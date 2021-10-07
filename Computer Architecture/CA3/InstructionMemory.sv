`timescale 1 us/ 1 us
module InstMem(input clk,input [31:0]Address, output reg [31:0]Instruction);
  reg [31:0]InstMemory[0:31];
  
  initial begin
    // Inst. Mem. Initialization
    //InstMemory[0]=32'b10001100000000010000000000000000;     // lw    R1,0(R0)
    InstMemory[1]=32'b00100000000101000000000000000001;     // addi  R20,R0,1
    //InstMemory[2]=32'b00101110100010100000000000001010;     // slti  R10,R20,10           Loop
    //InstMemory[3]=32'b00010001010000000000000000000100;     // beq   R10,R0,EndLoop (8)
    //InstMemory[4]=32'b10001110100000100000000000000000;     // lw    R2,0(R20)
    //InstMemory[5]=32'b00000000010000010000100000100000;     // add   R1,R2,R1
    //InstMemory[6]=32'b00100010100101000000000000000001;     // addi  R20,R20,1
    //InstMemory[7]=32'b00001000000000000000000000000010;     // j     Loop
    //InstMemory[8]=32'b10101100000000010000000000010000;     // sw    R1,16(R0)            EndLoop
  
    // Calculate sum of Memory[0:9] and store it to Memory[16]
  end
  
  always @(posedge clk,Address) begin
		Instruction = InstMemory[Address];
	end
endmodule


