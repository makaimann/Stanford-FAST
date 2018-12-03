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
(af0.gen_fifos[1].f.ff_wrPtr.Q == af1.gen_fifos[1].f.ff_wrPtr.Q)) &&
(sb0.ff_en.Q == sb1.ff_en.Q) &&
(sb0.ff_magic_packet.Q == sb1.ff_magic_packet.Q) &&
(sb0.mpt.ff_cnt.Q == sb1.mpt.ff_cnt.Q)
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
($past(af0.gen_fifos[1].f.ff_wrPtr.Q) == af1.gen_fifos[1].f.ff_wrPtr.Q)) &&
($past(sb0.ff_en.Q) == sb1.ff_en.Q) &&
($past(sb0.ff_magic_packet.Q) == sb1.ff_magic_packet.Q) &&
($past(sb0.mpt.ff_cnt.Q) == sb1.mpt.ff_cnt.Q)
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
# basic true assumption about scoreboard state
# holds and can be proven after a reset sequence
assume -name sb0_cnt_lt_depth {sb0.mpt.ff_cnt.Q <= DEPTH}
assume -name sb1_cnt_lt_depth {sb1.mpt.ff_cnt.Q <= DEPTH}
assume -name match_sb0_fifo {!sb0.ff_en.Q |-> ((af0.gen_fifos[0].f.wrPtr - af0.gen_fifos[0].f.rdPtr) == sb0.mpt.ff_cnt.Q)}
assume -name match_sb1_fifo {!sb1.ff_en.Q |-> ((af1.gen_fifos[0].f.wrPtr - af1.gen_fifos[0].f.rdPtr) == sb1.mpt.ff_cnt.Q)}

cover -name eq_then_not "${EQ} ##1 !${EQ}"

# This cover should hold in COMB_UPDATE mode but it doesn't
cover -name pop_then_nothing_then_pop "pop0\[0\] ##1 !(|pop0) ##1 pop0\[0\]"

# Things to do:
# 1. Prove that each operation can be moved to the next cycle
#    -- does it make sense to do this way? Not too restrictive?
# 2. Figure out how to handle pop i.e. req[i] ^ gnt[i]

# two approaches
# 1. Compare af1 to $past of af0 (af0 has one transition, af1 has two), then have to handle pops
# 2. Let both systems have two transitions, but af0 can't do any pushes in middle state

# Option 1: TODO

# Option 2: constraining middle state in diagram to do NOTHING for af0, and ONLY the push for af1 (***using a skip state to line up temporally again***)

# af0 : original system
# af1 : copy with one delayed op
# Control signals are constrained so that only difference is a delay in the signal of interest, and af0's second transition is a NOP
# Note: constraining req is *less* restrictive than constraining pop, so there's a preference for that
assert -name delay_push_0 "(($EQ && (push0\[1\] == push1\[1\]) && (reqs0 == reqs1) && (flat_data_in0 == flat_data_in1) && push0\[0\] && !push1\[0\]) ##1 (push1\[0\]) && !push1\[1\] && !(|push0) && !(|reqs0) && !(|reqs1) && (start == \$past(start)) && (flat_data_in0 == \$past(flat_data_in0)) && (flat_data_in1 == \$past(flat_data_in1))) |=> $pEQ"
assert -name delay_push_1 "(($EQ && (push0\[0\] == push1\[0\]) && (reqs0 == reqs1) && (flat_data_in0 == flat_data_in1) && push0\[1\] && !push1\[1\]) ##1 (push1\[1\]) && !push1\[0\] && !(|push0) && !(|reqs0) && !(|reqs1) && (start == \$past(start)) && (flat_data_in0 == \$past(flat_data_in0)) && (flat_data_in1 == \$past(flat_data_in1))) |=> $pEQ"
assert -name delay_bundled_req "(($EQ && (push0 == push1) && (flat_data_in0 == flat_data_in1) && (reqs0 != 0) && (reqs1 == 0)) ##1 (reqs0 == 0) && (start == \$past(start)) && (reqs1 == \$past(reqs0)) && !(|push0) && !(|push1) && (flat_data_in0 == \$past(flat_data_in0)) && (flat_data_in1 == \$past(flat_data_in1))) |=> $pEQ"


# covers to show that antecedent can be true
cover -name cover_delay_push_0 "(($EQ && (push0\[1\] == push1\[1\]) && (reqs0 == reqs1) && (flat_data_in0 == flat_data_in1) && push0\[0\] && !push1\[0\]) ##1 (push1\[0\]) && !push1\[1\] && !(|push0) && !(|reqs0) && !(|reqs1) && (start == \$past(start)) && (flat_data_in0 == \$past(flat_data_in0)) && (flat_data_in1 == \$past(flat_data_in1)))"
cover -name cover_delay_push_1 "(($EQ && (push0\[0\] == push1\[0\]) && (reqs0 == reqs1) && (flat_data_in0 == flat_data_in1) && push0\[1\] && !push1\[1\]) ##1 (push1\[1\]) && !push1\[0\] && !(|push0) && !(|reqs0) && !(|reqs1) && (start == \$past(start)) && (flat_data_in0 == \$past(flat_data_in0)) && (flat_data_in1 == \$past(flat_data_in1)))"
cover -name cover_delay_bundled_req "(($EQ && (push0 == push1) && (flat_data_in0 == flat_data_in1) && (reqs0 != 0) && (reqs1 == 0)) ##1 (reqs0 == 0) && (start == \$past(start)) && (reqs1 == \$past(reqs0)) && !(|push0) && !(|push1) && (flat_data_in0 == \$past(flat_data_in0)) && (flat_data_in1 == \$past(flat_data_in1)))"
