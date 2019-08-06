from collections import defaultdict, namedtuple
from cosa.analyzers.mcsolver import BMCSolver
from cosa.utils.formula_mngm import substitute, get_free_variables
from cosa.representation import HTS, TS
from typing import List, NamedTuple, Tuple
from pysmt.fnode import FNode
from pysmt.shortcuts import And, BOOL, BV, BVULE, BVType, EqualsOrIff, Implies, Not, Or, simplify, Solver, Symbol, TRUE

from por_utils import assume, copy_sys, interface

def find_gir(hts:HTS, config:NamedTuple, generic_interface:interface)->List[Tuple[FNode, FNode]]:
    '''
    Automatically find guarded independence relationships, aka partial order reductions
    '''

    B = 3

    copy_hts, copy_interface, sys_equiv_output = copy_sys(hts, generic_interface)
    hts_comb = HTS()
    hts_comb.combine(hts)
    hts_comb.combine(copy_hts)

    bmc = BMCSolver(hts_comb, config)
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
        for di in generic_interface.data_inputs:
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

    assume(bmc, timed_sys_equiv[0], "Assuming they start in the same state.")

    print("Add assumptions about copy data")
    for i in range(len(generic_interface.data_inputs)):
        assume(bmc, EqualsOrIff(copy_timed_data_inputs[0][i], timed_data_inputs[1][i]))
        assume(bmc, EqualsOrIff(copy_timed_data_inputs[1][i], timed_data_inputs[0][i]))

    girs = []
    for i in range(len(generic_interface.actions)-1):
        for j in range(i+1, len(generic_interface.actions)):
            print("Checking {} and {} for an independence relationship".format(generic_interface.actions[i], generic_interface.actions[j]))
            a0i, a1j = timed_actions[0][i], timed_actions[1][j]
            ca0j, ca1i = copy_timed_actions[0][j], copy_timed_actions[1][i]

            if not bmc.solver.solver.solve([a0i, a1j, ca0j, ca1i, Not(timed_sys_equiv[2])]):
                print("Found an independence relationship.")
                girs.append((generic_interface.actions[i], generic_interface.actions[j]))
            else:
                print("An independence relationship check failed.")
                # model = bmc.solver.solver.get_model()
                # print(model)
                # raise RuntimeError() #temporary for debugging

    return girs

def safe_to_remove_empty_instruction(hts:HTS, config:NamedTuple, generic_interface:interface)->bool:
    '''
    Returns true if we can remove the empty instruction (e.g. no actions, a stutter step)
    '''
    B = 2

    bmc = BMCSolver(hts, config)
    bmc._init_at_time(hts.vars, 2)

    invar = hts.single_invar()
    trans = hts.single_trans()
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
        for di in generic_interface.data_inputs:
            timed_data_inputs[t].append(bmc.at_time(di, t))
        assert len(timed_actions[t]) == len(timed_ens[t])

    assert hts.state_vars, "Expecting at least one state variable"
    state_changed = Not(And([EqualsOrIff(bmc.at_time(sv, 0), bmc.at_time(sv, 1)) for sv in hts.state_vars]))

    return not bmc.solver.solver.solve([Not(Or(timed_actions[0])), state_changed])
