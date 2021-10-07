`timescale 1 us/ 1 us
module ID_EX(input clk,rst,HazardMUX,ALUSrcID,RegDstID,MemReadID,MemWriteID,PCSrcID,MemToRegID,RegWriteID,input [2:0]ALUOpID,input [31:0]ReadData1ID,ReadData2ID,AddoutID,SEID,input [4:0]Inst1ID,Inst2ID,Inst3ID,output reg [31:0]ReadData1EX,ReadData2EX,AddEX,SEEX,output reg [4:0]Inst1EX,Inst2EX,Inst3EX,output reg [2:0]ALUOpEX,output reg ALUSrcEX,RegDstEX,MemReadEX,MemWriteEX,PCSrcEX,MemToRegEX,RegWriteEX);
  
  always@ (posedge clk,posedge rst) begin
    if(rst || HazardMUX)begin  ReadData1EX=0; ReadData2EX=0; AddEX=0; SEEX=0; Inst1EX=0; Inst2EX=0; Inst3EX=0;
    ALUOpEX=0; ALUSrcEX=0; RegDstEX=0; MemReadEX=0; MemWriteEX=0; PCSrcEX=0; MemToRegEX=0; RegWriteEX=0; end
    else begin ReadData1EX=ReadData1ID; ReadData2EX=ReadData2ID; AddEX=AddoutID; SEEX=SEID; Inst1EX=Inst1ID; Inst2EX=Inst2ID; Inst3EX=Inst3ID;
    ALUOpEX=ALUOpID; ALUSrcEX=ALUSrcID; RegDstEX=RegDstID; MemReadEX=MemReadID; MemWriteEX=MemWriteID; PCSrcEX=PCSrcID; MemToRegEX=MemToRegID; RegWriteEX=RegWriteID; end
end
endmodule

