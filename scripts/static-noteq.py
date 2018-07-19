#!/usr/bin/env python3
import argparse

from pyparsing import Word, printables, nestedExpr, Group, Forward, alphas, originalTextFor, Optional, Literal

parser = argparse.ArgumentParser(description='Statically detect literal pairs')
parser.add_argument('input_file', metavar='<INPUT_FILE>', help='SMT-LIB input')
parser.add_argument('output_file', metavar='<OUTPUT_FILE>', help='SMT-LIB output -- same as input file with additional assertions')
args = parser.parse_args()

input_file = args.input_file
output_file = args.output_file

enclosed = Forward()
svar = Word(printables.replace("()",""))
bvoneorzero = (Literal("#b1") | Literal("#b0"))
eqpat = originalTextFor(nestedExpr(content="= " + enclosed))
neqpat = originalTextFor("(not " + eqpat + ")")
enclosed << (svar | nestedExpr(opener='(', closer=')', content=None)) + bvoneorzero

detectneq = (eqpat | neqpat)

# tags
POSTAG = 1   # uses one to encode a positive equality
NEGTAG = 2   # uses two to encode a negated equality
BOTHTAG = 3  # three encodes both the positive and negative equalities occur (add an assertion comparing the two)

negval = {0: 1, 1:0}
def process_match(s):
    print(s)
    neg = False
    if s[:4] == "(not":
        name = s[9:-6]
        start = -3
        end = -2
        neg = True
        tag = 2
    else:
        name = s[4:-5]
        start = -2
        end = -1
        tag = 1
    print(start, end)
    print(s[start:end])
    assert s[start:end] in {"0", "1"}, "Expecting '0' or '1'"
    val = int(s[start:end])
    if neg:
        val = negval[val]
    print(s)
    print(name, val)
    return (name, val), tag

matches = {}

f_out = open(output_file, "w")

# read file and keep track of = and != #b(0|1) if you have both then we add an assertion connecting the two
with open(input_file) as f:
    for line in f:
        to_write = line
        res = detectneq.searchString(line)
        for r in res:
            idx, tag = process_match(r[0])

            if idx not in matches:
                matches[idx] = 0

            if matches[idx] == 0:
                matches[idx] += tag
            elif matches[idx] == POSTAG and tag == NEGTAG:
                matches[idx] += tag
            elif matches[idx] == NEGTAG and tag == POSTAG:
                matches[idx] += tag

            if matches[idx] == BOTHTAG:
                name, val = idx
                poseq = "(= {} #b{})".format(name, val)
                negeq = "(not (= {} #b{}))".format(name, negval[val])
                to_write += "\n(assert (= {} (not {})))\n".format(poseq, negeq)

        f_out.write(to_write)

    f.close()

f_out.close()
