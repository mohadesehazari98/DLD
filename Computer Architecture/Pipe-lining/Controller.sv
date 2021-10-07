`timescale 1 us/ 1 us
module controller(input [31:0]Instruction, input zero, output reg RegDst,Jal,ALUSrc,MemToReg,PCSrc,Jump,JR,RegWrite,MemRead,MemWrite,output reg [2:0]ALUop);
  
  reg [5:0]Opcode,Func;
  
  always@(Instruction) begin
    
    RegDst=0; Jal=0; ALUSrc=0; MemToReg=0; PCSrc=0; Jump=0; JR=0; RegWrite=0; MemRead=0; MemWrite=0; ALUop=3'b000;
    Opcode=Instruction[31:26];
    Func=Instruction[5:0];
    
    case(Opcode)
      
      0: begin
        if(Func==32)begin                               // add
          RegDst=1; RegWrite=1; ALUop=3'b010;end
        
        else if(Func==34)begin                          // sub
          RegDst=1; RegWrite=1; ALUop=3'b011;end
        
        else if(Func==42)begin                          // slt        
          ALUSrc=1; RegWrite=1; ALUop=3'b111;end
        
        else if(Func==8) JR=1;                          // jr
    end
    
     2: Jump=1;                                         // j
     
     3: begin Jal=1; Jump=1; end                        // jal
     
     4: begin if(zero==1)PCSrc=1;                       // beq
         ALUop=3'b011; end
     
     5: begin if(zero==0)PCSrc=1;                       // bne
         ALUop=3'b011; end 
      
     8: begin ALUSrc=1;RegWrite=1;ALUop=3'b010;end      // addi
     
     11: begin ALUSrc=1;RegWrite=1;ALUop=3'b111;end     // slti         
     
     35: begin ALUSrc=1; MemToReg=1; RegWrite=1;        // lw
     MemRead=1; ALUop=3'b011; end
       
     43: begin ALUSrc=1; MemWrite=1; ALUop=3'b010;end   // sw
         
    endcase
    
  end
  
endmodule
