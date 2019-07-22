#!/usr/bin/env python3
from pathlib import Path

from pysmt.shortcuts import And, BV, BVAnd, EqualsOrIff

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
    en    = symbols['sb.en']

    # note: need to make !sb.en part of the enabledness condition for start, otherwise it can be activated without affecting the wrPtr (if already enabled), which stumps the witness learner
    actions = [EqualsOrIff(push, BV(1, 1)), EqualsOrIff(pop, BV(1, 1)), EqualsOrIff(start, BV(1, 1))]
    en      = [EqualsOrIff(full, BV(0, 1)), EqualsOrIff(empty, BV(0, 1)), And(EqualsOrIff(full, BV(0, 1)), EqualsOrIff(en, BV(0, 1)))]

    generic_interface = interface(actions=actions, ens=en, rst=rst, clk=clk)

    test_actions(actions, en)
    reduced_instruction_set(hts, config, generic_interface, strategy='ceg')

if __name__ == "__main__":
    main()
