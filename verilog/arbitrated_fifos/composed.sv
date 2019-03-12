`include "options.v"

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef DWRR
 `include "DWRR.sv"
`endif

`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

`ifndef ARBITRATED_FIFOS
 `include "arbitrated_fifos.sv"
`endif

// Interface for POR/force-sequencial
// this describes in english, the Sigma function used for mapping instructions to  a different time
//   i.e. using the reduced instruction set and reordering instructions
// clk toggles for time
// rst is held low always
// instructions -- duplicated in duplicate system
// (en, control, data) -- control signal implies every other control signal is zero
//     note: using unpacked data for ease of use
// (!gen_fifos[0].f.full, push[0], data_in[0])
// (!gen_fifos[1].f.full, push[1], data_in[1])
// (!gen_fifos[0].empty, reqs[0], NIL)
// (!gen_fifos[1].empty, reqs[1], NIL)
//
// function of other signals
// start -- stays constant for the proof
// quantum -- stays constant for the proof
//
// Note: there are active an inactive signals
// start and quantum are inactive and thus remain constant
// start in particular is interesting, do we need to include it in proofs or not? Is it part of the instruction?
// I don't think we want it to be, so the only thing to do is formalize that it's okay to ignore it/keep it constant
// i.e. what qualifies it to be "inactive"
//

module top(clk, rst, start, push0, push1, reqs0, reqs1, flat_data_in0, flat_data_in1, quantums,
	   pop0, pop1, data_out0, data_out1, prop_signal0, prop_signal1);

   parameter NUM_REQS   =    `NUM_REQS,
	           WIDTH      =    `FIFO_DWIDTH,
       	     DEPTH      =    `FIFO_DEPTH,
 	           QWID       =    `ARB_QWID,
             FIFO_SEL   =     0; // which fifo to check data integrity of

   input                      clk, rst, start;
   input [NUM_REQS-1:0]       push0, push1;
   input [NUM_REQS-1:0]       reqs0, reqs1;


   input [NUM_REQS*QWID-1:0]  quantums;
   input [NUM_REQS*WIDTH-1:0] flat_data_in0, flat_data_in1;

   output [NUM_REQS-1:0]      pop0, pop1;
   output [WIDTH-1:0]         data_out0, data_out1;
   output                     prop_signal0, prop_signal1;

   // high when the magic packet is supposed to be exiting
   wire                       data_out_vld0, data_out_vld1;

   wire [NUM_REQS-1:0] 	      empty0, empty1, full0, full1;

   // unpack data for easier handling
   wire [WIDTH-1:0]           data_in0  [NUM_REQS-1:0];
   wire [WIDTH-1:0]           data_in1  [NUM_REQS-1:0];

   generate
      genvar                  i;
      for(i=0; i < NUM_REQS; i=i+1) begin : unpack_data
         assign data_in0[i]  = flat_data_in0[(i+1)*WIDTH-1:i*WIDTH];
         assign data_in1[i]  = flat_data_in1[(i+1)*WIDTH-1:i*WIDTH];
      end
   endgenerate


   arbitrated_fifos
     #(.NUM_REQS(NUM_REQS),
       .WIDTH(WIDTH),
       .DEPTH(DEPTH),
       .QWID(QWID),
       .ABSTRACT(1))

   af0 (.clk(clk),
       .rst(rst),
       .push(push0),
       .reqs(reqs0),
       .gnt(pop0),
       .flat_data_in(flat_data_in0),
       .quantums(quantums),
       .empty(empty0),
       .full(full0),
       .data_out(data_out0));

   // Scoreboard for af0
   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))

   sb0 (.clk(clk),
        .rst(rst),
        .push(push0[FIFO_SEL]),
        .pop(pop0[FIFO_SEL]),
        .start(start),
        .data_in(data_in0[FIFO_SEL]),
        .data_out(data_out0),
        .data_out_vld(data_out_vld0),
        .prop_signal(prop_signal0));


   arbitrated_fifos
     #(.NUM_REQS(NUM_REQS),
       .WIDTH(WIDTH),
       .DEPTH(DEPTH),
       .QWID(QWID),
       .ABSTRACT(1))

   af1 (.clk(clk),
       .rst(rst),
       .push(push1),
       .reqs(reqs1),
       .gnt(pop1),
       .flat_data_in(flat_data_in1),
       .quantums(quantums),
       .empty(empty1),
       .full(full1),
       .data_out(data_out1));
   
   // Scoreboard for af0
   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))

   sb1 (.clk(clk),
        .rst(rst),
        .push(push1[FIFO_SEL]),
        .pop(pop1[FIFO_SEL]),
        .start(start),
        .data_in(data_in1[FIFO_SEL]),
        .data_out(data_out1),
        .data_out_vld(data_out_vld1),
        .prop_signal(prop_signal1));

endmodule // top
