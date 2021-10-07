`timescale 1 us/ 1 us
`timescale 1 us/ 1 us
module DataMem(input clk,input [31:0]Address,WriteData, input MemRead,MemWrite, output reg [31:0]ReadData);
  reg [31:0]Memory[0:31];
  initial begin
    // Memory Initialization
    Memory[0]=10;
    Memory[1]=20;
    Memory[2]=30;
    Memory[3]=40;
    Memory[4]=50;
    Memory[5]=60;
    Memory[6]=70;
    Memory[7]=80;
    Memory[8]=90;
    Memory[9]=100;
    // The Sum must be 550
  end
  always @(posedge clk,Address,MemRead,MemWrite) begin
    if(MemRead)
		  ReadData = Memory[Address];
		else if(MemWrite)
		  Memory[Address]=WriteData; 
	end
endmodule
 

