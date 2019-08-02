from collections import namedtuple, defaultdict
from pathlib import Path
from typing import Tuple, List, Optional, NamedTuple

from cosa.analyzers.mcsolver import BMCSolver
from cosa.encoders.verilog_yosys import VerilogYosysBtorParser
from cosa.representation import HTS, TS
from cosa.utils.formula_mngm import SortingNetwork, substitute, get_free_variables

from pysmt.shortcuts import And, BOOL, BV, BVULE, BVType, EqualsOrIff, Implies, Not, Or, simplify, Solver, Symbol, TRUE
from pysmt.fnode import FNode

from por_utils import assume, btor_config, copy_sys, interface, temporal_sys

__all__ = ['reduced_instruction_set', 'read_verilog']

# hacky -- creating config here
# should have an api command to get a generic config object from CoSA

def test_actions(actions, en):
    '''
    Ensure that actions don't imply eachother
    '''
    s = Solver()

    # assume that action can't occur without being enabled
    for a, e in zip(actions, en):
        s.add_assertion(Implies(a, e))

    # now check that you can run an action with all the others disabled
    other_actions = set(actions)
    for a in actions:
        s.push()
        # remove current action
        other_actions.remove(a)

        # assume this action is enabled but none of the others are
        s.add_assertion(a)
        for oa in other_actions:
            s.add_assertion(Not(oa))

        assert s.check_sat(), \
            ("Expecting actions to not imply eachother but "
             "{} implies one of the other options".format(a))

        # add it back in
        other_actions.add(a)
        s.pop()

def ris_proof_setup(hts, config, generic_interface):
    B = 3
    for a in generic_interface.actions:
        assert a.get_type() == BOOL

    print("++++++++++++ automating reduced instruction set search ++++++++++++++++")
    print("Got HTS:", hts)

    print("----------------- adding assumptions to the HTS definition ----------------")

    # convert to a list, we want it to be ordered now
    data_inputs = generic_interface.data_inputs

    print('Found the following data inputs:\n\t', data_inputs)

    # assume reset is zero
    rst_zero = EqualsOrIff(generic_interface.rst, BV(0, 1))
    print("Simple assumption: Hold reset at zero:\n\t", rst_zero)

    # assume data stays constant
    data_stays_const = And([EqualsOrIff(TS.get_prime(di), di) for di in data_inputs])
    print("Simple assumption: data inputs all remain constant:\n\t", data_stays_const)

    # isn't even necessary for simple FIFO without scoreboard (because pointers still end up in same place)
    enabled_conds = And([Implies(a, e) for a, e in zip(generic_interface.actions, generic_interface.ens)])
    print("Add enabled-ness assumptions:\n\t", enabled_conds.serialize(100))

    # create a new transition system to add to the HTS
    ts = TS()
    ts.set_behavior(TRUE(), And(data_stays_const, enabled_conds), rst_zero)
    hts.add_ts(ts)

    # Now the system is ready to be copied
    # Create copy of system
    hts_copy, copy_interface, sys_equiv_output = copy_sys(hts, generic_interface)

    # update the main system
    hts_comb = HTS()
    hts_comb.combine(hts)
    hts_comb.combine(hts_copy)

    bmc = BMCSolver(hts_comb, config)
    # union_vars = hts_comb.vars.union(hts_copy.vars)
    bmc._init_at_time(hts_comb.vars, 2)
    invar = hts_comb.single_invar()
    trans = hts_comb.single_trans()
    invar0 = bmc.at_time(invar, 0)
    assume(bmc, invar0, "Assuming invariant at 0")
    unrolled = bmc.unroll(trans, invar, B)
    assume(bmc, unrolled, "Assuming unrolled system")

    timed_actions = defaultdict(list)
    timed_ens     = defaultdict(list)
    timed_data_inputs = defaultdict(list)
    for t in range(B):
        for a in generic_interface.actions:
            timed_actions[t].append(bmc.at_time(a, t))
        for e in generic_interface.ens:
            timed_ens[t].append(bmc.at_time(e, t))
        for di in data_inputs:
            timed_data_inputs[t].append(bmc.at_time(di, t))
        assert len(timed_actions[t]) == len(timed_ens[t])

    copy_timed_actions = defaultdict(list)
    copy_timed_ens    = defaultdict(list)
    copy_timed_data_inputs = defaultdict(list)
    for t in range(B):
        for ca in copy_interface.actions:
            copy_timed_actions[t].append(bmc.at_time(ca, t))
        for e in copy_interface.ens:
            copy_timed_ens[t].append(bmc.at_time(e, t))
        for cdi in copy_interface.data_inputs:
            copy_timed_data_inputs[t].append(bmc.at_time(cdi, t))
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

    unrolled_sys = temporal_sys(bmc=bmc,
                     timed_actions=timed_actions,
                     timed_ens=timed_ens,
                     timed_data_inputs=timed_data_inputs,
                     copy_timed_actions=copy_timed_actions,
                     copy_timed_ens=copy_timed_ens,
                     copy_timed_data_inputs=copy_timed_data_inputs,
                     timed_sys_equiv=timed_sys_equiv)

    return unrolled_sys

