`timescale 1ns/1ns
module MUX_2(input select,input[4:0] A,B,output[4:0] C);
  assign C=select?B:A;
endmodule
  
  
