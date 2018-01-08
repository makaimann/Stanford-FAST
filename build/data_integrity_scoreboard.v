module Register1R (input [0:0] I, output [0:0] O, input  CLK, input  RESET);
wire  inst0_Q;
SB_DFFSR inst0 (.C(CLK), .R(RESET), .D(I[0]), .Q(inst0_Q));
assign O = {inst0_Q};
endmodule

module Or2 (input [1:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hEEEE)) inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module Or2x1 (input [0:0] I0, input [0:0] I1, output [0:0] O);
wire  inst0_O;
Or2 inst0 (.I({I1[0],I0[0]}), .O(inst0_O));
assign O = {inst0_O};
endmodule

module Register3R (input [2:0] I, output [2:0] O, input  CLK, input  RESET);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
SB_DFFSR inst0 (.C(CLK), .R(RESET), .D(I[0]), .Q(inst0_Q));
SB_DFFSR inst1 (.C(CLK), .R(RESET), .D(I[1]), .Q(inst1_Q));
SB_DFFSR inst2 (.C(CLK), .R(RESET), .D(I[2]), .Q(inst2_Q));
assign O = {inst2_Q,inst1_Q,inst0_Q};
endmodule

module Invert3 (input [2:0] I, output [2:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
SB_LUT4 #(.LUT_INIT(16'h5555)) inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(I[1]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst2 (.I0(I[2]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst2_O));
assign O = {inst2_O,inst1_O,inst0_O};
endmodule

module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module Add3CinCout (input [2:0] I0, input [2:0] I1, input  CIN, output [2:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(CIN), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
assign O = {inst2_O,inst1_O,inst0_O};
assign COUT = inst2_COUT;
endmodule

module Sub3Cout (input [2:0] I0, input [2:0] I1, output [2:0] O, output  COUT);
wire [2:0] inst0_O;
wire [2:0] inst1_O;
wire  inst1_COUT;
Invert3 inst0 (.I(I1), .O(inst0_O));
Add3CinCout inst1 (.I0(I0), .I1(inst0_O), .CIN(1'b1), .O(inst1_O), .COUT(inst1_COUT));
assign O = inst1_O;
assign COUT = inst1_COUT;
endmodule

module ULT3 (input [2:0] I0, input [2:0] I1, output  O);
wire [2:0] inst0_O;
wire  inst0_COUT;
wire  inst1_O;
Sub3Cout inst0 (.I0(I0), .I1(I1), .O(inst0_O), .COUT(inst0_COUT));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(inst0_COUT), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
assign O = inst1_O;
endmodule

module And2 (input [1:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h8888)) inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module And2x3 (input [2:0] I0, input [2:0] I1, output [2:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
And2 inst0 (.I({I1[0],I0[0]}), .O(inst0_O));
And2 inst1 (.I({I1[1],I0[1]}), .O(inst1_O));
And2 inst2 (.I({I1[2],I0[2]}), .O(inst2_O));
assign O = {inst2_O,inst1_O,inst0_O};
endmodule

module Add3 (input [2:0] I0, input [2:0] I1, output [2:0] O);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
assign O = {inst2_O,inst1_O,inst0_O};
endmodule

module UGT3 (input [2:0] I0, input [2:0] I1, output  O);
wire [2:0] inst0_O;
wire  inst0_COUT;
wire  inst1_O;
Sub3Cout inst0 (.I0(I1), .I1(I0), .O(inst0_O), .COUT(inst0_COUT));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(inst0_COUT), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
assign O = inst1_O;
endmodule

module Add3Cin (input [2:0] I0, input [2:0] I1, input  CIN, output [2:0] O);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(CIN), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
assign O = {inst2_O,inst1_O,inst0_O};
endmodule

module Sub3 (input [2:0] I0, input [2:0] I1, output [2:0] O);
wire [2:0] inst0_O;
wire [2:0] inst1_O;
Invert3 inst0 (.I(I1), .O(inst0_O));
Add3Cin inst1 (.I0(I0), .I1(inst0_O), .CIN(1'b1), .O(inst1_O));
assign O = inst1_O;
endmodule

module MagicPacketTracker (input  push, input  pop, input  captured, output [2:0] cnt, output [2:0] next_cnt, input  rst, input  CLK);
wire [2:0] pop_cnt_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire [2:0] inst5_O;
wire [2:0] inst6_O;
wire  inst7_O;
wire  inst8_O;
wire [2:0] inst9_O;
wire [2:0] inst10_O;
Register3R pop_cnt (.I(inst10_O), .O(pop_cnt_O), .CLK(CLK), .RESET(rst));
ULT3 inst1 (.I0(pop_cnt_O), .I1({1'b0,1'b0,1'b0}), .O(inst1_O));
And2 inst2 (.I({push,inst1_O}), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst3 (.I0(captured), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst3_O));
And2 inst4 (.I({inst3_O,inst2_O}), .O(inst4_O));
And2x3 inst5 (.I0({1'b0,1'b0,1'b1}), .I1({inst4_O,inst4_O,inst4_O}), .O(inst5_O));
Add3 inst6 (.I0(pop_cnt_O), .I1(inst5_O), .O(inst6_O));
UGT3 inst7 (.I0(inst6_O), .I1({1'b0,1'b0,1'b0}), .O(inst7_O));
And2 inst8 (.I({pop,inst7_O}), .O(inst8_O));
And2x3 inst9 (.I0({1'b0,1'b0,1'b1}), .I1({inst8_O,inst8_O,inst8_O}), .O(inst9_O));
Sub3 inst10 (.I0(inst6_O), .I1(inst9_O), .O(inst10_O));
assign cnt = pop_cnt_O;
assign next_cnt = inst10_O;
endmodule

module Register4CER (input [3:0] I, output [3:0] O, input  CLK, input  CE, input  RESET);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
SB_DFFESR inst0 (.C(CLK), .R(RESET), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFESR inst1 (.C(CLK), .R(RESET), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFESR inst2 (.C(CLK), .R(RESET), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFESR inst3 (.C(CLK), .R(RESET), .E(CE), .D(I[3]), .Q(inst3_Q));
assign O = {inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Add4 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
assign O = {inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Register8CE (input [7:0] I, output [7:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFE inst4 (.C(CLK), .E(CE), .D(I[4]), .Q(inst4_Q));
SB_DFFE inst5 (.C(CLK), .E(CE), .D(I[5]), .Q(inst5_Q));
SB_DFFE inst6 (.C(CLK), .E(CE), .D(I[6]), .Q(inst6_Q));
SB_DFFE inst7 (.C(CLK), .E(CE), .D(I[7]), .Q(inst7_Q));
assign O = {inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Mux2 (input [1:0] I, input  S, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module Mux4 (input [3:0] I, input [1:0] S, output  O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
Mux2 inst0 (.I({I[1],I[0]}), .S(S[0]), .O(inst0_O));
Mux2 inst1 (.I({I[3],I[2]}), .S(S[0]), .O(inst1_O));
Mux2 inst2 (.I({inst1_O,inst0_O}), .S(S[1]), .O(inst2_O));
assign O = inst2_O;
endmodule

module Mux8 (input [7:0] I, input [2:0] S, output  O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
Mux4 inst0 (.I({I[3],I[2],I[1],I[0]}), .S({S[1],S[0]}), .O(inst0_O));
Mux4 inst1 (.I({I[7],I[6],I[5],I[4]}), .S({S[1],S[0]}), .O(inst1_O));
Mux2 inst2 (.I({inst1_O,inst0_O}), .S(S[2]), .O(inst2_O));
assign O = inst2_O;
endmodule

module Mux8x8 (input [7:0] I0, input [7:0] I1, input [7:0] I2, input [7:0] I3, input [7:0] I4, input [7:0] I5, input [7:0] I6, input [7:0] I7, input [2:0] S, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
Mux8 inst0 (.I({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]}), .S(S), .O(inst0_O));
Mux8 inst1 (.I({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}), .S(S), .O(inst1_O));
Mux8 inst2 (.I({I7[2],I6[2],I5[2],I4[2],I3[2],I2[2],I1[2],I0[2]}), .S(S), .O(inst2_O));
Mux8 inst3 (.I({I7[3],I6[3],I5[3],I4[3],I3[3],I2[3],I1[3],I0[3]}), .S(S), .O(inst3_O));
Mux8 inst4 (.I({I7[4],I6[4],I5[4],I4[4],I3[4],I2[4],I1[4],I0[4]}), .S(S), .O(inst4_O));
Mux8 inst5 (.I({I7[5],I6[5],I5[5],I4[5],I3[5],I2[5],I1[5],I0[5]}), .S(S), .O(inst5_O));
Mux8 inst6 (.I({I7[6],I6[6],I5[6],I4[6],I3[6],I2[6],I1[6],I0[6]}), .S(S), .O(inst6_O));
Mux8 inst7 (.I({I7[7],I6[7],I5[7],I4[7],I3[7],I2[7],I1[7],I0[7]}), .S(S), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module FIFO (input  push, input  pop, input  rst, input [7:0] data_in, output [7:0] data_out, output  empty, output  full, input  CLK);
wire  inst0_O;
wire  inst1_O;
wire [3:0] wrPtr_O;
wire [3:0] rdPtr_O;
wire [3:0] inst4_O;
wire [3:0] inst5_O;
wire [7:0] entry0_O;
wire  inst7_O;
wire [7:0] entry1_O;
wire  inst9_O;
wire [7:0] entry2_O;
wire  inst11_O;
wire [7:0] entry3_O;
wire  inst13_O;
wire [7:0] entry4_O;
wire  inst15_O;
wire [7:0] entry5_O;
wire  inst17_O;
wire [7:0] entry6_O;
wire  inst19_O;
wire [7:0] entry7_O;
wire  inst21_O;
wire [7:0] inst22_O;
Or2 inst0 (.I({pop,push}), .O(inst0_O));
Or2 inst1 (.I({rst,inst0_O}), .O(inst1_O));
Register4CER wrPtr (.I(inst4_O), .O(wrPtr_O), .CLK(CLK), .CE(push), .RESET(rst));
Register4CER rdPtr (.I(inst5_O), .O(rdPtr_O), .CLK(CLK), .CE(pop), .RESET(rst));
Add4 inst4 (.I0(wrPtr_O), .I1({1'b0,1'b0,1'b0,1'b1}), .O(inst4_O));
Add4 inst5 (.I0(rdPtr_O), .I1({1'b0,1'b0,1'b0,1'b1}), .O(inst5_O));
Register8CE entry0 (.I(data_in), .O(entry0_O), .CLK(CLK), .CE(inst7_O));
Or2 inst7 (.I({1'b0,inst1_O}), .O(inst7_O));
Register8CE entry1 (.I(data_in), .O(entry1_O), .CLK(CLK), .CE(inst9_O));
Or2 inst9 (.I({1'b0,inst1_O}), .O(inst9_O));
Register8CE entry2 (.I(data_in), .O(entry2_O), .CLK(CLK), .CE(inst11_O));
Or2 inst11 (.I({1'b0,inst1_O}), .O(inst11_O));
Register8CE entry3 (.I(data_in), .O(entry3_O), .CLK(CLK), .CE(inst13_O));
Or2 inst13 (.I({1'b0,inst1_O}), .O(inst13_O));
Register8CE entry4 (.I(data_in), .O(entry4_O), .CLK(CLK), .CE(inst15_O));
Or2 inst15 (.I({1'b0,inst1_O}), .O(inst15_O));
Register8CE entry5 (.I(data_in), .O(entry5_O), .CLK(CLK), .CE(inst17_O));
Or2 inst17 (.I({1'b0,inst1_O}), .O(inst17_O));
Register8CE entry6 (.I(data_in), .O(entry6_O), .CLK(CLK), .CE(inst19_O));
Or2 inst19 (.I({1'b0,inst1_O}), .O(inst19_O));
Register8CE entry7 (.I(data_in), .O(entry7_O), .CLK(CLK), .CE(inst21_O));
Or2 inst21 (.I({1'b0,inst1_O}), .O(inst21_O));
Mux8x8 inst22 (.I0(entry0_O), .I1(entry1_O), .I2(entry2_O), .I3(entry3_O), .I4(entry4_O), .I5(entry5_O), .I6(entry6_O), .I7(entry7_O), .S({rdPtr_O[2],rdPtr_O[1],rdPtr_O[0]}), .O(inst22_O));
assign data_out = inst22_O;
assign empty = 1'b0;
assign full = 1'b0;
endmodule

module ULE3 (input [2:0] I0, input [2:0] I1, output  O);
wire [2:0] inst0_O;
wire  inst0_COUT;
Sub3Cout inst0 (.I0(I1), .I1(I0), .O(inst0_O), .COUT(inst0_COUT));
assign O = inst0_COUT;
endmodule

module DataIntegritySB (input  push, input  pop, input  start, input  rst, input [7:0] data_in, output  data_out_vld, input  CLK);
wire [0:0] en_O;
wire [0:0] inst1_O;
wire [2:0] inst2_cnt;
wire [2:0] inst2_next_cnt;
wire [7:0] inst3_data_out;
wire  inst3_empty;
wire  inst3_full;
wire  inst4_O;
wire  inst5_O;
Register1R en (.I(inst1_O), .O(en_O), .CLK(CLK), .RESET(rst));
Or2x1 inst1 (.I0(en_O), .I1({start}), .O(inst1_O));
MagicPacketTracker inst2 (.push(push), .pop(pop), .captured(en_O[0]), .cnt(inst2_cnt), .next_cnt(inst2_next_cnt), .rst(rst), .CLK(CLK));
FIFO inst3 (.push(push), .pop(pop), .rst(rst), .data_in(data_in), .data_out(inst3_data_out), .empty(inst3_empty), .full(inst3_full), .CLK(CLK));
ULE3 inst4 (.I0(inst2_next_cnt), .I1({1'b0,1'b0,1'b0}), .O(inst4_O));
And2 inst5 (.I({inst4_O,en_O[0]}), .O(inst5_O));
assign data_out_vld = inst5_O;
endmodule

