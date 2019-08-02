`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

`define FORMAL

module credit_fifo_top(clk, rst, start, push, data_in, pop, credit_return,
           empty, full, data_out, prop_signal);

   parameter WIDTH            =    `FIFO_DWIDTH,
        	   DEPTH            =    `FIFO_DEPTH,
             QWID             =    `ARB_QWID,
             DOWNSTREAM_DEPTH =    `FIFO_DEPTH;

   input                       clk, rst, start, push, pop, credit_return;
   input [WIDTH-1:0]           data_in;
   output                      empty;
   output                      full;
   output [WIDTH-1:0]          data_out;
   output                      prop_signal;

   (* keep *)
   wire                        data_out_vld;

   (* keep *)
   wire                        has_credits;

   (* keep *)
   wire                        qual_pop;
   assign qual_pop             = pop & has_credits & !empty;

   credit_counter
     #(.CREDITS_MAX(DOWNSTREAM_DEPTH))
   cc (.clk(clk),
       .rst(rst),
       .inc(credit_return),
       .dec(qual_pop),
       .has_credits(has_credits));

   fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH))
   f (.clk(clk),
	    .rst(rst),
	    .push(push),
	    .pop(qual_pop),
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
       .pop(qual_pop),
       .start(start),
       .data_in(data_in),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));

`ifdef FORMAL
   reg                         initstate = 1'b1;
   always @(posedge clk) begin
      initstate <= 1'b0;
   end

   always @* begin
      assume(!full || !push);
      assume(rst == initstate);
      if (!initstate)
        assert (prop_signal);
   end
`endif

endmodule // fifo_top
