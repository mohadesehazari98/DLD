`timescale 1ns/1ns
module AND2(input a,b , output w );
  wire i;
  not #(5,7) G2(w,i);
  nand #(10,8) G1(i,a,b);
endmodule
