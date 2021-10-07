`timescale 1ns/1ns
module MUX_2_8(input select,input[7:0] A,B,output[7:0] C);
  assign C=select?B:A;
endmodule
  
