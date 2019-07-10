#!/usr/bin/env python3
from pathlib import Path

from pysmt.shortcuts import BV, BVAnd, EqualsOrIff

from cosa.environment import reset_env

from ris import btor_config, interface, reduced_instruction_set, read_verilog, test_actions

def main():
    reset_env()
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


    # FIXME TODO BUG this doesn't work because the third action implies the first -- it will be trivially unsat when it tries to drive action3 without action1
    # One possible fix is to change the rtl such that start forces a push (we'd also have to assume that you can't start when empty)
    actions = [EqualsOrIff(push, BV(1, 1)), EqualsOrIff(pop, BV(1, 1)), EqualsOrIff(BVAnd(start, push), BV(1, 1))]
    en      = [EqualsOrIff(full, BV(0, 1)), EqualsOrIff(empty, BV(0, 1)), EqualsOrIff(full, BV(0, 1))]

    generic_interface = interface(actions=actions, ens=en, rst=rst, clk=clk)

    test_actions(actions, en)
    reduced_instruction_set(hts, config, generic_interface)

if __name__ == "__main__":
    main()
