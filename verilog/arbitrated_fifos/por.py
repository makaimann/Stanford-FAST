from collections import namedtuple
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
    bmc = BMCSolver(hts, config)
    union_vars = hts.vars.union(copy_hts.vars)
    bmc._init_at_time(hts.vars, 2)
    invar = hts.single_invar()
    trans = hts.single_trans()
    invar0 = bmc.at_time(invar, 0)
    assume(bmc, invar0, "Assuming invariant at 0")
    unrolled = bmc.unroll(trans, invar, B)
    assume(bmc, unrolled, "Assuming unrolled system")
