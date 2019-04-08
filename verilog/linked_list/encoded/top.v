`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, start, push, pop, push_sel, pop_sel, data_in,
           empty, full, data_out, prop_signal);
   parameter WIDTH=8,
             DEPTH=4,
             NUM_FIFOS=2,
             FIFO_SEL=0,
             SEL_WIDTH=$clog2(NUM_FIFOS),
             ADDR_WIDTH=$clog2(NUM_FIFOS+1);

   input                           clk, rst, start, push, pop;
   input [SEL_WIDTH-1:0]           push_sel, pop_sel;
   input [WIDTH-1:0]               data_in;
   output                          full, prop_signal;
   output [NUM_FIFOS-1:0]          empty;
   output [WIDTH-1:0]              data_out;

   wire                            data_out_vld;

   generate
      genvar i;
      for(i=0; i < NUM_FIFOS; i=i+1) begin
         always @* begin
            assume(~empty[i] | ~pop[i]);
            assume(~full | ~push[i]);
         end
      end
   endgenerate

   // end assumptions

   linked_list_fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH),
       .NUM_FIFOS(NUM_FIFOS))
     shared_fifo (.clk(clk),
                  .rst(rst),
                  .push(push),
                  .pop(pop),
                  .push_sel(push_sel),
                  .pop_sel(pop_sel),
                  .data_in(data_in),
                  .full(full),
                  .empty(empty),
                  .data_out(data_out));

   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))
   sb (.clk(clk),
       .rst(rst),
       .push(push & (push_sel == FIFO_SEL)),
       .pop(pop & (pop_sel == FIFO_SEL)),
       .start(start),
       .data_in(data_in),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));


endmodule // top
