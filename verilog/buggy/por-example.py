#!/usr/bin/env python3
from pathlib import Path

from pysmt.fnode import FNode
from pysmt.shortcuts import And, BV, EqualsOrIff, Implies, Not, Or, TRUE

from cosa.environment import reset_env
from cosa.representation import TS
from cosa.utils.formula_mngm import get_free_variables, substitute

from por_utils import btor_config, interface, formulas_to_str

from ris import reduced_instruction_set, read_verilog, test_actions, create_action_constraints
from por import find_gir

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

    hts, _, _ = read_verilog(Path("./example.v"), "example", config)

    symbols = dict()
    for v in hts.vars:
        symbols[v.symbol_name()] = v

    clk    = symbols['clk']
    inc_y  = symbols['inc_y']
    inc_x  = symbols['inc_x']
    en_x   = symbols['en_x']

    actions = [EqualsOrIff(inc_y, BV(1, 1)), EqualsOrIff(inc_x, BV(1, 1))]
    en      = [TRUE(), EqualsOrIff(en_x, BV(1, 1))]

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

    data_inputs = list(data_inputs)

    generic_interface = interface(actions=actions, ens=en, rst=None, clk=clk, data_inputs=data_inputs)

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

        girs = find_gir(hts, config, generic_interface)
        print("Found the following members of the independence relationship:", girs)

        for a0, a1, g in girs:
            assumptions.append(Implies(And(g, And(a1, action2en[a0])), Not(TS.to_next(a0))))

        with open("assumptions.txt", "w") as f:
            f.write(formulas_to_str(assumptions))

        print("Wrote assumptions to assumptions.txt")

if __name__ == "__main__":
    main()
