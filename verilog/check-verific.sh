#!/bin/bash

yosys -q -p 'verific -sv2009 Scoreboard.sv; verific -import Scoreboard; hierarchy -check; proc; memory_collect; opt; prep -top Scoreboard; check -assert; write_smt2 -wires Scoreboard-verific.smt2'

yosys-smtbmc -s $1 -t 20 --unroll --noincr --dump-smt2 unrolled_verific.smt2 --smtc data_integrity.smtc --dump-vcd disb.vcd Scoreboard-verific.smt2
# For counter examples -- will file issue or make pull request for Yosys fix soon
# yosys-smtbmc -s z3 --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
