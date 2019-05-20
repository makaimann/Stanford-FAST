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
tail    = "'shared_fifo.ll.tail[{sel}]'"

PROBLEM="""
[{name}]
description: "AUTOGENERATED"
properties: {formula}
precondition: reset_done
verification: safety
prove: True
"""

def get_full_tag(fifo, elem_num, sel_width, ptr_width):
    num_bits = sel_width+ptr_width+1
    fifo_shifted = fifo*(2**ptr_width)
    res = fifo_shifted+elem_num
    return val.format(val=res, width=num_bits)

def get_fifo_tag_extract(sel_width, ptr_width):
    return extract.format(upper=(sel_width+ptr_width), lower=ptr_width)

def get_elem_tag_extract(sel_width, ptr_width):
    return extract.format(upper=ptr_width-1, lower=0)

def ptr_neq_tail(ptr, num_fifos, ptr_width):
    ptr_val = val.format(val=ptr, width=ptr_width)
    assertions = ["(({} != shared_fifo.ll.free_list_tail) | (full = 1_1))".format(ptr_val)]
    for i in range(num_fifos):
        empty_sel = empty.format(sel=i)
        empty_bool = "({} = 1_1)".format(empty_sel)
        tail_sel = tail.format(sel=i)
        ptr_noteq_tail = "({} != {})".format(ptr_val, tail_sel)
        assertions.append("({} | {})".format(ptr_noteq_tail, empty_bool))
    return " & ".join(assertions)

def counts_consistent_depth(depth, num_fifos, ptr_width, sel_width, addr_width):
    count_sum = "free_list_count"
    for i in range(num_fifos):
        count_sum += " + " + counter.format(sel=i, sel_width=sel_width)
    return "({}) = depth".format(count_sum)

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

def heads_map_to_zero(depth, num_fifos, ptr_width, sel_width, addr_width):
    free_list_tag = get_full_tag(num_fifos, 0, sel_width, ptr_width)
    mappings = ["((full = 0_1) -> (ghost[shared_fifo.ll.free_list_head] = {}))".format(free_list_tag)]
    for i in range(num_fifos):
        # TODO: Finish this
        empty_sel = empty.format(sel=i)
        tag = get_full_tag(i, 0, sel_width, ptr_width)
        head_sel = head.format(sel=i, width=sel_width)
        ghost_head = "ghost[{}]".format(head_sel)
        mappings.append("(({} = 0_1) -> ({} = {}))".format(empty_sel, ghost_head, tag))
    return " & ".join(mappings)

def tails_map_to_count(depth, num_fifos, ptr_width, sel_width, addr_width):
    fifo_extract = get_fifo_tag_extract(sel_width, ptr_width)
    elem_extract = get_elem_tag_extract(sel_width, ptr_width)
    mappings = ["((full = 0_1) -> ((ghost[shared_fifo.ll.free_list_tail]{} = {})"
                " & ((ghost[shared_fifo.ll.free_list_tail]{} + {}) "
                "= free_list_count{})))".format(
                    fifo_extract,
                    val.format(val=num_fifos, width=sel_width+1),
                    elem_extract,
                    val.format(val=1, width=ptr_width),
                    extract.format(upper=ptr_width-1, lower=0))]
    for i in range(num_fifos):
        empty_sel = empty.format(sel=i)
        empty_bool = "({} = 0_1)".format(empty_sel)
        ghost_tail = "ghost[{}]".format(tail.format(sel=i))
        ghost_fifo_extract = "{}{}".format(ghost_tail, get_fifo_tag_extract(sel_width, ptr_width))
        ghost_elem_extract = "{}{}".format(ghost_tail, get_elem_tag_extract(sel_width, ptr_width))
        ghost_fifo_matches = "({} = {})".format(ghost_fifo_extract,
                                                val.format(val=i, width=sel_width+1))
        count_sel = "{}{}".format(counter.format(sel=i, sel_width=sel_width), elem_extract)
        ghost_elem_matches = "(({} + {}) = {})".format(ghost_elem_extract,
                                                       val.format(val=1, width=ptr_width),
                                                       count_sel
                                                       )
        mappings.append("({} -> ({} & {}))".format(empty_bool, ghost_fifo_matches, ghost_elem_matches))
    return " & ".join(mappings)

def next_ptr(depth, num_fifos, ptr_width, sel_width, addr_width):
    ptr_assertions = []
    fifo_extract = get_fifo_tag_extract(sel_width, ptr_width)
    elem_extract = get_elem_tag_extract(sel_width, ptr_width)
    for i in range(depth):
        p = ptr_neq_tail(i, num_fifos, ptr_width)
        ptr_val = val.format(val=i, width=ptr_width)
        fifo_match = "(ghost[shared_fifo.ll.next_ptr[{0}]]{1} = ghost[{0}]{1})".format(ptr_val, fifo_extract)
        elem_inc = "(ghost[shared_fifo.ll.next_ptr[{0}]]{1} = (ghost[{0}]{1} + {2}))".format(ptr_val, elem_extract, val.format(val=1, width=ptr_width))
        ptr_assertions.append("(({}) -> ({} & {}))".format(p, fifo_match, elem_inc))

    return " & ".join(ptr_assertions)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate the shared fifo refinement property for the provided parameters")

    parser.add_argument('--depth', '-d', help='The number of available memory cells (power of 2)', required=True, type=int)
    parser.add_argument('--num-fifos', '-n', help='The number of FIFOs sharing the same memory', required=True, type=int)
    parser.add_argument('--problems', help='Print individual problems', action="store_true")

    args = parser.parse_args()
    depth = args.depth
    num_fifos = args.num_fifos

    assert (2**(depth.bit_length()-1)) == depth, "Expecting a power of two"

    ptr_width = math.ceil(math.log2(depth))
    sel_width = math.ceil(math.log2(num_fifos))
    addr_width = math.ceil(math.log2(num_fifos+1))

    problems = {
        'counts_consistent_depth': counts_consistent_depth,
        'counts_consistent_total': counts_consistent_total,
        'counters_lte_depth': counters_lte_depth,
        'heads_map_to_zero': heads_map_to_zero,
        'tails_map_to_count': tails_map_to_count,
        'next_ptr': next_ptr
    }

    if args.problems:
        for name, fun in problems.items():
            print(PROBLEM.format(name=name, formula=fun(depth, num_fifos, ptr_width, sel_width, addr_width)))
    else:
        assertions = []
        for name, fun in problems.items():
            assertions.append("({})".format(fun(depth, num_fifos, ptr_width, sel_width, addr_width)))
        print(" & ".join(assertions))
