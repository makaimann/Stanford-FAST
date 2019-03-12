`ifndef INSTR_DELAY
 `include "instr_delay.sv"
`endif
module top_composed(clk, rst, delay, start_top, push, reqs, flat_data_in_top, quantums_top,
                    pop0, pop1, data_out0, data_out1, prop_signal0, prop_signal1);

   parameter NUM_REQS   =    `NUM_REQS,
	       WIDTH      =    `FIFO_DWIDTH,
	       DEPTH      =    `FIFO_DEPTH,
 	       QWID       =    `ARB_QWID,
	       FIFO_SEL   =     0; // which fifo to check data integrity of


   input                      clk, rst, delay, start_top;
   input [NUM_REQS-1:0]       push, reqs;
   input [NUM_REQS*WIDTH-1:0] flat_data_in_top;
   input [NUM_REQS*QWID-1:0]  quantums_top;
   output [NUM_REQS-1:0]      pop0, pop1;
   output [WIDTH-1:0]         data_out0, data_out1;
   output                     prop_signal0, prop_signal1;


   wire [$clog2(NUM_REQS*2 + 1)-1:0] count;
   wire [NUM_REQS-1:0]           push0, reqs0, push1, reqs1;
   wire [NUM_REQS*QWID-1:0]      quantums;
   wire [NUM_REQS*WIDTH-1:0]     flat_data_in;

   instr_delay
     #(.NUM_INSTR(NUM_REQS*2),
       .NUM_DATA_BITS(WIDTH*DEPTH*NUM_REQS + QWID*NUM_REQS + 1))
   id (.clk(clk),
       .delay(delay),
       .instructions({push, reqs}),
       .data_in({flat_data_in_top, quantums_top, start_top}),
       .mask(4'b0011),
       .orig_instructions({push0, reqs0}),
       .delayed_instructions({push1, reqs1}),
       .data_out({flat_data_in, quantums, start}),
       .count(count));

top
  #(.NUM_REQS(NUM_REQS),
    .WIDTH(WIDTH),
    .DEPTH(DEPTH),
    .QWID(QWID),
    .FIFO_SEL(FIFO_SEL))
   t (.clk(clk),
      .rst(rst),
      .start(start),
      .push0(push0),
      .push1(push1),
      .reqs0(reqs0),
      .reqs1(reqs1),
      .flat_data_in0(flat_data_in),
      .flat_data_in1(flat_data_in),
      .quantums(quantums),
      .pop0(pop0),
      .pop1(pop1),
      .data_out0(data_out0),
      .data_out1(data_out1),
      .prop_signal0(prop_signal0),
      .prop_signal1(prop_signal1));

endmodule // top_composed
