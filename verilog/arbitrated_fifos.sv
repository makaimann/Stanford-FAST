`define ARBITRATED_FIFOS

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef DWRR
 `include "DWRR.sv"
`endif

`ifndef ONEHOT_MUX
 `include "onehot_mux.v"
`endif

module arbitrated_fifos(clk, rst, push, reqs, flat_data_in, quantums,
                        empty, full, gnt, data_out);

   parameter NUM_REQS   =    `NUM_REQS,
             WIDTH      =    `FIFO_DWIDTH,
             DEPTH      =    `FIFO_DEPTH,
             QWID       =    `ARB_QWID,
             ABSTRACT   =     0;

   input                      clk, rst;
   input [NUM_REQS-1:0]       push;
   input [NUM_REQS-1:0]       reqs;
   input [NUM_REQS*WIDTH-1:0] flat_data_in;
   input [NUM_REQS*QWID-1:0]  quantums;

   output [NUM_REQS-1:0]      empty;
   output [NUM_REQS-1:0]      full;
   (* keep *)
   output reg [NUM_REQS-1:0]  gnt;
   output reg [WIDTH-1:0]     data_out;

   wire [WIDTH-1:0]         fifo_data_out [NUM_REQS-1:0];


   wire [NUM_REQS-1:0]          guarded_reqs;

   // Unpack data_in
   wire [WIDTH-1:0]         data_in [NUM_REQS-1:0];
   generate
      genvar                i;

      for(i=0; i < NUM_REQS; i=i+1) begin : unpack_data_in
         assign data_in[i] = flat_data_in[(i+1)*WIDTH-1:i*WIDTH];
      end
   endgenerate

   if (ABSTRACT) begin
      always @* begin
         assume((reqs != 0) | (gnt == 0));
         assume((reqs == 0) | (|(gnt & reqs)));
         assume((reqs == 0) || ((gnt != 0) && ((gnt & (gnt - 1)) == 0)));
      end
   end
   else begin
      DWRR
        #(.NUM_REQS(NUM_REQS), .QWID(QWID), .PSIZE(WIDTH))
      arb (.clk(clk),
           .rst(rst),
           .blk(1'b0),
           .reqs(guarded_reqs),
           .input_quantums(quantums),
           .gnt(gnt));
   end
   generate
      for(i=0; i < NUM_REQS; i=i+1) begin : gen_fifos
         fifo #(.WIDTH(WIDTH), .DEPTH(DEPTH)) f (.clk(clk),
                                                 .rst(rst),
                                                 .push(push[i]),
                                                 .pop(gnt[i]),
                                                 .data_in(data_in[i]),
                                                 .full(full[i]),
                                                 .empty(empty[i]),
                                                 .data_out(fifo_data_out[i]));
   // For now assuming every non-empty fifo is requesting
   assign guarded_reqs[i] = reqs[i] & ~empty[i];
      end
   endgenerate

   wire [NUM_REQS*WIDTH-1:0] flat_fifo_data_out;
   generate
      genvar                 j;
      for(j=0; j < NUM_REQS; j=j+1) begin : pack_data_out
         assign flat_fifo_data_out[(j+1)*WIDTH-1:j*WIDTH] = fifo_data_out[j];
      end
   endgenerate


   onehot_mux
     #(.CHANNELS(NUM_REQS),
       .WIDTH(WIDTH))
     om(.onehot(gnt),
        .i_data(flat_fifo_data_out),
        .o_data(data_out));

endmodule
