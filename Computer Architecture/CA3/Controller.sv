`timescale 1ns/1ns
module controller(input clk,rst,input [31:0]Instruction, input zero, output reg ALUSrcID,RegDstID,MemReadID,MemWriteID,PCSrcID,MemToRegID,RegWriteID,output reg [2:0]ALUopID);
reg [1:0]ps,ns;
reg [5:0]Opcode,Func;
always@(Instruction,zero,ps) begin
  ALUSrcID=0; RegDstID=0; MemReadID=0; MemWriteID=0; PCSrcID=0; MemToRegID=0; RegWriteID=0; ALUopID=0;
  Opcode=Instruction[31:26];
  Func=Instruction[5:0];
  ns=2'b 00;
  case(ps)
  2'b 00:begin
    case(Opcode)
      6'b 000000: begin
        if(Func==6'b 100000)begin                               // add
          RegDstID=1; RegWriteID=1; ALUopID=3'b010;end
        else if(Func==6'b 100010)begin                          // sub
          RegDstID=1; RegWriteID=1; ALUopID=3'b011;end
        else if(Func==6'b 101010)begin                          // slt        
          ALUSrcID=1; RegWriteID=1; ALUopID=3'b111;end
        
        //else if(Func==6'b 001000) JR=1;                          // jr
        //end
      //6'b 000010: Jump=1;                                         // j
      //6'b 000011: begin Jal=1; Jump=1; RegWrite=1; end                        // jal
      //6'b 000100: begin
        if(zero==1)PCSrcID=1;                       // beq
        end
     
      6'b 000101: begin if(zero==0)PCSrcID=1;                       // bne
        ALUopID=3'b011; end 
      
      6'b 001000: begin ALUSrcID=1;RegWriteID=1;ALUopID=3'b010;end      // addi
      6'b 001011: begin ALUSrcID=1;RegWriteID=1;ALUopID=3'b111;end     // slti         
      6'b 100011: begin ALUSrcID=1; MemToRegID=1; RegWriteID=1;        // lw
        MemReadID=1; ALUopID=3'b011; end
      6'b 101011: begin ALUSrcID=1; MemWriteID=1; ALUopID=3'b010;end   // sw
    endcase
    
    ns=2'b 00;
    end
    
    default ns=2'b 00;
    
  endcase
end

always@(posedge clk,posedge rst) begin
if(rst) ps<= 2'b 00;
else ps<=ns;
end

endmodule  

