`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, push, pop, push_sel, pop_sel, data_in,
           // dummy inputs
           free_tail_ptr, head0, next_head0, rdPtr, wrPtr,
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
   input [PTR_WIDTH-1:0]           free_tail_ptr, head0, next_head0, rdPtr, wrPtr; // will be constrained by CoSA
   output                          full;
   output [NUM_FIFOS-1:0]          empty;
   output [WIDTH-1:0]              data_out;
   output                          cpempty, cpfull;
   output [WIDTH-1:0]              cpdata_out;

   wire                            data_out_vld;

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

   // downward refinement is abstract to detailed (shift register fifo is our 'abstract' spec)
   // upward refinement is detailed to abstract (ll_to_cp in this case)
   always @(posedge clk) begin : refinement_mapping
      // If we only have the first case, this works if we just care about the head
      //   something about tracking the tail as well makes this more complicated
      if (cppush & cpempty) begin
         cpf_to_ll[wrPtr] <= next_head0;
         ll_to_cpf[next_head0] <= wrPtr;
      end
      else if (cppop) begin
         cpf_to_ll[rdPtr+1] <= next_head0;
         ll_to_cpf[next_head0] <= rdPtr+1;
      end
      // including this makes the head tracking properties fail
      // but we need to track the tail too
      // if (cppush & !cpempty) begin
      //    cpf_to_ll[wrPtr] <= free_tail_ptr;
      //    ll_to_cpf[free_tail_ptr] <= wrPtr;
      // end
   end

   assign cpf_result = cpf_to_ll[wrPtr-1];
   assign ll_result = ll_to_cpf[free_tail_ptr];

endmodule // top
