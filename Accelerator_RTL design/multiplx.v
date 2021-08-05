`timescale 1ns/1ns
module multiplx(input rsel,xsel, input[15:0] repbus,xreg,output [15:0] muxbus);
  assign muxbus=(rsel ? repbus : (xsel ? xreg :16'b 0)) ;
endmodule
