`timescale 1ns/1ns
module fourbitadd(input[3:0]A,B,input c0,output[3:0]S,output c4,output[3:0]G,P);
  wire [4:0]ic;
  genvar j;
  generate  for(j=0;j<=3;j=j+1) begin:row
    fulladderasi FA(A[j],B[j],ic[j],S[j],ic[j+1],G[j],P[j]);
  end
endgenerate
assign c4 = ic[4];
assign ic[0]=c0;
endmodule
    
