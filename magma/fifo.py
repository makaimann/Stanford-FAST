import magma as m
from magma import cache_definition
from mantle import Mux, DefineRegister

WIDTH = 8
DEPTH = 8

@cache_definition
def DefineFIFO(WIDTH, DEPTH):
    PTRWID = DEPTH.bit_length()

    class FIFO(m.Circuit):
        name = "FIFO"
        IO = ["push", m.In(m.Bit), "pop", m.In(m.Bit), "rst", m.In(m.Reset),
              "data_in", m.In(m.UInt(WIDTH)), "data_out", m.Out(m.UInt(WIDTH)),
              "empty", m.Out(m.Bit), "full", m.Out(m.Bit)] + m.ClockInterface()

        @classmethod
        def definition(io):
            # didn't work with coreir because the rst/bit conversion
#            clkEn = io.push | io.pop | m.bit(io.rst)

            ########################## pointer logic ##############################
            ptrreg = DefineRegister(PTRWID, init=0, has_ce=True, has_reset=True, _type=m.UInt)
            wrPtr = ptrreg(name="wrPtr")
            rdPtr = ptrreg(name="rdPtr")

            # wire clocks
            m.wireclock(io, wrPtr)
            m.wireclock(io, rdPtr)

            # wire resets
            m.wire(wrPtr.RESET, io.rst)
            m.wire(rdPtr.RESET, io.rst)

            # wire enables
            m.wire(wrPtr.CE, io.push)
            m.wire(rdPtr.CE, io.pop)

            # next values increment by one
            m.wire(wrPtr.I, wrPtr.O + m.uint(1, PTRWID))
            m.wire(rdPtr.I, rdPtr.O + m.uint(1, PTRWID))
            ######################### end pointer logic ###########################

            ######################### full and empty logic ########################
            m.wire(io.empty, wrPtr.O == rdPtr.O)
            m.wire(io.full, (wrPtr.O[:PTRWID-1] == rdPtr.O[:PTRWID-1]) & (wrPtr.O[PTRWID-1] != rdPtr.O[PTRWID-1]))
            ######################### end full and empty logic ####################

            ########################### entry logic ###############################

            # Create and write
            entries = []
            entryReg = DefineRegister(WIDTH, init=0, has_ce=True, has_reset=False, _type=m.Bits)
            for i in range(DEPTH):
                entry = entryReg(name="entry" + str(i))
                m.wire(entry.CE, io.push & m.bit(m.uint(wrPtr.O[:PTRWID-1]) == m.uint(i, PTRWID-1)))
                m.wire(entry.I, io.data_in)
                entries.append(entry)

            # Read

            # # Decode ptr
            # dec = Decoder(PTRWID-1)
            # m.wire(dec.I, rdPtr.O[:PTRWID-1])

            # Connect mux
            outmux = Mux(DEPTH, WIDTH)
            for i in range(DEPTH):
                m.wire(getattr(outmux, "I" + str(i)), entries[i].O)

            m.wire(rdPtr.O[:PTRWID-1], outmux.S)
            m.wire(outmux.O, io.data_out)

            ########################### end entry logic ###########################

    return FIFO


if __name__ == "__main__":
    F = DefineFIFO(8, 8)
    
    # Compile verilog
    m.compile("build/fifo", F, include_coreir=False)

    with open("build/fifo.v", "r") as fifo_verilog:
        print(fifo_verilog.read())
