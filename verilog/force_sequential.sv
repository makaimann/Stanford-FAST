`include "options.v"

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef DWRR
 `include "DWRR.sv"
`endif

module arbitrated_fifos(clk, rst, push, flat_data_in, quantums,
			gnt, data_out);

   parameter NUM_REQS   =    `NUM_REQS,
	     WIDTH      =    `FIFO_DWIDTH,
	     DEPTH      =    `FIFO_DEPTH,
	     QWID       =    `ARB_QWID;

   input 		      clk, rst;
   input [NUM_REQS-1:0]       push;
   input [NUM_REQS*QWID-1:0]  quantums;
   input [NUM_REQS*WIDTH-1:0] flat_data_in;

   output reg [WIDTH-1:0]     data_out;
   output [NUM_REQS-1:0]      gnt;

   wire [WIDTH-1:0] 	      fifo_data_out [NUM_REQS-1:0];

   wire [NUM_REQS-1:0] 	      empty;
   wire [NUM_REQS-1:0] 	      full;

   wire [NUM_REQS-1:0] 	      reqs;


   // Unpack data_in

   wire [WIDTH-1:0] 	      data_in [NUM_REQS-1:0];
   generate
      genvar 		      i;

      for(i=0; i < NUM_REQS; i=i+1) begin : pack_data_in
	 assign data_in[i] = flat_data_in[(i+1)*WIDTH-1:i*WIDTH];
      end
   endgenerate


   DWRR #(.NUM_REQS(NUM_REQS), .QWID(QWID), .PSIZE(WIDTH)) arb (.clk(clk),
								.rst(rst),
								.blk(1'b0),
								.reqs(reqs),
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
	 assign reqs[i] = ~empty[i];
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

module top(clk, rst, push0, push1, flat_data_in0, flat_data_in1, quantums,
	   pop0, pop1, data_out0, data_out1);

   parameter NUM_REQS   =    `NUM_REQS,
	     WIDTH      =    `FIFO_DWIDTH,
	     DEPTH      =    `FIFO_DEPTH,
	     QWID       =    `ARB_QWID;

   input 		      clk, rst;
   input [NUM_REQS-1:0]       push0, push1;
   
   input [NUM_REQS*QWID-1:0]  quantums;
   input [NUM_REQS*WIDTH-1:0] flat_data_in0, flat_data_in1;

   output [NUM_REQS-1:0]      pop0, pop1;
   output [WIDTH-1:0] 	      data_out0, data_out1;



   // assuming quantums are stable -- this is the regular use-case
   assume property (@(posedge clk) $stable(quantums));

   arbitrated_fifos

     #(.NUM_REQS(NUM_REQS),
       .WIDTH(WIDTH),
       .DEPTH(DEPTH),
       .QWID(QWID))

   af0 (.clk(clk),
	.rst(rst),
	.push(push0),
	.gnt(pop0),
	.flat_data_in(flat_data_in0),
	.quantums(quantums),
	.data_out(data_out0));

   arbitrated_fifos

     #(.NUM_REQS(NUM_REQS),
       .WIDTH(WIDTH),
       .DEPTH(DEPTH),
       .QWID(QWID))

   af1 (.clk(clk),
	.rst(rst),
	.push(push1),
	.gnt(pop1),
	.flat_data_in(flat_data_in1),
	.quantums(quantums),
	.data_out(data_out1));

endmodule // top
