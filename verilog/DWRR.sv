`ifndef OPTIONS
 `include "options.v"
`endif

`define DWRR
`ifndef FF
 `include "FF.v"
`endif

`ifndef PRIDEC
 `include "pridec.sv"
`endif

module DWRR(clk, rst, blk, reqs, input_quantums,
	    gnt);
   parameter NUM_REQS = 4; // Number of requestors
   parameter QWID     = 8; // Quantum widths
   parameter PSIZE    = 8; // Data packet size
   parameter CNTWID   = $clog2(NUM_REQS);

   //********************* INTERFACE *******************//
   input wire                            clk;
   input wire                            rst;
   input wire                            blk;
   input wire [NUM_REQS-1:0]             reqs;
   input wire [NUM_REQS*QWID-1:0]        input_quantums;

   output wire [NUM_REQS-1:0] 	         gnt;

   //******************** PACK QUANTUMS ****************//
   wire [QWID-1:0] 			 quantums [NUM_REQS-1:0];
   generate
      genvar 				 i;
      for(i = 0; i < NUM_REQS; i=i+1) begin : pack_quantums
	     assign quantums[i] = input_quantums[(i+1)*QWID-1:i*QWID];
      end
   endgenerate

   //************** COMMUNICATION SIGNALS **************//

   wire [NUM_REQS-1:0] 		       done_vec;
   wire                            done;
   assign done = |done_vec;

   //*************** ROUND ROBIN COUNTER ***************//
   wire [CNTWID-1:0] 		       rr_cnt;
   wire [CNTWID-1:0] 		       next_rr_cnt;
   wire [CNTWID-1:0] 		       new_index [NUM_REQS-1:0];

`ifdef SLOW_UPDATE
   assign next_rr_cnt = done ? rr_cnt + 1 : rr_cnt;

`else
   wire [NUM_REQS-1:0] new_reqs;
   wire [NUM_REQS-1:0] pri_reqs;
   genvar k;
   for (k=0; k < NUM_REQS; k=k+1) begin : reorder
      assign new_index[k] = (rr_cnt + k + 1) < NUM_REQS ? rr_cnt + k + 1
                                                        : rr_cnt + k + 1 - NUM_REQS;
      assign new_reqs[k] = reqs[new_index[k]];
   end

   pridec #(.WIDTH(NUM_REQS)) priority_decoder (.vec(new_reqs),
			                                    .out_vec(pri_reqs));

   // allow jumping to the next requestor
   reg [CNTWID-1:0] rr_cnt_jump;
   integer 	     n;
   always @* begin
      rr_cnt_jump = rr_cnt; // default to current value
      for( n=0; n < NUM_REQS; n=n+1) begin
         if (pri_reqs[n])
           rr_cnt_jump = new_index[n];
      end
   end

   assign next_rr_cnt = rr_cnt_jump;

`endif // !`ifdef SLOW_UPDATE

   FF #(.WIDTH(CNTWID)) ff_rrcnt(.clk(clk),
                                 .rst(rst),
				                         .en(done),
				                         .D(next_rr_cnt),
				                         .Q(rr_cnt));

   //**************** ROUND ROBIN SELECTOR *************//
   wire [NUM_REQS-1:0] 		       selected;
   wire [NUM_REQS-1:0] 		       next_selected;
   generate
      for(i = 0; i < NUM_REQS; i=i+1) begin : selected_logic
	     assign selected[i] = rr_cnt == i;
	     assign next_selected[i] = next_rr_cnt == i;
      end
   endgenerate


   //***************** DEFICIT COUNTERS ****************//
   wire [QWID-1:0]       def_cnt [NUM_REQS-1:0];
   wire [QWID-1:0]       next_def_cnt [NUM_REQS-1:0];

   // Useful signal for driving done_vec
   wire [NUM_REQS-1:0] selected_and_not_req;
   generate
      for(i = 0; i < NUM_REQS; i=i+1) begin : when_to_pass
	     assign selected_and_not_req[i] = selected[i] & ~reqs[i];
      end
   endgenerate

   generate
      for(i = 0; i < NUM_REQS; i=i+1) begin : deficit_counters
   	     FF #(.WIDTH(QWID)) ff_defcnt(.clk(clk),
                                      .rst(rst),
   				                      .en(next_selected[i] | selected[i]), //TODO Double check enable signal
   				                      .D(next_def_cnt[i]),
   				                      .Q(def_cnt[i]));

   	     wire [QWID-1:0] dc_plus_quant;

         `ifdef SLOW_UPDATE
         assign dc_plus_quant = (~selected[i] & next_selected[i]) ? def_cnt[i] + quantums[i] :
   	                     def_cnt[i];
         assign done_vec[i] = gnt[i] & (selected[i] & (~reqs[i] | (def_cnt[i] < PSIZE)));

         `else
   	     assign dc_plus_quant = (next_selected[i]) ? def_cnt[i] + quantums[i] :
   	                         	def_cnt[i];
         assign done_vec[i] = gnt[i] & (selected[i] & (~reqs[i] | (next_def_cnt[i] < PSIZE)));
         `endif

         // might be better for partial order reductions to not reset when not requesting
   	     assign next_def_cnt[i] = rst ? 0 :
                                  selected_and_not_req[i] ? def_cnt[i] :
   				                        gnt[i] ? dc_plus_quant - PSIZE :
   				                        dc_plus_quant;
      end
   endgenerate


   // ****************** GRANT SELECTION *****************//
   generate
      for (i = 0; i < NUM_REQS; i=i+1) begin : gnt_selection
	     assign gnt[i] = reqs[i] & (def_cnt[i] >= PSIZE) & selected[i];
      end
   endgenerate

endmodule // DWRR