def setup_delay_logic(unrolled_sys:temporal_sys)->Tuple[List[FNode], List[FNode]]:

    # unpack the entire named tuple
    bmc=unrolled_sys.bmc
    timed_actions=unrolled_sys.timed_actions
    timed_ens=unrolled_sys.timed_ens
    timed_data_inputs=unrolled_sys.timed_data_inputs
    copy_timed_actions=unrolled_sys.copy_timed_actions
    copy_timed_ens=unrolled_sys.copy_timed_ens
    copy_timed_data_inputs=unrolled_sys.copy_timed_data_inputs
    timed_sys_equiv=unrolled_sys.timed_sys_equiv

    print("+++++++++++++++++ Setting up delay logic for automated proof +++++++++++++++++++++")

    print()
    # assume they start in the same state
    print("Assuming systems start in the same state:")
    assume(bmc, timed_sys_equiv[0])

    # assume the data starts the same
    print("Assume the data is equivalent")
    for di0, cdi0 in zip(timed_data_inputs[0], copy_timed_data_inputs[0]):
        assume(bmc, EqualsOrIff(di0, cdi0))
    print()

    # Generate delay indicator for each action
    print("Generating delay indicator for each action")
    delay = []
    delay_width = (len(timed_actions[0])-1).bit_length()
    delay_sel = Symbol('delay_sel', BVType(delay_width))
    for i in range(len(timed_actions[0])):
        delay.append(EqualsOrIff(delay_sel, BV(i, delay_width)))

    if len(timed_actions[0]) != 2**delay_width:
        assumption = BVULE(delay_sel, BV(len(timed_actions[0])-1, delay_width))
        assume(bmc, assumption)
    print()

    print("Add assumptions about actions in second and third states:")
    # original system only uses actions in the first state
    for a in timed_actions[1]:
        assume(bmc, Not(a))

    for generic_actions in [timed_actions, copy_timed_actions]:
        # assume that no actions are enabled in the last state (just comparing state now)
        for ta in generic_actions[2]:
            assume(bmc, Not(ta))
    print()

    # Usage
    sn = SortingNetwork.sorting_network(timed_actions[0])
    print("\nSorting Network:\n\t", sn)
    print()

    # assertion that delayed signal is enabled
    delayed_signal_enabled = And([Implies(delay[i], copy_timed_ens[1][i]) for i in range(len(delay))])

    return delay_sel, delay, sn

