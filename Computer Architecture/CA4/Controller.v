`timescale 1ns/1ns
module Controller(input clk,rst,input [2:0]Opcode,output reg PCwrite,PCcond,MemDst,MemRead,Memwrite,loadI,J,StackDst,push,pop,tos,AlUSrcB,LoadAlU,output reg[1:0] AlUSrcA,AlUop);
  reg [2:0]ps,ns;
  always@(Opcode,ps) begin
    {PCwrite,PCcond,MemDst,MemRead,Memwrite,loadI,J,StackDst,push,pop,tos,AlUSrcB,LoadAlU}= 14'b 0;
    AlUSrcA=2'b 00;
    AlUop=2'b 00;
    ns=4'b 0000;
    case(ps)
      4'b 0000:begin MemDst=1'b 0;MemRead=1'b 1;loadI=1'b 1;AlUSrcA=2'b 00;AlUSrcB=1'b 1;AlUop=2'b 00;J=1'b 0;PCwrite=1'b 1;ns=4'b 0001; end
      4'b 0001:begin if(Opcode==3'b 110) ns=4'b 0010; //JMP
                     else if(Opcode==3'b 111) ns=4'b 0011; //Jz
                     else if(Opcode==3'b 101) ns=4'b 0100; //pop
                     else if(Opcode==3'b 100) ns=4'b 0101; //push
                     else if(Opcode==3'b 000) ns=4'b 1001; //ADD
                     else if(Opcode==3'b 001) ns=4'b 1010; //SUB
                     else if(Opcode==3'b 010) ns=4'b 1011; //AND
                     else if(Opcode==3'b 011) ns=4'b 1100; //NOT
                     end
      4'b 0010:begin J=1'b 1;PCwrite=1'b 1; ns=4'b 0000; end
      4'b 0011:begin tos=1'b 1;AlUSrcA=2'b 10;AlUop=2'b 01; ns=4'b 0111; end
      4'b 0100:begin pop=1'b 1;MemDst=1'b 1;Memwrite=1'b 1; ns=4'b 0000; end 
      4'b 0101:begin MemDst=1'b 1;MemRead=1'b 1;loadI=1'b 1;ns=4'b 1000; end 
      4'b 0111:begin J=1'b 1;PCcond=1'b 1; ns=4'b 0000; end
      4'b 1000:begin StackDst=1'b 1;push=1'b 1; ns=4'b 0000; end
      4'b 1001:begin pop=1'b 1;AlUSrcA=2'b 01;AlUSrcB=1'b 0;AlUop=2'b 00; ns=4'b 1101; end
      4'b 1010:begin pop=1'b 1;AlUSrcA=2'b 01;AlUSrcB=1'b 0;AlUop=2'b 01; ns=4'b 1101; end
      4'b 1011:begin pop=1'b 1;AlUSrcA=2'b 01;AlUSrcB=1'b 0;AlUop=2'b 10; ns=4'b 1101; end
      4'b 1100:begin AlUSrcB=1'b 0;AlUop=2'b 11;StackDst=1'b 0; ns=4'b 1110; end
      4'b 1101:begin StackDst=1'b 0;LoadAlU=1'b 1; ns=4'b 1110; end
      4'b 1110:begin push=1'b 1; ns=4'b 0000; end
      default ns=4'b 0000;
    endcase
  end
always@(posedge clk,posedge rst) begin
if(rst) ps<= 4'b 0000;
else ps<=ns;
end

endmodule  
