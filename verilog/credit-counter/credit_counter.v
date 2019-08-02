`ifndef CREDIT_COUNTER
 `define CREDIT_COUNTER
`endif

// This module is a simple counter for credits
// It does not prevent over/underflow, instead it relies on the upstream environment
// to behave appropriately
module credit_counter(clk, rst, inc, dec, has_credits);
   parameter CREDITS_MAX=8,
             CNT_WIDTH=$clog2(CREDITS_MAX+1);

   input clk, rst, inc, dec;
   output has_credits;

   reg  [CNT_WIDTH-1:0] credits;

   always @(posedge clk) begin
      if (rst)
        credits <= 0;
      else
        credits <= credits + inc - dec;
   end

   assign has_credits = (credits > 0);

   always @* begin
      // assume the environment doesn't increment when credits are full
      assume((credits != CREDITS_MAX) || !inc);
   end

endmodule // credit_counter
