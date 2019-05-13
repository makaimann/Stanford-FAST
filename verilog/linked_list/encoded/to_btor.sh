#!/bin/bash
yosys -l yosys.log -p "read_verilog -sv -formal ./linked_list_fifo.v \
../../arbitrated_fifos/FF.v \
../../arbitrated_fifos/MagicPacketTracker.v \
../../arbitrated_fifos/SimpleScoreboard.sv \
../../arbitrated_fifos/count_ones.sv \
./top.v; \
prep -top top; \
memory -nomap; \
chformal -assume -early; \
flatten; \
opt; \
setundef -undriven -anyseq; \
write_btor top.btor \
"
