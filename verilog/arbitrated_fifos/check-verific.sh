#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "usage: $0 <solver> <bound>"
    exit 1
fi


yosys -q -p 'verific -sv2009 Scoreboard.sv; verific -import Scoreboard; hierarchy -check; proc; memory_collect; opt; prep -top Scoreboard; check -assert; write_smt2 -wires Scoreboard-verific.smt2'

yosys-smtbmc -s $1 -t $2 --unroll --noincr --dump-smt2 unrolled_verific.smt2 --smtc data_integrity.smtc --dump-vcd disb.vcd Scoreboard-verific.smt2

# best CVC4 performances
# yosys-smtbmc -s cvc4 -t $2 --unroll --noincr --logic QF_BV -S '--bitblast=eager' -S '--bv-sat-solver=cadical' --dump-smt2 named_unrolled.smt2 --smtc data_integrity.smtc  --dummy dummy-unsats.txt --dump-vcd disb.vcd Scoreboard.smt2

# For counter examples
# yosys-smtbmc -s z3 --smtc data_integrity.smtc --dump-vcd disb.vcd disb.smt2
