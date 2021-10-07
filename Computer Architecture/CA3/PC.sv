`timescale 1 us/ 1 us
module PC(input clk,rst,PCWrite,input [31:0]PCin,output reg [31:0]PCout);
  always@ (posedge clk,posedge rst) begin
    if(rst) PCout=32'b 000000;
    else if(!PCWrite) PCout=PCin;
  end
endmodule  

