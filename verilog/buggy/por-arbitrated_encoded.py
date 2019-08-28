#!/usr/bin/env python3

import argparse
import math
from pathlib import Path

from pysmt.fnode import FNode
from pysmt.shortcuts import And, BV, BVExtract, EqualsOrIff, Implies, Not, Or, TRUE, BVULT, BVUGT, BVZExt, BVLShr

from cosa.environment import reset_env
from cosa.representation import TS
from cosa.utils.formula_mngm import get_free_variables, substitute

from por_utils import btor_config, interface, formulas_to_str

from ris import reduced_instruction_set, read_verilog, read_btor, test_actions, create_action_constraints
from por import find_gir
from process_source import gen_btor

def prove(btorname, depth, num_fifos):
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
    empty    = symbols['empty']
    full     = symbols['full']
    data_out = symbols['data_out']
    en       = symbols['sb.en']
    gnt      = symbols['gnt']
    sbcnt    = symbols['sb.cnt']
    req      = symbols['req']
    gnt_sel  = symbols['gnt_sel']
    push_sel  = symbols['push_sel']
    f0cnt    = symbols['gen_fifos[0].f.cnt']

    selwidth = int(math.ceil(math.log2(num_fifos)))

    actions = [EqualsOrIff(push, BV(1, 1)), EqualsOrIff(req, BV(1, 1))]

    en = [EqualsOrIff(BVExtract(BVLShr(full, BVZExt(push_sel, num_fifos - selwidth)), 0, 0), BV(0, 1)),
          EqualsOrIff(BVExtract(BVLShr(empty, BVZExt(gnt_sel, num_fifos - selwidth)), 0, 0), BV(0, 1))]

    predicates = []

    guards = [And(Not(EqualsOrIff(sbcnt, BV(0, sbcnt.symbol_type().width))), BVULT(f0cnt, BV(depth-1, f0cnt.symbol_type().width)))]

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
        action_constraints = create_action_constraints(hts, config, generic_interface)
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

        assumption_filename = "assumptions-{}.txt".format(design_name)
        with open(assumption_filename, "w") as f:
            # super hacky, but need to quote name with square brackets in it
            res = formulas_to_str(assumptions)
            res = res.replace("gen_fifos[0].f.cnt", "'gen_fifos[0].f.cnt'")
            f.write(res)

        print("Wrote assumptions to {}".format(assumption_filename))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate BTOR collateral for buggy Verilog systems and check RIS/POR side conditions.")
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int, default=2)
    parser.add_argument("-k", type=int, default=80)
    parser.add_argument("--options", "-o", help='options to pass to abc', default='')
    args = parser.parse_args()

    # never runs with enable macro
    btorfile = gen_btor('arbitrated_encoded', args.depth, args.width, False, args.num_fifos)

    prove(btorfile, args.depth, args.num_fifos)
