`define FORMAL
module arbitrated_top(clk, rst, push, push_sel, reqs, data_in, start,
                      data_out, prop_signal);

   parameter NUM_FIFOS   =    `NUM_FIFOS,
             WIDTH       =    `WIDTH,
             DEPTH       =    `DEPTH,
             TAGWIDTH    =    $clog2(NUM_FIFOS),
             TRACKED     =    0;

   input                    clk, rst, push;
   input [TAGWIDTH-1:0]     push_sel;
   input [NUM_FIFOS-1:0]    reqs;
   input [WIDTH-1:0]        data_in;
   input                    start; // for scoreboard
   output [WIDTH-1:0]       data_out;
   output                   prop_signal;

   // scoreboard signals
   wire                     data_out_vld;

   wire [NUM_FIFOS-1:0]     full, empty, gnt, guarded_reqs;
   wire [WIDTH-1:0]         fifo_data_out [NUM_FIFOS-1:0];

   wire [NUM_FIFOS-1:0]     decoded_push, qual_push;
   genvar                   k;
   generate
      for(k=0; k < NUM_FIFOS; k = k+1) begin : qual_push
         assign decoded_push[k] = push & (push_sel == k);
      end
   endgenerate

   // can re-direct to different fifo
   // BUG: doesn't update tag
   round_robin_selector
     #(.WIDTH(NUM_FIFOS))
   rrs
     (.en(push),
      .requests(decoded_push & ~full),
      .sel(qual_push));

   genvar i;
   generate
      for(i=0; i < NUM_FIFOS; i=i+1) begin : gen_fifos
         circular_pointer_fifo
            #(.WIDTH(WIDTH), .DEPTH(DEPTH))
         f (.clk(clk),
            .rst(rst),
            .push(push && (push_sel == i)),
            .pop(gnt[i]),
            .data_in(data_in),
            .full(full[i]),
            .empty(empty[i]),
            .data_out(fifo_data_out[i]));

         // For now assuming every non-empty fifo is requesting
         assign guarded_reqs[i] = reqs[i] & ~empty[i];
      end
   endgenerate

   wire [NUM_FIFOS*WIDTH-1:0] flat_fifo_data_out;
   generate
      genvar                 j;
      for(j=0; j < NUM_FIFOS; j=j+1) begin : pack_data_out
         assign flat_fifo_data_out[(j+1)*WIDTH-1:j*WIDTH] = fifo_data_out[j];
      end
   endgenerate

   // abstract arbiter
   always @* begin : abstract_arbiter
      assume((guarded_reqs != 0) | (gnt == 0));
      assume((guarded_reqs == 0) | (|(gnt & guarded_reqs)));
      assume((guarded_reqs == 0) || ((gnt != 0) && ((gnt & (gnt - 1)) == 0)));
   end
   // end abstract arbiter

   onehot_mux
     #(.CHANNELS(NUM_FIFOS),
       .WIDTH(WIDTH))
   om(.onehot(gnt),
      .i_data(flat_fifo_data_out),
      .o_data(data_out));


   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))

   sb (.clk(clk),
       .rst(rst),
       .push(push & (push_sel == TRACKED)),
       .pop(gnt[TRACKED]),
       .start(start),
       .data_in(data_in),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));

`ifdef FORMAL
   reg initstate = 1'b1;

   always @(posedge clk) begin
      initstate <= 1'b0;
   end

   always @* begin
      assume(rst == initstate);
      if(!initstate)
        assert(prop_signal);
   end
   `endif

endmodule // arbitrated_fifos
