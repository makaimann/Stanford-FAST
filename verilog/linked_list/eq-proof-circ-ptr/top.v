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
   (* keep *)
   wire [1:0]                      fifo;
   (* keep *)
   wire [1:0]                      free_list;
   (* keep *)
   wire [1:0]                      phantom;

   assign depth = DEPTH;
   assign fifo = 2'b00;
   assign free_list = 2'b01;
   assign phantom = 2'b10;

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
   // back pointer
   (* keep *)
   reg [PTR_WIDTH+1:0] from_ll [DEPTH-1:0];

   // fifo tracker to linked list
   (* keep *)
   reg [PTR_WIDTH-1:0] cpf_to_ll [DEPTH-1:0];

   (* keep *)
   wire [PTR_WIDTH-1:0] cpf_result;

   always @(posedge clk) begin : history_vars
      if (!rst & cppush) begin
         cpf_to_ll[wrPtr[PTR_WIDTH-1:0]] <= free_tail_ptr;
      end
   end // block: history_vars

   assign cpf_result = cpf_to_ll[wrPtr-1];
   assign ll_result = ll_to_cpf[free_tail_ptr];

   // free list history variables
   reg [PTR_WIDTH:0]   free_list_wrPtrWrap;
   reg [PTR_WIDTH:0]   free_list_rdPtrWrap;
   (* keep *)
   wire [PTR_WIDTH-1:0] free_list_wrPtr;
   (* keep *)
   wire [PTR_WIDTH-1:0] free_list_rdPtr;
   assign free_list_wrPtr = free_list_wrPtrWrap;
   assign free_list_rdPtr = free_list_rdPtrWrap;

   (* keep *)
   wire [PTR_WIDTH:0]  free_list_count;
   assign free_list_count = free_list_wrPtrWrap - free_list_rdPtrWrap;

   always @(posedge clk) begin
      if (rst) begin
         // starts at maximum count
         free_list_wrPtrWrap <= DEPTH;
         free_list_rdPtrWrap <= 0;
      end
      else begin
         // these are opposite because push to free list when popping from others
         free_list_wrPtrWrap <= free_list_wrPtrWrap + pop;
         free_list_rdPtrWrap <= free_list_rdPtrWrap + push;
      end
   end

   (* keep *)
   reg [PTR_WIDTH-1:0] ptr_to_free_list [DEPTH-1:0];

   always @(posedge clk) begin : free_list_tracker_logic
      integer i;
      if (rst) begin
         for(i=0; i < DEPTH; i=i+1) begin
            ptr_to_free_list[i] <= i;
         end
      end
      else if (pop) begin
         ptr_to_free_list[free_list_wrPtr] <= popped_head;
      end
   end // block: free_list_tracker_logic

   (* keep *)
   wire [PTR_WIDTH-1:0] pfl_result;
   assign pfl_result = ptr_to_free_list[free_list_wrPtr];

   always @(posedge clk) begin : back_pointer
      integer j;
      if (rst) begin
         for(j=0; j < DEPTH; j=j+1) begin
            // mark all elements as belonging to the free list
            from_ll[j] <= {free_list, 2'b00} + j;
         end
      end
      else begin
         if (cppush) begin
            from_ll[free_tail_ptr] <= {fifo, wrPtr};
         end
         else if (push) begin
            // pushing to a different fifo
            from_ll[free_tail_ptr] <= {phantom, {(PTR_WIDTH-1){1'b0}}};
           end
         if (pop) begin
            from_ll[popped_head] <= {free_list, free_list_wrPtr};
         end
      end
      // end
   end // block: back_pointer

   // so yosys doesn't delete it
   (* keep *)
   wire [PTR_WIDTH+1:0] from_ll_result;
   assign from_ll_result = from_ll[wrPtr];

endmodule // top
