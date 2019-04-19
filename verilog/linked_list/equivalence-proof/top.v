`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, push, pop, push_sel, pop_sel, data_in,
           // dummy inputs
           free_tail_ptr, next_head, idx,
           // outputs
           empty, full, data_out,
           srempty, srfull, srdata_out);
   parameter WIDTH=8,
             DEPTH=4,
             NUM_FIFOS=2,
             FIFO_SEL=0,
             PTR_WIDTH=$clog2(DEPTH),
             SEL_WIDTH=$clog2(NUM_FIFOS),
             ADDR_WIDTH=$clog2(NUM_FIFOS+1);

   input                           clk, rst, push, pop;
   input [SEL_WIDTH-1:0]           push_sel, pop_sel;
   input [WIDTH-1:0]               data_in;
   input [PTR_WIDTH-1:0]           free_tail_ptr, next_head, idx; // will be constrained by CoSA
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

   // history variables
   (* keep *)
   reg [PTR_WIDTH-1:0] sr_to_ll [DEPTH-1:0];
   (* keep *)
   reg [PTR_WIDTH-1:0] ll_to_sr [DEPTH-1:0];

   (* keep *)
   wire [PTR_WIDTH-1:0] sr_result;
   (* keep *)
   wire [PTR_WIDTH-1:0] ll_result;

   always @(posedge clk) begin
      if (srpush) begin
         sr_to_ll[idx] <= free_tail_ptr;
         ll_to_sr[free_tail_ptr] <= idx;
      end
      if (srpop) begin
         // idx will never be zero when this happens because of environmental constraints
         // not sure if yosys will synthesize this nicely though
         sr_to_ll[0] <= next_head;
         ll_to_sr[next_head] <= 0;
      end
   end

   assign sr_result = sr_to_ll[idx];
   assign ll_result = ll_to_sr[free_tail_ptr];

endmodule // top
