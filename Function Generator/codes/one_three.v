`timescale 1ns/1ns
module one_three(input[2:0] A,output A_1,A_2,A_3);
  assign A_1=A[0];
  assign A_2=A[1];
  assign A_3=A[2];
endmodule