def simple_delay_strategy(unrolled_sys:temporal_sys, delay:List[FNode], sn:List[FNode], delay_sel:Optional[FNode]=None)->bool:

    # unpack the entire named tuple
    bmc=unrolled_sys.bmc
    timed_actions=unrolled_sys.timed_actions
    timed_ens=unrolled_sys.timed_ens
    timed_data_inputs=unrolled_sys.timed_data_inputs
    copy_timed_actions=unrolled_sys.copy_timed_actions
    copy_timed_ens=unrolled_sys.copy_timed_ens
    copy_timed_data_inputs=unrolled_sys.copy_timed_data_inputs
    timed_sys_equiv=unrolled_sys.timed_sys_equiv

    print("++++++++++++++++++++ Running Simple Delay Strategy +++++++++++++++++++++")
    ################ add assumptions about delay signal ###################
    # if delaying a signal, it must have been enabled
    print("Assume that delayed action must occur in first state in original system")
    for d, a in zip(delay, timed_actions[0]):
        assumption = Implies(d, a)
        assume(bmc, assumption)

    print("Assume that delayed action can't occur in first state in copy")
    for d, ca in zip(delay, copy_timed_actions[0]):
        assume(bmc, Implies(d, Not(ca)))
    print()

    print("Assume that if not delayed, the action and copy of action are equal")
    for d, a, ca in zip(delay, timed_actions[0], copy_timed_actions[0]):
        assume(bmc, Implies(Not(d), EqualsOrIff(a, ca)))
    print()

    # simple delay assumptions
    print("Assume that the delayed action is at time step 1 in the copied system")
    for d, ca in zip(delay, copy_timed_actions[1]):
        assume(bmc, Implies(d, ca))
    print()

    print("Assume that the delayed action is the only action at time 1")
    for d, ca in zip(delay, copy_timed_actions[1]):
        assume(bmc, Implies(Not(d), Not(ca)))
    print()

    # previous bug explanation
    # I had a property like (a -> b) OR (c -> d), which when negated becomes (a AND -b) AND (c AND -d), but a AND c is already unsat in this case so that does NOT work

    # looked like this:
    # full_consequent = Or(Implies(delay[0], And(copy_timed_ens[1][0], timed_sys_equiv[2])),
    #                      Implies(delay[1], And(copy_timed_ens[1][1], timed_sys_equiv[2])))
    # raise RuntimeError("Currently buggy")


    for i in range(1, len(timed_actions[0])):
        print("======= Proving that an action can be delayed for instruction cardinality = {} ======".format(i+1))
        antecedent = sn[i]
        if i < len(timed_actions[0]) - 1:
            # it's exactly i+1 actions enabled
            antecedent = And(antecedent, Not(sn[i+1]))
        prop = Implies(antecedent, timed_sys_equiv[2])
        assumptions = [Not(prop)]
        res = bmc.solver.solver.solve(assumptions)
        if res:
            model = bmc.solver.solver.get_model()
            print("+++++++++++++++++++++++ Model +++++++++++++++++++++++")
            print(model)
            return False
        else:
            return True

def ceg_strategy(unrolled_sys:temporal_sys, delay:List[FNode], sn:List[FNode],
                 delay_sel:Optional[FNode]=None, monotonic:bool=True, constrain_copy=True)->bool:
    '''
    Counter-example guided strategy

    Options:
    # monotonic       : monotonicity with respect to the original system actions
    #                   when true only consider applied actions from the original system when learning the witness function
    # constrain_copy  : extra guidance for the copy system
    #                   when true add the assumption that actions that don't occur at time 0 in the original
    #                   also don't occur in the copy at time 0
    '''


    if delay_sel is None:
        print("Auto-detecting delay_sel...")
        delay_sel = get_free_variables(delay[0])
        assert len(delay_sel) == 1
        delay_sel = delay_sel[0]

    # unpack the entire named tuple
    bmc=unrolled_sys.bmc
    timed_actions=unrolled_sys.timed_actions
    timed_ens=unrolled_sys.timed_ens
    timed_data_inputs=unrolled_sys.timed_data_inputs
    copy_timed_actions=unrolled_sys.copy_timed_actions
    copy_timed_ens=unrolled_sys.copy_timed_ens
    copy_timed_data_inputs=unrolled_sys.copy_timed_data_inputs
    timed_sys_equiv=unrolled_sys.timed_sys_equiv

    print("++++++++++++++++++++ Running Counter-Example Strategy +++++++++++++++++++++")
    ################ add assumptions about delay signal ###################
    # if delaying a signal, it must have been enabled
    print("Assume that delayed action must occur in first state in original system")
    for d, a in zip(delay, timed_actions[0]):
        assumption = Implies(d, a)
        assume(bmc, assumption)
    print()

    print("Assume that delayed action can't occur in first state in copy")
    for d, ca in zip(delay, copy_timed_actions[0]):
        assume(bmc, Implies(d, Not(ca)))
    print()

    print("Assume that the delayed action is at time step 1 in the copied system")
    for d, ca in zip(delay, copy_timed_actions[1]):
        assume(bmc, Implies(d, ca))
    print()

    print("Assume that the delayed action is the only action at time 1")
    for d, ca in zip(delay, copy_timed_actions[1]):
        assume(bmc, Implies(Not(d), Not(ca)))
    print()

    if constrain_copy:
        print("Assume that copy can apply options that original did in time 0")
        for a, ca in zip(timed_actions[0], copy_timed_actions[0]):
            assume(bmc, Implies(ca, a))
        print()

    # counter-example guided loop
    model = None
    # property is equivalence at time 2
    prop = timed_sys_equiv[2]
    for i in range(1, len(timed_actions[0])):
        print("======= Proving that an action can be delayed for instruction cardinality = {} ======".format(i+1))
        antecedent = sn[i]
        if i < len(timed_actions[0]) - 1:
            # it's exactly i+1 actions enabled, e.g. don't let it be more
            antecedent = And(antecedent, Not(sn[i+1]))

        res = True

        while res:
            # check that we haven't over-constrained with the learned witness
            if not bmc.solver.solver.solve([antecedent]):
                res2 = bmc.solver.solver.solve([sn[i-1], Not(sn[i])])
                if res2:
                    print("Previous model")
                    print(model)
                raise RuntimeError("Bummer: Over-constrained by witness -- giving up")

            assumptions = [antecedent, Not(prop)]
            res = bmc.solver.solver.solve(assumptions)

            if res:
                model = bmc.solver.solver.get_model()
                # witness function depends on the property being negated at time 2
                witness_antecedent = [Not(prop)]
                witness_neg_consequent = []
                for ta in timed_actions[0]:
                    vta = bmc.solver.solver.get_value(ta).constant_value()
                    if monotonic:
                        if vta:
                            witness_antecedent.append(ta)
                    else:
                        if vta:
                            witness_antecedent.append(ta)
                        else:
                            witness_antecedent.append(Not(ta))
                # only considering time 0 and only allow delayed action at time 1
                # to be more general, could let the witness constraint range over time 0 and time 1
                for cta in copy_timed_actions[0]:
                    vcta = bmc.solver.solver.get_value(cta).constant_value()
                    if vcta:
                        witness_neg_consequent.append(cta)
                    elif not constrain_copy:
                        witness_neg_consequent.append(Not(cta))
                vdelay = bmc.solver.solver.get_value(delay_sel)
                witness_neg_consequent.append(EqualsOrIff(delay_sel, vdelay))
                witness_constraint = Implies(And(witness_antecedent), Not(And(witness_neg_consequent)))
                print()
                print("Learned witness constraint:")
                assume(bmc, witness_constraint, serialize=100)
                print()
            else:
                continue
    return True

