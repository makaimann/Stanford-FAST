// Code your design here
`define DESIGN

`ifndef OPTIONS
 `include "options.v"
`endif

`ifndef FF
 `include "FF.v"
`endif

`ifndef PRIDEC
 `include "pridec.sv"
`endif

`ifndef ONEHOT_MUX
 `include "onehot_mux.sv"
`endif

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef DWRR
 `include "DWRR.sv"
`endif

`ifndef MAGICPACKETTRACKER
 `include "MagicPacketTracker.v"
`endif

`ifdef ARBITER
// if using arbiter, pop signal is connected to arbiter gnt
module Scoreboard(clk, rst, push, start, flat_data_in, input_quantums,
                       data_out_vld, prop_signal);
`else
  module Scoreboard(clk, rst, push, pop, start, flat_data_in,
                       data_out_vld, prop_signal);
`endif

  parameter DEPTH = `FIFO_DEPTH;
  parameter WIDTH = `FIFO_DWIDTH;
  parameter QWID  = `ARB_QWID; // Quantum widths

`ifdef ARBITER
   parameter NUM_REQS = 4; // Number of requestors
   parameter NRBITS = $clog2(NUM_REQS);
   input wire [NUM_REQS*QWID-1:0]            input_quantums;
   wire [NUM_REQS-1:0]                 pop;

 `else
   parameter NUM_REQS = 1;
   input wire [NUM_REQS-1:0]          pop;
`endif

  parameter CNTWID = $clog2(DEPTH) + 1;

  input wire                                clk;
  input wire                                rst;
  input wire [NUM_REQS-1:0]                 push;
  input wire                                start;
  input wire [NUM_REQS*WIDTH-1:0]           flat_data_in;

  output wire                               data_out_vld;
  output wire                               prop_signal;

  wire [NUM_REQS-1:0]			    empty;
  wire [NUM_REQS-1:0]			    full;

  wire                              mp_push; //push for magic packet tracker
  wire                              mp_pop;  //pop for magic packet tracker
  wire [WIDTH-1:0]                  mp_data_in;

  wire [WIDTH-1:0] 	    data_in [NUM_REQS-1:0];
  generate
     genvar 		    i;

     for(i=0; i < NUM_REQS; i=i+1) begin : pack_data_in
	    assign data_in[i] = flat_data_in[(i+1)*WIDTH-1:i*WIDTH];
     end
  endgenerate



  wire en;
  wire next_en;

  assign next_en = en | (start & mp_push);

  FF #(.WIDTH(1)) ff_en (.rst(rst),
			             .clk(clk),
                         .en(~en), // only need to update once
                         .D(next_en),
                         .Q(en));

  wire [CNTWID-1:0] cnt;
  wire [CNTWID-1:0] next_cnt;

  MagicPacketTracker #(.DEPTH(DEPTH)) mpt (.clk(clk),
                                           .rst(rst),
                                           .push(mp_push),
                                           .pop(mp_pop),
                                           .captured(en),
                                           .cnt(cnt),
                                           .next_cnt(next_cnt)
	     				                   );

  wire [WIDTH-1:0] magic_packet;

  FF #(.WIDTH(WIDTH)) ff_magic_packet (.rst(rst),
				                       .clk(clk),
                                       .en(start & mp_push & ~en),
                                       .D(mp_data_in),
                                       .Q(magic_packet));

  wire [WIDTH-1:0] fifo_data_out [NUM_REQS-1:0];
  wire [WIDTH-1:0] data_out;

`ifdef ARBITER
   wire [NUM_REQS-1:0] reqs;
   wire [NUM_REQS-1:0] gnt;

   DWRR #(.NUM_REQS(NUM_REQS), .QWID(QWID), .PSIZE(WIDTH)) arb (.clk(clk),
								.rst(rst),
								.blk(1'b0), //TODO incorporate blk
								.reqs(reqs),
								.input_quantums(input_quantums),
								.gnt(gnt));
   generate
      for(i=0; i < NUM_REQS; i=i+1) begin : gen_fifos
	     fifo #(.WIDTH(WIDTH), .DEPTH(DEPTH)) f (.clk(clk),
						                         .rst(rst),
						                         .push(push[i]),
						                         .pop(pop[i]),
						                         .data_in(data_in[i]),
						                         .full(full[i]),
						                         .empty(empty[i]),
						                         .data_out(fifo_data_out[i]));
	     assign reqs[i] = ~empty[i]; // For now assuming every non-empty fifo is requesting
	     assign pop[i] = gnt[i];
      end
   endgenerate

 `ifdef TAGS
   // always_comb begin: arbiter_mux
   //    for(genvar i = 0; i < NUM_REQS; i++) begin
   //       assign data_out = gnt[i] ? fifo_data_out[i] : 'z;
   //       // tags
   //       assume property (@(posedge clk) (data_in[i][WIDTH-1:WIDTH-NRBITS] == i));
   //    end
   // end

   onehot_mux #(.inputs(NUM_REQS), .width(WIDTH)) mux (.out(data_out),
                                                       .in(fifo_data_out),
                                                       .sel(gnt));

   // tag packets
   for(genvar i = 0; i < NUM_REQS; i++) begin
      assume property ( @ (posedge clk) (data_in[i][WIDTH-1:WIDTH-NRBITS] == i));
   end

   assign mp_push = push[1];
   assign mp_pop = (data_out[WIDTH-1:WIDTH-NRBITS] == 1); // tag == 1
   assign mp_data_in = data_in[1];
 `else
   assign mp_push = push[1];
   assign mp_pop = pop[1];
   assign mp_data_in = data_in[1];
 `endif

`else // !`ifdef ARBITER
  fifo #(.WIDTH(WIDTH), .DEPTH(DEPTH)) f (.clk(clk),
                                          .rst(rst),
                                          .push(push),
                                          .pop(pop[0]),
                                          .data_in(data_in[0]),
                                          .full(full),
                                          .empty(empty),
                                          .data_out(fifo_data_out[0]));

   assign mp_push = push;
   assign mp_pop = pop;
   assign mp_data_in = data_in;
   assign data_out = fifo_data_out[0];
`endif



  assign data_out_vld = en & (cnt > 0) & (next_cnt == 0); //There was at least one packet stored, and now it's exiting

  // used in data_integrity.smtc
  wire 	       prop_push;
  wire         prop_pop;
  wire         prop_empty;
  wire         prop_full;

  assign prop_push = push[0];
  assign prop_pop = pop[0];
  assign prop_empty = empty[0];
  assign prop_full = full[0];


  assign prop_signal = ~data_out_vld | (magic_packet == data_out);

`ifdef FORMAL
 `ifdef SB_SANITY
   assert property ((cnt != 'd6) | (fifo_data_out[0] != 'd11) );
 `endif

   initial begin
      assume (rst);
      assume (!start);
   end

   always @* begin
      if (!$initstate) begin
         assume(!rst);
	     assume(!prop_empty | !prop_pop);
	     assume(!prop_full | !prop_push);
         assert(prop_signal);
      end
   end
`endif

endmodule
