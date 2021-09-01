`timescale 1ns/1ns
module for_SW(input[12:0] SW,output[1:0] A,output[2:0] B,output[7:0] C);
  assign A=SW[12:11];
  assign B=SW[10:8];
  assign C=SW[7:0];
endmodule