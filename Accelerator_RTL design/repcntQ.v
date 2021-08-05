`timescale 1ns/1ns
module repcnt(input rst,clk,input ld0cnt,inccnt,output rco , output reg [2:0]repcnt);
always@(posedge clk, posedge rst) begin 
if(rst) repcnt<=3'b 0;
else if(ld0cnt) repcnt<=3'b 0;
else if(inccnt) repcnt<= repcnt+1;
end
endmodule  


