`timescale 1ns/1ns
module PP(input p0,p1,p2,p3, output W );
  wire w , f, t;
  AND2 #(13,17) G1(t,p0,p1);
  AND2 #(13,17) G2(f,p2,p3);
  AND2 #(13,17) G3(w,t,f);
endmodule

