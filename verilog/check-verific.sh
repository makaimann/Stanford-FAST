#!/bin/bash

yosys -q -p 'verific -sv2009 data_integrity_scoreboard.sv; verific -import Scoreboard; hierarchy -check; proc; memory_collect; opt; prep -top Scoreboard; check -assert; write_smt2 -wires disb-verific.smt2'

yosys-smtbmc -s $1 -t 20 --unroll --dump-smt2 unrolled_verific.smt2 --smtc data_integrity.smtc --dump-vcd disb.vcd disb-verific.smt2
# For counter examples -- will file issue or make pull request for Yosys fix soon
# yosys-smtbmc -s z3 --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
