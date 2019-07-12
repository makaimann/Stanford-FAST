#!/bin/bash

if ["$#" -eq 0] || [ "$1" = "composed" ]; then
    ../run_abc.py -t top -e pdr -s='-D=../arbitrated_fifos/' -s ../arbitrated_fifos/fifo.sv -s ../arbitrated_fifos/MagicPacketTracker.v -s ../arbitrated_fifos/SimpleScoreboard.sv -s ./top.v
elif [ "$1" = "abstract" ]; then
    ../run_abc.py -t top -e pdr -s='-D=../arbitrated_fifos/' -s ../arbitrated_fifos/fifo.sv -s ../arbitrated_fifos/MagicPacketTracker.v -s ../arbitrated_fifos/SimpleScoreboard.sv -s ./abstract_top.v
elif [ "$1" = "onlyscoreboards" ]; then
    ../run_abc.py -t top -e pdr -s='-D=../arbitrated_fifos/' -s ../arbitrated_fifos/fifo.sv -s ../arbitrated_fifos/MagicPacketTracker.v -s ./only_scoreboards.v
elif [ "$1" = "fifo" ]; then
    ../run_abc.py -t fifo_top -e pdr -s='-D=../arbitrated_fifos/' -s ../arbitrated_fifos/fifo.sv -s ../arbitrated_fifos/MagicPacketTracker.v -s ../arbitrated_fifos/SimpleScoreboard.sv -s ./fifo_top.sv
fi
