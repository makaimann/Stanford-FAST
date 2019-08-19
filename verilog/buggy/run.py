#!/usr/bin/env python3
import argparse
import os
import sys
from to_btor import gen_btor

COSA_SCRIPT="time CoSA -i {BTOR} -k {K} --verification safety --full-trace"

def main():
    parser = argparse.ArgumentParser(description="Generate BTOR collateral for buggy Verilog systems.")
    parser.add_argument("design", choices=["shift_register", "circular_pointer", "arbitrated", "example"])
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int, default=4)
    parser.add_argument("-k", type=int, default=80)
    args = parser.parse_args()

    btorfile = gen_btor(args.design, args.depth, args.width, args.num_fifos)

    try:
        os.system(COSA_SCRIPT.format(BTOR=btorfile, K=args.k))
    except KeyboardInterrupt:
        sys.exit(1)

if __name__ == "__main__":
    main()
