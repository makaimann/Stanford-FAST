#!/bin/bash

if ["$#" -eq 0] || [ "$1" = "composed" ]; then
    /home/makaim/.local/bin/run_abc -t top -e pdr -s='-D=../arbitrated_fifos/' -s ../arbitrated_fifos/fifo.sv -s ../arbitrated_fifos/MagicPacketTracker.v -s ./SimpleScoreboard.sv -s ./top.v
elif [ "$1" = "abstract" ]; then
    /home/makaim/.local/bin/run_abc -t top -e pdr -s='-D=../arbitrated_fifos/' -s ../arbitrated_fifos/fifo.sv -s ../arbitrated_fifos/MagicPacketTracker.v -s ./SimpleScoreboard.sv -s ./abstract_top.v
elif [ "$1" = "fifo" ]; then
    /home/makaim/.local/bin/run_abc -t fifo_top -e pdr -s='-D=../arbitrated_fifos/' -s ../arbitrated_fifos/fifo.sv -s ../arbitrated_fifos/MagicPacketTracker.v -s ./SimpleScoreboard.sv -s ./fifo_top.sv
fi
