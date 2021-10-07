`timescale 1 us/ 1 us
module RegFile(input clk,input rst, input RegWrite,input [4:0]ReadReg1,ReadReg2,WriteReg,input [31:0]WriteData,output reg [31:0]ReadData1,ReadData2);
  
  reg [31:0]RegisterFile[0:31];

  
  always@(posedge clk,WriteReg)begin
    RegisterFile[0]= 0;     // R0=0
    ReadData1=RegisterFile[ReadReg1];
    ReadData2=RegisterFile[ReadReg2];
    if(RegWrite)RegisterFile[WriteReg]=WriteData;
  end
  
endmodule


