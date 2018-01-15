#!/bin/bash

yosys -q -p 'read_verilog -sv -formal data_integrity_scoreboard.sv; hierarchy -check; prep -top DataIntegritySB; proc; opt; check -assert; write_smt2 -wires disb.smt2'

yosys-smtbmc -s cvc4 --unroll --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
# For counter examples -- will file issue or make pull request for Yosys fix soon
# yosys-smtbmc -s z3 --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
