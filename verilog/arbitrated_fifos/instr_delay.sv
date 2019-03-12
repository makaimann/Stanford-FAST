`define INSTR_DELAY

`ifndef COUNT_ONES
 `include "count_ones.sv"
`endif

// witness function for showing how to delay instructions
// todo: make more general, especially wrt mask
// todo: add comments about cases for push/reqs

module instr_delay(clk, delay, instructions, data_in, mask,
                   orig_instructions, delayed_instructions, data_out, count);

   parameter NUM_INSTR = 4,
	       CNTWIDTH = $clog2(NUM_INSTR + 1),
	       NUM_DATA_BITS = 64;

   input 				   clk;
   input 				   delay;
   input [NUM_INSTR-1:0] 		   instructions;
   input [NUM_DATA_BITS-1:0] 		   data_in;
   input [NUM_INSTR-1:0] 		   mask;
   output reg [NUM_INSTR-1:0]              orig_instructions;
   output reg [NUM_INSTR-1:0]              delayed_instructions;
   output reg [NUM_DATA_BITS-1:0]          data_out;
   output [CNTWIDTH-1:0] 		   count;

   // STATE
   reg                                 WAIT;
   reg [NUM_INSTR-1:0] 		       select_instr;
   reg [NUM_INSTR-1:0]                 prev_select_instr;
   reg [NUM_DATA_BITS-1:0]             prev_data_out;
   // END STATE

   count_ones
     #(.WIDTH(NUM_INSTR))
   co (.vec(instructions),
       .count(count));

   always_comb begin
      if (WAIT) begin
         orig_instructions = 'd0;
	 delayed_instructions = prev_select_instr;
         data_out = prev_data_out;
      end
      else if (delay && !WAIT) begin
         orig_instructions = instructions;
         delayed_instructions = ((select_instr & mask) == 0) ? instructions & (~select_instr) : instructions & ~mask;
         data_out = data_in;
      end
      else begin
         orig_instructions = instructions;
         delayed_instructions = instructions;
         data_out = data_in;
      end
   end // always_comb

   always @(posedge clk) begin
      if (delay && !WAIT) begin
         WAIT <= 1'b1;
	 assume ($onehot(select_instr));
         assume ((select_instr & instructions) != 'd0);
         prev_select_instr <= select_instr;
         prev_data_out <= data_out;
      end
      else begin
         WAIT <= 1'b0;
         prev_select_instr <= select_instr;
         prev_data_out <= data_out;
      end
   end

endmodule // instr_delay
