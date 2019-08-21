#!/usr/bin/env python3

import argparse

from pathlib import Path

from pysmt.fnode import FNode
from pysmt.shortcuts import And, BV, EqualsOrIff, Implies, Not, Or, TRUE, BVULT, BVUGT

from cosa.environment import reset_env
from cosa.representation import TS
from cosa.utils.formula_mngm import get_free_variables, substitute

from por_utils import btor_config, interface, formulas_to_str

from ris import reduced_instruction_set, read_verilog, read_btor, test_actions, create_action_constraints
from por import find_gir, safe_to_remove_empty_instruction
from process_source import gen_btor

def prove(btorname):
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

    design_name = btorname.replace('.btor', '')

    hts, _, _ = read_btor(Path(btorname), "", config)

    symbols = dict()
    for v in hts.vars:
        symbols[v.symbol_name()] = v

    clk      = symbols['clk']
    rst      = symbols['rst']
    start    = symbols['start']
    push     = symbols['push']
    data_in  = symbols['data_in']
    pop      = symbols['pop']
    empty    = symbols['empty']
    full     = symbols['full']
    data_out = symbols['data_out']
    en       = symbols['sb.en']
    count    = symbols['dut.count']
    sbcnt    = symbols['sb.cnt']

    actions = [EqualsOrIff(push, BV(1, 1)), EqualsOrIff(pop, BV(1, 1))]
    # , EqualsOrIff(start, BV(1, 1))]
    en      = [Not(full), EqualsOrIff(empty, BV(0, 1))]
    # , And(EqualsOrIff(en, BV(0, 1)), BVUGT(count, BV(0, sbcnt.symbol_type().width)))]

    guards  = [And(BVULT(count, BV(2**(count.symbol_type().width-1)-1, count.symbol_type().width)), Not(EqualsOrIff(sbcnt, BV(0, sbcnt.symbol_type().width))))]

    action2en = {}
    for a, e in zip(actions, en):
        action2en[a] = e

    action_vars = set()
    for a in actions:
        for v in get_free_variables(a):
            action_vars.add(v)
    data_inputs = hts.input_vars - action_vars
    # remove reset and clock
    data_inputs.remove(clk)
    data_inputs.remove(rst)

    data_inputs = list(data_inputs)

    generic_interface = interface(actions=actions, ens=en, rst=rst, clk=clk, data_inputs=data_inputs)

    assumptions = []
    test_actions(actions, en)
    if reduced_instruction_set(hts, config, generic_interface, strategy='ceg'):
        action_constraints = create_action_constraints(actions)
        print("Found RIS constraint:", action_constraints)

        assumptions.append(action_constraints)

        # add action constraints to system
        ts = TS()
        ts.set_behavior(TRUE(), TRUE(), action_constraints)
        hts.add_ts(ts)

        girs = find_gir(hts, config, generic_interface, guards)
        print("Found the following members of the independence relationship:", girs)

        for a0, a1, g in girs:
            assumptions.append(Implies(And(g, And(a1, action2en[a0])), Not(TS.to_next(a0))))

        if safe_to_remove_empty_instruction(hts, config, generic_interface):
            print("Can safely remove empty instruction")
            assumptions.append(Or(actions))

        assumption_filename = "assumptions-{}.txt".format(design_name)
        with open(assumption_filename, "w") as f:
            f.write(formulas_to_str(assumptions))

        print("Wrote assumptions to {}".format(assumption_filename))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate BTOR collateral for buggy Verilog systems and check RIS/POR side conditions.")
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int, default=4)
    parser.add_argument("-k", type=int, default=80)
    parser.add_argument("--options", "-o", help='options to pass to abc', default='')
    args = parser.parse_args()

    # never runs with enable macro
    btorfile = gen_btor('shift_register', args.depth, args.width, False, args.num_fifos)

    prove(btorfile)
