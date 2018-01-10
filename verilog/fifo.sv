`define FIFO
`ifndef UTILS
 `include "utils.sv"
`endif

module FIFO(clk, rst, push, pop, data_in,
            full, empty, data_out);
  parameter WIDTH = 8;
  parameter DEPTH = 8;
  parameter PTRWID = $clog2(DEPTH);
  
  input wire clk;
  input wire rst;
  input wire push;
  input wire pop;
  input wire [WIDTH-1:0] data_in;
  
  output wire full;
  output wire empty;
  output wire [WIDTH-1:0] data_out;
  
  wire clkEn = push | pop | rst;
  
  //************** wrPtr logic *****************// 
   
  logic [PTRWID-1:0] wrPtr;
  
  wire  [PTRWID-1:0] wrPtrNxt;
  
  assign wrPtrNxt = rst ? 0 :
                        push ? wrPtr + 1 :
                             wrPtr;
  
  FF #(.WIDTH(PTRWID)) ff_wrPtr (.clk(clk),
                                 .en(clkEn),
                        		 .D(wrPtrNxt),
                        		 .Q(wrPtr)
  								);
  
  //************** rdPtr logic ****************//
  
  logic [PTRWID-1:0] rdPtr;
  wire  [PTRWID-1:0] rdPtrNxt;
  
  assign rdPtrNxt = rst ? 0 :
                        pop ? rdPtr + 1 :
                            rdPtr;
 
  FF #(.WIDTH(PTRWID)) ff_rdPtr (.clk(clk),
                                 .en(clkEn),
                                 .D(rdPtrNxt),
                                 .Q(rdPtr));

  //************** empty and full logic ********//
  assign empty = rdPtr == wrPtr;
  assign full = (rdPtr[PTRWID-2:0] == wrPtr[PTRWID-2:0]) & (rdPtr[PTRWID-1] != wrPtr[PTRWID-1]);
  
  //************** latch entries ***************//
    
  wire [WIDTH-1:0] entries [DEPTH-1:0];
  
  genvar i;
  generate
    for(i = 0; i < DEPTH; i = i + 1) begin : entry_gen
      FF #(.WIDTH(WIDTH)) ff_entry_inst(.clk(clk),
                                        .en(wrPtr == i),
                                        .D(data_in),
                                        .Q(entries[i])
      									);
    end
  endgenerate
  
  //******************** output *******************//
  assign data_out = entries[rdPtr];

endmodule
