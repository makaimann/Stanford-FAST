#!/usr/bin/env python3
import argparse
import os
import sys
from process_source import gen_aig

ABC_COMMAND="""
yosys-abc -c 'read_aiger {aigfile}; fold; strash; {verification} {options}; write_cex -a {top}.aiw'
"""

def main():
    parser = argparse.ArgumentParser(description="Generate AIG collateral for buggy Verilog systems and check enable conditions.")
    parser.add_argument("design", choices=["shift_register", "circular_pointer", "arbitrated", "arbitrated_encoded", "example"])
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int, default=2)
    parser.add_argument("-k", type=int, default=80)
    parser.add_argument("--options", "-o", help='options to pass to abc', default='')
    args = parser.parse_args()

    # always runs with enable macro
    aigfile = gen_aig(args.design, args.depth, args.width, True, args.num_fifos)

    try:
        os.system(ABC_COMMAND.format(aigfile=aigfile,
                                     verification='pdr',
                                     options=args.options,
                                     top=aigfile.replace('.aig', '')))
    except KeyboardInterrupt:
        sys.exit(1)

if __name__ == "__main__":
    main()
