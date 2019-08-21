module round_robin_selector(en, input_sel, allowed, sel);

   parameter WIDTH=4,
             SELW =$clog2(WIDTH),
             START=0;

   input en;
   input [SELW-1:0]          input_sel;
   input [WIDTH-1:0]         allowed;
   output logic [WIDTH-1:0]  sel;

   logic [WIDTH-1:0]         allowed_rotated;

   always_comb begin
      if(START != 0)
        allowed_rotated = {allowed[START-1:0], allowed[WIDTH-1:START]};
      else
        allowed_rotated = allowed;
   end

   logic [WIDTH-1:0] sel_rotated;

   assign sel_rotated[0] = (allowed_rotated[0] & ((input_sel == 0) || ~(|allowed_rotated[WIDTH-1:1])));

   genvar           i;
   generate
      for(i=1; i < WIDTH; i=i+1) begin
         // probably not allowed -- actually sel?
	       always_comb begin
            if(i <= WIDTH-1)
              sel_rotated[i] = allowed_rotated[i] & ~(|sel_rotated[i-1:0]) & ((i >= input_sel) || ~(|allowed_rotated[WIDTH-1:i+1]));
            else
              sel_rotated[i] = allowed_rotated[i] & ~(|sel_rotated[i-1:0]) & (i >= input_sel);
	       end
      end
   endgenerate

   always_comb begin
      if(!en)
        sel = {WIDTH{1'b0}};
      else if (START != 0)
        sel = {sel_rotated[WIDTH-START-1:0], sel_rotated[WIDTH-1-:START]};
      else
        sel = sel_rotated;
   end

endmodule // round_robin_selector
