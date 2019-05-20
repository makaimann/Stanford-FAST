#!/usr/bin/env python3

from cosa.analyzers.mcsolver import BMCSolver
from cosa.encoders.verilog_yosys import VerilogYosysBtorParser
from cosa.representation import HTS, TS
from cosa.utils.formula_mngm import SortingNetwork, substitute, get_free_variables

from pysmt.shortcuts import And, BOOL, BV, BVULE, BVType, EqualsOrIff, Implies, Not, Or, Symbol, simplify, TRUE

from collections import namedtuple, defaultdict
from pathlib import Path

# TODO: Need to hold data constant, e.g. non-actions should stay the same

# hacky -- creating config here
# should have an api command to get a generic config object from CoSA

btor_config = namedtuple('btor_config', 'abstract_clock opt_circuit no_arrays symbolic_init strategy skip_solving smt2_tracing solver_name incremental solver_options')
interface   = namedtuple('interface', 'actions ens')

def copy_sys(hts, generic_interface):
    '''
    Creates a copy of an HTS
    '''
    prefix = 'copy.'
    hts_copy = HTS("copy")
    ts = TS()
    copymap = {v.symbol_name():'{}{}'.format(prefix, v.symbol_name()) for v in hts.vars}
    for sv in hts.state_vars:
        primed_name = TS.get_prime(sv).symbol_name()
        copymap[primed_name] = '{}{}'.format(prefix, primed_name)
    ts.vars = set([TS.get_prefix(v, prefix) for v in hts.vars])
    ts.set_behavior(substitute(hts.single_init(), copymap),
                    substitute(hts.single_trans(), copymap),
                    substitute(hts.single_invar(), copymap))
    ts.state_vars = set([TS.get_prefix(v, prefix) for v in hts.state_vars])
    hts_copy.add_ts(ts)

    copy_interface = interface(actions=[substitute(a, copymap) for a in generic_interface.actions],
                               ens=[substitute(e, copymap) for e in generic_interface.ens])

    return hts_copy, copy_interface

def ris_proof_setup(hts, config, generic_interface):
    B = 3
    for a in generic_interface.actions:
        assert a.get_type() == BOOL

    print("++++++++++++ automating reduced instruction set search ++++++++++++++++")
    print("Got HTS:", hts)

    # Create copy of system
    hts_copy, copy_interface = copy_sys(hts, generic_interface)
    # update the main system
    hts.combine(hts_copy)

    bmc = BMCSolver(hts, config)
    # union_vars = hts.vars.union(hts_copy.vars)
    bmc._init_at_time(hts.vars, 2)
    init = hts.single_init()
    invar = hts.single_invar()
    trans = hts.single_invar()
    init_0 = bmc.at_time(And(init, invar), 0)
    bmc._add_assertion(bmc.solver, init_0)
    unrolled = bmc.unroll(trans, invar, B)
    bmc._add_assertion(bmc.solver, unrolled)

    def assume(assumption):
        print('Adding assumption: {}'.format(assumption))
        bmc._add_assertion(bmc.solver, assumption)

    timed_actions = defaultdict(list)
    timed_ens     = defaultdict(list)
    for t in range(B):
        for a in generic_interface.actions:
            timed_actions[t].append(bmc.at_time(a, t))
        for e in generic_interface.ens:
            timed_ens[t].append(bmc.at_time(e, t))
        assert len(timed_actions[t]) == len(timed_ens[t])

    copy_timed_actions = defaultdict(list)
    copy_timed_ens    = defaultdict(list)
    for t in range(B):
        for ca in copy_interface.actions:
            copy_timed_actions[t].append(bmc.at_time(ca, t))
        for e in copy_interface.ens:
            copy_timed_ens[t].append(bmc.at_time(e, t))
        assert len(copy_timed_actions[t]) == len(copy_timed_ens[t])
    print()
    print('TIMED ACTIONS:')
    for t in timed_actions:
        print("\t{}: {} - en: {}".format(t, timed_actions[t], timed_ens[t]))

    print('COPY TIMED ACTIONS:')
    for t in copy_timed_actions:
        print("\t{}: {} - en: {}".format(t, copy_timed_actions[t], copy_timed_ens[t]))

    print()

    # Generate delay indicator for each action
    delay = []
    delay_width = (len(generic_interface.actions)-1).bit_length()
    delay_var = Symbol('delay_sel', BVType(delay_width))
    for i in range(len(generic_interface.actions)):
        delay.append(EqualsOrIff(delay_var, BV(i, delay_width)))

    if len(generic_interface.actions) != 2**delay_width:
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
            assume(Not(ta))

    for a, e in zip(timed_actions[0], timed_ens[0]):
        assume(Implies(a, e))

    for a in timed_actions[1]:
        assume(Not(a))

    ################ add assumptions about delay signal ###################
    # if delaying a signal, it must have been enabled
    for d, a in zip(delay, timed_actions[0]):
        assumption = Implies(d, a)
        assume(assumption)

    for d, a, ca in zip(delay, timed_actions[0], copy_timed_actions[0]):
        assume(Implies(Not(d), EqualsOrIff(a, ca)))

    for d, ca in zip(delay, copy_timed_actions[0]):
        assume(Implies(d, Not(ca)))

    # Usage
    sn = SortingNetwork.sorting_network(timed_actions[0])
    print("\nSorting Network:\n\t", sn)

    return bmc, timed_actions, timed_ens, copy_timed_actions, copy_timed_ens, delay, sn

def reduced_instruction_set(hts, config, generic_interface):
    setup = ris_proof_setup(hts, config, generic_interface)
    bmc, timed_actions, timed_ens, copy_timed_actions, copy_timed_ens, delay, sn = setup

    # # assertion that delayed signal is enabled
    # delayed_signal_enabled = And([Implies(delay[i], copy_timed_ens[1][i]) for i in range(len(delay))])
    # # blown-out existential quantification -- there is a delayed signal that's enabled
    # exists_enabled_delay_signal = Or([And(delay[i], copy_timed_ens[1][i]) for i in range(len(delay))])

    # prop = Implies(sn[1], exists_enabled_delay_signal)
    # print("Trying to prove property:\n\t", prop)
    # assumptions = [Not(prop)]
    # print(bmc.solver.solver.solve(assumptions))
    # model = bmc.solver.solver.get_model()
    # print("+++++++++++++++++++++++ Model +++++++++++++++++++++++")
    # print(model)

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

    rst   = symbols['rst']
    # assume reset is zero
    ts = TS()
    ts.set_behavior(TRUE(), TRUE(), EqualsOrIff(rst, BV(0, 1)))
    hts.add_ts(ts)

    push  = symbols['push']
    pop   = symbols['pop']
    full  = symbols['full']
    empty = symbols['empty']

    actions = [EqualsOrIff(push, BV(1, 1)), EqualsOrIff(pop, BV(1, 1))]
    en      = [EqualsOrIff(full, BV(0, 1)), EqualsOrIff(empty, BV(0, 1))]

    generic_interface = interface(actions=actions, ens=en)

    reduced_instruction_set(hts, config, generic_interface)

if __name__ == "__main__":
    main()
