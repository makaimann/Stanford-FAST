analyze -sv {composed.sv};
analyze -sv {count_ones.sv};
analyze -sv {instr_delay.sv};
analyze -sv {top_composed.sv};
analyze -sv {pridec.sv};
elaborate -top top_composed;

clock clk;
reset -none;

set EQ {
((t.af0.gen_fifos[0].f.entries[0] == t.af1.gen_fifos[0].f.entries[0]) &&
(t.af0.gen_fifos[0].f.entries[1] == t.af1.gen_fifos[0].f.entries[1]) &&
(t.af0.gen_fifos[0].f.entries[2] == t.af1.gen_fifos[0].f.entries[2]) &&
(t.af0.gen_fifos[0].f.entries[3] == t.af1.gen_fifos[0].f.entries[3]) &&
(t.af0.gen_fifos[0].f.entries[4] == t.af1.gen_fifos[0].f.entries[4]) &&
(t.af0.gen_fifos[0].f.entries[5] == t.af1.gen_fifos[0].f.entries[5]) &&
(t.af0.gen_fifos[0].f.entries[6] == t.af1.gen_fifos[0].f.entries[6]) &&
(t.af0.gen_fifos[0].f.entries[7] == t.af1.gen_fifos[0].f.entries[7]) &&
(t.af0.gen_fifos[0].f.ff_rdPtr.Q == t.af1.gen_fifos[0].f.ff_rdPtr.Q) &&
(t.af0.gen_fifos[0].f.ff_wrPtr.Q == t.af1.gen_fifos[0].f.ff_wrPtr.Q) &&
(t.af0.gen_fifos[1].f.entries[0] == t.af1.gen_fifos[1].f.entries[0]) &&
(t.af0.gen_fifos[1].f.entries[1] == t.af1.gen_fifos[1].f.entries[1]) &&
(t.af0.gen_fifos[1].f.entries[2] == t.af1.gen_fifos[1].f.entries[2]) &&
(t.af0.gen_fifos[1].f.entries[3] == t.af1.gen_fifos[1].f.entries[3]) &&
(t.af0.gen_fifos[1].f.entries[4] == t.af1.gen_fifos[1].f.entries[4]) &&
(t.af0.gen_fifos[1].f.entries[5] == t.af1.gen_fifos[1].f.entries[5]) &&
(t.af0.gen_fifos[1].f.entries[6] == t.af1.gen_fifos[1].f.entries[6]) &&
(t.af0.gen_fifos[1].f.entries[7] == t.af1.gen_fifos[1].f.entries[7]) &&
(t.af0.gen_fifos[1].f.ff_rdPtr.Q == t.af1.gen_fifos[1].f.ff_rdPtr.Q) &&
(t.af0.gen_fifos[1].f.ff_wrPtr.Q == t.af1.gen_fifos[1].f.ff_wrPtr.Q)) &&
(t.sb0.ff_en.Q == t.sb1.ff_en.Q) &&
(t.sb0.ff_magic_packet.Q == t.sb1.ff_magic_packet.Q) &&
(t.sb0.ff_magic_packet_exited.Q == t.sb1.ff_magic_packet_exited.Q) &&
(t.sb0.mpt.ff_cnt.Q == t.sb1.mpt.ff_cnt.Q)
}

