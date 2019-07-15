`define FORMAL

`ifndef OPTIONS
`include "options.v"
`endif

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, start, push, data_in, pop,
           empty, full, data_out, prop_signal);

   parameter WIDTH      =    `FIFO_DWIDTH,
             DEPTH      =    2*`FIFO_DEPTH,
             QWID       =    `ARB_QWID;

   input                       clk, rst, start;
   input                       push;
   input [1:0]                 pop;
   input [WIDTH-1:0]           data_in;
   output [1:0]                empty, full;
   output [WIDTH-1:0]          data_out;
   output                      prop_signal;

   (* keep *)
   wire                        data_out_vld;

   (* keep *)
   wire [WIDTH-1:0]            intm_data;

   fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH/2))
   f0 (.clk(clk),
	     .rst(rst),
	     .push(push[0]),
	     .pop(pop[0]),
       .data_in(data_in),
       .empty(empty[0]),
       .full(full[0]),
	     .data_out(intm_data));

   fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH/2))
   f1 (.clk(clk),
	    .rst(rst),
	    .push(pop[0]), // gets value as soon as other fifo pops
	    .pop(pop[1]),
      .data_in(intm_data),
      .empty(empty[1]),
      .full(full[1]),
	    .data_out(data_out));

   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))

   sb (.clk(clk),
       .rst(rst),
       .push(push[0]),
       .pop(pop[1]),
       .start(start),
       .data_in(data_in),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));

`ifdef FORMAL
   // assumptions
   reg                         initstate = 1;

   always @(posedge clk) begin
      initstate <= 0;
   end

   always @* begin
      assume(rst == initstate);
      assume(!push[0] || !full[0]);
      // can't push to second fifo (pop from first) when it's full
      assume(!pop[0] || !full[1]);
      assume(!pop[0] || !empty[0]);
      assume(!pop[1] || !empty[1]);
   end

   // assertion
   always @(posedge clk) begin
      if (!initstate) begin
         assert(prop_signal);
      end
   end
`endif

endmodule // fifo_top
