#!/usr/bin/env python3

import argparse
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.axes as ax
from collections import defaultdict
from datetime import datetime

parser = argparse.ArgumentParser(description='Read data output from text file')
parser.add_argument('input_file', metavar='<INPUT_FILE>', help='The file to read containing Yosys printouts')
parser.add_argument('--timeout', metavar='<TIMEOUT>', help='Pass the timeout used')
parser.add_argument('--log', action='store_true')
args = parser.parse_args()

input_file = args.input_file
include_timeout = args.timeout is not None
timeout = None
if args.timeout:
    timeout = int(args.timeout)
else:
    # default timeout
    timeout = 2000
log = args.log
SolverH = "Solver: "
TitleH = "TITLE: "

def read_time(s):
    '''
    Parse time string in either seconds or H:M:S format and return
    the number of seconds as a float
    '''
    if ":" in s:
        d = datetime.strptime(s, '%H:%M:%S')
        return float(3600*d.hour + 60*d.minute + d.second)
    else:
        return float(s)

with open(input_file) as f:
    text = f.read()
    f.close()

solvers = set()
header = None
solver = None
data = defaultdict(list)
for line in text.split("\n"):
    if SolverH in line:
        solver = line[line.find(SolverH)+len(SolverH):].strip()
        assert solver not in solvers, "Should not have repeats"
    elif "##" in line:
        vals = line.split()
        t = read_time(vals[1])
        assert solver is not None
        data[solver].append(t)
    elif TitleH in line:
        header = line[line.find(TitleH)+len(TitleH):].strip()
    else:
        pass

max_steps = max([len(v) for v in data.values()])
fig, ax = plt.subplots()
# TODO: choose linestyles/color based on labels
markers = ['^', 'o', '>', 'o', '>', '*']
s = 0
for solver, times in data.items():
    if len(times) < max_steps:
        times += [timeout]*(max_steps - len(times))
    times = np.array(times)
    if log:
        times[times < 0.02] = 0.02
        times = np.log(times)
    plt.plot(times, label=solver, linewidth=2, marker=markers[s])
    s = (s+1)%len(markers)

if include_timeout:
    to = np.array([timeout, timeout])
    if log:
        to = np.log(to)
    plt.plot([0, max_steps], to, 'r--', label='timeout', linewidth=2)

plt.grid("on")
plt.xlabel("Steps")
plt.ylabel("Cumulative Solve Time (s)")
plt.title(header)

# borrowed from python tutorial
legend = ax.legend(loc='upper left', shadow=True, fontsize='large')
# Put a nicer background color on the legend.
legend.get_frame().set_facecolor('#00FFCC')

plt.show()
