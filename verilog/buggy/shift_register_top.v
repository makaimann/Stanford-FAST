`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

`define FORMAL
module shift_register_top(clk, rst, start, push, pop, data_in,
                          empty, full, data_out, prop_signal);
   parameter WIDTH=`WIDTH,
             DEPTH=`DEPTH;

   input                           clk, rst, start, push, pop;
   input [WIDTH-1:0]               data_in;
   output                          empty, full, prop_signal;
   output [WIDTH-1:0]              data_out;

   (* keep *)
   wire                            data_out_vld;
   (* keep *)
   wire                            en;


   always @* begin : environmental_constraints
      assume (~empty | ~pop);
      assume (~full | ~push);
   end

   shift_register_fifo
     #(.WIDTH(WIDTH),
       .DEPTH(DEPTH))
   dut(.clk(clk),
       .rst(rst),
       .data_in(data_in),
       .push(push),
       .pop(pop),
       .empty(empty),
       .full(full),
       .data_out(data_out));

   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))
   sb (.clk(clk),
       .rst(rst),
       .push(push),
       .pop(pop),
       .start(start),
       .data_in(data_in),
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
      assume(!full | !push);
      assume(!empty | !pop);
   end

 `ifdef EN
   always @(posedge clk) begin
      if (!trail_initstate) begin
         // pop doesn't disable start
        assert property(!(!$past(start) && !$past(push) && $past(pop) && !$past(en)) || !en);
         // pop doesn't disable push
        assert property(!(!$past(start) && !$past(push) && $past(pop) && !$past(full)) || !full);
         // push doesn't disable start
        assert property(!(!$past(start) && $past(push) && !$past(pop) && !$past(en)) || !en);
         // push doesn't disable pop
         assert property(!(!$past(start) && $past(push) && !$past(pop) && !$past(empty)) || !empty);
         // start doesn't disable pop
        assert property(!($past(start) && !$past(push) && !$past(pop) && !$past(empty)) || !empty);
         // start doesn't disable push
        assert property(!($past(start) && !$past(push) && !$past(pop) && !$past(full)) || !full);
      end
   end
 `else
   always @* begin
      if (!initstate)
        data_integrity: assert(prop_signal);
   end
 `endif

`endif

endmodule // top
