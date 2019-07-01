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
           free_ptr, popped_head, head, F_sel, I_sel,
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
   input [PTR_WIDTH-1:0]           free_ptr, popped_head, head; // will be constrained by CoSA/Jasper
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
   // (* keep *)
   // wire [SEL_WIDTH:0]              free_list;
   (* keep *)
   wire [$clog2(PTR_WIDTH+1)-1:0]  ptr_width;
   (* keep *)
   wire [$clog2(SEL_WIDTH+1)-1:0]  sel_width;

   assign depth = DEPTH;
   // assign free_list = NUM_FIFOS;
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

   // SimpleScoreboard
   //   #(.DEPTH(DEPTH),
   //     .WIDTH(WIDTH))
   // sb (.clk(clk),
   //     .rst(rst),
   //     .push(push & (push_sel == FIFO_SEL)),
   //     .pop(pop & (pop_sel == FIFO_SEL)),
   //     .start(start),
   //     .data_in(data_in),
   //     .data_out(data_out),
   //     .data_out_vld(data_out_vld),
   //     .prop_signal(prop_signal));

   // (* keep *)
   // reg [PTR_WIDTH:0] free_list_count;

   // always @(posedge clk) begin
   //    if (rst) begin
	 //       free_list_count <= depth;
   //    end
   //    else begin
	 //       free_list_count <= free_list_count + pop - push;
   //    end
   // end

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

   // should be true only once, exactly when the magic packet is being captured
   (* keep *)
   wire capturing;

   // TODO Check if this parameterization works for non-trivial sizes!
   (* keep *)
   reg [0:0]            F [DEPTH-1:0];
   (* keep *)
   reg [PTR_WIDTH-1:0]  I [DEPTH-1:0];
   (* keep *)
   wire                 F_result;
   (* keep *)
   wire [PTR_WIDTH-1:0] I_result;

   // just to stop yosys from optimizing it out
   assign F_result = F[F_sel];
   assign I_result = I[I_sel];

   (* keep *)
   reg [PTR_WIDTH-1:0]  ptr;
   (* keep *)
   reg [PTR_WIDTH-1:0]  start_ptr;
   always @(posedge clk) begin
      if (rst) begin
         ptr <= 0;
      end
      else if (push & (push_sel == FIFO_SEL)) begin
         ptr <= ptr + 1;
      end
   end

   always @(posedge clk) begin
      if (capturing) begin
         start_ptr <= ((empty[0:0] ? ptr : I[head]) + (pop & (pop_sel == FIFO_SEL)));
      end
   end

   always @(posedge clk) begin: ghost_state_update_logic
      if (push & (push_sel == FIFO_SEL)) begin
         // mark it as the one we care about
         F[free_ptr] <= 0;
         // tag it with the place in the list and subtract pop to account for simultaneous pop
         I[free_ptr] <= ptr;
      end
      else if (pop & (pop_sel == FIFO_SEL)) begin
         // tag it as "other"
         F[popped_head] <= 1;
         // don't even need to update I
      end
   end: ghost_state_update_logic

   // an in-line scoreboard
   reg [PTR_WIDTH:0] sb_count;
   reg               sb_en;
   always @(posedge clk) begin: sb_count_update_logic
      if (rst) begin
         sb_count <= 0;
      end
      else if (!sb_en) begin
         sb_count <= sb_count + (push & (push_sel == FIFO_SEL)) - (pop & (pop_sel == FIFO_SEL));
      end
      // holds the counter-value once sb_en goes high
   end: sb_count_update_logic

   always @(posedge clk) begin: sb_en_update_logic
      if (rst) begin
         sb_en <= 0;
      end
      else begin
         sb_en <= ((start & push & (push_sel == FIFO_SEL)) | sb_en);
      end
   end

   (* keep *)
   reg [PTR_WIDTH:0] pos_cnt;
   (* keep *)
   reg               exited;
   always @(posedge clk) begin: pos_cnt_update_logic
      if (rst) begin
         pos_cnt <= 0;
         exited <= 0;
      end
      else if (sb_en & pop & (pop_sel == FIFO_SEL) & (pos_cnt < sb_count)) begin
         pos_cnt <= pos_cnt + 1;
         exited <= 1;
      end
      else if (sb_en & pop & (pop_sel == FIFO_SEL)) begin
         exited <= 1;
      end
   end: pos_cnt_update_logic

   reg [WIDTH-1:0] magic_packet;
   always @(posedge clk) begin
      if (capturing) begin
         magic_packet <= data_in;
      end
   end

   assign capturing = (start & !sb_en & push & (push_sel == FIFO_SEL));
   assign data_out_vld = (sb_en & (pos_cnt == (sb_count - 1)) & (pop_sel == FIFO_SEL));
   assign prop_signal = (!data_out_vld | (data_out == magic_packet));

   // debugging wires
   (* keep *)
   wire [PTR_WIDTH-1:0] ptr_p_pos_cnt;
   (* keep *)
   wire [PTR_WIDTH-1:0] I_head;
   (* keep *)
   wire F_head;

   assign ptr_p_pos_cnt = start_ptr + pos_cnt[PTR_WIDTH-2:0];
   assign I_head = I[head];
   assign F_head = F[head];

endmodule // top
