`timescale 1ns/1ns
module GG(input p0,p1,p2,g0,g1,g2,c0, output N );
  wire w , f, m;
  AO2  #(19,17) G1(w,p2,g1,g2);
  AO2  #(19,17) G2(f,p0,c0,g0);
  AND2 #(13,17) G3(m,p2,p1);
  AO2  #(19,17) G4(N,w,f,m);
endmodule
