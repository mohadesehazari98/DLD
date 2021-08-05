`timescale 1ns/1ns
module partnine(input [7:0]A , input clk , rst ,output [7:0]S,output cout);
  wire [7:0]B;
  reg cin=0; 
  assign #(182) S = A + B + cin;
  assign cout = A[7];
   always @(posedge clk) begin
    cin <= cout;
  end
  eightbitreg SFA3(S,clk,rst,B);
  endmodule