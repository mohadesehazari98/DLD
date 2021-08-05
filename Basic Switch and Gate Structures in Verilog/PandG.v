`timescale 1ns/1ns
module PandG(input[3:0]A,B,output GG,PP);
  wire [4:0]ic;
  wire [3:0]S,G,P;
  
  fourbitadd PG(A[3:0],B[3:0],ic[0], S[3:0],ic[1],G[3:0],P[3:0]);
    wire i,j,k,m,n;
   assign i = (( P[1] & G[0]) | (G[1]));
   assign j = (P[2] & P[3]);
   assign k = ((P[3] & G[2]) | G[3]);
   assign GG = ((i & j) | k);
   assign m = ( P[3] & P[2]);
   assign n = ( P[1] & P[0]);
   assign PP = (n & m);
    assign ic[0]=0;
endmodule

