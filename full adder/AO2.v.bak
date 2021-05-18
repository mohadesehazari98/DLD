`timescale 1ns/1ns
module AO2(input a,b,c,output w);
  wire i,j;
  not #(5,7) G2(j,c);
  nand #(10,8) G1(i,a,b);
  nand #(10,8) G3(w,i,j);
endmodule