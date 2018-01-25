#!/usr/bin/env python3

import magma as m
from mantle import DefineRegister, repeat
from mantle.common.operator import eq
from fifo import DefineFIFO

ARBITER = True


def DefineMagicPacketTracker(DEPTH):
    CNTWID = (DEPTH - 1).bit_length()

    class MagicPacketTracker(m.Circuit):
        name = "MagicPacketTracker"
        IO = ["push", m.In(m.Bit), "pop", m.In(m.Bit), "captured", m.In(m.Bit),
              "cnt", m.Out(m.UInt(CNTWID)), "next_cnt", m.Out(m.UInt(CNTWID)),
              "rst", m.In(m.Reset)] + m.ClockInterface()

        @classmethod
        def definition(io):
            cntreg = DefineRegister(CNTWID, init=0, has_ce=False, has_reset=True, _type=m.UInt)

            pop_cnt = cntreg(name="pop_cnt")

            # wire clock
            m.wireclock(io, pop_cnt)

            # wire reset
            m.wire(pop_cnt.RESET, io.rst)

            # increment enable logic
            incr_mask = m.bit((pop_cnt.O < m.uint(DEPTH, CNTWID)) &
                          (io.push) &
                          (~io.captured))
            wide_incr_mask = repeat(incr_mask, CNTWID)

            # intermediate signal
            push_cnt = m.uint(pop_cnt.O + m.uint(m.uint(1, CNTWID) & wide_incr_mask))

            # decrement enable logic
            decr_mask = m.bit((push_cnt > m.uint(0, CNTWID)) &
                          (io.pop))
            wide_decr_mask = repeat(decr_mask, CNTWID)

            # wire next state
            cnt_update = push_cnt - m.uint(m.uint(1, CNTWID) & wide_decr_mask)
            m.wire(pop_cnt.I, cnt_update)

            # wire output
            m.wire(pop_cnt.O, io.cnt)
            m.wire(cnt_update, io.next_cnt)

    return MagicPacketTracker


def DefineScoreboard(DATAWID, DEPTH, NUM_REQS=None, QWID=None):
    class Scoreboard(m.Circuit):
        name = "Scoreboard"

        assert not ARBITER or NUM_REQS is not None, "If using arbiter, need to supply NUM_REQS"
        assert not ARBITER or QWID is not None, "If using arbiter, need to supply QWID"

        if ARBITER:
            IO = ["push", m.In(m.Bits(NUM_REQS)), "start", m.In(m.Bit), "rst", m.In(m.Reset),
                  "data_in", m.In(m.Array(N=NUM_REQS, T=m.Bits(DATAWID))),
                  "input_quantums", m.In(m.Array(N=NUM_REQS, T=m.UInt(QWID)))
                  "data_out_vld", m.Out(m.Bit)] + m.ClockInterface()
        else:
            IO = ["push", m.In(m.Bit), "pop", m.In(m.Bit), "start", m.In(m.Bit),
                  "rst", m.In(m.Reset), "data_in", m.In(m.Bits(DATAWID)),
                  "data_out_vld", m.Out(m.Bit)] + m.ClockInterface()

        if NUM_REQS is None:
            NUM_REQS = 1

        @classmethod
        def definition(io):
            en = DefineRegister(1, init=0, has_ce=False, has_reset=True, _type=m.Bits)(name="en")
            # wire clock
            m.wireclock(en, io)

            # wire reset
            m.wire(io.rst, en.RESET)

            # enable only goes high once, then stays high
            m.wire(en.O | m.bits(io.start), en.I)

            mpt = DefineMagicPacketTracker(DEPTH)()

            # wire up magic packet tracker
            m.wire(io.push[0], mpt.push)
            m.wire(io.pop[0], mpt.pop)
            m.wire(en.O, m.bits(mpt.captured))
            m.wire(io.rst, mpt.rst)
            m.wireclock(io, mpt)

            if not ARBITER:
                fifo = DefineFIFO(DATAWID, DEPTH)()
                # wire up fifo
                m.wire(io.push, fifo.push)
                m.wire(io.pop, fifo.pop)
                m.wire(io.rst, fifo.rst)
                m.wire(io.data_in, fifo.data_in)
                m.wireclock(io, fifo)
            else:
                fifos = list()
                for i in range(NUM_REQS):
                    f = DefineFIFO(DATAWID, DEPTH)(name="fifo_{}".format(i))
                    fifos.append(f)
                    m.wire(io.push[i], f.push)
                    m.wire(io.rst, f.rst)
                    m.wire(io.data_in[i], f.data_in)
                    m.wireclock(io, f)


            # Need to wire things up
            if ARBITER:
                for i in range(NUM_REQS):
                    m.wire(gnt[i], fifos[i].pop)

            # vld out
            # TODO handle missing magic packet -- need to reset everything. Or keep as an assumption/restriction

            m.wire(m.bit(en.O) & eq(m.uint(mpt.next_cnt), m.uint(0, (DEPTH - 1).bit_length())), io.data_out_vld)

    return Scoreboard


if __name__ == "__main__":

    sb = DefineScoreboard(DATAWID=8, DEPTH=8)

    # Compile coreir
    m.compile("build/data_integrity_scoreboard", sb, output="coreir")
