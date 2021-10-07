`timescale 1 us/ 1 us
module DataMem(input [31:0]Address,WriteData, input MemRead,MemWrite, output reg [31:0]ReadData);
  reg [31:0]Memory[0:31];
  initial begin
    // Memory Initialization
    Memory[1000]=1;
    Memory[1001]=2;
    Memory[1002]=3;
    Memory[1003]=4;
    Memory[1004]=5;
    Memory[1005]=6;
    Memory[1006]=7;
    Memory[1007]=8;
    Memory[1008]=9;
    Memory[1009]=10;
    // The Sum must be 55
  end
  always @(Address,MemRead,MemWrite) begin
    if(MemRead)
		  ReadData = Memory[Address];
		else if(MemWrite)
		  Memory[Address]=WriteData; 
	end
endmodule
 
