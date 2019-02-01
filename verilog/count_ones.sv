`define COUNT_ONES

module count_ones(vec,
                  count);
   parameter WIDTH=32,
     CNTWIDTH=$clog2(WIDTH+1);

   input [WIDTH-1:0]         vec;
   output reg [CNTWIDTH-1:0] count;

   integer                   idx;
   always_comb begin
      count = {CNTWIDTH{1'b0}};
      for ( idx = 0; idx < WIDTH; idx = idx + 1) begin
         count = count + vec[idx];
      end
   end
endmodule // count_ones
