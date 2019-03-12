analyze -sv {./Scoreboard.sv} ; analyze -sv {./DWRR.sv} ; analyze -sv {./fifo.sv} ; analyze -verilog {./options.v} ; analyze -verilog {./FF.v} ; analyze -sv {./pridec.sv} ;
elaborate -top {Scoreboard} ;

clock clk;
reset rst;

assume -name no_pop_empty {empty |-> !pop} ;
assume -name no_push_full {full |-> !push} ;

assert -name data_integrity {prop_signal}
# For Arbiter liveness
# assume -name fix_quantums {(arb.quantums[0] == 8) && (arb.quantums[1] == 8) && (arb.quantums[2] == 8) && (arb.quantums[3] == 8)}
# assert -name will_gnt {always arb.reqs[0] |-> s_eventually arb.gnt[0]}
