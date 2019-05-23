from collections import namedtuple, defaultdict
from pathlib import Path
from typing import Tuple

from cosa.analyzers.mcsolver import BMCSolver
from cosa.encoders.verilog_yosys import VerilogYosysBtorParser
from cosa.representation import HTS, TS
from cosa.utils.formula_mngm import SortingNetwork, substitute, get_free_variables

from pysmt.shortcuts import And, BOOL, BV, BVULE, BVType, EqualsOrIff, Implies, Not, Or, Symbol, simplify, TRUE
from pysmt.fnode import FNode

__all__ = ['btor_config', 'interface', 'reduced_instruction_set', 'read_verilog']

# hacky -- creating config here
# should have an api command to get a generic config object from CoSA

btor_config = namedtuple('btor_config', 'abstract_clock opt_circuit no_arrays symbolic_init strategy skip_solving smt2_tracing solver_name incremental solver_options')
interface   = namedtuple('interface', 'actions ens rst clk')

def assume(bmc, assumption):
    print('Adding assumption: {}'.format(assumption))
    bmc._add_assertion(bmc.solver, assumption)


def copy_sys(hts, generic_interface, data_inputs):
    '''
    Creates a copy of an HTS
    '''
    prefix = 'copy.'
    hts_copy = HTS("copy")
    ts = TS()
    copymap = {v.symbol_name():'{}{}'.format(prefix, v.symbol_name()) for v in hts.vars}
    for var in get_free_variables(hts.single_trans()):
        primed_name = TS.get_prime(var).symbol_name()
        copymap[primed_name] = '{}{}'.format(prefix, primed_name)
    ts.vars = set([TS.get_prefix(v, prefix) for v in hts.vars])
    ts.set_behavior(substitute(hts.single_init(), copymap),
                    substitute(hts.single_trans(), copymap),
                    substitute(hts.single_invar(), copymap))
    ts.state_vars = set([TS.get_prefix(v, prefix) for v in hts.state_vars])
    hts_copy.add_ts(ts)

    assert len(hts_copy.vars.intersection(hts.vars)) == 0

    copy_free_vars = get_free_variables(hts_copy.single_invar()).union(get_free_variables(hts_copy.single_trans()))
    orig_free_vars = get_free_variables(hts.single_invar()).union(get_free_variables(hts.single_trans()))
    assert len(copy_free_vars.intersection(orig_free_vars)) == 0

    copy_interface = interface(actions=[substitute(a, copymap) for a in generic_interface.actions],
                               ens=[substitute(e, copymap) for e in generic_interface.ens],
                               rst=substitute(generic_interface.rst, copymap),
                               clk=substitute(generic_interface.clk, copymap))

    print("Created copy of HTS")
    print("\t", hts_copy)

    assert isinstance(data_inputs, list)

    sys_equiv_output = And([EqualsOrIff(sv, substitute(sv, copymap)) for sv in hts.state_vars])
    return hts_copy, copy_interface, [TS.get_prefix(d, prefix) for d in data_inputs], sys_equiv_output

