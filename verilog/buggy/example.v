//`define POR
module example(clk, inc_x, inc_y);
   parameter WIDTH=6,
             NUM_ELEMS=2**WIDTH,
             DWIDTH=NUM_ELEMS;

   input                  clk, inc_x, inc_y;

   reg [WIDTH-1:0]        x = 0;
   reg [WIDTH-1:0]        y = 0;

   reg [DWIDTH-1:0]       valid = 0;
   reg [DWIDTH-1:0]       data = 1;
   reg [DWIDTH-1:0]       mem [NUM_ELEMS-1:0];

   (* keep *)
   wire                   en_x;
   assign en_x            = valid[x];

   always @(posedge clk) begin
      if (inc_x & en_x)
         x <= x + 1;
      if (inc_y) begin
         y <= y + 1;
         data <= (y+1 == 0) ? 1 : (data << 1);
         valid[y] <= 1'b1;
         mem[y] <= data;
      end
   end

`ifdef EN
   reg initstate = 1'b1;
   always @(posedge clk) begin
      initstate <= 1'b0;
      if (!initstate)
        assert property (!(!$past(inc_x) && $past(inc_y) && $past(en_x)) || en_x);
   end
`else
   always @* begin
      assert ((mem[x] == (1 << x)) || ~valid[x]);
   end
`endif

endmodule // deep_bug
