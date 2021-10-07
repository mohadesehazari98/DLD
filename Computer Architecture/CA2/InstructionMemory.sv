`timescale 1 us/ 1 us
module InstMem(input [31:0]Address, output reg [31:0]Instruction);
  reg [31:0]InstMemory[0:31];
  
  initial begin
    // Inst. Mem. Initialization
    InstMemory[0]=32'b10001100000000010000001111101000;     // lw  R1,1000(R0)
    //
  end
  
  always @(Address) begin
		Instruction = InstMemory[Address];
	end
endmodule

