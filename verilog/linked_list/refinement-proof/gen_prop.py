#!/usr/bin/env python3
# PARAMETERS
# DEPTH
# NUM_FIFOS

import argparse
import math

counter = "count[{sel}_{sel_width}]"
empty   = "empty[{sel}:{sel}]"
val     = "{val}_{width}"
extract = "[{lower}:{upper}]"
head    = "shared_fifo.ll.head[{sel}_{width}]"

def get_full_tag(fifo, elem_num, sel_width, ptr_width):
    num_bits = sel_width+ptr_width+1
    fifo_shifted = fifo*(2**ptr_width)
    val = fifo_shifted+elem_num
    return val.format(val=val, width=num_bits)

def get_fifo_tag_extract(sel_width, ptr_width):
    return extract.format(upper=(sel_width+ptr_width), lower=ptr_width)

def get_elem_tag_extract(sel_width, ptr_width):
    return extract.format(upper=ptr_width-1, lower=0)

def counts_consistent_total(depth, num_fifos, ptr_width, sel_width, addr_width):
    count_sum = counter.format(sel=0, sel_width=sel_width)
    for i in range(1, num_fifos):
        count_sum += " + " + counter.format(sel=i, sel_width=sel_width)

    return "({}) = shared_fifo.ll.total_count".format(count_sum)

def counters_lte_depth(depth, num_fifos, ptr_width, sel_width, addr_width):
    lte_depth = ["(free_list_count <= depth)"]
    for i in range(num_fifos):
        lte_depth.append("({} <= depth)".format(counter.format(sel=i, sel_width=sel_width)))
    return " & ".join(lte_depth)

def head_maps_to_zero(depth, num_fifos, ptr_width, sel_width, addr_width):
    mappings = ["(full = 0_1) -> (ghost[shared_fifo.ll.free_list_head] == )"]
    for i in range(num_fifos):
        # TODO: Finish this
        empty_sel = empty.format(sel=i)
        tag = get_full_tag(i, 0, sel_width, ptr_width)
        head_sel = head.format(sel=i, width=sel_width)
        mappings.append("({} = 0_1) -> ({} = {})".format(empty_sel, head_sel, tag))
    return " & ".join(mappings)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate the shared fifo refinement property for the provided parameters")

    parser.add_argument('--depth', '-d', help='The number of available memory cells (power of 2)', required=True)
    parser.add_argument('--num-fifos', '-n', help='The number of FIFOs sharing the same memory', required=True)

    args = parser.parse_args()
    depth = args.depth
    num_fifos = args.num_fifos

    assert (2**depth.bit_length()) == depth, "Expecting a power of two"

    ptr_width = math.ceil(math.log2(depth))
    sel_width = math.ceil(math.log2(num_fifos))
    addr_width = math.ceil(math.log2(num_fifos+1))
