`timescale 1ns/1ns
module PandGcal(input [15:0]A,B , input c0 ,output [4:0]c);
  wire [3:0]GG,PP;
  genvar j;
  generate for (j=0;j<=12;j=j+4) begin: row
    PandG cal(A[(j+3):j],B[(j+3):j],GG[(j/4)],PP[(j/4)]);
    AO2 #(19,17) G1(c[j+4],PP[j],c[j],GG[j]);
  end
endgenerate
assign c[0]= c0;
endmodule
    