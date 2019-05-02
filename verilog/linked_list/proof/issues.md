# Keeping Track Of Issues

## Overconstraining
* ~~changing: ghost[j] <= {free_list, free_list_count[PTR_WIDTH-1:0] - push}; to use {1'b0, ... should cause props to fail but it does not~~
  * this had to do with the btor encoding yosys produces (arrays are held constant if they aren't written to -- duh)

## Property
* ~~One of the conjuncts in the refinement property is too weak~~
  * In particular, for each element of next_ptr we check:
    if it's not a tail, then it needs to increment the number
    However, this can make it trivially true. if it's equal to an invalid tail (tail of an empty list) then it shouldn't trivialize the consequent!
  * Handled this by checking empty/full for each tail (full is for free list only)
