analyze -sv {force_sequential.sv};
elaborate -top top;

clock clk;
reset rst;

set EQ {
(af0.arb.deficit_counters[0].ff_defcnt.Q == af1.arb.deficit_counters[0].ff_defcnt.Q) &&
(af0.arb.deficit_counters[1].ff_defcnt.Q == af1.arb.deficit_counters[1].ff_defcnt.Q) &&
(af0.arb.ff_rrcnt.Q == af1.arb.ff_rrcnt.Q) &&
(af0.gen_fifos[0].f.entries[0] == af1.gen_fifos[0].f.entries[0]) &&
(af0.gen_fifos[0].f.entries[1] == af1.gen_fifos[0].f.entries[1]) &&
(af0.gen_fifos[0].f.entries[2] == af1.gen_fifos[0].f.entries[2]) &&
(af0.gen_fifos[0].f.entries[3] == af1.gen_fifos[0].f.entries[3]) &&
(af0.gen_fifos[0].f.entries[4] == af1.gen_fifos[0].f.entries[4]) &&
(af0.gen_fifos[0].f.entries[5] == af1.gen_fifos[0].f.entries[5]) &&
(af0.gen_fifos[0].f.entries[6] == af1.gen_fifos[0].f.entries[6]) &&
(af0.gen_fifos[0].f.entries[7] == af1.gen_fifos[0].f.entries[7]) &&
(af0.gen_fifos[0].f.ff_rdPtr.Q == af1.gen_fifos[0].f.ff_rdPtr.Q) &&
(af0.gen_fifos[0].f.ff_wrPtr.Q == af1.gen_fifos[0].f.ff_wrPtr.Q) &&
(af0.gen_fifos[1].f.entries[0] == af1.gen_fifos[1].f.entries[0]) &&
(af0.gen_fifos[1].f.entries[1] == af1.gen_fifos[1].f.entries[1]) &&
(af0.gen_fifos[1].f.entries[2] == af1.gen_fifos[1].f.entries[2]) &&
(af0.gen_fifos[1].f.entries[3] == af1.gen_fifos[1].f.entries[3]) &&
(af0.gen_fifos[1].f.entries[4] == af1.gen_fifos[1].f.entries[4]) &&
(af0.gen_fifos[1].f.entries[5] == af1.gen_fifos[1].f.entries[5]) &&
(af0.gen_fifos[1].f.entries[6] == af1.gen_fifos[1].f.entries[6]) &&
(af0.gen_fifos[1].f.entries[7] == af1.gen_fifos[1].f.entries[7]) &&
(af0.gen_fifos[1].f.ff_rdPtr.Q == af1.gen_fifos[1].f.ff_rdPtr.Q) &&
(af0.gen_fifos[1].f.ff_wrPtr.Q == af1.gen_fifos[1].f.ff_wrPtr.Q)
}

cover -name eq_then_not "${EQ} ##2 !${EQ}"
assert -name eq {${EQ}}