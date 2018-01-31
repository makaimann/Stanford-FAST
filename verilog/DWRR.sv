`ifndef OPTIONS
 `include "options.sv"
`endif

`define DWRR
`ifndef UTILS
 `include "utils.sv"
`endif

module DWRR(clk, rst, blk, reqs, input_quantums,
	    gnt);
   parameter NUM_REQS = 4; // Number of requestors
   parameter QWID     = 8; // Quantum widths  //TODO: Should have assumption that quantum widths are > than data packet size. Simplifies but not needed for correctness
   parameter PSIZE    = 8; // Data packet size
   parameter CNTWID   = $clog2(NUM_REQS);

   //********************* INTERFACE *******************//
   input wire 			         clk;
   input wire 			         rst;
   input wire 			         blk;
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
   wire 			       done;
   assign done = |done_vec;

   //*************** ROUND ROBIN COUNTER ***************//
   wire [CNTWID-1:0] 		       rr_cnt;
   wire [CNTWID-1:0] 		       next_rr_cnt;

   `ifdef COMB_UPDATE
   generate
      genvar 			       i;
      wire [CNTWID-1:0] 	       next_index [CNTWID-1:1];
      for(i=1; i < NUM_REQS; i=i+1) begin : rr_cnt_indices
	 assign next_index[i] = rr_cnt + i;
      end
   endgenerate

   always_comb begin : comb_update
      next_rr_cnt = 0;
      for(int j = 1; j < NUM_REQS; j=j+1)
	if (reqs[next_index[j]] == 1'b1) begin
	   next_rr_cnt = next_index[j];
	   break;
	end
   end

   `else
   assign next_rr_cnt = done ? rr_cnt + 1 :
			       rr_cnt;

   `endif

   FF #(.WIDTH(CNTWID)) ff_rrcnt(.clk(clk),
				 .en(done), //TODO Figure out if this is the correct enable signal
				 .D(next_rr_cnt),
				 .Q(rr_cnt));

   //**************** ROUND ROBIN SELECTOR *************//
   wire [NUM_REQS-1:0] 		       selected;
   wire [NUM_REQS-1:0] 		       next_selected;
   generate
      genvar 			       i;

      for(i = 0; i < NUM_REQS; i=i+1) begin : selected_logic
	 assign selected[i] = rr_cnt == i;
	 assign next_selected[i] = next_rr_cnt == i;
      end
   endgenerate


   //***************** DEFICIT COUNTERS ****************//
   wire [QWID-1:0]       def_cnt [NUM_REQS-1:0];
   wire [QWID-1:0]       next_def_cnt [NUM_REQS-1:0];

   // Useful signal for driving done_vec
   wire [NUM_REQS-1:0] selected_and_empty;
   generate
      genvar 	                  i;
      for(i = 0; i < NUM_REQS; i=i+1) begin : when_to_pass
	 assign selected_and_empty[i] = selected[i] & ~reqs[i];
      end
   endgenerate

   generate
      genvar 			  i;
      for(i = 0; i < NUM_REQS; i=i+1) begin : deficit_counters
   	 FF #(.WIDTH(QWID)) ff_defcnt(.clk(clk),
   				      .en(next_selected[i] | selected[i]), //TODO Double check enable signal
   				      .D(next_def_cnt[i]),
   				      .Q(def_cnt[i]));

   	 wire [QWID-1:0] dc_plus_quant;
   	 assign dc_plus_quant = (~selected[i] & next_selected[i]) ? def_cnt[i] + quantums[i] :
   	                         		                    def_cnt[i];

   	 assign next_def_cnt[i] = (rst | selected_and_empty[i]) ? 0 :
   				     gnt[i] ? dc_plus_quant - PSIZE :
   				        dc_plus_quant;

   	 assign done_vec[i] = selected[i] & (~reqs[i] | (def_cnt[i] < PSIZE));
      end
   endgenerate


   // ****************** GRANT SELECTION *****************//
   generate
      genvar i;
      for (i = 0; i < NUM_REQS; i=i+1) begin : gnt_selection
	 assign gnt[i] = reqs[i] & (def_cnt[i] >= PSIZE) & selected[i];
      end
   endgenerate

endmodule // DWRR
