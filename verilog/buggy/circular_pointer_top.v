
`define FORMAL
module circular_pointer_top(clk, rst, start, push, data_in, pop,
           empty, full, data_out, prop_signal);

   parameter WIDTH      =    `WIDTH,
             DEPTH      =    `DEPTH;

   input                       clk, rst, start, push, pop;
   input [WIDTH-1:0]           data_in;
   output                      empty;
   output                      full;
   output [WIDTH-1:0]          data_out;
   output                      prop_signal;

   (* keep *)
   wire                        data_out_vld;


   circular_pointer_fifo
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
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));

`ifdef FORMAL
   reg                         initstate = 1'b1;
   always @(posedge clk) begin
      initstate <= 1'b0;
   end

   always @* begin
      assume(rst == initstate);
      if (!initstate)
        assert(prop_signal);
   end
`endif

endmodule // fifo_top
