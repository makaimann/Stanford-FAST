#!/usr/bin/env python3
import argparse
import os
from pathlib import Path
import subprocess
import sys

YOSYS_COMMAND="""
read_verilog -sv -formal {source_files}; prep -top {top}; \
memory_map; \
async2sync; \
chformal -assume -early; \
chformal -live -fair -cover -remove; \
opt_clean; \
setundef -anyseq; \
opt -keepdc -fast; \
check; \
hierarchy -simcheck; \
flatten; \
setattr -unset keep; \
delete -output; \
opt -full; \
techmap; \
opt -fast; \
abc -g AND -fast; \
opt_clean; \
stat; \
write_aiger -I -B -zinit -map {top}.aim {top}.aig;
"""

ABC_COMMAND="""
read_aiger {top}.aig; fold; strash; {verification} {options}; write_cex -a {top}.aiw
"""


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="command line interface for running abc through Yosys")

    parser.add_argument("-e", "--engine", choices=['pdr', 'int', 'bmc3', 'ind'])
    parser.add_argument("--options", '-o', help='options to pass through to abc', default='')
    parser.add_argument('-s', '--source_files', help='Verilog source files', action='append')
    parser.add_argument('--top', '-t', default='top')

    args = parser.parse_args()

    res = subprocess.check_call(['yosys',
                                 '-l', 'yosys.log',
                                 '-p', YOSYS_COMMAND.format(source_files=" ".join(args.source_files),
                                                            top=args.top)
    ])

    if res != 0:
        print(res)
        sys.exit(res)

    res = subprocess.check_call([
        'yosys-abc',
        '-c', ABC_COMMAND.format(verification=args.engine,
                                 options=args.options,
                                 top=args.top)
    ])

    topaig = Path("{top}.aig".format(top=args.top))
    if topaig.exists():
        topaim = topaig.with_suffix('.aim')
        topaig.unlink()
        if topaim.exists():
            topaim.unlink()