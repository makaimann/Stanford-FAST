`define FORMAL
module arbitrated_encoded_top(clk, rst, push, push_sel, flat_data_in, start, req, gnt_sel,
                      data_out, gnt, prop_signal);

   parameter NUM_FIFOS   =    `NUM_FIFOS,
             WIDTH       =    `WIDTH,
             DEPTH       =    `DEPTH,
             TAGWIDTH    =    $clog2(NUM_FIFOS),
             TRACKED     =    1;

   input                    clk, rst, push;
   input [TAGWIDTH-1:0]     push_sel;
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
            .push(push & (push_sel == i)),
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
       .push(push & (push_sel == TRACKED)),
       .pop(gnt[TRACKED]),
       .start(start & push & (push_sel == TRACKED)),
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

   genvar k;
   generate
      for(k = 0; k < NUM_FIFOS; k = k+1) begin
         always @* begin
            assume(!full[k] | !(push & (push_sel == k)));
            assume(!empty[k] | !gnt[k]);
         end
      end
   endgenerate

   always @* begin
      assume(rst == initstate);
   end

 `ifdef EN

   genvar l;
   generate
      for(l=0; l < NUM_FIFOS; l = l+1) begin
         always @(posedge clk) begin
            if(!trail_initstate) begin
               assert property (!($past(push) &&
                                  !$past(req) &&
                                  !$past(empty[l]))
                                || !empty[l]);
               assert property (!(!$past(|push) &&
                                  $past(req) &&
                                  !$past(full[l]))
                                || !full[l]);
            end
         end
      end
   endgenerate

 `else
   always @* begin
      if (!initstate)
        data_integrity: assert(prop_signal);
   end
 `endif

`endif

endmodule // arbitrated_fifos

