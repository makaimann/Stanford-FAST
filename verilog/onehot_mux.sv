// credit to: https://stackoverflow.com/users/4111268/campkeith
// from question: https://stackoverflow.com/questions/19875899/how-to-define-a-parameterized-multiplexer-using-systemverilog

`define ONEHOT_MUX

module onehot_mux
  #( parameter int unsigned inputs = 4,
     parameter int unsigned width = 8 )
   ( output logic [width-1:0]  out,
     input logic  [inputs-1:0] sel,
     input logic [width-1:0]   in[inputs] );

   always_comb
     begin
        // outputs zero if not selecting
        out = {width{1'b0}};
        for (int unsigned index = 0; index < inputs; index++)
          begin
             out |= {width{sel[inputs - index - 1]}} & in[index];
          end
     end
endmodule
