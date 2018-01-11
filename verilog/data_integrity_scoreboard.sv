`ifndef UTILS
 `include "utils.sv"
`endif

`ifndef FIFO
 `include "fifo.sv"
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
                       data_out_vld
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

  //************ Ensure you don't miss magic packet *****************//
  // goes high one cycle after data_out_vld and stays high
  wire missed_magic_packet;

  FF #(.WIDTH(1)) ff_missed_magic_packet (.clk(clk),
                                          .en(data_out_vld & ~missed_magic_packet),
                                          .D(data_out_vld), // could be 1'b1 because enable
                                          .Q(missed_magic_packet)
  					 );

  assign data_out_vld = en & & (cnt > 0) & (next_cnt == 0); //There was at least one packet stored, and now it's exiting

  `ifdef FORMAL

  	initial begin
   		assume (rst);
        assume (!start);
	end

	always @* begin
   	   if (!$initstate) begin
              assume(!rst);
	      assume(!empty | !pop);
	      assume(!full | !push);
              assert(~data_out_vld | missed_magic_packet | (magic_packet == data_out));
        end
    end

  `endif


endmodule
