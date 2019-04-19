`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, push, pop, push_sel, pop_sel, data_in,
           empty, full, data_out,
           srempty, srfull, srdata_out);
   parameter WIDTH=8,
             DEPTH=4,
             NUM_FIFOS=2,
             FIFO_SEL=0,
             SEL_WIDTH=$clog2(NUM_FIFOS),
             ADDR_WIDTH=$clog2(NUM_FIFOS+1);

   input                           clk, rst, push, pop;
   input [SEL_WIDTH-1:0]           push_sel, pop_sel;
   input [WIDTH-1:0]               data_in;
   output                          full;
   output [NUM_FIFOS-1:0]          empty;
   output [WIDTH-1:0]              data_out;
   output                          srempty, srfull;
   output [WIDTH-1:0]              srdata_out;

   wire                            data_out_vld;

   // push and pop to shift register fifo when shared fifo is
   // performing the same action on the tracked fifo
   (* keep *)
   wire                            srpush, srpop;
   assign srpush = push & (push_sel == FIFO_SEL);
   assign srpop = pop & (pop_sel == FIFO_SEL);

   // environmental assumptions
   generate
      genvar i;
      for(i=0; i < NUM_FIFOS; i=i+1) begin
         always @* begin
            assume(~empty[i] | ~(pop & (pop_sel == i)));
            assume(~full | ~(push & (push_sel == i)));
         end
      end
   endgenerate

   // end assumptions

   (* keep *)
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

   (* keep *)
   shift_register_fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH))
   sr (.clk(clk),
       .rst(rst),
       .data_in(data_in),
       .push(srpush),
       .pop(srpop),
       .empty(srempty),
       .full(srfull),
       .data_out(srdata_out));

endmodule // top
