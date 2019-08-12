// Based on: http://fpgacpu.ca/fpga/priority.html
// Which it self is based on Hacker's Delight

// Simple priority arbiter.
// Returns the LSB set, where bit 0 has highest priority

module Priority_Arbiter(requests, grant);
   parameter WIDTH = 2;

   input wire [WIDTH-1:0] requests;
   output reg [WIDTH-1:0] grant = 0;

   always @(*) begin
      grant = requests & -requests;
   end

endmodule
