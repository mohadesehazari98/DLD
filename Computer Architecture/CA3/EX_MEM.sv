`timescale 1 us/ 1 us
module EX_MEM(input clk,rst,MemReadEX,MemWriteEX,PCSrcEX,MemToRegEX,RegWriteEX,input [31:0]AddOutEX,ALUResult,ReadData2EX,input [4:0]RegDstEX,output reg [31:0]AddOutMEM,AddressMEM,WriteDataMEM,output reg [4:0]RegDstMEM,output reg MemReadMEM,MemWriteMEM,PCSrcMEM,MemToRegMEM,RegWriteMEM);
  
  always@ (posedge clk,posedge rst) begin
    if(rst)begin  AddOutMEM=0; AddressMEM=0; WriteDataMEM=0; RegDstMEM=0;
    MemReadMEM=0; MemWriteMEM=0; PCSrcMEM=0; MemToRegMEM=0; RegWriteMEM=0; end
    else begin  AddOutMEM=AddOutEX; AddressMEM=ALUResult; WriteDataMEM=ReadData2EX; RegDstMEM=RegDstMEM; 
    MemReadMEM=MemReadEX; MemWriteMEM=MemWriteEX; PCSrcMEM=PCSrcEX; MemToRegMEM=MemToRegEX; RegWriteMEM=RegWriteEX; end
end
endmodule

