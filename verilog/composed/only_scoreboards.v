`define FORMAL

// thoughts
// empty from scoreboard is just an approximation
// might be better to just remove it
// invariant: scoreboard.empty -> fifo.empty, but not the other way

`ifndef OPTIONS
`include "options.v"
`endif

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef SIMPLE_SCOREBOARD_MODIFIED
 `include "SimpleScoreboardModified.sv"
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
   input [1:0]                empty, full;

   output [WIDTH-1:0]          data_out;
   output                      prop_signal;

   (* keep *)
   wire                        data_out_vld0;
   (* keep *)
   wire                        data_out_vld1;
   (* keep *)
   wire                        data_out_vld;

   (* keep *)
   wire                        en_prop0, en_prop1;

   (* keep *)
   wire [WIDTH-1:0]            packet_out0;
   (* keep *)
   wire [WIDTH-1:0]            packet_out;

   wire                        prop_signal0;
   wire                        prop_signal1;

   fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH/2))
   f0 (.clk(clk),
	     .rst(rst),
	     .push(push[0]),
	     .pop(pop[0]),
       //      .data_in(data_in),
       // .empty(empty[0]),
       // .full(full[0]),
       //	    .data_out(packet_out0)
       );

   SimpleScoreboard
     #(.DEPTH(DEPTH/2),
       .WIDTH(WIDTH))
   sb0 (.clk(clk),
       .rst(rst),
       .push(push[0]),
       .pop(pop[0]),
       .start(start),
       .data_in(data_in),
       .data_out(packet_out0),
       .empty_ref(empty[0]),
       .full_ref(full[0]),
       .packet_out(packet_out0),
       .data_out_vld(data_out_vld0),
       .en_prop(en_prop0),
       .prop_signal(prop_signal0));

   always @* begin
      assume(en_prop0);
      assume(prop_signal0);
   end

   fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH/2))
   f1 (.clk(clk),
	     .rst(rst),
	     .push(pop[0]),
	     .pop(pop[1]),
       //       .data_in(packet_out0),
       // .empty(empty[1]),
       // .full(full[1]),
       //	     .data_out(data_out)
       );

   SimpleScoreboard
     #(.DEPTH(DEPTH/2),
       .WIDTH(WIDTH))
   sb1 (.clk(clk),
        .rst(rst),
        .push(pop[0]),
        .pop(pop[1]),
        .start(data_out_vld0),
        .data_in(packet_out0),
        .data_out(data_out),
        .empty_ref(empty[1]),
        .full_ref(full[1]),
        .packet_out(data_out),
        .data_out_vld(data_out_vld1),
        .en_prop(en_prop1),
        .prop_signal(prop_signal1));

   always @* begin
      assume(en_prop1);
      assume(prop_signal1);
   end

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
