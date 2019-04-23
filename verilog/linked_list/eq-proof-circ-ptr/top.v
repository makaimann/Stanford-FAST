`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, push, pop, push_sel, pop_sel, data_in,
           // dummy inputs
           free_tail_ptr, popped_head, rdPtr, wrPtr,
           // outputs
           empty, full, data_out,
           cpempty, cpfull, cpdata_out);
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
   input [PTR_WIDTH-1:0]           free_tail_ptr, popped_head, rdPtr, wrPtr; // will be constrained by CoSA
   output                          full;
   output [NUM_FIFOS-1:0]          empty;
   output [WIDTH-1:0]              data_out;
   output                          cpempty, cpfull;
   output [WIDTH-1:0]              cpdata_out;

   wire                            data_out_vld;

   // just for CoSA properties
   (* keep *)
   wire [PTR_WIDTH:0]              depth;
   assign depth = DEPTH;

   // push and pop to shift register fifo when shared fifo is
   // performing the same action on the tracked fifo
   (* keep *)
   wire                            cppush, cppop;
   assign cppush = push & (push_sel == FIFO_SEL);
   assign cppop = pop & (pop_sel == FIFO_SEL);

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
   circular_pointer_fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH))
   cpf (.clk(clk),
       .rst(rst),
       .data_in(data_in),
       .push(cppush),
       .pop(cppop),
       .empty(cpempty),
       .full(cpfull),
       .data_out(cpdata_out));

   // history variables
   (* keep *)
   reg [PTR_WIDTH-1:0] cpf_to_ll [DEPTH-1:0];
   (* keep *)
   reg [PTR_WIDTH-1:0] ll_to_cpf [DEPTH-1:0];

   (* keep *)
   wire [PTR_WIDTH-1:0] cpf_result;
   (* keep *)
   wire [PTR_WIDTH-1:0] ll_result;

   always @(posedge clk) begin : history_vars
      if (!rst & cppush) begin
         cpf_to_ll[wrPtr] <= free_tail_ptr;
         ll_to_cpf[free_tail_ptr] <= wrPtr;
      end
   end // block: history_vars

   assign cpf_result = cpf_to_ll[wrPtr-1];
   assign ll_result = ll_to_cpf[free_tail_ptr];

   // free list history variables
   (* keep *)
   reg [PTR_WIDTH:0]   free_list_wrPtr;
   (* keep *)
   reg [PTR_WIDTH:0]   free_list_rdPtr;
   (* keep *)
   wire [PTR_WIDTH:0]  free_list_count;
   assign free_list_count = (free_list_wrPtr + 1) - free_list_rdPtr;

   always @(posedge clk) begin
      if (rst) begin
         // starts at maximum count
         free_list_wrPtr <= (DEPTH-1);
         free_list_rdPtr <= 0;
      end
      else begin
         // these are opposite because push to free list when popping from others
         free_list_wrPtr <= free_list_wrPtr + pop;
         free_list_rdPtr <= free_list_rdPtr + push;
      end
   end

   (* keep *)
   reg [PTR_WIDTH-1:0] ptr_to_free_list [DEPTH-1:0];
   reg [PTR_WIDTH-1:0] free_list_to_ptr [DEPTH-1:0];

   always @(posedge clk) begin : free_list_tracker_logic
      integer i;
      if (rst) begin
         for(i=0; i < DEPTH; i=i+1) begin
            ptr_to_free_list[i] <= i;
            free_list_to_ptr[i] <= i;
         end
      end
      else if (cppop) begin
         ptr_to_free_list[free_list_wrPtr] <= popped_head;
         free_list_to_ptr[popped_head] <= free_list_wrPtr;
      end
   end
endmodule // top
