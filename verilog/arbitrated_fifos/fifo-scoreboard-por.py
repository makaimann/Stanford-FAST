#!/usr/bin/env python3
from pathlib import Path

from pysmt.shortcuts import And, BV, BVAnd, EqualsOrIff, TRUE

from cosa.environment import reset_env
from cosa.representation import TS
from cosa.utils.formula_mngm import get_free_variables

from por_utils import btor_config, interface
from ris import reduced_instruction_set, read_verilog, test_actions, create_action_constraints
from por import find_gir, safe_to_remove_empty_instruction

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

    action_vars = set()
    for a in actions:
        for v in get_free_variables(a):
            action_vars.add(v)
    data_inputs = hts.input_vars - action_vars
    # remove reset and clock
    data_inputs.remove(rst)
    data_inputs.remove(clk)

    data_inputs = list(data_inputs)

    generic_interface = interface(actions=actions, ens=en, rst=rst, clk=clk, data_inputs=data_inputs)

    test_actions(actions, en)
    if reduced_instruction_set(hts, config, generic_interface, strategy='ceg'):
        action_constraints = create_action_constraints(actions)
        print("Found RIS constraint:", action_constraints)

        # add action constraints to system
        ts = TS()
        ts.set_behavior(TRUE(), TRUE(), action_constraints)
        hts.add_ts(ts)

        find_gir(hts, config, generic_interface)
        if safe_to_remove_empty_instruction(hts, config, generic_interface):
            print("Can safely remove empty instruction")

if __name__ == "__main__":
    main()