set pEQ {
(
($past(t.af0.gen_fifos[0].f.entries[0]) == t.af1.gen_fifos[0].f.entries[0]) &&
($past(t.af0.gen_fifos[0].f.entries[1]) == t.af1.gen_fifos[0].f.entries[1]) &&
($past(t.af0.gen_fifos[0].f.entries[2]) == t.af1.gen_fifos[0].f.entries[2]) &&
($past(t.af0.gen_fifos[0].f.entries[3]) == t.af1.gen_fifos[0].f.entries[3]) &&
($past(t.af0.gen_fifos[0].f.entries[4]) == t.af1.gen_fifos[0].f.entries[4]) &&
($past(t.af0.gen_fifos[0].f.entries[5]) == t.af1.gen_fifos[0].f.entries[5]) &&
($past(t.af0.gen_fifos[0].f.entries[6]) == t.af1.gen_fifos[0].f.entries[6]) &&
($past(t.af0.gen_fifos[0].f.entries[7]) == t.af1.gen_fifos[0].f.entries[7]) &&
($past(t.af0.gen_fifos[0].f.ff_rdPtr.Q) == t.af1.gen_fifos[0].f.ff_rdPtr.Q) &&
($past(t.af0.gen_fifos[0].f.ff_wrPtr.Q) == t.af1.gen_fifos[0].f.ff_wrPtr.Q) &&
($past(t.af0.gen_fifos[1].f.entries[0]) == t.af1.gen_fifos[1].f.entries[0]) &&
($past(t.af0.gen_fifos[1].f.entries[1]) == t.af1.gen_fifos[1].f.entries[1]) &&
($past(t.af0.gen_fifos[1].f.entries[2]) == t.af1.gen_fifos[1].f.entries[2]) &&
($past(t.af0.gen_fifos[1].f.entries[3]) == t.af1.gen_fifos[1].f.entries[3]) &&
($past(t.af0.gen_fifos[1].f.entries[4]) == t.af1.gen_fifos[1].f.entries[4]) &&
($past(t.af0.gen_fifos[1].f.entries[5]) == t.af1.gen_fifos[1].f.entries[5]) &&
($past(t.af0.gen_fifos[1].f.entries[6]) == t.af1.gen_fifos[1].f.entries[6]) &&
($past(t.af0.gen_fifos[1].f.entries[7]) == t.af1.gen_fifos[1].f.entries[7]) &&
($past(t.af0.gen_fifos[1].f.ff_rdPtr.Q) == t.af1.gen_fifos[1].f.ff_rdPtr.Q) &&
($past(t.af0.gen_fifos[1].f.ff_wrPtr.Q) == t.af1.gen_fifos[1].f.ff_wrPtr.Q)) &&
($past(t.sb0.ff_en.Q) == t.sb1.ff_en.Q) &&
($past(t.sb0.ff_magic_packet.Q) == t.sb1.ff_magic_packet.Q) &&
($past(t.sb0.ff_magic_packet_exited.Q) == t.sb1.ff_magic_packet_exited.Q) &&
($past(t.sb0.mpt.ff_cnt.Q) == t.sb1.mpt.ff_cnt.Q)
}

# Fifo i gets same inputs
set F0EQ {(push0[0] == push1[0]) && (reqs0[0] == reqs1[0])}
set F1EQ {(push0[1] == push1[1]) && (reqs0[1] == reqs1[1])}

# Fifo i inactive (for both copies)
set F0IA {!push0[0] &&  !push1[0] && !reqs0[0] && !reqs1[0]}
set F1IA {!push0[1] &&  !push1[1] && !reqs0[1] && !reqs1[1]}

# TODO: need to actually check that it's still enabled...
# set push0_en "((!t.full1\[0\] && push1\[0\]) |=> !t.full1\[0\])"
# set push1_en "((!t.full1\[1\] && push1\[1\]) |=> !t.full1\[1\])"
# set reqs0_en "((!t.empty1\[0\] && reqs1\[0\])|=> !t.empty1\[0\])"
# set reqs1_en "((!t.empty1\[1\] && |=> !t.empty1\[1\])"
# set atleast_one_en "($push0_en or $push1_en or $reqs0_en or $reqs1_en)"

