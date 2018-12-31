`ifndef FF
 `include "FF.v"
`endif

`ifndef MAGICPACKETTRACKER
 `include "MagicPacketTracker.v"
`endif

`define SIMPLE_SCOREBOARD

  module SimpleScoreboard(clk, rst, push, pop, start, data_in, data_out,
                          data_out_vld, prop_signal);
   parameter DEPTH  = 8,
             WIDTH  = 8,
             CNTWID = $clog2(DEPTH) + 1;

   input wire                                clk;
   input wire                                rst;
   input wire                                push;
   input wire                                pop;
   input wire                                start;
   // data inflow to DUT
   input wire [WIDTH-1:0]                    data_in;
   // data outflow from DUT
   input wire [WIDTH-1:0]                    data_out;

   output wire                               data_out_vld;
   output wire                               prop_signal;

   wire                                      en;
   wire                                      next_en;

   wire [CNTWID-1:0]                         cnt;
   wire [CNTWID-1:0]                         next_cnt;

   wire [WIDTH-1:0]                          magic_packet;


  assign next_en = en | (start & push);

  FF #(.WIDTH(1)) ff_en (.rst(rst),
			                   .clk(clk),
                         .en(~en), // only need to update once
                         .D(next_en),
                         .Q(en));

  MagicPacketTracker #(.DEPTH(DEPTH)) mpt (.clk(clk),
                                           .rst(rst),
                                           .push(push),
                                           .pop(pop),
                                           .captured(en),
                                           .cnt(cnt),
                                           .next_cnt(next_cnt)
	     				                             );

  FF #(.WIDTH(WIDTH)) ff_magic_packet (.rst(rst),
				                               .clk(clk),
                                       .en(start & push & ~en),
                                       .D(data_in),
                                       .Q(magic_packet));

  // There was at least one packet stored, and now it's exiting
  assign data_out_vld = en & (cnt != 0) & (next_cnt == 0);

  assign prop_signal = ~data_out_vld | (magic_packet == data_out);

endmodule
