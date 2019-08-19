module round_robin_selector(en, requests, sel);

   parameter WIDTH=4,
             START=2;

   input                     en;
   input [WIDTH-1:0]         requests;
   output logic [WIDTH-1:0]  sel;

   logic [WIDTH-1:0]         requests_rotated;

   always_comb begin
      if(START != 0)
        requests_rotated = {requests[START-1:0], requests[WIDTH-1:START]};
      else
        requests_rotated = requests;
   end

   logic [WIDTH-1:0] sel_rotated;

   assign sel_rotated[0] = requests_rotated[0];

   genvar           i;
   generate
      for(i=1; i < WIDTH; i=i+1) begin
         // probably not requests -- actually sel?
	 always_comb begin
           sel_rotated[i] = requests_rotated[i] & ~(|sel_rotated[i-1:0]);
	 end
      end
   endgenerate

   always_comb begin
      if (!en)
	sel = {WIDTH{1'b0}};
      else if (START != 0)
        sel = {sel_rotated[WIDTH-START-1:0], sel_rotated[WIDTH-1-:START]};
      else
        sel = sel_rotated;
   end

endmodule // round_robin_selector
