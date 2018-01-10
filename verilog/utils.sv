`define UTILS

module FF(clk, en, D, Q);
  parameter WIDTH = 1;
  
  input wire                clk;
  input wire                en;
  input wire   [WIDTH-1:0]  D;
  output reg   [WIDTH-1:0]  Q = 'd0;
  
  always @ (posedge clk) begin
    if(en) begin
      Q <= D;
    end
  end
endmodule
