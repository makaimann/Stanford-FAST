`define LINKED_LIST
/**
  Author: Makai Mann
  Description: N linked lists with shared memory implementation in Standard Verilog
               -- provides a head and tail and interface for pushing/popping from N lists

  Interface:
    INPUTS
      clk    -- standard synchronous clock
      rst    -- standard active high reset
      push   -- zero or one-hot, selects a list to push onto tail
      pop    -- zero or one-hot, selects a list to pop from head
    OUTPUTS
      full     -- 1 if memory is used up
      empty    -- bit i is 1 if list 1 is empty
      head     -- packed version of the list heads
      tail     -- packed version of the list tails
      free_ptr -- next free pointer (equivalent to free_list_head)

   Parameters
      NUM_ELEMS  -- total number of elements
      NUM_LISTS  -- total number of lists

   Invariants and Notes
      * The number of elements should be greater than or equal to the number of lists
      * If the list is empty, the head and tail are meaningless
      * Behavior is undefined for push/pop having more than one bit set
      * next_ptr should start in a line, e.g. next_ptr[j] = j+1 (this is handled by rst)
      * maintains a free list of available nodes
 */
`ifndef ONEHOT_MUX
 `include "onehot_mux.v"
`endif

module linked_list(clk, rst, push, pop,
                   full, empty, free_ptr, popped_head);
   parameter NUM_ELEMS=4,
             NUM_LISTS=2,
             PTR_WIDTH=$clog2(NUM_ELEMS),
             CNT_WIDTH=PTR_WIDTH+1,
             ADDR_WIDTH=$clog2(NUM_LISTS+1);

   input                                   clk, rst;
   input [NUM_LISTS-1:0]                   push, pop;
   output                                  full;
   output [NUM_LISTS-1:0]                  empty;
   output [PTR_WIDTH-1:0]                  free_ptr;
   output [PTR_WIDTH-1:0]                  popped_head;

   reg [PTR_WIDTH-1:0]                     head_int [NUM_LISTS-1:0];
   reg [PTR_WIDTH-1:0]                     tail_int [NUM_LISTS-1:0];
   reg [PTR_WIDTH-1:0]                     next_ptr [NUM_ELEMS-1:0];
   reg [PTR_WIDTH-1:0]                     free_list_head;
   reg [PTR_WIDTH-1:0]                     free_list_tail;

   // counters
   reg [CNT_WIDTH-1:0]                     count [NUM_LISTS-1:0];
   reg [CNT_WIDTH-1:0]                     total_count;

   // aliases
   assign free_ptr = free_list_head;

   // select the popped head
   wire [ADDR_WIDTH*PTR_WIDTH-1:0]         packed_head;
   onehot_mux
     #(.CHANNELS(NUM_LISTS),
       .WIDTH(PTR_WIDTH))
   om (.onehot(pop),
       .i_data(packed_head),
       .o_data(popped_head));

   // unpack head and tail
   generate
      genvar                               i;
      for(i=0; i < NUM_LISTS; i=i+1) begin : unpack_arrays
         assign packed_head[PTR_WIDTH*i +: PTR_WIDTH] = head_int[i];
      end
   endgenerate

   // update count and assign empty
   generate
      genvar c;
      for(c=0; c < NUM_LISTS; c=c+1) begin : count_elements
         always @(posedge clk) begin
            if (rst)
              count[c] <= 0;
            else
              count[c] <= count[c] + push[c] - pop[c];
         end
         assign empty[c] = (count[c] == 0);
      end
   endgenerate

   // update total_count
   always @(posedge clk) begin
      if (rst)
        total_count <= 0;
      else
        total_count <= total_count + (|push) - (|pop);
   end
   assign full = (total_count == NUM_ELEMS);

   integer j;
   always @(posedge clk) begin : next_ptr_logic
      for(j=0; j < NUM_ELEMS; j=j+1) begin
	       if (rst) begin
	          if (j < NUM_ELEMS - 1) begin
	             next_ptr[j] <= j + 1;
	          end
	          else begin
	             next_ptr[j] <= 0;
	          end
	       end
	       else if (j < NUM_LISTS) begin
            if (push[j] & !empty[j]) begin
               // update the pointer at the tail to point to the next available
               //  pointer from the free list (e.g. popping from free list)
               next_ptr[tail_int[j]] <= free_list_head;
            end
            else if (pop[j]) begin
               // update the pointer for the free list
               next_ptr[head_int[j]] <= free_list_head;
            end
	       end // if (j < NUM_LISTS)
      end // for (j=0; j < NUM_ELEMS; j=j+1)
   end // block: next_ptr_logic

   always @(posedge clk) begin : head_logic
      for(j=0; j < NUM_LISTS; j=j+1) begin
         if (rst) begin
            head_int[j] <= 0;
         end
         else if (push[j] & empty[j]) begin
            // update head pointer because it was pointing to garbage when empty
            head_int[j] <= free_list_head;
         end
         else if (pop[j]) begin
            // update head pointer to the next element (forget about this location)
            head_int[j] <= (push[j] & (count[j] == 1)) ? free_list_head : next_ptr[head_int[j]];
         end
      end
   end // block: head_logic

   always @(posedge clk) begin : tail_logic
      for(j=0; j < NUM_LISTS; j=j+1) begin
         if (rst) begin
            tail_int[j] <= 0;
         end
         else if (push[j]) begin
            // take a pointer from the free list
            tail_int[j] <= free_list_head;
         end
      end
   end // block: tail_logic

   always @(posedge clk) begin : free_list_logic
      for (j=0; j < NUM_LISTS; j=j+1) begin
         if (rst) begin
            free_list_head <= 0;
            free_list_tail <= 0;
         end
         else if (push[j]) begin
            // pop the head pointer of the free list
            free_list_head <= next_ptr[free_list_head];
         end
         else if (pop[j]) begin
            // push the freed element to the tail of the free list
            free_list_tail <= head_int[j];
            if (full) begin
               // if the linked list is full, then the free list is empty
               // need to update the head too
               free_list_head <= head_int[j];
            end
         end
      end
   end // block: free_list_logic

   // Assumptions
   // commented out for non-SV support
   // assume($onehot(push));
   // assume($onehot(pop));

endmodule // linked_list
