`define ARBITRATED_FIFOS

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef DWRR
 `include "DWRR.sv"
`endif

`ifndef ONEHOT_MUX
 `include "onehot_mux.v"
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


   onehot_mux
     #(.CHANNELS(NUM_REQS),
       .WIDTH(WIDTH))
     om(.onehot(gnt),
        .i_data(flat_data_in),
        .o_data(data_out));

endmodule
