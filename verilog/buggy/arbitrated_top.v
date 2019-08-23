`define FORMAL
module arbitrated_top(clk, rst, push, flat_data_in, start, req, gnt_sel,
                      data_out, gnt, prop_signal);

   parameter NUM_FIFOS   =    `NUM_FIFOS,
             WIDTH       =    `WIDTH,
             DEPTH       =    `DEPTH,
             TAGWIDTH    =    $clog2(NUM_FIFOS),
             TRACKED     =    1;

   input                    clk, rst;
   input [NUM_FIFOS-1:0]    push;
   input [NUM_FIFOS*WIDTH-1:0] flat_data_in;
   input                    start; // for scoreboard
   input                    req;
   input [TAGWIDTH-1:0]     gnt_sel;
   output [WIDTH-1:0]       data_out;
   output [NUM_FIFOS-1:0]   gnt;
   output                   prop_signal;

   // scoreboard signals
   wire                     data_out_vld;
   wire                     en;

   wire [NUM_FIFOS-1:0]     full, empty;
   wire [WIDTH-1:0]         fifo_data_out [NUM_FIFOS-1:0];

   // unpack data for easier handling
   (* keep *)
   wire [WIDTH-1:0]         data_in  [NUM_FIFOS-1:0];

   wire                     not_full;
   assign not_full = ~full;

   // Yosys generates bad btor (non-UTF-8 parseable) without this...not sure why
   wire [WIDTH-1:0]                    all_ones;
   assign all_ones = {WIDTH{1'b1}};

   wire [WIDTH-1:0]                    mask;
   assign mask = {WIDTH{not_full}};

   generate
      genvar                i;
      for(i=0; i < NUM_FIFOS; i=i+1) begin : unpack_data
         assign data_in[i]  = all_ones & flat_data_in[(i+1)*WIDTH-1:i*WIDTH];
      end
   endgenerate

   // wire [NUM_FIFOS-1:0]     qual_push;

   // // can re-direct to different fifo
   // // BUG: doesn't update tag
   // round_robin_selector
   //   #(.WIDTH(NUM_FIFOS))
   // rrs
   //   (.en(push),
   //    .input_sel(push_sel),
   //    .allowed(~full),
   //    .sel(qual_push));

   genvar i;
   generate
      for(i=0; i < NUM_FIFOS; i=i+1) begin : gen_fifos
         circular_pointer_fifo
            #(.WIDTH(WIDTH), .DEPTH(DEPTH))
         f (.clk(clk),
            .rst(rst),
            .push(push[i]),
            .pop(gnt[i]),
            .data_in(data_in[i] & mask),
            .full(full[i]),
            .empty(empty[i]),
            .data_out(fifo_data_out[i]));

         // For now assuming every non-empty fifo is requesting
         //assign guarded_reqs[i] = reqs[i] & ~empty[i];
         assign gnt[i] = (req & (gnt_sel == i));
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
      assume (empty[gnt_sel] | (gnt != 0));
      // assume((guarded_reqs != 0) | (gnt == 0));
      // assume((guarded_reqs == 0) | (|(gnt & guarded_reqs)));
      // assume((guarded_reqs == 0) || ((gnt != 0) && ((gnt & (gnt - 1)) == 0)));
   end
   // end abstract arbiter

   // priority arbiter
   // assign gnt = (reqs) & (reqs - 1);
   // end priority arbiter

   onehot_mux
     #(.CHANNELS(NUM_FIFOS),
       .WIDTH(WIDTH))
   om(.onehot(gnt),
      .i_data(flat_fifo_data_out),
      .o_data(data_out));


   SimpleScoreboard
     #(.DEPTH(DEPTH+2),
       .WIDTH(WIDTH))

   sb (.clk(clk),
       .rst(rst),
       .push(push[TRACKED]),
       .pop(gnt[TRACKED]),
       .start(start & push[TRACKED]),
       .data_in(data_in[TRACKED]),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .en(en),
       .prop_signal(prop_signal));

