analyze -sv {composed.sv};
analyze -sv {pridec.sv};
elaborate -top top;

clock clk;
reset -none;

set EQ {
((af0.arb.deficit_counters[0].ff_defcnt.Q == af1.arb.deficit_counters[0].ff_defcnt.Q) &&
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
(af0.gen_fifos[1].f.ff_wrPtr.Q == af1.gen_fifos[1].f.ff_wrPtr.Q))
}

set pEQ {
(($past(af0.arb.deficit_counters[0].ff_defcnt.Q) == af1.arb.deficit_counters[0].ff_defcnt.Q) &&
($past(af0.arb.deficit_counters[1].ff_defcnt.Q) == af1.arb.deficit_counters[1].ff_defcnt.Q) &&
($past(af0.arb.ff_rrcnt.Q) == af1.arb.ff_rrcnt.Q) &&
($past(af0.gen_fifos[0].f.entries[0]) == af1.gen_fifos[0].f.entries[0]) &&
($past(af0.gen_fifos[0].f.entries[1]) == af1.gen_fifos[0].f.entries[1]) &&
($past(af0.gen_fifos[0].f.entries[2]) == af1.gen_fifos[0].f.entries[2]) &&
($past(af0.gen_fifos[0].f.entries[3]) == af1.gen_fifos[0].f.entries[3]) &&
($past(af0.gen_fifos[0].f.entries[4]) == af1.gen_fifos[0].f.entries[4]) &&
($past(af0.gen_fifos[0].f.entries[5]) == af1.gen_fifos[0].f.entries[5]) &&
($past(af0.gen_fifos[0].f.entries[6]) == af1.gen_fifos[0].f.entries[6]) &&
($past(af0.gen_fifos[0].f.entries[7]) == af1.gen_fifos[0].f.entries[7]) &&
($past(af0.gen_fifos[0].f.ff_rdPtr.Q) == af1.gen_fifos[0].f.ff_rdPtr.Q) &&
($past(af0.gen_fifos[0].f.ff_wrPtr.Q) == af1.gen_fifos[0].f.ff_wrPtr.Q) &&
($past(af0.gen_fifos[1].f.entries[0]) == af1.gen_fifos[1].f.entries[0]) &&
($past(af0.gen_fifos[1].f.entries[1]) == af1.gen_fifos[1].f.entries[1]) &&
($past(af0.gen_fifos[1].f.entries[2]) == af1.gen_fifos[1].f.entries[2]) &&
($past(af0.gen_fifos[1].f.entries[3]) == af1.gen_fifos[1].f.entries[3]) &&
($past(af0.gen_fifos[1].f.entries[4]) == af1.gen_fifos[1].f.entries[4]) &&
($past(af0.gen_fifos[1].f.entries[5]) == af1.gen_fifos[1].f.entries[5]) &&
($past(af0.gen_fifos[1].f.entries[6]) == af1.gen_fifos[1].f.entries[6]) &&
($past(af0.gen_fifos[1].f.entries[7]) == af1.gen_fifos[1].f.entries[7]) &&
($past(af0.gen_fifos[1].f.ff_rdPtr.Q) == af1.gen_fifos[1].f.ff_rdPtr.Q) &&
($past(af0.gen_fifos[1].f.ff_wrPtr.Q) == af1.gen_fifos[1].f.ff_wrPtr.Q))
}

assume -name no_push0_0_when_full {af0.gen_fifos[0].f.full |-> !push0[0]}
assume -name no_push0_1_when_full {af0.gen_fifos[1].f.full |-> !push0[1]}
assume -name no_push1_0_when_full {af1.gen_fifos[0].f.full |-> !push1[0]}
assume -name no_push1_1_when_full {af1.gen_fifos[1].f.full |-> !push1[1]}
assume -name no_reqs0_0_when_empty {af0.gen_fifos[0].f.empty |-> !reqs0[0]}
assume -name no_reqs0_1_when_empty {af0.gen_fifos[1].f.empty |-> !reqs0[1]}
assume -name no_reqs1_0_when_empty {af1.gen_fifos[0].f.empty |-> !reqs1[0]}
assume -name no_reqs1_1_when_empty {af1.gen_fifos[1].f.empty |-> !reqs1[1]}
assume -name stable_quantums {$stable(quantums)}
# quantum should be large enough
assume -name large_enough_quantums { (quantums[7:0] >= 8) && (quantums[15:8] >= 8)}
assume -name no_rst {!rst}

# force sequential assumptions

assume -name not_both_push0 {!(&push0)}
assume -name not_both_push1 {!(&push1)}
assume -name not_both_push0_reqs0 {!(|push0) || (reqs0 == 0)}
assume -name not_both_push1_reqs1 {!(|push1) || (reqs1 == 0)}

assert -name push0_push1_por "$EQ && push0\[0\] && push1\[1\] ##1 push0\[1\] && push1\[0\] && (flat_data_in0 == \$past(flat_data_in1)) && (flat_data_in1 == \$past(flat_data_in0)) |=> $EQ"
