`timescale 1ns/1ns
module Dlatch3(input D,CLK, output Q);
  wire w,i,k,y;
assign #(7) w= ~D;
assign #(7) i= ~(w&CLK);
assign #(7) k= ~(D&CLK);
assign #(7) Q= ~(i&y);
assign #(7) y= ~(Q&k); 
endmodule