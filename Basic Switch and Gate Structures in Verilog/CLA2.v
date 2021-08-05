`timescale 1ns/1ns
module CLA2(input [3:0]A,B, input c0,output GG,PP,c4,output [3:0]S);
  wire [4:0]cc;
  genvar i;
  generate for(i=0; i<=3 ; i=i+1) begin:row
  assign #(86) S[i] = A[i] ^ B[i] ^ cc[i];
  assign #(62) cc[(i+1)] = ( (A[i]) & (B[i])) | ((A[i]) & (cc[i])) | ((B[i]) & (cc[i]));
end 
endgenerate
PandG FA2(A[3:0] , B[3:0] , GG , PP);
   assign c4 = (( PP & c0) | GG);
 assign cc[0]=c0;
 endmodule