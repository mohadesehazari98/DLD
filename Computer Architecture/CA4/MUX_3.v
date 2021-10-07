`timescale 1ns/1ns
module MUX_3(input[1:0] select,input[7:0] A,B,C,output[7:0] D);
  assign D=select[1]?C:(select[0]?B:A);
endmodule
  
