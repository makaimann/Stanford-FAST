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

module arbitrated_fifos(clk, rst, push, reqs, flat_data_in, quantums,
			                  gnt, data_out);

   parameter NUM_REQS   =    `NUM_REQS,
	           WIDTH      =    `FIFO_DWIDTH,
	           DEPTH      =    `FIFO_DEPTH,
	           QWID       =    `ARB_QWID;

   input 		      clk, rst;
   input [NUM_REQS-1:0]       push;
   input [NUM_REQS-1:0]       reqs;
   input [NUM_REQS*WIDTH-1:0] flat_data_in;
   input [NUM_REQS*QWID-1:0]  quantums;


   output reg [WIDTH-1:0]     data_out;
   output [NUM_REQS-1:0]      gnt;

   wire [WIDTH-1:0] 	      fifo_data_out [NUM_REQS-1:0];

   wire [NUM_REQS-1:0] 	      empty;
   wire [NUM_REQS-1:0] 	      full;

   wire [NUM_REQS-1:0] 	      guarded_reqs;

   // Unpack data_in
   wire [WIDTH-1:0] 	      data_in [NUM_REQS-1:0];
   generate
      genvar                i;

      for(i=0; i < NUM_REQS; i=i+1) begin : unpack_data_in
	       assign data_in[i] = flat_data_in[(i+1)*WIDTH-1:i*WIDTH];
      end
   endgenerate


   DWRR #(.NUM_REQS(NUM_REQS), .QWID(QWID), .PSIZE(WIDTH)) arb (.clk(clk),
								.rst(rst),
								.blk(1'b0),
								.reqs(guarded_reqs),
								.input_quantums(quantums),
								.gnt(gnt));
   generate
      for(i=0; i < NUM_REQS; i=i+1) begin : gen_fifos
	 fifo #(.WIDTH(WIDTH), .DEPTH(DEPTH)) f (.clk(clk),
						 .rst(rst),
						 .push(push[i]),
						 .pop(gnt[i]),
						 .data_in(data_in[i]),
						 .full(full[i]),
						 .empty(empty[i]),
						 .data_out(fifo_data_out[i]));
	 // For now assuming every non-empty fifo is requesting
	 assign guarded_reqs[i] = reqs[i] & ~empty[i];
      end
   endgenerate

   always_comb begin
      data_out = 'z;
      for (int i = 0; i < NUM_REQS; i++) begin
	 if (gnt[i]) begin
	    data_out = fifo_data_out[i];
	 end
      end
   end

endmodule

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
       .QWID(QWID))

   af0 (.clk(clk),
	      .rst(rst),
	      .push(push0),
	      .reqs(reqs0),
	      .gnt(pop0),
	      .flat_data_in(flat_data_in0),
	      .quantums(quantums),
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
       .QWID(QWID))

   af1 (.clk(clk),
	      .rst(rst),
	      .push(push1),
	      .reqs(reqs1),
	      .gnt(pop1),
	      .flat_data_in(flat_data_in1),
	      .quantums(quantums),
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
