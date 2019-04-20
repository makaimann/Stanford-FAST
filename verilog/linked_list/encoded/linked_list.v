`define LINKED_LIST
/**
 Author: Makai Mann
 Description: N linked lists with shared memory implementation in Standard Verilog
 -- provides a head and tail and interface for pushing/popping from N lists

 Interface:
 INPUTS
 clk      -- standard synchronous clock
 rst      -- standard active high reset
 push     -- push enable signal
 pop      -- pop enable signal
 push_sel -- which list to push to when pushing
 pop_sel  -- which list to pop to when poping
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
// idea: use shadow state telling whether each entry of next_ptr is garbage or not
//       or just use shadow state to track all the lists explicitly with a list data type
module linked_list(clk, rst, push, pop, push_sel, pop_sel,
                   full, empty, free_ptr, popped_head);
   parameter NUM_ELEMS=4,
	       NUM_LISTS=2,
	       PTR_WIDTH=$clog2(NUM_ELEMS),
	       CNT_WIDTH=PTR_WIDTH+1,
	       SEL_WIDTH=$clog2(NUM_LISTS),
	       ADDR_WIDTH=$clog2(NUM_LISTS+1);

   input                                   clk, rst, push, pop;
   input [SEL_WIDTH-1:0]                   push_sel, pop_sel;
   output                                  full;
   output [NUM_LISTS-1:0]                  empty;
   output [PTR_WIDTH-1:0]                  free_ptr;
   output [PTR_WIDTH-1:0]                  popped_head;

   reg [PTR_WIDTH-1:0]                     head [NUM_LISTS-1:0];
   reg [PTR_WIDTH-1:0]                     tail [NUM_LISTS-1:0];
   reg [PTR_WIDTH-1:0]                     next_ptr [NUM_ELEMS-1:0];
   reg [PTR_WIDTH-1:0]                     free_list_head;
   reg [PTR_WIDTH-1:0]                     free_list_tail;

   // counters
   reg [CNT_WIDTH-1:0]                     count [NUM_LISTS-1:0];
   reg [CNT_WIDTH-1:0]                     total_count;

   // aliases
   assign free_ptr = free_list_head;

   // select the popped head
   assign popped_head = head[pop_sel];

   // update count and assign empty
   generate
      genvar                               c;
      for(c=0; c < NUM_LISTS; c=c+1) begin : count_elements
         always @(posedge clk) begin
            if (rst)
              count[c] <= 0;
            else
              count[c] <= count[c] + (push & (push_sel == c)) - (pop & (pop_sel == c));
         end
         assign empty[c] = (count[c] == 0);
      end
   endgenerate

   // update total_count
   always @(posedge clk) begin
      if (rst)
        total_count <= 0;
      else
        total_count <= total_count + push - pop;
   end
   assign full = (total_count == NUM_ELEMS);

   // manage the pointer memory
   always @(posedge clk) begin : next_ptr_logic
      // could just not handle the reset case?
      integer j;
      if (rst) begin
         for(j=0; j < NUM_ELEMS; j=j+1) begin
            if (j < NUM_ELEMS - 1) begin
               next_ptr[j] <= j + 1;
            end
            else begin
               next_ptr[j] <= 0;
            end
         end
      end
      else begin
         if (push & !empty[push_sel]) begin
            // update the pointer at the tail to point to the next available
            //  pointer from the free list (e.g. popping from free list)
            next_ptr[tail[push_sel]] <= free_list_head;
         end
         if (pop & !full) begin
            // update the pointer for the free list
            // when full the free_list_tail is garbage
            next_ptr[free_list_tail] <= popped_head;
         end
      end // else: !if(rst)
   end

   // this is currently unused but is useful for equivalence proof
   // (only not used because it's not convenient with if statements
   //  when you don't know which head needs to be assigned to -- would
   //  have to check twice)
   (* keep *)
   wire [PTR_WIDTH-1:0] next_head0;
   assign next_head0 = pop & (pop_sel == 0) ? ((push & (push_sel == pop_sel) & (count[pop_sel] == 1)) ? free_list_head : next_ptr[head[pop_sel]]) :
                       free_list_head;

   always @(posedge clk) begin : head_logic
      integer i;
      if (rst) begin
         for(i=0; i < NUM_LISTS; i=i+1) begin
            head[i] <= 0;
         end
      end
      else begin
	       if (pop) begin
            // update head pointer to the next element (forget about this location)
            if (push & (push_sel == pop_sel) & (count[pop_sel] == 1)) begin
               // if pushing to the same list and there's only one element, then next_ptr is stale
               // use free_list_head directly
               head[pop_sel] <= free_list_head;
            end
            else begin
               head[pop_sel] <= next_ptr[head[pop_sel]];
            end
	       end
	       if (push & empty[push_sel]) begin // this case should not occur when popping because empty (env constraint)
            // update head pointer because it was pointing to garbage when empty
            head[push_sel] <= free_list_head;
	       end
      end // else: !if(rst)
   end // block: head_logic

   always @(posedge clk) begin : tail_logic
      integer j;
      if (rst) begin
         for(j=0; j < NUM_LISTS; j=j+1) begin
            tail[j] <= 0;
         end
      end
      else if (push) begin
         // take a pointer from the free list
         tail[push_sel] <= free_list_head;
      end
   end // block: tail_logic

   always @(posedge clk) begin : free_list_logic
      if (rst) begin
         // start free head and pointer at opposite ends
         // (free list starts with everything)
         free_list_head <= 0;
         free_list_tail <= (NUM_ELEMS-1);
      end
      else begin
         if (push & (!pop | (total_count < NUM_ELEMS-1))) begin
            // should never be pushing when full (undefined)
            // pop the head pointer of the free list
            free_list_head <= next_ptr[free_list_head];
         end
         if (pop) begin
            // push the freed element to the tail of the free list
            free_list_tail <= popped_head;
            if (full | (push & (total_count >= NUM_ELEMS-1))) begin
               // need to update free_list head when full (or when pushing and almost full)
               // free list is empty
               free_list_head <= head[pop_sel];
            end
         end
      end // else: !if(rst)
   end // block: free_list_logic

   // Assumptions
   // commented out for non-SV support
   // assume($onehot(push));
   // assume($onehot(pop));

endmodule // linked_list
