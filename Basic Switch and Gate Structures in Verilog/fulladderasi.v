`timescale 1ns/1ns
module fulladderasi(input ai,bi,c0,output si,c1,gi,pi);
  assign #(86) si = ai ^ bi ^ c0;
  assign #(62) c1 = ( ai & bi)|(ai & c0)|(bi&c0);
  assign #(19) pi = ai | bi;
  assign #(17) gi = ai & bi;
endmodule
