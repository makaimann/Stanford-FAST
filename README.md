# Formal At Scale Technology

This repo currently contains circular pointer FIFO and data integrity scoreboard implementations in both Magma and Verilog.
The Magma circuits have not been tested or formally verified yet, but that will happen soon. The Verilog implementation
has a bounded proof of data integrity. A Deficit Weighted Round Robin Arbiter implementation is upcoming. Check back for updates.

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
* [Magma](https://github.com/phanrahan/magma)
* [Mantle](https://github.com/phanrahan/mantle)
* [CoreIR](https://github.com/rdaly525/coreir)

## Verilog Flow
In the Verilog directory are SystemVerilog implementations with embedded data integrity assertions and the necessary 
assumptions. The script `check.sh` will use Yosys to read in these files, process the circuit and produce SMT-LIB 
(disb.smt2). Then it calls the yosys-smtbmc script with CVC4 as the underlying SMT solver for a bounded model checking run.
Adding `-i` to the yosys-smtbmc invocation would start a k-induction run. If a counter example is found, it is written 
to disb.vcd.

No extra software required, except a Waveform viewer for viewing counter examples.
