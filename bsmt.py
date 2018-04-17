#!/usr/bin/env python3
import subprocess
import argparse
import time

parser = argparse.ArgumentParser(description='Takes an incremental smt2 file and calls the provided solver repeatedly')
parser.add_argument('solver', metavar='<solver>', help='The solver to use')
parser.add_argument('input_file', metavar='<input_file>', help='The incremental benchmark')
parser.add_argument('--options', metavar='solver options', action='store', type=str, help='solver options to use')

args = parser.parse_args()

solver = args.solver
input_file = args.input_file
options = args.options

cmd = [solver]

if options:
    cmd += options.split(" ")

if solver == 'cvc4':
    cmd.append('--lang=smt')

# preprocess the input file
with open(input_file) as f:
    lines = f.read()
    f.close()

idx = 0
push = None
pop = None
proc_lines = []
total_time = 0.0
times = []
step = 0
stderr = []
# Note: only handles push and pop by one right now
for l in lines.split("\n"):
    if "(push 1)" in l or "(push)" in l:
        proc_lines.append(";; {}".format(l))
        push = idx
    elif "(pop 1)" in l or "(pop)" in l:
        assert push is not None
        assert 'push' in proc_lines[push]
        idx = push-1
        proc_lines = proc_lines[:push]
        push = None
    elif l.strip() == "(check-sat)":
        # Set up the echo command and direct the output to a pipe
        p1 = subprocess.Popen(cmd, stdout=subprocess.PIPE,
                              stdin=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              encoding='utf8')

        # Run the command
        start = time.time()
        output = p1.communicate('\n'.join(proc_lines + ["(check-sat)"]))
        t = time.time() - start

        total_time += t
        times.append(total_time)

        print("## {:.2f} {} at step {}".format(total_time, output[0].rstrip(), step))
        step += 1

        if output[1] is not None and output[1].strip() != "":
            raise RuntimeError(output[1])

    else:
        proc_lines.append(l)

    idx += 1
