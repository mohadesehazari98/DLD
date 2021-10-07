`timescale 1 us/ 1 us
module MEM_WB(input clk,rst,MemToRegMEM,RegWriteMEM,input [31:0]AddressMEM,ReadDataMEM,input [4:0]RegDstMEM,output reg [31:0]AddressWB,ReadDataWB,output reg [4:0]RegDstWB,output reg MemToRegWB,RegWriteWB);
  
  always@ (posedge clk,posedge rst) begin
    if(rst)begin AddressWB=0; ReadDataWB=0; RegDstWB=0;
    MemToRegWB=0; RegWriteWB=0; end
    else begin AddressWB=AddressMEM; ReadDataWB=ReadDataWB; RegDstWB=RegDstMEM;
    MemToRegWB=MemToRegMEM; RegWriteWB=RegWriteMEM; end
end
endmodule

