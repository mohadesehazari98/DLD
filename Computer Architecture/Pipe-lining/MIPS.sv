`timescale 1 us/ 1 us
module MIPS(input clk,rst);
  
  wire RegDst,Jal,ALUSrc,MemToReg,PCSrc,Jump,JR,RegWrite,MemRead,MemWrite,zero;
  wire [2:0]ALUop;
  wire [31:0]Instruction;
  
  DataPath     dataPath(clk,rst,RegDst,Jal,ALUSrc,MemToReg,PCSrc,Jump,JR,RegWrite,MemRead,MemWrite,ALUop,zero,Instruction);
  controller   control(Instruction,zero,RegDst,Jal,ALUSrc,MemToReg,PCSrc,Jump,JR,RegWrite,MemRead,MemWrite,ALUop);
  
endmodule

