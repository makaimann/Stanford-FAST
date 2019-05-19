#!/usr/bin/env python3

from cosa.analyzers.mcsolver import BMCSolver
from cosa.encoders.verilog_yosys import VerilogYosysBtorParser
from cosa.representation import HTS, TS
from cosa.utils.formula_mngm import SortingNetwork, substitute, get_free_variables

from pysmt.shortcuts import And, BOOL, BV, BVULE, BVType, EqualsOrIff, Implies, Not, Symbol, simplify

from collections import namedtuple, defaultdict
from pathlib import Path

# hacky -- creating config here
# should have an api command to get a generic config object from CoSA

btor_config = namedtuple('btor_config', 'abstract_clock opt_circuit no_arrays symbolic_init strategy skip_solving smt2_tracing solver_name incremental solver_options')

def reduced_instruction_set(hts, config, actions):
    B = 3

    for a in actions:
        assert a.get_type() == BOOL

    print("++++++++++++ automating reduced instruction set search ++++++++++++++++")
    print("Got HTS:", hts)

    # Create copy of system
    hts_copy, copy_actions = copy_sys(hts, actions)

    bmc = BMCSolver(hts, config)
    union_vars = hts.vars.union(hts_copy.vars)
    bmc._init_at_time(union_vars, 2)
    for h in [hts, hts_copy]:
        init = h.single_init()
        invar = h.single_invar()
        trans = h.single_invar()
        init_0 = bmc.at_time(And(init, invar), 0)
        bmc._add_assertion(bmc.solver, init_0)
        unrolled = bmc.unroll(trans, invar, B)
        bmc._add_assertion(bmc.solver, unrolled)

    def assume(assumption):
        print('Adding assumption: {}'.format(assumption))
        bmc._add_assertion(bmc.solver, assumption)

    timed_actions = defaultdict(list)
    for t in range(B):
        for a in actions:
            timed_actions[t].append(bmc.at_time(a, t))

    copy_timed_actions = defaultdict(list)
    for t in range(B):
        for ca in copy_actions:
            copy_timed_actions[t].append(bmc.at_time(ca, t))

    print('TIMED ACTIONS:')
    for t in timed_actions:
        print("\t{}: {}".format(t, timed_actions[t]))

    print('COPY TIMED ACTIONS:')
    for t in copy_timed_actions:
        print("\t{}: {}".format(t, copy_timed_actions[t]))

    # Generate delay indicator for each action
    delay = []
    delay_width = (len(actions)-1).bit_length()
    delay_var = Symbol('delay_sel', BVType(delay_width))
    for i in range(len(actions)):
        delay.append(EqualsOrIff(delay_var, BV(i, delay_width)))

    if len(actions) != 2**delay_width:
        assumption = BVULE(delay_var, BV(len(actions)-1, delay_width))
        assume(assumption)

    # add constraints based on reduced instruction set proof goal
    # 'monotonicity' assumptions
    # TODO: figure out if this is always the case -- might not be in general?
    #       if action not enabled in first state, then it shouldn't be in the second
    for generic_actions in [timed_actions, copy_timed_actions]:
        for ta1, ta2 in zip(generic_actions[0], generic_actions[1]):
            assumption = Implies(simplify(Not(ta1)), simplify(Not(ta2)))
            assume(assumption)

        # assume that no actions are enabled in the last state (just comparing state now)
        for ta in generic_actions[2]:
            assumption = Not(ta)
            assume(assumption)

    # add assumptions about delay signal

    # if delaying a signal, it must have been enabled
    for d, a in zip(delay, timed_actions[0]):
        assumption = Implies(d, a)
        assume(assumption)

    for d, a, ca in zip(delay, timed_actions[0], copy_timed_actions[0]):
        assumption = Implies(Not(d), EqualsOrIff(a, ca))
        assume(assumption)

    # Usage
    # sn = SortingNetowrk.sorting_network(parameters)

def copy_sys(hts, actions):
    prefix = 'copy.'
    hts_copy = HTS("copy")
    ts = TS()
    copymap = {v.symbol_name():'{}{}'.format(prefix, v.symbol_name()) for v in hts.vars}
    ts.vars = set([TS.get_prefix(v, prefix) for v in hts.vars])
    ts.set_behavior(substitute(hts.single_init(), copymap),
                    substitute(hts.single_trans(), copymap),
                    substitute(hts.single_invar(), copymap))
    ts.state_vars = set([TS.get_prefix(v, prefix) for v in hts.state_vars])
    hts_copy.add_ts(ts)
    return hts_copy, [substitute(a, copymap) for a in actions]

def main():
    parser = VerilogYosysBtorParser()
    fifo_source = Path("./fifo.sv")
    config = btor_config(abstract_clock=True,
                         opt_circuit=False,
                         no_arrays=False,
                         symbolic_init=False,
                         strategy='FWD',
                         skip_solving=False,
                         smt2_tracing=None,
                         solver_name='btor',
                         incremental=True,
                         solver_options=None)

    hts, inv_a, ltl_a = parser.parse_file(fifo_source, config, flags=['fifo'])

    symbols = dict()
    for v in hts.vars:
        symbols[v.symbol_name()] = v

    push = symbols['push']
    pop  = symbols['pop']

    actions = [EqualsOrIff(push, BV(1, 1)), EqualsOrIff(pop, BV(1, 1))]

    reduced_instruction_set(hts, config, actions)

if __name__ == "__main__":
    main()
