#!/usr/bin/env python3
import argparse
import itertools
import subprocess

YOSYS_SCRIPT="""read_verilog {MACROS} -sv {SRC}; prep -top {TOP}; hierarchy -check; memory; flatten;; setundef -undriven -expose; write_btor {TOP}.btor"""

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

def gen_btor(design, depth, width, num_fifos):
    '''
    Generates btor and returns the name of the generated file. Throws a runtime error if generation fails.
    '''
    MACROS="-DDEPTH={} -DWIDTH={} -DNUM_FIFOS={}".format(depth, width, num_fifos)
    SRC = " ".join(itertools.chain(design_files[design], scoreboard_files))
    TOP = top_mods[design]

    child = subprocess.Popen(["yosys", "-l", "yosys.log", "-p", YOSYS_SCRIPT.format(MACROS=MACROS, SRC=SRC, TOP=TOP)],
                             stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT)
    stdout,stderr = child.communicate()
    if child.returncode != 0:
        print(stdout)
        print(stderr)
        raise RuntimeError("Failed")

    print("Successfully wrote btor file to {TOP}.btor".format(TOP=TOP))

    return "{}.btor".format(TOP)


def main():
    parser = argparse.ArgumentParser(description="Generate BTOR collateral for buggy Verilog systems.")
    parser.add_argument("design", choices=["shift_register", "circular_pointer", "arbitrated", "example"])
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int, default=4)
    args = parser.parse_args()

    gen_btor(args.design, args.depth, args.width, args.num_fifos)

if __name__ == "__main__":
    main()
