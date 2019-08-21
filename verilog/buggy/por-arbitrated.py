#!/usr/bin/env python3

import argparse

from pathlib import Path

from pysmt.fnode import FNode
from pysmt.shortcuts import And, BV, BVExtract, EqualsOrIff, Implies, Not, Or, TRUE, BVUGT

from cosa.environment import reset_env
from cosa.representation import TS
from cosa.utils.formula_mngm import get_free_variables, substitute

from por_utils import btor_config, interface, formulas_to_str

from ris import reduced_instruction_set, read_verilog, read_btor, test_actions, create_action_constraints
from por import find_gir, safe_to_remove_empty_instruction

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
    push_sel = symbols['push_sel']
    data_in  = symbols['data_in']
    empty    = symbols['empty']
    full     = symbols['full']
    data_out = symbols['data_out']
    en       = symbols['sb.en']
    reqs     = symbols['reqs']
    gnt      = symbols['gnt']
    sbcnt    = symbols['sb.cnt']

    # Not parameterized -- assumes N=4
    actions = [And(EqualsOrIff(push, BV(1, 1)), EqualsOrIff(push_sel, BV(0, 2))), And(EqualsOrIff(push, BV(1, 1)), EqualsOrIff(push_sel, BV(1, 2))), And(EqualsOrIff(push, BV(1, 1)), EqualsOrIff(push_sel, BV(2, 2))), And(EqualsOrIff(push, BV(1, 1)), EqualsOrIff(push_sel, BV(3, 2))),
               EqualsOrIff(BVExtract(reqs, 0, 0), BV(1, 1)), EqualsOrIff(BVExtract(reqs, 1, 1), BV(1, 1)), EqualsOrIff(BVExtract(reqs, 2, 2), BV(1, 1)), EqualsOrIff(BVExtract(reqs, 3, 3), BV(1, 1))]
    # EqualsOrIff(start, BV(1, 1)),
    en      = [EqualsOrIff(BVExtract(full, 0, 0), BV(0, 1)), EqualsOrIff(BVExtract(full, 1, 1), BV(0, 1)), EqualsOrIff(BVExtract(full, 2, 2), BV(0, 1)), EqualsOrIff(BVExtract(full, 3, 3), BV(0, 1)),
               TRUE(), TRUE(), TRUE(), TRUE()]
    # And(EqualsOrIff(push_sel, BV(0, 2)), And(EqualsOrIff(en, BV(0, 1)), BVUGT(sbcnt, BV(0, sbcnt.symbol_type().width)))),

    predicates = [EqualsOrIff(gnt, BV(1, 4)), EqualsOrIff(gnt, BV(2, 4)), EqualsOrIff(gnt, BV(4, 4)), EqualsOrIff(gnt, BV(8, 4))]

    guards = [Not(EqualsOrIff(sbcnt, BV(0, sbcnt.symbol_type().width)))]

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
    if reduced_instruction_set(hts, config, generic_interface, strategy='ceg', predicates=predicates):
        action_constraints = create_action_constraints(actions)
        print("Found RIS constraint:", action_constraints)

        assumptions.append(action_constraints)

        # add action constraints to system
        ts = TS()
        ts.set_behavior(TRUE(), TRUE(), action_constraints)
        hts.add_ts(ts)

        girs = find_gir(hts, config, generic_interface)
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
    parser = argparse.ArgumentParser(description="Reads a BTOR file and proves RIS/POR")
    parser.add_argument('btor', help='btor filename')

    args = parser.parse_args()

    prove(args.btor)
