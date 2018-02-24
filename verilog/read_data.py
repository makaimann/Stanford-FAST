#!/usr/bin/env python3

import argparse
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.axes as ax
from collections import defaultdict

parser = argparse.ArgumentParser(description='Read data output from Yosys SMT-BMC')
parser.add_argument('input_file', metavar='<INPUT_FILE>', help='The file to read containing Yosys printouts')
parser.add_argument('configuration', metavar='<CONFIG>', help='Which configuration was used to produce this data')
parser.add_argument('--timeout', metavar='<TIMEOUT>', help='Pass the timeout used', default=8000)
parser.add_argument('--log', action='store_true')
args = parser.parse_args()

input_file = args.input_file
timeout = int(args.timeout)
log = args.log
Modes = {"Incremental", "Non-Incremental"}
SolverH = "Solver: "

with open(input_file) as f:
    text = f.read()
    f.close()

data = defaultdict(list)
for line in text.split("\n"):
    if line in Modes:
        mode = line
    elif "Solver:" in line:
        solver = line[line.find(SolverH)+len(SolverH):]
    elif "##" in line:
        if "step" in line:
            step = line[line.find("step")+4:]
            step = int(step.replace("..", ""))
        else:
            assert step
            step += 1
        end = min(line.find("Checking"), line.find("Status"))
        times = line[line.find('##')+2:end]
        times = times.split()
        sec = int(times[0])
        formatted_time = times[1]

        assert mode
        assert solver
        data[(mode, solver)].append(sec)

l = list()
max_steps = max([len(v) for v in data.values()])
fig, ax = plt.subplots()
linestyles = ['-', '--', '-.', ':']
s = -1
for k, times in data.items():
    s = (s + 1) % len(linestyles)
    mode, solver = k
    if len(times) < max_steps:
        times += [timeout]*(max_steps - len(times))
    times = np.array(times)
    if log:
        times = np.log(times)
    plt.plot(times, label="{} {}".format(solver, mode), linewidth=3, linestyle=linestyles[s])

plt.grid("on")
plt.xlabel("Steps")
plt.ylabel("Cumulative Solve Time (s)")
plt.title("Solver Performance:" + args.configuration)

# borrowed from python tutorial
legend = ax.legend(loc='upper left', shadow=True, fontsize='large')
# Put a nicer background color on the legend.
legend.get_frame().set_facecolor('#00FFCC')

plt.show()
