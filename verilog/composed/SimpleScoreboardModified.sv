`ifndef FF
 `include "FF.v"
`endif

`ifndef MAGICPACKETTRACKER
 `include "MagicPacketTracker.v"
`endif

`define SIMPLE_SCOREBOARD_MODIFIED

  module SimpleScoreboard(clk, rst, push, pop, start, data_in, data_out, empty_ref, full_ref,
                          packet_out, data_out_vld, en_prop, prop_signal);
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
   input wire                                empty_ref, full_ref;

   output wire [WIDTH-1:0]                   packet_out;
   output wire                               data_out_vld;
   output wire                               en_prop, prop_signal;

   (* keep *)
   wire                                      empty, full;

   wire                                      en;
   wire                                      next_en;

   wire                                      magic_packet_exited;
   wire                                      next_magic_packet_exited;

   wire [CNTWID-1:0]                         cnt;
   wire [CNTWID-1:0]                         next_cnt;

   wire [WIDTH-1:0]                          magic_packet;


  assign next_en = en | (start & push);

  FF #(.WIDTH(1)) ff_en (.rst(rst),
			                   .clk(clk),
                         .en(~en), // only need to update once
                         .D(next_en),
                         .Q(en));

  assign next_magic_packet_exited = data_out_vld | magic_packet_exited;
  FF #(.WIDTH(1)) ff_magic_packet_exited (.rst(rst),
                                          .clk(clk),
                                          .en(1'b1),
                                          .D(next_magic_packet_exited),
                                          .Q(magic_packet_exited));

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

  assign packet_out = magic_packet;

  // There was at least one packet stored, and now it's exiting
  assign data_out_vld = en & !magic_packet_exited & (cnt != 0) & (next_cnt == 0);

  // this is an approximation of empty -- it's not quite right
  always_comb begin
     if (!en) begin
        assume(empty == (cnt == 0));
        assume(full == (cnt == DEPTH));
     end
  end
  // assign empty = !en & (cnt == 0);
  // assign full = (cnt == DEPTH);

  assign en_prop = en | ((empty == empty_ref) && (full == full_ref));
  assign prop_signal = ~data_out_vld | (magic_packet == data_out);

endmodule
