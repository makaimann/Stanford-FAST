// Code your design here
`define DESIGN

`ifndef OPTIONS
 `include "options.sv"
`endif

`ifndef UTILS
 `include "utils.sv"
`endif

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef DWRR
 `include "DWRR.sv"
`endif

module MagicPacketTracker(clk, rst, push, pop, captured,
                          cnt, next_cnt);
  parameter DEPTH = 8;
  parameter CNTWID = $clog2(DEPTH) + 1;

  input wire clk;
  input wire rst;
  input wire push;
  input wire pop;
  input wire captured;

  output wire [CNTWID-1:0] cnt;
  output wire [CNTWID-1:0] next_cnt;

  FF #(.WIDTH(CNTWID)) ff_cnt (.clk(clk),
                               .en(push | pop | rst | captured),
                               .D(next_cnt),
                               .Q(cnt));

  //************ Intermediate Signal **************//
  wire [CNTWID-1:0] ssa_cnt;

  assign ssa_cnt = ((cnt < DEPTH) & push & ~captured) ? cnt + 1 :
                                                        cnt;

  //************ Compute Next Value ***************//
  // Using Single Static Assignment.
  // Increments/Decrements until magic packet captured
  // Then only decrements until magic packet exits
  // Behavior after exit is undefined/unimportant
  assign next_cnt = rst ? 0 :
                          ((ssa_cnt > 0) & pop) ? ssa_cnt - 1 :
                                                  ssa_cnt;

endmodule


`ifdef ARBITER
// if using arbiter, pop signal is connected to arbiter gnt
module Scoreboard(clk, rst, push, start, flat_data_in, input_quantums,
                       data_out_vld, prop_signal);
`else
  module Scoreboard(clk, rst, push, pop, start, flat_data_in,
                       data_out_vld, prop_signal);
`endif
  parameter DEPTH = 8;
  parameter WIDTH = 8;
  parameter QWID  = 8; // Quantum widths

  `ifdef ARBITER
   input wire [NUM_REQS*QWID-1:0]            input_quantums;
   parameter NUM_REQS = 4; // Number of requestors
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


  wire [WIDTH-1:0] 	    data_in [NUM_REQS-1:0];
  generate
     genvar 		    i;

     for(i=0; i < NUM_REQS; i=i+1) begin : pack_data_in
	    assign data_in[i] = flat_data_in[(i+1)*WIDTH-1:i*WIDTH];
     end
  endgenerate



  wire en;
  wire next_en;

  assign next_en = en | (start & push);

  FF #(.WIDTH(1)) ff_en (.clk(clk),
                         .en(~en), // only need to update once
                         .D(next_en),
                         .Q(en));

  wire [CNTWID-1:0] cnt;
  wire [CNTWID-1:0] next_cnt;

  MagicPacketTracker #(.DEPTH(DEPTH)) mpt (.clk(clk),
                                           .rst(rst),
                                           .push(push[0]),
                                           .pop(pop[0]),
                                           .captured(en),
                                           .cnt(cnt),
                                           .next_cnt(next_cnt)
	     				  );

  wire [WIDTH-1:0] magic_packet;

  FF #(.WIDTH(WIDTH)) ff_magic_packet (.clk(clk),
                                       .en(start & push[0] & ~en),
                                       .D(data_in[0]),
                                       .Q(magic_packet));

  wire [WIDTH-1:0] data_out [NUM_REQS-1:0];

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
	     FIFO #(.WIDTH(WIDTH), .DEPTH(DEPTH)) f (.clk(clk),
						                         .rst(rst),
						                         .push(push[i]),
						                         .pop(pop[i]),
						                         .data_in(data_in[i]),
						                         .full(full[i]),
						                         .empty(empty[i]),
						                         .data_out(data_out[i]));
	     assign reqs[i] = ~empty[i]; // For now assuming every non-empty fifo is requesting
	     assign pop[i] = gnt[i];
      end
   endgenerate

`else // !`ifdef ARBITER
  FIFO #(.WIDTH(WIDTH), .DEPTH(DEPTH)) f (.clk(clk),
                                          .rst(rst),
                                          .push(push),
                                          .pop(pop[0]),
                                          .data_in(data_in[0]),
                                          .full(full),
                                          .empty(empty),
                                          .data_out(data_out[0]));
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


  assign prop_signal = ~data_out_vld | (magic_packet == data_out[0]);

`ifdef FORMAL
 `ifdef SB_SANITY
   assert property ((cnt != 'd6) | (data_out[0] != 'd11) );
 `endif

   `ifdef EMBED
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
`endif

endmodule
