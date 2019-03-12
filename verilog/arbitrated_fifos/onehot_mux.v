module onehot_mux(onehot,
                  i_data, o_data);

   parameter CHANNELS = 2,
              WIDTH   = 8;

   input [CHANNELS-1:0]        onehot;
   input [CHANNELS*WIDTH-1:0]  i_data;
   output [WIDTH-1:0]          o_data;

   wire [WIDTH-1:0]            unpacked_i_data [CHANNELS-1:0];

   generate
      genvar                   i;
      for(i = 0; i < CHANNELS; i = i+1) begin: unpack_inputs
         assign unpacked_i_data[i] = i_data[((i+1)*WIDTH)-1:i*WIDTH];
      end
   endgenerate

   wire [WIDTH-1:0] interm [CHANNELS-1:0];

   generate
      genvar           j;
      wire [WIDTH-1:0] temp;
      for(j = 0; j < CHANNELS; j = j+1) begin: select_output
         if (j > 0)
           assign interm[j] = (unpacked_i_data[j] & {WIDTH{onehot[j]}}) | interm[j-1];
         else
           assign interm[j] = unpacked_i_data[j] & {WIDTH{onehot[j]}};

      end
   endgenerate

   assign o_data = interm[CHANNELS-1];

endmodule // onehot_mux
