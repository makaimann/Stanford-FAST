module shift_register_fifo(clk, rst, data_in, push, pop,
                           empty, full, data_out);

   parameter WIDTH  = 8,
             DEPTH  = 8,
             CNTWID = $clog2(DEPTH+1),
             IDXWID = $clog2(DEPTH);

   input              clk, rst, push, pop;
   input [WIDTH-1:0]  data_in;
   output             empty, full;
   output [WIDTH-1:0] data_out;

   (* keep *)
   reg [CNTWID-1:0]   count;

   wire [DEPTH-1:0]   reg_en;
   wire [IDXWID-1:0]  data_in_idx;

   // assign to the count-th register unless also popping, then one less
   // when full, data_in_idx will wraparound (which doesn't matter because env constraints)
   assign data_in_idx = count - pop;

   // environmental assumptions on push and pop should prevent overflow
   always @(posedge clk) begin
      if (rst) begin
         count <= {CNTWID{1'b0}};
      end
      else begin
         count <= count + {{(CNTWID-1){1'b0}}, push} - {{(CNTWID-1){1'b0}}, pop};
      end
   end

   assign empty = (count == 0);
   assign full  = (count >= DEPTH);

   wire [WIDTH-1:0]   next_val [DEPTH-1:0];
   wire [WIDTH-1:0]   entries  [DEPTH-1:0];
   generate
      genvar          i;
      for(i = 0; i < DEPTH; i=i+1) begin : regs
         FF
              #(.WIDTH(WIDTH),
                .INIT(0))
         reg_inst(.rst(rst),
                  .clk(clk),
                  .en(reg_en[i]),
                  .D(next_val[i]),
                  .Q(entries[i])
                  );
         assign reg_en[i] = pop | (push & (count == i));
      end
   endgenerate

   generate
      genvar j;
      for(j = 0; j < DEPTH-1; j=j+1) begin : next_val_comp
         assign next_val[j] = ((push & pop & (count - 1 == j)) | (push & (count == j))) ? data_in :
                              pop ? entries[j+1] : 0;
      end
      // let the enable signal handle it
      // don't ever need to shift any values in because this is the end
      assign next_val[DEPTH-1] = data_in;
   endgenerate

   // always pop elements off the front of the queue
   assign data_out = entries[0];

endmodule // shift_register_fifo
