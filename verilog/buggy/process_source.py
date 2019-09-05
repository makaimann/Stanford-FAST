#!/usr/bin/env python3
import argparse
import itertools
import subprocess

YOSYS_SCRIPT="""read_verilog {MACROS} -sv {SRC}; prep -top {TOP}; hierarchy -check; {MEMCMD}; flatten;; setundef -undriven -expose; write_btor {NAME}.btor"""

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
write_aiger -I -B -zinit -map {TOP}.aim {NAME}.aig;
"""

scoreboard_files = ['FF.v', 'MagicPacketTracker.v', 'SimpleScoreboard.sv']

design_files = {
    "example": ["example.v"],
    "shift_register":  ['shift_register_fifo.v', 'shift_register_top.v'],
    "circular_pointer": ['circular_pointer_fifo.v', 'circular_pointer_top.v'],
    "arbitrated": ['arbitrated_top.v', 'onehot_mux.v', 'shift_register_fifo_fixed.v', 'circular_pointer_fifo.v', 'credit_counter.v'],
    "arbitrated_encoded": ['arbitrated_encoded_top.v', 'onehot_mux.v', 'circular_pointer_fifo.v']
}

top_mods = {
    "example": "example",
    "shift_register": 'shift_register_top',
    "circular_pointer": 'circular_pointer_top',
    "arbitrated": 'arbitrated_top',
    "arbitrated_encoded": 'arbitrated_encoded_top'
}

def collect_options(design, depth, width, en, num_fifos):
    en_macro = "-DEN" if en else ""
    MACROS="-DDEPTH={} -DWIDTH={} {}".format(depth, width, en_macro)

    SRC = " ".join(itertools.chain(design_files[design], scoreboard_files))
    TOP = top_mods[design]

    int_en = 1 if en else 0

    NAME = TOP
    if "arbitrated" in design:
        assert num_fifos is not None
        NAME += "_n%i"%num_fifos
        MACROS += " -DNUM_FIFOS={}".format(num_fifos)

    NAME += "_w%i"%width + "_d%i"%depth + "_e%i"%int_en

    return MACROS, SRC, TOP, NAME

def gen_btor(design, depth, width, en, num_fifos, arrays=False):
    '''
    Generates btor and returns the name of the generated file. Throws a runtime error if generation fails.
    '''

    MACROS, SRC, TOP, NAME = collect_options(design, depth, width, en, num_fifos)

    if arrays:
        MEMCMD = "memory -nomap"
    else:
        MEMCMD = "memory"

    child = subprocess.Popen(["yosys", "-l", "yosys.log", "-p", YOSYS_SCRIPT.format(MACROS=MACROS, SRC=SRC, TOP=TOP, MEMCMD=MEMCMD, NAME=NAME)],
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
    parser.add_argument("design", choices=["shift_register", "circular_pointer", "arbitrated", "arbitrated_encoded", "example"])
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int)
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
