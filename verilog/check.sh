#!/bin/bash

yosys -q -p 'read_verilog -sv -formal data_integrity_scoreboard.sv; hierarchy -check; prep -top Scoreboard; proc; opt; check -assert; write_smt2 -wires disb.smt2'

yosys-smtbmc --noincr -s cvc4 -t 30 --unroll --dump-smt2 named_unrolled.smt2 --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
# For counter examples -- will file issue or make pull request for Yosys fix soon
# yosys-smtbmc -s z3 --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
