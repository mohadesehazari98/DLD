`timescale 1ns/1ns
module masterslaveD(input rst,D,CLK, output Q);
  wire Q1;
Dlatchreset SFA1(rst,D,CLK,Q1);
Dlatchreset SFA2(rst,Q1,~CLK,Q);
endmodule