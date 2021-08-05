`timescale 1ns/1ns
module multiplier(input [15:0]treg,muxbus, output [15:0] mulbus);
  assign mulbus= muxbus * treg;
endmodule