/**
   Author: Makai Mann
   Description: N fifos sharing the same memory, managed by linked lists of pointers.

   Interface:
     INPUTS
       clk     -- standard synchronous clock
       rst     -- standard synchronous active high reset
       push    -- zero or one-hot, selects a fifo to push data to
       pop     -- zero or one-hot, selects a fifo to pop data from
       data_in -- input data for a push
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

`include "linked_list.v"
`include "onehot_mux.v"

module linked_list_fifo(clk, rst, push, pop, data_in,
                        full, empty, data_out);
   parameter WIDTH=8,
             DEPTH=4,
             NUM_FIFOS=2,
             PTR_WIDTH=$clog2(DEPTH),
             ADDR_WIDTH=$clog2(NUM_FIFOS+1);

   input                           clk, rst;
   input [NUM_FIFOS-1:0]           push, pop;
   input [WIDTH-1:0]               data_in;
   output                          full;
   output [NUM_FIFOS-1:0]          empty;
   output [WIDTH-1:0]              data_out;

   // storage
   reg [WIDTH-1:0]                 mem [DEPTH-1:0];

   // selected pop (read) address
   wire [PTR_WIDTH-1:0]            pop_addr;

   // wires to linked_list state
   wire [ADDR_WIDTH*PTR_WIDTH-1:0] packed_head, packed_tail;
   wire [PTR_WIDTH-1:0]            head [NUM_FIFOS-1:0];
   wire [PTR_WIDTH-1:0]            tail [NUM_FIFOS-1:0];
   wire [PTR_WIDTH-1:0]            free_ptr;

   // unpack head and tail
   generate
      genvar              i;
      for(i=0; i < NUM_FIFOS; i=i+1) begin : unpack_arrays
         assign head[i] = packed_head[PTR_WIDTH*i +: PTR_WIDTH];
         assign tail[i] = packed_tail[PTR_WIDTH*i +: PTR_WIDTH];
      end
   endgenerate

   // instantiate the linked list
   linked_list
     #(.NUM_ELEMS(DEPTH),
       .NUM_LISTS(NUM_FIFOS))
   ll (.clk(clk),
       .rst(rst),
       .push(push),
       .pop(pop),
       .full(full),
       .empty(empty),
       .head(packed_head),
       .tail(packed_tail),
       .free_ptr(free_ptr));

   // manage the memory
   always @(posedge clk) begin
      if (|push) begin
         mem[free_ptr] <= data_in;
      end
   end

   onehot_mux
     #(.CHANNELS(NUM_FIFOS),
       .WIDTH(PTR_WIDTH))
   om (.onehot(pop),
       .i_data(packed_head),
       .o_data(pop_addr));

   // read from that address in memory
   assign data_out = mem[pop_addr];

endmodule // linked_list_fifo
