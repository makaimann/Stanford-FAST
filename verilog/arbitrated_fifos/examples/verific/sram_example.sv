// credit to: https://en.wikipedia.org/wiki/SystemVerilog
// for Memory and SRAM

virtual class Memory;
    virtual function bit [31:0] read(bit [31:0] addr); endfunction
    virtual function void write(bit [31:0] addr, bit [31:0] data); endfunction
endclass

class SRAM #(parameter AWIDTH=8, parameter DWIDTH=8) extends Memory;   
    logic [DWIDTH-1:0] mem [1<<AWIDTH];

    virtual function bit [DWIDTH-1:0] read(bit [DWIDTH-1:0] addr);
        return mem[addr];
    endfunction

    virtual function void write(bit [DWIDTH-1:0] addr, bit [DWIDTH-1:0] data);
        mem[addr] = data;
    endfunction
endclass

module top (clk, toggle);
   input wire clk;
   input wire toggle;

   logic [3:0] addr = 0;
   
   SRAM #(.AWIDTH(4), .DWIDTH(4)) s;

   wire [3:0] addrm1;
   assign addrm1 = addr - 1;

   always @(posedge clk) begin
      addr += 1;
   end


   always @(posedge clk) begin
      if(toggle) begin
	 s.write(addr, addr);
      end
   end

   assert property( @ (posedge clk) toggle |=> (s.read(addrm1) == (addrm1)));
   
endmodule // top
