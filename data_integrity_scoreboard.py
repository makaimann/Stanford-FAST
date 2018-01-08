import magma as m
from magma.bitutils import int2seq, int2uint
from mantle import Mux2, DefineRegister, repeat
from fifo import DefineFIFO


def DefineMagicPacketTracker(DEPTH):
    CNTWID = (DEPTH - 1).bit_length()
    
    class MagicPacketTracker(m.Circuit):
        name = "MagicPacketTracker"
        IO = ["push", m.In(m.Bit), "pop", m.In(m.Bit), "captured", m.In(m.Bit),
              "cnt", m.Out(m.UInt(CNTWID)), "next_cnt", m.Out(m.UInt(CNTWID)),
              "rst", m.In(m.Bit)] + m.ClockInterface()

        @classmethod
        def definition(io):
            cntreg = DefineRegister(CNTWID, init=0, has_ce=False, has_reset=True, _type=m.UInt)
            
            pop_cnt = cntreg(name="pop_cnt")

            # wire clock
            m.wireclock(io, pop_cnt)

            # wire reset
            m.wire(pop_cnt.RESET, io.rst)

            # increment enable logic
            incr_en = m.bit((pop_cnt.O < m.uint(DEPTH, CNTWID)) &
                          (io.push) &
                          (~io.captured))
            wide_incr_en = repeat(incr_en, CNTWID)

            # intermediate signal
            push_cnt = m.uint(pop_cnt.O + m.uint(m.uint(1, CNTWID) & wide_incr_en))

            # decrement enable logic
            decr_en = m.bit((push_cnt > m.uint(0, CNTWID)) &
                          (io.pop))
            wide_decr_en = repeat(decr_en, CNTWID)
            
            # wire next state
            cnt_update = push_cnt - m.uint(m.uint(1, CNTWID) & wide_decr_en)
            m.wire(pop_cnt.I, cnt_update)

            # wire output
            m.wire(pop_cnt.O, io.cnt)
            m.wire(cnt_update, io.next_cnt)

    return MagicPacketTracker


def DefineDataIntegritySB(DATAWID, DEPTH):
    class DataIntegritySB(m.Circuit):
        name = "DataIntegritySB"
        IO = ["push", m.In(m.Bit), "pop", m.In(m.Bit), "start", m.In(m.Bit),
              "rst", m.In(m.Bit), "data_in", m.In(m.Bits(DATAWID)),
              "data_out_vld", m.Out(m.Bit)] + m.ClockInterface()

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
            fifo = DefineFIFO(DATAWID, DEPTH)()

            # wire up magic packet tracker
            m.wire(io.push, mpt.push)
            m.wire(io.pop, mpt.pop)
            m.wire(en.O, m.bits(mpt.captured))
            m.wire(io.rst, mpt.rst)
            m.wireclock(io, mpt)

            # wire up fifo
            m.wire(io.push, fifo.push)
            m.wire(io.pop, fifo.pop)
            m.wire(io.rst, fifo.rst)
            m.wire(io.data_in, fifo.data_in)
            m.wireclock(io, fifo)

    return DataIntegritySB

    
if __name__ == "__main__":

    disb = DefineDataIntegritySB(DATAWID=8, DEPTH=8)
    
    # Compile verilog
    m.compile("build/data_integrity_scoreboard", disb, include_coreir=False)

    with open("build/data_integrity_scoreboard.v", "r") as disb_verilog:
        print(disb_verilog.read())
