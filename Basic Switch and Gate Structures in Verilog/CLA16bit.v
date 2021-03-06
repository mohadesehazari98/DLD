`timescale 1ns/1ns
module CLA16bit(input [15:0]A,B, input c0 , output [3:0]G3,P3 , output c16 , output [15:0]S);
  wire [16:0]ic;
  wire [12:0]P,G;
  assign ic[0]= c0 , c16 = ic[16];
genvar j;
generate for(j=0;j<=12;j=j+4) begin:row 
 CLA2 LA(A[(j+3):j] , B[(j+3):j] , ic[j] ,G[j],P[j],ic[(j+4)],S[(j+3):j]);
 end
 endgenerate  
assign G3[0]=G[0] , P3[0]=P[0] , G3[1]=G[4] ,P3[1]=P[4],G3[2]=G[8],P3[2]=P[8],G3[3]=G[12],P3[3]=P[12];
endmodule 



