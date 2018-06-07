analyze -sv {./Scoreboard.sv} ; analyze -sv {./DWRR.sv} ; analyze -sv {./fifo.sv} ; analyze {./options.v} ; analyze {./FF.v} ; analyze {./pridec.v} ;
elaborate -top {Scoreboard} ;

clock clk;
reset rst;

assume -name no_pop_empty {empty |-> !pop} ;
assume -name no_push_full {full |-> !push} ;

assert -name data_integrity {prop_signal}
