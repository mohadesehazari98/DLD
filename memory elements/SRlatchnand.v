`timescale 1ns/1ns
module SRlatchnand(input S,R,CLK, output Q);
wire i,k,y;
assign #(7) i=(S| ~CLK);
assign #(7) k=(R| ~CLK);
assign #(7) Q= ~(i&y);
assign #(7) y= ~(Q&k); 
endmodule