strategies = {
    'simple': simple_delay_strategy,
    'ceg': ceg_strategy
}

def reduced_instruction_set(hts, config, generic_interface, strategy='simple'):
    unrolled_sys = ris_proof_setup(hts, config, generic_interface)

    bmc = unrolled_sys.bmc
    timed_actions = unrolled_sys.timed_actions
    timed_sys_equiv = unrolled_sys.timed_sys_equiv

    # cover -- not equal
    res = bmc.solver.solver.solve([Not(timed_sys_equiv[2])])
    assert res
    # if res:
    #     model = bmc.solver.solver.get_model()
    #     print('+++++++++++++++++++++++++++ Model ++++++++++++++++++++++++++++')
    #     print(model)

    delay_sel, delay, sn = setup_delay_logic(unrolled_sys)

    # another cover after the delay logic is added
    # can't expect there to be a trace resulting in different states after delay logic added
    res = bmc.solver.solver.solve()
    assert res

    res = strategies[strategy](unrolled_sys, delay, sn, delay_sel=delay_sel)

    if res:
        print("Property holds")
        print("IMPORTANT NOTE: This procedure for finding the reduced instruction set relies on proving that actions don't disable each other -- use IC3 for this.")

    else:
        raise RuntimeError("Bummer: {} delay failed -- try a more advanced approach".format(strategy))

    return res

def create_action_constraints(actions:List[FNode])->FNode:
    '''
    Creates a disjunctive constraint for reduced instruction sets.
    Assumes that reduced_instruction_set was called and returned True, i.e. all actions can be separated
    '''

    disjuncts = []
    for i in range(len(actions)):
        conjuncts = []
        for j, a in enumerate(actions):
            if i == j:
                conjuncts.append(a)
            else:
                conjuncts.append(Not(a))
        disjuncts.append(And(conjuncts))

    assert len(disjuncts) > 0, "Expecting non-empty disjunction"

    return Or(disjuncts)


def read_verilog(filepath:Path, topmod:str, config:btor_config)->Tuple[HTS, FNode, FNode]:
    parser = VerilogYosysBtorParser()
    return parser.parse_file(filepath, config, flags=[topmod])
