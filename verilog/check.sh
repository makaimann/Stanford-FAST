#!/bin/bash

yosys -p 'read_verilog -sv -formal data_integrity_scoreboard.sv; hierarchy -check; prep -top DataIntegritySB; proc; opt; check -assert; write_smt2 -wires disb.smt2'

yosys-smtbmc -s cvc4 --unroll --dump-vcd disb.vcd disb.smt2
