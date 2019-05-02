analyze -sv -f verif.vlist +define+DEPTH=2 +define+NUM_FIFOS=1;

elaborate -top top;

clock clk;
reset rst;

###################### STATUS ##########################
# Using free_tail_ptr_assigned, popped_head_assigned, count_assigned, counts_consistent_depth, counts_consistent_total, head_and_tails_distinct
# as PROVEN SST Helpers, then the SST inductive step converges
#
# if they're not proven, it can find counter-examples
#
# Goal: have everything just in the refinement property (no helpers)
#       first we need to identify which are important. Head and tails distinct seems important but I was hoping that the ghost state would handle that
#
# What I'm trying now is just using counts_consistent_depth and counts_consistent_total (proven) as helpers, and fixing the refinement property
# There seemed to be something strange about the bit-selects so I just hardcoded them

assume -name assignments { (free_tail_ptr == shared_fifo.free_ptr) && (popped_head == shared_fifo.popped_head) && (count == shared_fifo.ll.count) };

# NOT PARAMETERIZED
# Jasper is being dumb and can't make SEL_WIDTH = 1
# this should be a disjunction when there are more options
assume -name only_valid_sel { (push_sel == 0) && (pop_sel == 0) };

# sanity assertions
assert -name free_tail_ptr_assigned { (free_tail_ptr == shared_fifo.free_ptr) };
assert -name popped_head_assigned { (popped_head == shared_fifo.popped_head) };
assert -name count_assigned { (count == shared_fifo.ll.count) };

# NOT PARAMETERIZED
assert -name counts_consistent_depth { (free_list_count + count[0] == depth) };

# need to have all fifos
assert -name counts_consistent_total { (count[0] == shared_fifo.ll.total_count) };

# Some other useful properties for refinement
assert -name head_and_tails_distinct { (!full & !empty[0]) implies ( (shared_fifo.ll.head[0] != shared_fifo.ll.free_list_head) && (shared_fifo.ll.tail[0] != shared_fifo.ll.free_list_tail) && (shared_fifo.ll.head[0] != shared_fifo.ll.free_list_tail) && (shared_fifo.ll.tail[0] != shared_fifo.ll.free_list_head)) };

cover -name push_two_things { shared_fifo.ll.total_count == 2 };

cover -name more_complex {
push & !pop
##1
push & !pop
##1
!push & pop
##1
push & !pop
##1
!push & pop
##1
!push & pop
##1
!push & !pop
}

# Some refinement properties

### PARAMETERS INSTANTIATED ###

assert -name head0_maps_to00 { !empty[0] implies ghost[shared_fifo.ll.head[0]] == 0 };
assert -name free_list_head_maps_to10 { !full implies ghost[shared_fifo.ll.free_list_head] == 2'b10 };

# NOT PARAMETERIZED 
assert -name tail0_maps_tofifocount { !empty[0] implies ((ghost[shared_fifo.ll.tail[0]][1:1] == 1'b0) && (ghost[shared_fifo.ll.tail[0]][PTR_WIDTH-1:0]+2'd1 == shared_fifo.ll.count[0])) };
assert -name free_list_tail0_maps_tofifocount { !full implies ((ghost[shared_fifo.ll.free_list_tail][1:1] == 1'b1) && (ghost[shared_fifo.ll.free_list_tail][PTR_WIDTH-1:0]+2'd1 == free_list_count)) };

# NOT PARAMETERIZED
assert -name next_ptr0 { ( (0 != shared_fifo.ll.tail[0]) && (0 != shared_fifo.ll.free_list_tail) ) implies ( (ghost[shared_fifo.ll.next_ptr[0]][1:1] == ghost[0][1:1]) && (ghost[shared_fifo.ll.next_ptr[0]][0:0] == (ghost[0][0:0] + 1'b1)) ) };
assert -name next_ptr1 { ( (1 != shared_fifo.ll.tail[0]) && (1 != shared_fifo.ll.free_list_tail) ) implies ( (ghost[shared_fifo.ll.next_ptr[1]][1:1] == ghost[1][1:1]) && (ghost[shared_fifo.ll.next_ptr[1]][0:0] == (ghost[1][0:0] + 1'b1)) ) };
# need to instantiate up to DEPTH


################# REFINEMENT PROPERTY ATTEMPT #######################
assert -name refinement {
(!empty[0] implies ghost[shared_fifo.ll.head[0]] == 0) and
(!full implies ghost[shared_fifo.ll.free_list_head] == 2'b10) and
(!empty[0] implies ((ghost[shared_fifo.ll.tail[0]][1:1] == 1'b0) && (ghost[shared_fifo.ll.tail[0]][PTR_WIDTH-1:0]+2'd1 == shared_fifo.ll.count[0]))) and
(!full implies ((ghost[shared_fifo.ll.free_list_tail][1:1] == 1'b1) && (ghost[shared_fifo.ll.free_list_tail][PTR_WIDTH-1:0]+2'd1 == free_list_count))) and
(( (0 != shared_fifo.ll.tail[0]) && (0 != shared_fifo.ll.free_list_tail) ) implies ( (ghost[shared_fifo.ll.next_ptr[0]][1:1] == ghost[0][1:1]) && (ghost[shared_fifo.ll.next_ptr[0]][0:0] == (ghost[0][0:0] + 1'b1)) )) and
(( (1 != shared_fifo.ll.tail[0]) && (1 != shared_fifo.ll.free_list_tail) ) implies ( (ghost[shared_fifo.ll.next_ptr[1]][1:1] == ghost[1][1:1]) && (ghost[shared_fifo.ll.next_ptr[1]][0:0] == (ghost[1][0:0] + 1'b1)) ))
}