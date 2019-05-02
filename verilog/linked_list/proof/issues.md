# Keeping Track Of Issues

## Overconstraining
* ~~changing: ghost[j] <= {free_list, free_list_count[PTR_WIDTH-1:0] - push}; to use {1'b0, ... should cause props to fail but it does not~~
  * this had to do with the btor encoding yosys produces (arrays are held constant if they aren't written to -- duh)
