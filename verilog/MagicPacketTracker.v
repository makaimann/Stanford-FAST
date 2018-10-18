`define MAGICPACKETTRACKER

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

  FF #(.WIDTH(CNTWID)) ff_cnt (.rst(rst),
			       .clk(clk),
                               .en(push | pop | rst | captured),
                               .D(next_cnt),
                               .Q(cnt));

  //************ Intermediate Signal **************//
  wire [CNTWID-1:0] ssa_cnt;

  assign ssa_cnt =  cnt + {{(CNTWID-1){1'b0}}, ((cnt != DEPTH) & push & ~captured)};


  //************ Compute Next Value ***************//
  // Using Single Static Assignment.
  // Increments/Decrements until magic packet captured
  // Then only decrements until magic packet exits
  // Behavior after exit is undefined/unimportant
  assign next_cnt = rst ? {CNTWID{1'b0}} : ssa_cnt - {{(CNTWID-1){1'b0}}, ((ssa_cnt != 0) & pop)};

endmodule
