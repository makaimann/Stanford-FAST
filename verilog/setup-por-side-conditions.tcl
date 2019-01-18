# Assuming arbiter is abstracted

analyze -sv {composed.sv};
elaborate -top top;

clock clk;
reset -none;

set EQ {
((af0.gen_fifos[0].f.entries[0] == af1.gen_fifos[0].f.entries[0]) &&
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

####################################### Helper Lemmas #####################################
## needed for some of the proofs to go through
# assume -name mpt_cnt_0_lt_depth {sb0.mpt.cnt <= 8}
# assume -name mpt_cnt_1_lt_depth {sb1.mpt.cnt <= 8}
# Note: might need this at some point -- keeps it from being in a bogus state where MagicPacketCounter doesn't behave correctly
# assume -name match_sb0_fifo {!sb0.ff_en.Q |-> ((af0.gen_fifos[0].f.wrPtr - af0.gen_fifos[0].f.rdPtr) == sb0.mpt.ff_cnt.Q)}


# environmental assumptions
assume -name no_push0_0_when_full {af0.gen_fifos[0].f.full |-> !push0[0]}
assume -name no_push0_1_when_full {af0.gen_fifos[1].f.full |-> !push0[1]}
assume -name no_push1_0_when_full {af1.gen_fifos[0].f.full |-> !push1[0]}
assume -name no_push1_1_when_full {af1.gen_fifos[1].f.full |-> !push1[1]}
assume -name no_reqs0_0_when_empty {af0.gen_fifos[0].f.empty |-> !reqs0[0]}
assume -name no_reqs0_1_when_empty {af0.gen_fifos[1].f.empty |-> !reqs0[1]}
assume -name no_reqs1_0_when_empty {af1.gen_fifos[0].f.empty |-> !reqs1[0]}
assume -name no_reqs1_1_when_empty {af1.gen_fifos[1].f.empty |-> !reqs1[1]}

# not strictly necessary (could just be an assumption on the inputs)
# but in any practical use, they'll be held constant
assume -name stable_quantums {$stable(quantums)}

# quantum should be large enough
assume -name large_enough_quantums { (quantums[7:0] >= 8) && (quantums[15:8] >= 8)}

# reset could trivially violate
# could probably include this in the input stability assumptions as well
assume -name no_rst {!rst}

############################################## Force Sequential ############################################

set reduced_instruction_set {
# if you want to include stutter, uncomment line below
#    ((push == 2'b00) && (reqs == 2'b00)) ||
    ((push0 == 2'b01) && (reqs0 == 2'b00)) ||
    ((push0 == 2'b10) && (reqs0 == 2'b00)) ||
    ((push0 == 2'b00) && (reqs0 == 2'b01)) ||
    ((push0 == 2'b00) && (reqs0 == 2'b10)) ||
    ((push1 == 2'b01) && (reqs1 == 2'b00)) ||
    ((push1 == 2'b10) && (reqs1 == 2'b00)) ||
    ((push1 == 2'b00) && (reqs1 == 2'b01)) ||
    ((push1 == 2'b00) && (reqs1 == 2'b10))
}

# if enabled, then nothing else occurs at the same time
assume -name push00_alone {
!af0.gen_fifos[0].f.full |-> 
    (push0[0] |-> (!push0[1] && (reqs0 == 2'b00)))
}

assume -name push01_alone {
!af0.gen_fifos[1].f.full |-> 
    (push0[1] |-> (!push0[0] && (reqs0 == 2'b00)))
}

assume -name reqs00_alone {
!af0.gen_fifos[0].f.empty |-> 
    (reqs0[0] |-> (!reqs0[1] && (push0 == 2'b00)))
}

assume -name reqs01_alone {
!af0.gen_fifos[1].f.empty|-> 
    (reqs0[1] |-> (!reqs0[0] && (push0 == 2'b00)))
}

assume -name push10_alone {
!af1.gen_fifos[0].f.full |-> 
    (push1[0] |-> (!push1[1] && (reqs1 == 2'b00)))
}

assume -name push11_alone {
!af1.gen_fifos[1].f.full |-> 
    (push1[1] |-> (!push1[0] && (reqs1 == 2'b00)))
}

assume -name reqs10_alone {
!af1.gen_fifos[0].f.empty |-> 
    (reqs1[0] |-> (!reqs1[1] && (push1 == 2'b00)))
}

assume -name reqs11_alone {
!af1.gen_fifos[1].f.empty|-> 
    (reqs1[1] |-> (!reqs1[0] && (push1 == 2'b00)))
}

assume -name no_stutter0 {!((push0 == 2'b00) && (reqs0 == 2'b00))}
assume -name no_stutter1 {!((push1 == 2'b00) && (reqs1 == 2'b00))}

############################################ End Force Sequential ##########################################

########################################### Partial Order Reduction ########################################
# set up so that the trace in system 1 is the one we plan to keep, i.e. need to check property in other case

# when enabled, push before everything except req0 
# EQ state, then push followed by any op (EXCEPT req on fifo0), is the same as the op followed by a push
# TODO: need to figure out theory for data signals, which system is constrained by the previous (sigma mapping function)
#   i.e. why is it reqs == $past(reqs0) (doing same op) but flat_data_in0 = $past(flat_data_in1) (0 and 1 swapped roles)
cover -name cover_push_0_before_when_en "($EQ && !af0.gen_fifos\[0\].f.full && !push0\[0\] && !reqs0\[0\] && push1\[0\]) ##1 (push0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in0 == \$past(flat_data_in1)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)))"

assert -name push_0_before_when_en "(($EQ && !af0.gen_fifos\[0\].f.full && !push0\[0\] && !reqs0\[0\] && push1\[0\]) ##1 (push0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in0 == \$past(flat_data_in1)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)))) |=> $EQ"

# need to check property in system 0 path (one we're going to remove) and make sure we're not excluding a property violation
#       i.e. if the property was violated in the removed state, then it would be violated in the final state
#            in general, it could also be violated in the middle state in the other path, but we don't need that here
# Note: I believe this is actually stronger than I need. Could also constrain the starting state to meet the property
#       but it turns out that's not needed for this case
assert -name prop_push_0_before_when_en "(($EQ && !af0.gen_fifos\[0\].f.full && !push0\[0\] && !reqs0\[0\] && push1\[0\]) ##1 (push0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in0 == \$past(flat_data_in1)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)) && !prop_signal0)) |=> !prop_signal1"

# when req0 enabled, put it before everything except push0
cover -name cover_req_0_before_other_when_en "($EQ && !af0.gen_fifos\[0\].f.empty && !reqs0\[0\] && !push0\[0\] && reqs1\[0\]) ##1 (reqs0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in0 == \$past(flat_data_in1)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)))"

assert -name req_0_before_other_when_en "(($EQ && !af0.gen_fifos\[0\].f.empty && !reqs0\[0\] && !push0\[0\] && reqs1\[0\]) ##1 (reqs0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in0 == \$past(flat_data_in1)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)))) |=> $EQ"

# Note: This one is confusing, might have theory wrong
#       the property is dependent on the inputs, because it depends on combinational logic of pop
#       Therefore they can start in exactly the same state, but one violates the property and the other does it
# How to handle?
#       kinda seems like the right thing to do is just shift the proof back. i.e. if violated in the first state, then also in second
#    OR could force the property to hold in the first state of system 1 (the path we're keeping), which I THINK is still safe
#        intuitive reason why it should be safe:
#              if the property is violated in the path we're keeping then we're fine, so we only care about missing a property violation when it never shows up in system 1
#              --> could maybe achieve same effect just by saying if the removed state violates the property then one of the states in the system 1 path does also
# TODO: Verify the above, going with second option for now
assert -name prop_req_0_before_other_when_en "(($EQ && prop_signal1 && !af0.gen_fifos\[0\].f.empty && !reqs0\[0\] && !push0\[0\] && reqs1\[0\]) ##1 (reqs0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in0 == \$past(flat_data_in1)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)) && !prop_signal0)) |=> !prop_signal1"

# Fancy POR!
# prefer req0 when enabled over ANY op when the magic packet has been injected and it's not empty
cover -name cover_req_0_before_other_when_en_and_mp_in "($EQ && !af0.gen_fifos\[0\].f.empty && sb0.ff_en.Q && !reqs0\[0\] && reqs1\[0\]) ##1 (reqs0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)))"
assert -name req_0_before_other_when_en_and_mp_in "(($EQ && !af0.gen_fifos\[0\].f.empty && sb0.ff_en.Q && !reqs0\[0\] && reqs1\[0\]) ##1 (reqs0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)))) |=> $EQ"
assert -name prop_req_0_before_other_when_en_and_mp_in "(($EQ && prop_signal1 && !af0.gen_fifos\[0\].f.empty && sb0.ff_en.Q && !reqs0\[0\] && reqs1\[0\]) ##1 (reqs0\[0\] && (push1 == \$past(push0)) && (reqs1 == \$past(reqs0)) && (flat_data_in1 == \$past(flat_data_in0)) && (start == \$past(start)) && !prop_signal0)) |=> !prop_signal1"

######################################### End Partial Order Reduction ######################################
