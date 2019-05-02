# Keeping Track Of Issues

## Overconstraining
* changing: ghost[j] <= {free_list, free_list_count[PTR_WIDTH-1:0] - push}; to use {1'b0, ... should cause props to fail but it does not
