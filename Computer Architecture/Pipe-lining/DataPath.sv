`timescale 1 us/ 1 us
module DataPath(input clk,rst,input RegDst,Jal,ALUSrc,MemToReg,PCSrc,Jump,JR,RegWrite,MemRead,MemWrite,input [2:0]ALUop,output zero,output [31:0]Instruction);
  
  wire [31:0]PCout,WriteData,ReadData1,ReadData2,memReg,mout4,ALUResult,SEout,ReadDataMem,add1out,add2out,PCMUX,JumpMUX,JRMUX;
  wire [4:0]WriteReg,mout2;
  
  PC  pc(clk,rst,JRMUX,PCout);
  InstMem  instMem(PCout,Instruction);                              
  RegFile  regFile(RegWrite,Instruction[25:21],Instruction[20:16],WriteReg,WriteData,ReadData1,ReadData2);
  MUX5     m1(mout2,31,Jal,WriteReg);
  MUX5     m2(Instruction[20:16],Instruction[15:11],RegDst,mout2);
  MUX32    m3(memReg,{PCout[31:28],Instruction[25:24],(Instruction[25:0]<<2)},Jal,WriteData);
  ALU      alu(ReadData1,mout4,ALUop,ALUResult,zero);
  MUX32    m4(ReadData2,SEout,ALUSrc,mout4);
  SE       se(Instruction[15:0],SEout);
  DataMem  dataMem(ALUResult,ReadData2,MemRead,MemWrite,ReadDataMem);
  MUX32    m5(ALUResult,ReadDataMem,MemToReg,memReg);
  adder32  add1(4,PCout,add1out);
  adder32  add2(add1out,(SEout<<2),add2out);
  MUX32    m6(add1out,add2out,PCSrc,PCMUX);
  MUX32    m7(PCMUX,{PCout[31:28],Instruction[25:24],(Instruction[25:0]<<2)},Jump,JumpMUX);
  MUX32    m8(JumpMUX,ReadData1,JR,JRMUX);
                     
  
endmodule

