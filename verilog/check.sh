#!/bin/bash

yosys -q -p 'read_verilog -sv -formal Scoreboard.sv; hierarchy -check; proc; memory_collect; opt; prep -top Scoreboard; check -assert; write_smt2 -wires Scoreboard.smt2'

yosys-smtbmc -s $1 -t 25 --unroll --dump-smt2 named_unrolled.smt2 --smtc data_integrity.smtc  --dummy dummy-unsats.txt --dump-vcd disb.vcd Scoreboard.smt2
# For counter examples -- will file issue or make pull request for Yosys fix soon
# yosys-smtbmc -s z3 --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
