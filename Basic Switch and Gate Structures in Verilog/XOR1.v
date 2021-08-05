`timescale 1ns/1ns
module XOR1(input a , b , output w);
  wire m ,n , i , j;
  not #(5,7) G1(m,a);
  not #(5,7) G2(n,b);
  AND2 #(13,17) G3(i,m,b);
  AO2 #(19,17) G4(w,n,a,i);
endmodule 