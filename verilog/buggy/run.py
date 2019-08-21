#!/usr/bin/env python3
import argparse
import os
from pathlib import Path
import sys

from process_source import gen_btor

def main():
    parser = argparse.ArgumentParser(description="Generate BTOR and run on it.")
    parser.add_argument("design", choices=["shift_register", "circular_pointer", "arbitrated", "example"])
    parser.add_argument("--depth", type=int, default=8)
    parser.add_argument("--width", type=int, default=8)
    parser.add_argument("--num-fifos", type=int, default=4)
    parser.add_argument("-k", type=int, default=80)
    parser.add_argument("--por", action="store_true")
    args = parser.parse_args()

    # never runs with enable macro
    btorfile = gen_btor(args.design, args.depth, args.width, False, args.num_fifos)

    design = btorfile.replace(".btor", "")

    COSA_SCRIPT="CoSA -i {BTOR} -k {K} --verification safety --solver-name btor"

    if args.por:
        assumptionfile = Path("assumptions-{}.txt".format(design))

        if not assumptionfile.exists():
            raise RuntimeError("ERROR: {} has not been produced.".format(assumptionfile))

        COSA_SCRIPT += " -a {}".format(assumptionfile)

    try:
        os.system(COSA_SCRIPT.format(BTOR=btorfile, K=args.k))
    except KeyboardInterrupt:
        sys.exit(1)

if __name__ == "__main__":
    main()
