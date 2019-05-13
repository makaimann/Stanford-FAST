#!/bin/bash
yosys -l yosys.log -p 'read_verilog -sv -formal top.sv; prep -top top; hierarchy -check; proc; memory -nomap; opt; chformal -assume -early; flatten; opt; setundef -undriven -anyseq; write_btor top.btor'
# yosys -l yosys.log -p 'read_verilog -sv -formal Scoreboard.sv; hierarchy -check; proc; memory -nomap; opt; prep -top Scoreboard; check -assert; flatten; opt; write_btor Scoreboard.btor'
