#!/usr/bin/env python3
import argparse
import sys

NOTINIT = "(= (bvand (bvnot rst__AT1) (bvnot sb.ff_en.Q__AT1) (bvor (bvnot ((_ extract 3 3) sb.mpt.ff_cnt.Q__AT1)) (bvcomp ((_ extract 2 0) sb.mpt.ff_cnt.Q__AT1) #b000)) (bvcomp sb.mpt.ff_cnt.Q__AT1 (bvsub |af.gen_fifos[0].f.ff_wrPtr.Q__AT1| |af.gen_fifos[0].f.ff_rdPtr.Q__AT1|))) #b0)"
PROP = "(= prop_signal__AT{} #b1)"

# (!en@{0} ^ en@{1}) -> (!data_out_vld@{2} | (wrPtr@{0} = rdPtr@{2}))
# {0} start, {1} = {0}+1, {2} prop time
SGF = "(=> (and (= sb.ff_en.Q__AT{0} #b0) (= sb.ff_en.Q__AT{0} #b1)) (or (= data_out_vld__AT{2} #b0) (= |af.gen_fifos[0].f.ff_wrPtr.Q__AT{0}| |af.gen_fifos[0].f.ff_rdPtr.Q__AT{2}|)))"

parser = argparse.ArgumentParser("Add proof lifting and search guiding formulas to an smt2 file.\nAssumes that the smt2 file already has a symbolic initial state")
parser.add_argument("--proof-lifting", action="store_true", help="Add proof-lifing")
parser.add_argument("--search-guiding", action="store_true", help="Add search guiding formulas")
parser.add_argument("smt2file", metavar="<SMT2 FILE>", help="The SMT2 file to modify")
parser.add_argument('-f', action="store_true", help='forcibly run without extra checks')

CHECKSAT = "(check-sat)"

args = parser.parse_args()

pl = args.proof_lifting
sg = args.search_guiding
smt2file = args.smt2file
force = args.f

if not force and not pl and not sg:
    print("Not being asked to do anything...exiting")
    sys.exit()

if not force and "syminit" not in smt2file:
    raise Warning("Not clear that this is a symbolic initial state file. Are you sure you want to run on this?")

def insert_clauses(genfun, smt2in, start=0):
    '''
    Assumes that you are issuing a (push 1) once per bound before the property check
    '''
    t = 0
    smt2out = ""
    for line in smt2in.split("\n"):
        line = line.strip()
        if line == CHECKSAT:
            if t >= start:
                smt2out += genfun(t) + "\n"
            smt2out += CHECKSAT + "\n"
            t += 1
        else:
            smt2out += line + "\n"
    return smt2out

def add_pl(t):
    return ";; block initial state\n(assert {})\n".format(NOTINIT)
#    return "(assert (=> {} {}))".format(INIT, PROP.format(t))

def add_sg(t):
    smt2 = ";; Search guiding formulas\n\n"
    candidates = []
    fmtname = "en{}_prop{}"
    for i in range(t):
        j = i+1
        name = fmtname.format(j, t)
        formula = SGF.format(i, j, t)
        candidates.append((name, formula))

    final_check = "(check-sat-assuming ((not (and"
    for name, formula in candidates:
        final_check += " %s"%name
        smt2 += "(define-fun {} () Bool {})\n\n".format(name, formula)
    smt2 += final_check + "))))\n\n"
    return smt2

def add_echo(t):
    return "\n(echo \"Checking property at bound {}\")\n".format(t)

suffix = ""

if pl:
    suffix += "-pl"
if sg:
    suffix += "-sg"

outfile = smt2file.replace(".smt2", "")
outfile += suffix + ".smt2"

f = open(smt2file, "r")
smt2 = f.read()

if pl:
    smt2 = insert_clauses(add_pl, smt2, 2)
if sg:
    smt2 = insert_clauses(add_sg, smt2, 2)

if sg:
    # more unsats than bounds in this case, mark important calls
    smt2 = insert_clauses(add_echo, smt2)

f.close()

with open(outfile, "w") as fout:
    fout.write(smt2)
