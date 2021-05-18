`timescale 1ns/1ns
module CLA(input [3:0]A,B, c0,output GG,PP,c4,output [3:0]S);
  wire c42;
  wire [3:0]P,G;
  wire G2,P2;
  
  fourbitadd FA1(A[3:0],B[3:0],c0,S[3:0],c42,P[3:0],G[3:0]);
  PandG FA2(A[3:0] , B[3:0] , GG , PP);
  PandG FA3(A[3:0],B[3:0],G2,P2);
   assign c4 = ((P2 & c0 ) | G2);
  endmodule 