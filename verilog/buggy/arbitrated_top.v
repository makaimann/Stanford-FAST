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
         shift_register_fifo
            #(.WIDTH(WIDTH), .DEPTH(DEPTH))
         f (.clk(clk),
            .rst(rst),
            .push(push[i]),
            .pop(gnt[i]),
            .data_in(data_in[i]),
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

   genvar k;
   generate
      for(k=0; k < NUM_FIFOS; k=k+1) begin
         always @* begin
            assume(!full[k] | !push[k]);
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
      for(l = 0; l < NUM_FIFOS; l = l+1) begin
         always @(posedge clk) begin
            if (!trail_initstate) begin
               assert property (!($past(|push) &&
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