`ifdef FORMAL
   reg                         initstate = 1'b1;
   reg                         trail_initstate = 1'b1;

   always @(posedge clk) begin
      initstate <= 1'b0;
      trail_initstate <= initstate;
   end

   always @* begin
      assume(rst == initstate);
      // //assume(!(&full) | !push);
      // assume(!full[0] | !(push & (push_sel == 0)));
      // assume(!full[1] | !(push & (push_sel == 1)));
      // assume(!full[2] | !(push & (push_sel == 2)));
      // assume(!full[3] | !(push & (push_sel == 3)));

      assume(!full[0] | !push[0]);
      assume(!full[1] | !push[1]);
      assume(!full[2] | !push[2]);
      assume(!full[3] | !push[3]);
      assume(!empty[0] | !gnt[0]);
      assume(!empty[1] | !gnt[1]);
      assume(!empty[2] | !gnt[2]);
      assume(!empty[3] | !gnt[3]);
   end

 `ifdef EN
   always @(posedge clk) begin
      if (!trail_initstate) begin
         // reqs doesn't disable push
         assert property (!($past(|push) &&
                            !$past(req) &&
                            !$past(empty[0]))
                          || !empty[0]);
         assert property (!($past(|push) &&
                            !$past(req) &&
                            !$past(empty[1]))
                          || !empty[1]);
         assert property (!($past(|push) &&
                            !$past(req) &&
                            !$past(empty[2]))
                          || !empty[2]);
         assert property (!($past(|push) &&
                            !$past(req) &&
                            !$past(empty[3]))
                          || !empty[3]);

         // don't need to check requests -- guarded internally so the enable condition is just True

         // decided not to use start as an action, just using an extra guard that shouldn't matter anyway
         // alternative is to add an invariant that empty & !en <-> sbcnt != 0

         // // start doesn't disable push
         // assert property(!($past(start) &&
         //                   !$past(push) &&
         //                   !$past(reqs[0]) &&
         //                   !$past(reqs[1]) &&
         //                   !$past(reqs[2]) &&
         //                   !$past(reqs[3]) &&
         //                   !$past(full)) || !full);
                 //  // reqs doesn't disable start
        // assert property(!(!$past(start) &&
        //                   !$past(push) &&
        //                   !$past(reqs[0]) &&
        //                   !$past(reqs[1]) &&
        //                   !$past(reqs[2]) &&
        //                   $past(reqs[3]) &&
        //                   !$past(en)) || !en);
        //  assert property(!(!$past(start) &&
        //                    !$past(push) &&
        //                    !$past(reqs[0]) &&
        //                    !$past(reqs[1]) &&
        //                    $past(reqs[2]) &&
        //                    !$past(reqs[3]) &&
        //                    !$past(en)) || !en);
        //  assert property(!(!$past(start) &&
        //                    !$past(push) &&
        //                    !$past(reqs[0]) &&
        //                    $past(reqs[1]) &&
        //                    !$past(reqs[2]) &&
        //                    !$past(reqs[3]) &&
        //                    !$past(en)) || !en);
        //  assert property(!(!$past(start) &&
        //                    !$past(push) &&
        //                    $past(reqs[0]) &&
        //                    !$past(reqs[1]) &&
        //                    !$past(reqs[2]) &&
        //                    !$past(reqs[3]) &&
        //                    !$past(en)) || !en);

        //  // push doesn't disable start
        //  assert property(!(!$past(start) &&
        //                    $past(push) &&
        //                    !$past(reqs[0]) &&
        //                    !$past(reqs[1]) &&
        //                    !$past(reqs[2]) &&
        //                    !$past(reqs[3]) &&
        //                    !$past(en)) || !en);

      end
   end
 `else
   always @* begin
      if (!initstate)
        data_integrity: assert(prop_signal);
   end
 `endif

`endif

endmodule // arbitrated_fifos

