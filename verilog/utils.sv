`define UTILS

module FF(rst, clk, en, D, Q);
  parameter WIDTH = 1;
  parameter INIT  = 0;

  input wire                rst;
  input wire                clk;
  input wire                en;
  input wire   [WIDTH-1:0]  D;

  output reg   [WIDTH-1:0]  Q = INIT;

  always @ (posedge clk) begin
    if (rst) begin
       Q <= INIT;
    end
    else if(en) begin
      Q <= D;
    end
  end
endmodule

module PRIDEC(vec,
	      out_vec);
   parameter WIDTH = 2;

   input wire  [WIDTH-1:0] vec;
   output wire [WIDTH-1:0] out_vec;

   assign out_vec[0] = vec[0];
   generate
      genvar 		   i;
      for(i=1; i < WIDTH; i=i+1) begin
	 assign out_vec[i] = vec[i] & ~(|vec[i-1:0]);
      end
   endgenerate

endmodule // PRIDEC
