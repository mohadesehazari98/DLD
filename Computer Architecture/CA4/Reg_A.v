`timescale 1ns/1ns
module Reg_A(input clk,rst,input[7:0] inreg,output reg[7:0] outreg);
  always@ (posedge clk,posedge rst) begin
    if(rst) outreg=8'b 00000000;
    else  outreg=inreg;
  end
endmodule  
