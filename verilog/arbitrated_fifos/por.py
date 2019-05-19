#!/usr/bin/env python3

from cosa.encoders.verilog_yosys import VerilogYosysBtorParser
from cosa.analyzers.mcsolver import BMCSolver

from pysmt.shortcuts import BOOL, BV, EqualsOrIff

from collections import namedtuple
from pathlib import Path

# hacky -- creating config here
# should have an api command to get a generic config object from CoSA

btor_config = namedtuple('btor_config', 'abstract_clock opt_circuit no_arrays symbolic_init strategy skip_solving smt2_tracing solver_name incremental solver_options')

def reduced_instruction_set(hts, config, actions):
    for a in actions:
        assert a.get_type() == BOOL

    print("++++++++++++ automating reduced instruction set search ++++++++++++++++")
    print("Got HTS:", hts)
    print("\tWith actions={}".format(actions))

    bmc = BMCSolver(hts, config)

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
