// prove that single fifo meets scoreboard property

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef SIMPLE_SCOREBOARD_MODIFIED
 `include "SimpleScoreboardModified.sv"
`endif

module fifo_top(clk, rst, start, push, data_in, pop,
                empty, full, data_out, prop_signal);

   parameter WIDTH      =    `FIFO_DWIDTH,
        	   DEPTH      =    `FIFO_DEPTH,
             QWID       =    `ARB_QWID;

   input                       clk, rst, start, push, pop;
   input [WIDTH-1:0]           data_in;
   output                      empty;
   output                      full;
   output [WIDTH-1:0]          data_out;
   output                      prop_signal;

   (* keep *)
   wire                        data_out_vld;

   (* keep *)
   wire                        en_prop;

   fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH))
   f (.clk(clk),
	    .rst(rst),
	    .push(push),
	    .pop(pop),
      .data_in(data_in),
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
       .empty_ref(empty),
       .full_ref(full),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .en_prop(en_prop),
       .prop_signal(prop_signal));

`ifdef FORMAL
   // assumptions
   reg                         initstate = 1;

   always @(posedge clk) begin
      initstate <= 0;
   end

   always @* begin
      assume(rst == initstate);
      assume(!push || !full);
      assume(!pop || !empty);
   end

   // assertion
   always @(posedge clk) begin
      if (!initstate) begin
         assert(prop_signal);
         assert(en_prop);
      end
   end

`endif

endmodule // fifo_top
