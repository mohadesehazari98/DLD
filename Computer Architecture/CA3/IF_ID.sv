`timescale 1 us/ 1 us
module IF_ID(input clk,rst,IF_IDWrite,input [31:0]AddoutIF,input [31:0]InstIF,output reg [31:0]AddoutID,InstID);
  
  always@ (posedge clk,posedge rst) begin
    if(rst)begin  InstID=0; AddoutID=0; end
    else if(!IF_IDWrite) begin AddoutID=AddoutIF; InstID=InstIF; end
end
endmodule
