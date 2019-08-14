`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

`define FORMAL
module shift_register_top(clk, rst, start, push, pop, data_in,
                          empty, full, data_out, prop_signal);
   parameter WIDTH=`WIDTH,
             DEPTH=`DEPTH;

   input                           clk, rst, start, push, pop;
   input [WIDTH-1:0]               data_in;
   output                          empty, full, prop_signal;
   output [WIDTH-1:0]              data_out;

   wire                            data_out_vld;

   always @* begin : environmental_constraints
      assume (~empty | ~pop);
      assume (~full | ~push);
   end

   shift_register_fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH))
   dut(.clk(clk),
       .rst(rst),
       .data_in(data_in),
       .push(push),
       .pop(pop),
       .empty(empty),
       .full(full),
       .data_out(data_out));

   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))
   sb (.clk(clk),
       .rst(rst),
       .push(push),
       .pop(pop),
       .start(start),
       .data_in(data_in),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));

   `ifdef FORMAL
   reg initstate = 1'b1;

   always @(posedge clk) begin
      initstate <= 1'b0;
   end

   always @*begin
      reset: assume(initstate == rst);
      if (!initstate)
        data_integrity: assert(prop_signal);
   end
   `endif

endmodule // top
