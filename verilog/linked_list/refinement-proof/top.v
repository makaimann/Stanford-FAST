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
           free_ptr, popped_head, F_sel, I_sel,
           // scoreboard input
           start,
           // outputs
           empty, full, data_out,
           cpempty, cpfull, cpdata_out,
           // scoreboard outputs
           data_out_vld, prop_signal);
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
   input [PTR_WIDTH-1:0]           free_ptr, popped_head; // will be constrained by CoSA/Jasper
   input [PTR_WIDTH-1:0]           F_sel, I_sel;
   input                           start;
   output                          full;
   output [NUM_FIFOS-1:0]          empty;
   output [WIDTH-1:0]              data_out;
   output                          cpempty, cpfull;
   output [WIDTH-1:0]              cpdata_out;
   output                          data_out_vld, prop_signal;

   wire                            data_out_vld;

   // just for CoSA properties
   (* keep *)
   wire [PTR_WIDTH:0]              depth;
   (* keep *)
   wire [SEL_WIDTH:0]              free_list;
   (* keep *)
   wire [$clog2(PTR_WIDTH+1)-1:0]  ptr_width;
   (* keep *)
   wire [$clog2(SEL_WIDTH+1)-1:0]  sel_width;

   assign depth = DEPTH;
   assign free_list = NUM_FIFOS;
   assign ptr_width = PTR_WIDTH;
   assign sel_width = SEL_WIDTH;

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

   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))
   sb (.clk(clk),
       .rst(rst),
       .push(push & (push_sel == FIFO_SEL)),
       .pop(pop & (pop_sel == FIFO_SEL)),
       .start(start),
       .data_in(data_in),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));

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
   reg [SEL_WIDTH:0]   F [DEPTH-1:0];
   (* keep *)
   reg [PTR_WIDTH-1:0] I [DEPTH-1:0];
   (* keep *)
   wire [SEL_WIDTH:0]   F_result;
   (* keep *)
   wire [PTR_WIDTH-1:0] I_result;

   // just to stop yosys from optimizing it out
   assign F_result = F[F_sel];
   assign I_result = I[I_sel];

   reg [PTR_WIDTH-1:0]          tmp;
   // need update logic for the ghost state
   integer                      k;
   integer                      j;
   always @(posedge clk) begin : ghost_state_update_logic
      if (rst) begin
	       for(k=0; k < DEPTH; k=k+1) begin
	          tmp = k;
            F[k] <= free_list;
            I[k] <= tmp;
	       end
      end
      else begin
	       for (j=0; j < DEPTH; j=j+1) begin
            if ((j == free_ptr) & push) begin
               // Need to subtract pop to hoandle simultaneous pop case (if it's the same fifo)
		           // the other if case won't catch it because still referring to stale
		           // fifo identifier
               F[j] <= {1'b0, push_sel};
               I[j] <= (count[push_sel][PTR_WIDTH-1:0] - (pop & (pop_sel == push_sel)));
            end
            else if (pop & (j == popped_head)) begin
               // if head, then add to free list
		           // need to subtract push in case pushing simultaneously
               F[j] <= free_list;
               I[j] <= (free_list_count[PTR_WIDTH-1:0] - push);
            end
            else if (pop & ({1'b0, pop_sel} == F[j])) begin
               // decrement on pop from a list
               I[j] <= (I[j] - {{(PTR_WIDTH-1){1'b0}}, 1'b1});
            end
            else if (push & (F[j] == free_list)) begin
               I[j] <= (I[j] - {{(PTR_WIDTH-1){1'b0}}, 1'b1});
            end
	       end
      end
   end // block: ghost_state_update_logic

endmodule // top
