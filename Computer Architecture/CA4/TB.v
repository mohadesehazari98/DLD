`timescale 1ns/1ns
module TB();
  reg clk=1'b0 ,rst=1'b0;    
  reg [2:0]Opcode=3'b 000;           
  wire PCwrite,PCcond,MemDst,MemRead,Memwrite,loadI,J,StackDst,push,pop,tos,AlUSrcB,LoadAlU;
  wire [1:0]AlUSrcA,AlUop;
  Controller UUT(clk,rst,Opcode,PCwrite,PCcond,MemDst,MemRead,Memwrite,loadI,J,StackDst,push,pop,tos,AlUSrcB,LoadAlU,AlUSrcA,AlUop);
    initial begin
    #100 rst=1'b1;
    #100 rst=1'b0;
    #10000000
    $stop;
  end 
  //clk
  always
  begin
  clk=1'b0;
  clk= #20 1'b1;
  #20;
  end
  //Opcode
  always
  begin
  Opcode=3'b 000;
  #500 Opcode=Opcode+3'b 001;
  #500;
  end
endmodule
    

