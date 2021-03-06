`timescale 1ns/1ns
module PandG2(input[3:0]A,B,output GG,PP);
  wire [4:0]ic;
  wire [3:0]S,G,P;
  fourbitadd PG(A[3:0],B[3:0],ic[0], S[3:0],ic[1],G[3:0],P[3:0]);
    wire i,j,k,m,n,w,f;
   AO2 #(19,17) G1(i,P[1],G[0],G[1]);
   AND2 #(13,17) G2(j,P[2],P[3]);
   AO2 #(19,17) G3(k,P[3],G[2],G[3]);
   AO2 #(19,17) G4(w,i,j,k);
   assign GG=w , PP=f;
   AND2 #(13,17) G5(m,P[3],P[2]);
   AND2 #(13,17) G6(n,P[1],P[0]);
   AND2 #(13,17) G7(f,n,m);
    assign ic[0]=0;
endmodule

