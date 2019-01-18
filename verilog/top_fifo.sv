// Code your design here
`define DESIGN

`ifndef OPTIONS
 `include "options.v"
`endif

`ifndef FIFO
 `include "fifo.sv"
`endif

`ifndef DWRR
 `include "DWRR.sv"
`endif

`ifndef SIMPLE_SCOREBOARD
 `include "SimpleScoreboard.sv"
`endif


module top_fifo(clk, rst, push, pop, start, data_in,
                       data_out_vld, prop_signal);
  parameter DEPTH = `FIFO_DEPTH;
  parameter WIDTH = `FIFO_DWIDTH;

  input wire                                clk;
  input wire                                rst;
  input wire                                push;
  input wire                                pop;
  input wire                                start;
  input wire [WIDTH-1:0]                    data_in;

  output wire                               data_out_vld;
  output wire                               prop_signal;

  wire [WIDTH-1:0]                          data_out;

  (* keep *)
  wire                                      empty;
  (* keep *)
  wire                                      full;

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
       .prop_signal(prop_signal));

  fifo
    #(.WIDTH(WIDTH), .DEPTH(DEPTH))
   f (.clk(clk),
      .rst(rst),
      .push(push),
      .pop(pop),
      .data_in(data_in),
      .full(full),
      .empty(empty),
      .data_out(data_out));

endmodule
