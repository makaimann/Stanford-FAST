`ifndef UTILS
 `include "utils.sv"
`endif

module z_sum(clk, rst, en, in0,
		   out);
   parameter WIDTH = 8;

   input wire clk;
   input wire rst;
   input wire en;

   input  [WIDTH-1:0] in0;

   output [WIDTH-1:0] out;

   wire [WIDTH-1:0]   rst_in0;
   wire   [WIDTH-1:0] z_in0;
   wire   [WIDTH-1:0] z_in0_2;   

   assign rst_in0 = rst ? 0 : in0;
   
   FF #(.WIDTH(WIDTH)) f1 (.clk(clk),
			   .en(en),
			   .D(rst_in0),
			   .Q(z_in0));

   FF #(.WIDTH(WIDTH)) f2 (.clk(clk),
			   .en(en),
			   .D(rst_in0),
			   .Q(z_in0_2));


   assign out = z_in0 + z_in0_2;

`ifdef FORMAL
   initial begin
      assume (rst);
   end

   always @* begin
      if (!$initstate) begin
	 assume (!rst);
	 assert (out[0:0] == 1'b0);
         `ifdef FPROP
	 assert (out == 'd5); 
         `endif
      end
   end
   
`endif
   
endmodule
