`ifndef WIDTH
 `define WIDTH 4
`endif

`ifndef DEPTH
 `define DEPTH 2
`endif

`ifndef NUM_FIFOS
 `define NUM_FIFOS 1
`endif


module top(clk, rst, push, pop, push_sel, pop_sel, data_in,
           // dummy inputs
           free_tail_ptr, popped_head, ghost_sel,
           // outputs
           empty, full, data_out,
           cpempty, cpfull, cpdata_out);
   parameter WIDTH=`WIDTH,
     DEPTH=`DEPTH,
     NUM_FIFOS=`NUM_FIFOS,
     FIFO_SEL=0,
     PTR_WIDTH=$clog2(DEPTH),
     SEL_WIDTH=$clog2(NUM_FIFOS),
     ADDR_WIDTH=$clog2(NUM_FIFOS+1);

   input                           clk, rst, push, pop;
   input [SEL_WIDTH-1:0]           push_sel, pop_sel;
   input [WIDTH-1:0]               data_in;
   input [PTR_WIDTH-1:0]           free_tail_ptr, popped_head; // will be constrained by CoSA/Jasper
   input [PTR_WIDTH-1:0]           ghost_sel;
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
   wire [SEL_WIDTH:0]              free_list;

   assign depth = DEPTH;
   assign free_list = NUM_FIFOS;

   // (* keep *)
   // wire                            cppush, cppop;
   // assign cppush = push & (push_sel == FIFO_SEL);
   // assign cppop = pop & (pop_sel == FIFO_SEL);

   // environmental assumptions
   generate
      genvar                       i;
      for(i=0; i < NUM_FIFOS; i=i+1) begin
         always @* begin
            assume(~empty[i] | ~(pop & (pop_sel == i)));
         end
      end      
   endgenerate
   always @* begin
      assume (~full | ~push);
   end

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
   reg [PTR_WIDTH:0] free_list_count;

   always @(posedge clk) begin
      if (rst) begin
	       free_list_count <= depth;
      end
      else begin
	       free_list_count <= free_list_count + pop - push;
      end
   end

   // mirrors the logic in linked_list.v
   (* keep *)
   reg [PTR_WIDTH:0]                     count [NUM_FIFOS-1:0];

   generate
      genvar                             c;
      for(c=0; c < NUM_FIFOS; c=c+1) begin : count_elements
         always @(posedge clk) begin
            if (rst)
              count[c] <= 0;
            else
              count[c] <= count[c] + (push & (push_sel == c)) - (pop & (pop_sel == c));
         end
      end
   endgenerate


   // TODO Check if this parameterization works for non-trivial sizes!
   (* keep *)
   reg [SEL_WIDTH+PTR_WIDTH:0] ghost [DEPTH-1:0];
   (* keep *)
   wire [SEL_WIDTH+PTR_WIDTH:0] ghost_result;

   // just to stop yosys from optimizing it out
   assign ghost_result = ghost[ghost_sel];

   reg [PTR_WIDTH-1:0]          tmp;
   // need update logic for the ghost state
   integer                      k;
   integer                      j;
   always @(posedge clk) begin : ghost_state_update_logic
      if (rst) begin
	       for(k=0; k < DEPTH; k=k+1) begin
	          tmp = k;
	          ghost[k] <= {free_list, tmp};
	       end
      end
      else begin
	       for (j=0; j < DEPTH; j=j+1) begin
	          if (push) begin
	             if (j == free_tail_ptr) begin
		              // TODO THIS IS WRONG -- FIX THIS
		              // Need to subtract pop to handle simultaneous pop case
		              // the other if case won't catch it because still referring to stale
		              // fifo identifier
		              ghost[j] <= {push_sel, count[push_sel][PTR_WIDTH-1:0] - pop};
	             end
	             else if (ghost[j][SEL_WIDTH+PTR_WIDTH:PTR_WIDTH] == free_list) begin
		              ghost[j] <= {free_list, ghost[j][SEL_WIDTH+PTR_WIDTH:PTR_WIDTH]-{{(PTR_WIDTH-1){1'b0}}, 1'b1}};
	               end
	          end

	          if (pop & (pop_sel == ghost[j][SEL_WIDTH+PTR_WIDTH:PTR_WIDTH])) begin
	             if (ghost[j][PTR_WIDTH-1:0] != 0) begin
		              // subtract one from number if not head
		              ghost[j] <= {ghost[j][SEL_WIDTH+PTR_WIDTH:PTR_WIDTH], ghost[j][PTR_WIDTH-1:0]-{{(PTR_WIDTH-1){1'b0}}, 1'b1}};
	          end
	             else begin
		              // if head, then add to free list
		              // need to subtract push in case pushing simultaneously
		              ghost[j] <= {free_list, free_list_count[PTR_WIDTH-1:0] - push};
	             end
	          end
	       end
      end
   end

endmodule // top
