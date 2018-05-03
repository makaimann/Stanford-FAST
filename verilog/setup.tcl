analyze -sv {./data_integrity_scoreboard.sv} ; analyze -sv {./DWRR.sv} ; analyze -sv {./fifo.sv} ; analyze -sv {./ndtop.sv} ; analyze -sv {./options.sv} ; analyze -sv {./simple.sv} ; analyze -sv {./utils.sv} ;
elaborate -top {Scoreboard} ;

clock clk;
reset rst;

assume -name no_pop_empty {empty |-> !pop} ;
assume -name no_push_full {full |-> !push} ;

assert -name data_integrity {prop_signal}
