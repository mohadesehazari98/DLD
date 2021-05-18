`timescale 1ns/1ns
module fulladder(input ai,bi,c0,output si,c1,pi,gi);
  wire j,i,m,n;
  XOR1 #(43) G1(si,j,c0);
  XOR1 #(43) G2(j,ai,bi);
  OR1 #(10,14) G3(i,ai,bi);
  AND2 #(13,17) G4(m,i,c0);
  AND2 #(13,17) G5(n,ai,bi);
  OR1 #(10,14) G6(c1,m,n);
  assign pi=i , gi=n;
endmodule 
  
  
 