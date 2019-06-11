#!/usr/bin/env python3
from pathlib import Path

from pysmt.shortcuts import BV, BVAnd, EqualsOrIff

from ris import btor_config, interface, reduced_instruction_set, read_verilog

def main():
    config = btor_config(abstract_clock=True,
                         opt_circuit=False,
                         no_arrays=False,
                         symbolic_init=True,
                         strategy='FWD',
                         skip_solving=False,
                         smt2_tracing=None,
                         solver_name='btor',
                         incremental=True,
                         solver_options=None,
                         synchronize=False,
                         verific=False)

    hts, _, _ = read_verilog(Path("./fifo_top.sv"), "fifo_top", config)

    symbols = dict()
    for v in hts.vars:
        symbols[v.symbol_name()] = v

    clk   = symbols['clk']
    rst   = symbols['rst']
    start = symbols['start']
    push  = symbols['push']
    pop   = symbols['pop']
    full  = symbols['full']
    empty = symbols['empty']

    actions = [EqualsOrIff(push, BV(1, 1)), EqualsOrIff(pop, BV(1, 1)), EqualsOrIff(BVAnd(start, push), BV(1, 1))]
    en      = [EqualsOrIff(full, BV(0, 1)), EqualsOrIff(empty, BV(0, 1)), EqualsOrIff(full, BV(0, 1))]

    generic_interface = interface(actions=actions, ens=en, rst=rst, clk=clk)

    reduced_instruction_set(hts, config, generic_interface)

if __name__ == "__main__":
    main()
