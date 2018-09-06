# Formal At Scale Technology

This repo currently contains circular pointer FIFO and data integrity scoreboard implementations in Verilog, Magma, and CoreIR.
The modules are all parameterized and the current target is to improve bounded model checking of data integrity with WIDTH=8 and
DEPTH=8, with the hope that improving BMC on these parameter values would also help with larger values. The Verilog implementation
also contains a Deficit Weighted Round Robin Arbiter. This can be used in combination with the FIFO to create difficult verification
challenges of composed arbiters and FIFOs.

The data integrity scoreboard keeps track of the number of elements, non-deterministically selects a "magic packet", and checks that
this packet exits when it should.

## Known Bugs
* The arbiter fails liveness checks if the quantum values are not fixed at the packet size. This needs further investigation.
* On some systems, Yosys fails to produce a .vcd file for SMT solvers other than z3.

## Required Software
* [Yosys](https://github.com/YosysHQ/yosys)
* [CVC4](https://github.com/CVC4/CVC4)

## Magma Flow
Magma is a hardware generator language embedded in Python. The implementations in this library also make use of Mantle,
a library of useful Magma circuits.

Magma has backends for Lattice FPGAs and CoreIR (the Verilog backend exists but has not been maintained). For our purposes, we
will write a generator in Magma, which produces a (concrete) circuit in CoreIR. Then using the CoreIR command line, we can
produce Verilog which is readable by Yosys to produce SMT-LIBv2. **To use with CoreIR, set the `MANTLE_TARGET` environment
variable to `coreir`.**

### (Extra) Required Software for Magma track
* Python3.6
* [Magma](https://github.com/phanrahan/magma)
* [Mantle](https://github.com/phanrahan/mantle)
* [CoreIR](https://github.com/rdaly525/coreir)

## Verilog Flow
In the Verilog directory are SystemVerilog implementations with embedded data integrity assertions and the necessary
assumptions. The script `check.sh` uses Yosys to read in these files, process the circuit and produce SMT-LIB
("disb.smt2"). Then it calls the `yosys-smtbmc` script (comes bundled with Yosys) with CVC4 as the underlying SMT solver
for a bounded model checking run. Adding `-i` to the `yosys-smtbmc` invocation would start a k-induction run. If a
counter example is found, it is written to "disb.vcd".

No extra software required, except a Waveform viewer for viewing counter examples.
