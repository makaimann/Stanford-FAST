`define PRIDEC

module pridec(vec,
	          out_vec);
   parameter WIDTH = 2;

   input wire  [WIDTH-1:0] vec;
   output wire [WIDTH-1:0] out_vec;

   assign out_vec[0] = vec[0];
   generate
      genvar               i;
      for(i=1; i < WIDTH; i=i+1) begin: gen_out
	     assign out_vec[i] = vec[i] & ~(|vec[i-1:0]);
      end
   endgenerate

endmodule // PRIDEC
