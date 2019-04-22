`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, push, pop, push_sel, pop_sel, data_in,
           // dummy inputs
           free_tail_ptr, head0, next_head0, idx,
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
   input [PTR_WIDTH-1:0]           free_tail_ptr, head0, next_head0, idx; // will be constrained by CoSA
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

   // maybe it would help to track head and tail separately?
   // right now it can be written to twice in same cycle (because tail and head are updated)
   // always @(posedge clk) begin
   //    if (srpush) begin
   //       sr_to_ll[idx] <= free_tail_ptr;
   //       ll_to_sr[free_tail_ptr] <= idx;
   //    end
   //    if (srpop | (srpush & srempty)) begin
   //       sr_to_ll[0] <= next_head0;
   //       ll_to_sr[next_head0] <= 0;
   //    end
   // end

   // always @(posedge clk) begin
   //    if (srpush) begin
   //       if (srempty | srpop) begin
   //          sr_to_ll[0] <= next_head0;
   //       end
   //       else begin
   //          sr_to_ll[idx] <= free_tail_ptr;
   //       end
   //    end
   //    else if (srpop) begin
   //       sr_to_ll[0] <= next_head0;
   //    end
   // end // always @ (posedge clk)

   // downward refinement is abstract to detailed (shift register fifo is our 'abstract' spec)
   always @(posedge clk) begin : downward_refinement_mapping
      // If we only have the first case, this works if we just care about the head
      //   something about tracking the tail as well makes this more complicated
      if (srpop | (srpush & srempty)) begin
         sr_to_ll[0] <= next_head0;
         ll_to_sr[next_head0] <= 0;
      end
      // conditions on idx and free_tail_ptr are redundant but helps the inductive proof
      // they're basically lemmas built into the history var update
      // TODO : see if these extra conditions are necessary once we have the full mapping?
      if (srpush & !srempty & (idx != 0) & (free_tail_ptr != head0) & (free_tail_ptr != next_head0)) begin
         sr_to_ll[idx] <= free_tail_ptr;
         ll_to_sr[free_tail_ptr] <= idx;
      end
   end

   assign sr_result = sr_to_ll[idx];
   assign ll_result = ll_to_sr[free_tail_ptr];

endmodule // top
