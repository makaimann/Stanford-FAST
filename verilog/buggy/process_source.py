#!/usr/bin/env python3
import argparse
import itertools
import subprocess

YOSYS_SCRIPT="""read_verilog {MACROS} -sv {SRC}; prep -top {TOP}; hierarchy -check; memory; flatten;; setundef -undriven -expose; write_btor {NAME}.btor"""

YOSYS_ABC_SCRIPT="""
read_verilog -sv -formal {MACROS} {SRC}; prep -top {TOP}; \
memory_map; \
chformal -assume -early; \
chformal -live -fair -cover -remove; \
setundef -anyseq; \
check; \
hierarchy -simcheck; \
flatten; \
delete -output; \
techmap; \
abc -g AND -fast; \
write_aiger -I -B -zinit -map {TOP}.aim {TOP}.aig;
"""

scoreboard_files = ['FF.v', 'MagicPacketTracker.v', 'SimpleScoreboard.sv']

design_files = {
    "shift_register":  ['shift_register_fifo.v', 'shift_register_top.v'],
    "circular_pointer": ['circular_pointer_fifo.v', 'circular_pointer_top.v'],
    "arbitrated": ['arbitrated_top.v', 'round_robin_selector.sv', 'onehot_mux.v', 'circular_pointer_fifo.v']
}

top_mods = {
    "shift_register": 'shift_register_top',
    "circular_pointer": 'circular_pointer_top',
    "arbitrated": 'arbitrated_top'
}

def collect_options(design, depth, width, en, num_fifos):
    en_macro = "-DEN" if en else ""
    MACROS="-DDEPTH={} -DWIDTH={} -DNUM_FIFOS={} {}".format(depth, width, num_fifos, en_macro)
    SRC = " ".join(itertools.chain(design_files[design], scoreboard_files))
    TOP = top_mods[design]

    int_en = 1 if en else 0
    NAME = TOP + "_w%i"%width + "_d%i"%depth + "_e%i"%int_en

    if design == "arbitrated":
        NAME += "_n%i"%num_fifos

    return MACROS, SRC, TOP, NAME

def gen_btor(design, depth, width, en, num_fifos):
    '''
    Generates btor and returns the name of the generated file. Throws a runtime error if generation fails.
    '''

    MACROS, SRC, TOP, NAME = collect_options(design, depth, width, en, num_fifos)

    child = subprocess.Popen(["yosys", "-l", "yosys.log", "-p", YOSYS_SCRIPT.format(MACROS=MACROS, SRC=SRC, TOP=TOP, NAME=NAME)],
                             stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT)
    stdout,stderr = child.communicate()
    if child.returncode != 0:
        print(stdout)
        print(stderr)
        raise RuntimeError("Failed")

    print("Successfully wrote btor file to {NAME}.btor".format(NAME=NAME))

    return NAME + ".btor"

def gen_aig(design, depth, width, en, num_fifos):
    '''
    Generates aig and returns the name of the generated file. Throws a runtime error if generation fails.
    '''

    MACROS, SRC, TOP, NAME = collect_options(design, depth, width, en, num_fifos)

    child = subprocess.Popen(["yosys", "-l", "yosys.log", "-p", YOSYS_ABC_SCRIPT.format(MACROS=MACROS, SRC=SRC, TOP=TOP, NAME=NAME)],
                             stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT)
    stdout,stderr = child.communicate()
    if child.returncode != 0:
        print(stdout)
        print(stderr)
        raise RuntimeError("Failed")

    print("Successfully wrote aig file to {NAME}.aig".format(NAME=NAME))

    return NAME + ".aig"


def main():
    parser = argparse.ArgumentParser(description="Generate BTOR collateral for buggy Verilog systems.")
    parser.add_argument("design", choices=["shift_register", "circular_pointer", "arbitrated", "example"])
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int, default=4)
    parser.add_argument("--en", action="store_true", default=False)
    parser.add_argument("--dest", required=True, choices=['btor', 'aig'])
    args = parser.parse_args()

    if args.dest == 'btor':
        gen_btor(args.design, args.depth, args.width, args.en, args.num_fifos)
    elif args.dest == 'aig':
        gen_aig(args.design, args.depth, args.width, args.en, args.num_fifos)
    else:
        raise ValueError("Unknown destination option: {}".format(args.dest))

if __name__ == "__main__":
    main()
