from collections import namedtuple
from cosa.analyzers.mcsolver import BMCSolver
from cosa.utils.formula_mngm import substitute, get_free_variables
from cosa.representation import HTS, TS
from typing import List, NamedTuple, Tuple
from pysmt.fnode import FNode
from pysmt.shortcuts import And, BOOL, BV, BVULE, BVType, EqualsOrIff, Implies, Not, Or, simplify, Solver, Symbol, TRUE


btor_config = namedtuple('btor_config', 'abstract_clock opt_circuit no_arrays symbolic_init strategy skip_solving smt2_tracing solver_name incremental solver_options synchronize verific')
interface   = namedtuple('interface', 'actions ens rst clk data_inputs')
temporal_sys = namedtuple('temporal_sys', 'bmc, timed_actions, timed_ens, timed_data_inputs, copy_timed_actions, copy_timed_ens, copy_timed_data_inputs, timed_sys_equiv')

def assume(bmc:BMCSolver, assumption:FNode, msg:str=None, serialize:int=None):
    if msg is not None:
        print(msg)
    else:
        if serialize is not None:
            assumptionstr = assumption.serialize(serialize)
        else:
            assumptionstr = repr(assumption)
        print('Adding assumption: {}'.format(assumptionstr))
    bmc._add_assertion(bmc.solver, assumption)


def copy_sys(hts:HTS, generic_interface:interface)->Tuple[HTS, interface, FNode]:
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

    var_intersection = hts_copy.vars.intersection(hts.vars)
    assert len(var_intersection) == 0, "Expected empty intersection but got: {}".format(var_intersection)

    copy_free_vars = get_free_variables(hts_copy.single_invar()).union(get_free_variables(hts_copy.single_trans()))
    orig_free_vars = get_free_variables(hts.single_invar()).union(get_free_variables(hts.single_trans()))

    free_var_intersection = copy_free_vars.intersection(orig_free_vars)
    assert len(free_var_intersection) == 0, "Expected no common free variables but got: {}".format(free_var_intersection)

    copy_interface = interface(actions=[substitute(a, copymap) for a in generic_interface.actions],
                               ens=[substitute(e, copymap) for e in generic_interface.ens],
                               rst=substitute(generic_interface.rst, copymap),
                               clk=substitute(generic_interface.clk, copymap),
                               data_inputs=[TS.get_prefix(d, prefix) for d in generic_interface.data_inputs])

    print("Created copy of HTS")
    print("\t", hts_copy)

    sys_equiv_output = And([EqualsOrIff(sv, substitute(sv, copymap)) for sv in hts.state_vars])
    return hts_copy, copy_interface, sys_equiv_output

