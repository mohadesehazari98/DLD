`timescale 1ns/1ns
module Dlatchreset(input rst,D,CLK, output Q);
  wire w,i,k,y;
  reg Rst;
always @(posedge CLK) begin
  if(rst) Rst <= 1'b 0;
else Rst <= 1'b 1; 
    end
assign #(7) w= ~D;
assign #(7) i= ~((w&CLK)&Rst);
assign #(7) k= ~(D&CLK);
assign #(7) Q= ~((k&y)&Rst);
assign #(7) y= ~(Q&i); 
endmodule