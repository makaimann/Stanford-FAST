#!/bin/bash

# Author: Makai Mann

# Prove data integrity

show_help ()
{
    echo -e "
$(basename $0) <verification type>
    pdr: IC3/PDR with ABC, default
    int: Interpolant based model checking with ABC
    bmc: BMC with ABC
    smtbmc: BMC with Boolector
"
}

gen_aiger()
{
    yosys -l yosys.log -q -p "read -formal top.sv; prep -top top; memory_map; async2sync; chformal -assume -early; chformal -live -fair -cover -remove; opt_clean; setundef -anyseq -undriven; opt -keepdc -fast; check; hierarchy -simcheck; flatten; delete -output; opt -full; techmap; opt -fast; abc -g AND -fast; opt_clean; stat; write_aiger -I -B -zinit -map top.aim top.aig;"
}

gen_smt2()
{
    yosys -l yosys.log -q -p "verific -formal top.sv; verific -import top; prep -top top; setundef -anyseq -undriven; memory -nomap; opt; write_smt2 -wires top.smt2"
}

gen_nomem_smt2()
{
    yosys -l yosys.log -q -p "verific -formal top.sv; verific -import top; prep -top top; setundef -anyseq -undriven; memory; opt; write_smt2 -wires top.smt2"
}

run_pdr()
{
    echo -e "
##########################################################################
#                              RUNNING PDR                               #
##########################################################################
"
    yosys-abc -c "read_aiger top.aig; fold; strash; pdr; write_cex -a top.aiw"
}

# Initialize our own variables
ver="pdr"

if [ "$#" -gt 1 ]; then
    show_help
    exit 1
fi

if [ "$#" -eq 1 ]; then
    case "$1" in
        pdr)
            ver="pdr"
            ;;
        int)
            ver="int"
            ;;
        bmc)
            ver="bmc"
            ;;
        smtbmc)
            ver="smtbmc"
            ;;
        "-h")
            show_help
            exit 0
            ;;
        *)
            show_help
            exit 1
            ;;
   esac
fi

case $ver in
    pdr)
        gen_aiger
        run_pdr
        ;;
    int|bmc)
        gen_aiger
        echo "unimplemented"
        ;;
    smtbmc)
        gen_smt2
        echo "unimplemented"
        ;;
esac

