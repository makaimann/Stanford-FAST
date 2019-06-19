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
properties: ((empty[0:0] = 0_1) -> ((F[shared_fifo.ll.head[0_1]] = 0_{F_width}) & ((I[shared_fifo.ll.head[0_1]] = 0_{I_width}))));
            ((empty[1:1] = 0_1) -> ((F[shared_fifo.ll.head[1_1]] = 1_{F_width}) & ((I[shared_fifo.ll.head[1_1]] = 0_{I_width}))));
            ((full = 0_1) -> ((F[shared_fifo.ll.free_list_head] = free_list) & ((I[shared_fifo.ll.free_list_head] = 0_{I_width}))));
            ((empty[0:0] = 0_1) -> (F[shared_fifo.ll.tail[0_1]] = 0_{F_width})) ;
            ((empty[1:1] = 0_1) -> (F[shared_fifo.ll.tail[1_1]] = 1_{F_width})) ;
            ((full = 0_1) -> (F[shared_fifo.ll.free_list_tail] = free_list)) ;
            ((empty[0:0] = 0_1) -> (I[shared_fifo.ll.tail[0_1]] = (shared_fifo.ll.count[0_1][0:{I_widthm1}] - 1_{I_width}))) ;
            ((empty[1:1] = 0_1) -> (I[shared_fifo.ll.tail[1_1]] = (shared_fifo.ll.count[1_1][0:{I_widthm1}] - 1_{I_width}))) ;
            ((full = 0_1) -> (I[shared_fifo.ll.free_list_tail] = (free_list_count[0:{I_widthm1}] - 1_{I_width}))) ;
            (((((A.value != shared_fifo.ll.free_list_tail) | (full = 1_1)) &
               ((A.value != shared_fifo.ll.tail[0_1]) | (empty[0:0] = 1_1)) &
               ((A.value != shared_fifo.ll.tail[1_1]) | (empty[1:1] = 1_1))) ->
               ((I[shared_fifo.ll.next_ptr[A.value]] = (I[A.value] + 1_{I_width})) &
               (F[shared_fifo.ll.next_ptr[A.value]] = F[A.value]) &
               (I[A.value] != {depthm1}_{I_width}))) &
              ((I[A.value] = 0_{I_width}) -> (((A.value = shared_fifo.ll.head[0_1]) & (empty[0:0] = 0_1)) |
                                      ((A.value = shared_fifo.ll.head[1_1]) & (empty[1:1] = 0_1)) |
                                      ((A.value = shared_fifo.ll.free_list_head) & (full = 0_1))))) ;
            (sb.en = 0_1) -> (shared_fifo.ll.count[0_1] = sb.cnt)  ;
            ((sb.en = 1_1) & (sb.cnt = 0_{cnt_width})) -> (sb.magic_packet_exited = 1_1) ;
            ((sb.en = 1_1) & (sb.magic_packet_exited = 0_1)) -> (shared_fifo.ll.count[0_1] >= sb.cnt) ;
            (sb.magic_packet_exited = 0_1) -> (sb.cnt <= depth) ;
            ((F[B.value] = 0_{F_width}) & (sb.en = 1_1) & (sb.magic_packet_exited = 0_1) & (I[B.value] + 1_{I_width} = sb.cnt[0:{I_widthm1}])) -> (shared_fifo.mem[B.value] = sb.magic_packet) ;
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
    I_width = (depth - 1).bit_length()
    F_width = num_fifos.bit_length()

    return PROBLEM_TEMPLATE.format(cnt_width=cnt_width,
                                   I_width=I_width,
                                   F_width=F_width,
                                   I_widthm1=I_width-1,
                                   depthm1=(depth-1))

if __name__ == "__main__":
    print(gen())
