/**
   Author: Makai Mann
   Description: N fifos sharing the same memory, managed by linked lists of pointers.

   Interface:
     INPUTS
       clk      -- standard synchronous clock
       rst      -- standard synchronous active high reset
       push     -- enable for pushing to any fifo
       pop      -- enable popping from any fifo
       push_sel -- selects which fifo to push to when pushing
       pop_sel  -- selects which fifo to pop to when poping
       data_in  -- input data for a push
     OUTPUTS
       full     -- 1 if the memory is full
       empty    -- bit i is 1 if fifo i is empty
       data_out -- output data on a pop

    Parameters
      WIDTH     -- data width
      DEPTH     -- number of shared elements (can be all in one fifo or distributed)
      NUM_FIFOS -- number of fifos

    Invariants and Notes
      * data_out will always be driven but *can* be garbage if not popping
      * behavior is undefined for push/pop having more than one bit set
      * supports only pushing or popping one at a time
      * cannot push when full or pop from an empty fifo
 */

`ifndef LINKED_LIST
 `include "linked_list.v"
`endif

module linked_list_fifo(clk, rst, push, pop, push_sel, pop_sel, data_in,
                        full, empty, data_out);
   parameter WIDTH=8,
             DEPTH=4,
             NUM_FIFOS=2,
             PTR_WIDTH=$clog2(DEPTH),
             SEL_WIDTH=$clog2(NUM_FIFOS),
             ADDR_WIDTH=$clog2(NUM_FIFOS+1);

   input                           clk, rst, push, pop;
   input [SEL_WIDTH-1:0]           push_sel, pop_sel;
   input [WIDTH-1:0]               data_in;
   output                          full;
   output [NUM_FIFOS-1:0]          empty;
   output [WIDTH-1:0]              data_out;

   // storage
   reg [WIDTH-1:0]                 mem [DEPTH-1:0];

   // selected pop (read) address
   wire [PTR_WIDTH-1:0]            pop_addr;

   // wires to linked_list state
  wire [PTR_WIDTH-1:0]            free_ptr;
  wire [PTR_WIDTH-1:0]            popped_head;

   // instantiate the linked list
   linked_list
     #(.NUM_ELEMS(DEPTH),
       .NUM_LISTS(NUM_FIFOS))
   ll (.clk(clk),
       .rst(rst),
       .push(push),
       .pop(pop),
       .push_sel(push_sel),
       .pop_sel(pop_sel),
       .full(full),
       .empty(empty),
       .free_ptr(free_ptr),
       .popped_head(popped_head));

   // manage the memory
   always @(posedge clk) begin
      if (|push) begin
         mem[free_ptr] <= data_in;
      end
   end

   // read from that address in memory
   assign data_out = mem[popped_head];

endmodule // linked_list_fifo