set push0_trace "(!t.full1\[0\] && push1\[0\]) |=> $pEQ"
set push1_trace "(!t.full1\[1\] && push1\[1\]) |=> $pEQ"
set reqs0_trace "(!t.empty1\[0\] && reqs1\[0\]) |=> $pEQ"
set reqs1_trace "(!t.empty1\[1\] && reqs1\[1\]) |=> $pEQ"
# set atleast_one_trace "(((!t.full1\[0\] && push1\[0\]) ##1 $pEQ) or ((!t.full1\[1\] && push1\[1\]) ##1 $pEQ) or ((!t.empty1\[0\] && reqs1\[0\]) ##1 $pEQ))"
# or ((!t.full1\[1\]) and (push1\[1\ |=> $pEQ)))
#  or ((!t.empty1\[0\]) and (reqs1\[0\] |=> $pEQ)) or ((!t.empty1\[1\]) and (reqs1\[1\] |=> $pEQ))"
set atleast_one_trace "(((push1\[0\] |=> $pEQ) and (!t.full1\[0\])) or ((push1\[1\] |=> $pEQ) and (!t.full1\[1\])) or ((reqs1\[0\] |=> $pEQ) and (!t.empty1\[0\])) or ((reqs1\[1\] |=> $pEQ) and (!t.empty1\[1\])))"
# set atleast_one_trace "(((!t.full1\[0\] && push1\[0\]) |=> $pEQ) or ((!t.full1\[1\] && push1\[1\]) |=> $pEQ) or ((!t.empty1\[0\] && reqs1\[0\]) |=> $pEQ) or ((!t.empty1\[1\] && reqs1\[1\]) |=> $pEQ))"

assume -name no_push0_0_when_full {t.af0.gen_fifos[0].f.full |-> !push0[0]}
assume -name no_push0_1_when_full {t.af0.gen_fifos[1].f.full |-> !push0[1]}
assume -name no_reqs0_0_when_empty {t.af0.gen_fifos[0].f.empty |-> !reqs0[0]}
assume -name no_reqs0_1_when_empty {t.af0.gen_fifos[1].f.empty |-> !reqs0[1]}
assume -name copy_no_push0_0_when_full {t.af1.gen_fifos[0].f.full |-> !push1[0]}
assume -name copy_no_push0_1_when_full {t.af1.gen_fifos[1].f.full |-> !push1[1]}
assume -name copy_no_reqs0_0_when_empty {t.af1.gen_fifos[0].f.empty |-> !reqs1[0]}
assume -name copy_no_reqs0_1_when_empty {t.af1.gen_fifos[1].f.empty |-> !reqs1[1]}

assume -name stable_quantums {$stable(quantums)}
# quantum should be large enough
assume -name large_enough_quantums { (quantums[7:0] >= 8) && (quantums[15:8] >= 8)}
assume -name no_rst {!rst}

# deterministic abstract arbiter
assume -name deterministic_arb {(reqs0 == reqs1) |-> (pop0 == pop1)}

cover -name cover_count_4_delay "($EQ && delay && !id.WAIT && (count == 4)) ##3 1"

# assert -name count_4_en "($EQ && delay && !id.WAIT && (count == 4)) |-> $atleast_one_en"
# assert -name count_3_en "($EQ && delay && !id.WAIT && (count == 3)) |-> $atleast_one_en"
# assert -name count_2_en "($EQ && delay && !id.WAIT && (count == 2)) |-> $atleast_one_en"
# cover -name cex_2_en "($EQ && delay && !id.WAIT && !t.empty1\[0\] && (count == 2) && push0\[0\] && push1\[0\]) ##1 t.empty1\[0\]"

assert -name count_4_delay "($EQ && delay && !id.WAIT && (count == 4)) |=> $atleast_one_trace"
assert -name count_3_delay "($EQ && delay && !id.WAIT && (count == 3)) |=> $atleast_one_trace"
assert -name count_2_delay "($EQ && delay && !id.WAIT && (count == 2)) |=> $atleast_one_trace"

cover -name cex_2 "($EQ && delay && !id.WAIT && (count == 2)) ##1 (t.empty1\[0\] && t.empty1\[1\])"