def ris_proof_setup(hts, config, generic_interface):
    B = 3
    for a in generic_interface.actions:
        assert a.get_type() == BOOL

    print("++++++++++++ automating reduced instruction set search ++++++++++++++++")
    print("Got HTS:", hts)

    print("----------------- adding assumptions to the HTS definition ----------------")
    action_vars = set()
    for a in generic_interface.actions:
        for v in get_free_variables(a):
            action_vars.add(v)
    data_inputs = hts.input_vars - action_vars
    # remove reset and clock
    data_inputs.remove(generic_interface.rst)
    data_inputs.remove(generic_interface.clk)

    # convert to a list, we want it to be ordered now
    data_inputs = list(data_inputs)

    print('Found the following data inputs:\n\t', data_inputs)

    # assume reset is zero
    rst_zero = EqualsOrIff(generic_interface.rst, BV(0, 1))
    print("Simple assumption: Hold reset at zero:\n\t", rst_zero)

    # assume data stays constant
    data_stays_const = And([EqualsOrIff(TS.get_prime(di), di) for di in data_inputs])
    print("Simple assumption: data inputs all remain constant:\n\t", data_stays_const)

    # create a new transition system to add to the HTS
    ts = TS()
    ts.set_behavior(TRUE(), data_stays_const, rst_zero)
    hts.add_ts(ts)

    # Now the system is ready to be copied
    # Create copy of system
    hts_copy, copy_interface, copy_data_inputs, sys_equiv_output = copy_sys(hts, generic_interface, data_inputs)
    # update the main system
    hts.combine(hts_copy)

    bmc = BMCSolver(hts, config)
    # union_vars = hts.vars.union(hts_copy.vars)
    bmc._init_at_time(hts.vars, 2)
    invar = hts.single_invar()
    trans = hts.single_trans()
    invar0 = bmc.at_time(invar, 0)
    bmc._add_assertion(bmc.solver, invar0)
    unrolled = bmc.unroll(trans, invar, B)
    bmc._add_assertion(bmc.solver, unrolled)

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

    timed_sys_equiv = list()
    for t in range(B):
        timed_sys_equiv.append(bmc.at_time(sys_equiv_output, t))

    print()
    print('TIMED ACTIONS:')
    for t in timed_actions:
        print("\t{}: {} - en: {}".format(t, timed_actions[t], timed_ens[t]))

    print('COPY TIMED ACTIONS:')
    for t in copy_timed_actions:
        print("\t{}: {} - en: {}".format(t, copy_timed_actions[t], copy_timed_ens[t]))

    print()
    print('TIMED EQUIV OUTPUT:')
    for e in timed_sys_equiv:
        print("\t", e)

    print()
    # assume they start in the same state
    print("Assuming systems start in the same state:")
    assume(bmc, timed_sys_equiv[0])

    # assume the data starts the same
    print("Assume the data is equivalent")
    for di, cdi in zip(data_inputs, copy_data_inputs):
        di0 = bmc.at_time(di, 0)
        cdi0 = bmc.at_time(cdi, 0)
        assume(bmc, EqualsOrIff(di0, cdi0))
    print()

    # Generate delay indicator for each action
    delay = []
    delay_width = (len(generic_interface.actions)-1).bit_length()
    delay_var = Symbol('delay_sel', BVType(delay_width))
    for i in range(len(generic_interface.actions)):
        delay.append(EqualsOrIff(delay_var, BV(i, delay_width)))

    if len(generic_interface.actions) != 2**delay_width:
        assumption = BVULE(delay_var, BV(len(actions)-1, delay_width))
        assume(bmc, assumption)

    # add constraints based on reduced instruction set proof goal
    # 'monotonicity' assumptions
    # TODO: figure out if this is always the case -- might not be in general?
    #       if action not enabled in first state, then it shouldn't be in the second
    # for ta1, ta2 in zip(timed_actions[0], timed_actions[1]):
    #     assume(bmc, Implies(Not(ta1), Not(ta2)))

    # original system only uses actions in the first state
    for a in timed_actions[1]:
        assume(bmc, Not(a))

    for generic_actions in [timed_actions, copy_timed_actions]:
        # assume that no actions are enabled in the last state (just comparing state now)
        for ta in generic_actions[2]:
            assume(bmc, Not(ta))

    for a, e in zip(timed_actions[0], timed_ens[0]):
        assume(bmc, Implies(a, e))

    ################ add assumptions about delay signal ###################
    # if delaying a signal, it must have been enabled
    for d, a in zip(delay, timed_actions[0]):
        assumption = Implies(d, a)
        assume(bmc, assumption)

    for d, a, ca in zip(delay, timed_actions[0], copy_timed_actions[0]):
        assume(bmc, Implies(Not(d), EqualsOrIff(a, ca)))

    for d, ca in zip(delay, copy_timed_actions[0]):
        assume(bmc, Implies(d, Not(ca)))

    # Usage
    sn = SortingNetwork.sorting_network(timed_actions[0])
    print("\nSorting Network:\n\t", sn)

    return bmc, timed_actions, timed_ens, copy_timed_actions, copy_timed_ens, timed_sys_equiv, delay, sn

def reduced_instruction_set(hts, config, generic_interface):
    setup = ris_proof_setup(hts, config, generic_interface)
    bmc, timed_actions, timed_ens, copy_timed_actions, copy_timed_ens, timed_sys_equiv, delay, sn = setup

    # assertion that delayed signal is enabled
    delayed_signal_enabled = And([Implies(delay[i], copy_timed_ens[1][i]) for i in range(len(delay))])
    # blown-out existential quantification -- there is a delayed signal that's enabled
    exists_enabled_delay_signal = Or([Implies(delay[i], copy_timed_ens[1][i]) for i in range(len(delay))])
    # blown-out existentail quantification, plus the equivalence property
    full_consequent = And(exists_enabled_delay_signal, timed_sys_equiv[2])

    # simple delay assumptions
    print()
    print("Assume that it's disabled in state 1 unless it's the delayed action:")
    for i, (cta1, cta2) in enumerate(zip(copy_timed_actions[0], copy_timed_actions[1])):
        assume(bmc, Implies(Not(cta1), Or(delay[i], Not(cta2))))

    print()
    print("Assume that the delayed action is at time step 1 in the copied system")
    for d, ca in zip(delay, copy_timed_actions[1]):
        assume(bmc, Implies(d, ca))
    print()

    print("Assume that the delayed action is the only action at time 1")
    for d, ca in zip(delay, copy_timed_actions[1]):
        assume(bmc, Implies(Not(d), Not(ca)))
    print()

    # cover -- not equal
    # res = bmc.solver.solver.solve([Not(timed_sys_equiv[2])])
    # assert res
    # if res:
    #     model = bmc.solver.solver.get_model()
    #     print('+++++++++++++++++++++++++++ Model ++++++++++++++++++++++++++++')
    #     print(model)

    for i in reversed(range(1, len(timed_actions[0]))):
        print("Proving enabled-ness condition for instruction cardinality = {}".format(i+1))
        antecedent = sn[i]
        if i < len(timed_actions[0]) - 1:
            # it's exactly i+1 actions enabled
            antecedent = And(antecedent, Not(sn[i+1]))
        prop = Implies(antecedent, full_consequent)
        # print("Prop:", prop)
        assumptions = [Not(prop)]
        res = bmc.solver.solver.solve(assumptions)
        if res:
            model = bmc.solver.solver.get_model()
            print("+++++++++++++++++++++++ Model +++++++++++++++++++++++")
            print(model)
            raise RuntimeError("Bummer. Simple delay failed -- try a more advanced approach")
        else:
            print('Property holds')

def read_verilog(filepath:Path, topmod:str, config:btor_config)->Tuple[HTS, FNode, FNode]:
    parser = VerilogYosysBtorParser()
    return parser.parse_file(filepath, config, flags=[topmod])
