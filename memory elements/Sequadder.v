`timescale 1ns/1ns
module Sequadder(input [7:0]A , input clk , rst ,output [7:0]S,output cout);
  reg [7:0]B;
  reg cin=0; 
  assign #(182) S = A + B + cin;
  assign cout = A[7];
    always @(posedge clk) begin
    cin <= cout;
    if(rst) B <= 8'b 0;
    else B <= S ;
    end
  endmodule 
  