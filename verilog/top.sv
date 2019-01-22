`ifndef ARBITRATED_FIFOS
 `include "arbitrated_fifos.sv"
`endif

`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif

module top(clk, rst, start, push, flat_data_in, reqs, quantums,
           empty, full, data_out, prop_signal);

   parameter NUM_REQS      =    `NUM_REQS,
             WIDTH         =    `FIFO_DWIDTH,
             DEPTH         =    `FIFO_DEPTH,
             QWID          =    `ARB_QWID,
             ABSTRACT_ARB  =    `ABSTRACT_ARB,
             FIFO_SEL      =    0;

   input                       clk, rst, start;
   input  [NUM_REQS-1:0]       push, reqs;
   input  [NUM_REQS*WIDTH-1:0] flat_data_in;
   input  [NUM_REQS*QWID-1:0]  quantums;
   output [NUM_REQS-1:0]       empty;
   output [NUM_REQS-1:0]       full;
   output [WIDTH-1:0]          data_out;
   output                      prop_signal;

   (* keep *)
   wire [NUM_REQS-1:0]         pop;
   (* keep *)
   wire                        data_out_vld;

   // unpack data for easier handling
   wire [WIDTH-1:0]            data_in  [NUM_REQS-1:0];

   generate
      genvar                   i;
      for(i=0; i < NUM_REQS; i=i+1) begin : unpack_data
         assign data_in[i]  = flat_data_in[(i+1)*WIDTH-1:i*WIDTH];
      end
   endgenerate


   arbitrated_fifos
     #(.NUM_REQS(NUM_REQS),
       .WIDTH(WIDTH),
       .DEPTH(DEPTH),
       .QWID(QWID),
       .ABSTRACT(ABSTRACT_ARB))

   af (.clk(clk),
       .rst(rst),
       .push(push),
       .reqs(reqs),
       .gnt(pop),
       .flat_data_in(flat_data_in),
       .quantums(quantums),
       .empty(empty),
       .full(full),
       .data_out(data_out));

   SimpleScoreboard
     #(.DEPTH(DEPTH),
       .WIDTH(WIDTH))

   sb (.clk(clk),
       .rst(rst),
       .push(push[FIFO_SEL]),
       .pop(pop[FIFO_SEL]),
       .start(start),
       .data_in(data_in[FIFO_SEL]),
       .data_out(data_out),
       .data_out_vld(data_out_vld),
       .prop_signal(prop_signal));

`ifdef FORMAL
   reg initstate = 1;

 //  assume property (@(posedge clk) (!empty[0] && push[0]) |=> !push[1]);

   always @(posedge clk) begin
      initstate <= 0;
   end

   always @* begin
      assume (initstate == rst);
      if (!initstate) begin
         assume (!empty[0] || !pop[0]);
         assume (!empty[1] || !pop[1]);
         assume (!full[0] || !push[0]);
         assume (!full[1] || !push[1]);
         assert (prop_signal);
      end
   end
`endif

endmodule // top
