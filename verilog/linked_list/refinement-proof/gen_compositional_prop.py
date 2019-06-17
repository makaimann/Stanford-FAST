#!/usr/bin/env python3

import argparse

PROBLEM_TEMPLATE='''# For now, this uses the compositional branch of CoSA -- not merged yet
[GENERAL]
model_files: verif.vlist[top],reset.ets,global-assumptions.ssts
abstract_clock: True
vcd: True
assume_if_true: True

[DEFAULT]
bmc_length: 1
solver_name: btor

[COMPOSITIONAL]
description: "Check the following properties compositionally"
properties: ((empty[0:0] = 0_1) -> (ghost[shared_fifo.ll.head[0_1]] = 0_{ghost_width})) ;
            ((empty[1:1] = 0_1) -> (ghost[shared_fifo.ll.head[1_1]] = {shift1}_{ghost_width})) ;
            ((full = 0_1) -> (ghost[shared_fifo.ll.free_list_head] = {shift2}_{ghost_width})) ;
            ((empty[0:0] = 0_1) -> (ghost[shared_fifo.ll.tail[0_1]][{fifo_sel_low}:{fifo_sel_high}] = 0_2)) ;
            ((empty[1:1] = 0_1) -> (ghost[shared_fifo.ll.tail[1_1]][{fifo_sel_low}:{fifo_sel_high}] = 1_2)) ;
            ((full = 0_1) -> (ghost[shared_fifo.ll.free_list_tail][{fifo_sel_low}:{fifo_sel_high}] = 2_2)) ;
            ((empty[0:0] = 0_1) -> (ghost[shared_fifo.ll.tail[0_1]][0:{idx_sel}] = (shared_fifo.ll.count[0_1][0:{idx_sel}] - 1_{ptr_width}))) ;
            ((empty[1:1] = 0_1) -> (ghost[shared_fifo.ll.tail[1_1]][0:{idx_sel}] = (shared_fifo.ll.count[1_1][0:{idx_sel}] - 1_{ptr_width}))) ;
            ((full = 0_1) -> (ghost[shared_fifo.ll.free_list_tail][0:{idx_sel}] = (free_list_count[0:{idx_sel}] - 1_{ptr_width}))) ;
            (((((A.value != shared_fifo.ll.free_list_tail) | (full = 1_1)) &
               ((A.value != shared_fifo.ll.tail[0_1]) | (empty[0:0] = 1_1)) &
               ((A.value != shared_fifo.ll.tail[1_1]) | (empty[1:1] = 1_1))) ->
               ((ghost[shared_fifo.ll.next_ptr[A.value]][0:{idx_sel}] = (ghost[A.value][0:{idx_sel}] + 1_{ptr_width})) &
               (ghost[shared_fifo.ll.next_ptr[A.value]][{fifo_sel_low}:{fifo_sel_high}] = ghost[A.value][{fifo_sel_low}:{fifo_sel_high}]) &
               (ghost[A.value][0:{idx_sel}] != {depthm1}_{ptr_width}))) &
              ((ghost[A.value][0:{idx_sel}] = 0_{ptr_width}) -> (((A.value = shared_fifo.ll.head[0_1]) & (empty[0:0] = 0_1)) |
                                               ((A.value = shared_fifo.ll.head[1_1]) & (empty[1:1] = 0_1)) |
                                               ((A.value = shared_fifo.ll.free_list_head) & (full = 0_1))))) ;
            (sb.en = 0_1) -> (shared_fifo.ll.count[0_1] = sb.cnt)  ;
            ((sb.en = 1_1) & (sb.cnt = 0_{cnt_width})) -> (sb.magic_packet_exited = 1_1) ;
            ((sb.en = 1_1) & (sb.magic_packet_exited = 0_1)) -> (shared_fifo.ll.count[0_1] >= sb.cnt) ;
            (sb.magic_packet_exited = 0_1) -> (sb.cnt <= depth) ;
            ((ghost[B.value][{fifo_sel_low}:{fifo_sel_high}] = 0_2) & (sb.en = 1_1) & (sb.magic_packet_exited = 0_1) & (ghost[B.value][0:{idx_sel}] + 1_{ptr_width} = sb.cnt[0:{idx_sel}])) -> (shared_fifo.mem[B.value] = sb.magic_packet) ;
            ((sb.cnt = 1_{cnt_width}) & (sb.en = 1_1) & (sb.magic_packet_exited = 0_1)) -> (shared_fifo.mem[shared_fifo.ll.head[0_1]] = sb.magic_packet) ;
            (prop_signal = 1_1) ;
generators: A=Random(shared_fifo.ll.free_list_head); B=Random(shared_fifo.ll.free_list_head)
precondition: reset_done
verification: compositional
prove: True
'''

def gen():
    parser = argparse.ArgumentParser(description="Generates the problem file for the Shared FIFO compositional proof based on parameter inputs.")
    parser.add_argument('--num-fifos', '-n', type=int, help='the number of fifos sharing the memory', default=2)
    parser.add_argument('--depth', '-d', type=int, help='the total amount of memory storage', default=4)

    args = parser.parse_args()
    num_fifos = args.num_fifos
    depth = args.depth

    if num_fifos != 2:
        raise NotImplementedError("This script hasn't been properly parameterized for the number of fifos yet")

    cnt_width = depth.bit_length()
    ptr_width = (depth - 1).bit_length()
    sel_width = (num_fifos - 1).bit_length()

    idx_sel = ptr_width-1
    fifo_sel_high = ptr_width+sel_width
    fifo_sel_low = ptr_width
    ghost_width = ptr_width+sel_width+1

    return PROBLEM_TEMPLATE.format(cnt_width=cnt_width,
                                   ptr_width=ptr_width,
                                   idx_sel=idx_sel,
                                   fifo_sel_high=fifo_sel_high,
                                   fifo_sel_low=fifo_sel_low,
                                   ghost_width=ghost_width,
                                   depthm1=(depth-1),
                                   shift1=(1<<ptr_width),
                                   shift2=(2<<ptr_width))


if __name__ == "__main__":
    print(gen())
