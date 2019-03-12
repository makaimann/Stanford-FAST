#!/bin/bash

yosys -q -p 'verific -sv2012 sram_example.sv; verific -import top; hierarchy -check; prep -top top; proc; opt; check -assert; write_smt2 -wires sram.smt2'

yosys-smtbmc --noincr -s cvc4 -S '--bitblast=eager' -t 30 --dump-smt2 sram_unrolled.smt2 sram.smt2
