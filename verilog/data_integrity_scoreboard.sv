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
  parameter CNTWID = $clog2(DEPTH);

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


module DataIntegritySB(clk, rst, push, pop, start, data_in,
                       data_out_vld, prop_signal
                      );
  parameter DEPTH = 8;
  parameter WIDTH = 8;
  parameter CNTWID = $clog2(DEPTH);

  input wire             clk;
  input wire             rst;
  input wire             push;
  input wire             pop;
  input wire             start;
  input wire [WIDTH-1:0] data_in;

  output wire data_out_vld;
  output wire prop_signal;


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
                                           .push(push),
                                           .pop(pop),
                                           .captured(en),
                                           .cnt(cnt),
                                           .next_cnt(next_cnt)
	     				  );

  wire [WIDTH-1:0] magic_packet;

  FF #(.WIDTH(WIDTH)) ff_magic_packet (.clk(clk),
                                       .en(start & push & ~en),
                                       .D(data_in),
                                       .Q(magic_packet));

  wire             full;
  wire             empty;
  wire [WIDTH-1:0] data_out;

  FIFO #(.WIDTH(WIDTH), .DEPTH(DEPTH)) f (.clk(clk),
                                          .rst(rst),
                                          .push(push),
                                          .pop(pop),
                                          .data_in(data_in),
                                          .full(full),
                                          .empty(empty),
                                          .data_out(data_out));

/*  `ifdef ARBITER
    DWRR #(.NUM_REQS(NUM_REQS), .QWID(QWID), .PSIZE(WIDTH)) arb (.clk(clk),
								 .rst(rst),
								 .blk(1'b0), //TODO incorporate blk
								 .reqs(),
								 .input_quantums(quantums),
								 .gnt(gnt));


  `endif*/



  assign data_out_vld = en & (cnt > 0) & (next_cnt == 0); //There was at least one packet stored, and now it's exiting

   // used in data_integrity.smtc
  wire 	   prop_signal;
  assign prop_signal = ~data_out_vld | (magic_packet == data_out);

endmodule
