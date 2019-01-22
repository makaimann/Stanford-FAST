analyze -sv {top.sv}
elaborate -top top

reset rst;
clock clk;

assume -name no_push_0_when_full {af.gen_fifos[0].f.full |-> !push[0]}
assume -name no_push_1_when_full {af.gen_fifos[1].f.full |-> !push[1]}
# assume -name no_push_2_when_full {af.gen_fifos[2].f.full |-> !push[0]}
# assume -name no_push_3_when_full {af.gen_fifos[3].f.full |-> !push[1]}
assume -name no_reqs_0_when_empty {af.gen_fifos[0].f.empty |-> !reqs[0]}
assume -name no_reqs_1_when_empty {af.gen_fifos[1].f.empty |-> !reqs[1]}
# assume -name no_reqs_2_when_empty {af.gen_fifos[2].f.empty |-> !reqs[0]}
# assume -name no_reqs_3_when_empty {af.gen_fifos[3].f.empty |-> !reqs[1]}

# # partial order reductions 
# assume -name por_1 {(!full[0] && push[1]) |=> !push[0]}
# assume -name por_2 {(!full[0] && reqs[1]) |=> !push[0]}
# assume -name por_3 {(!empty[0] && push[1]) |=> !reqs[0]}
# assume -name por_4 {(!empty[0] && reqs[1]) |=> !reqs[0]}

# # key partial order reduction
# assume -name por_final {(sb.ff_en.Q && !af.gen_fifos[0].f.empty) |-> (push[0] |=> !pop[0])}

assert -name data_integrity {prop_signal}
