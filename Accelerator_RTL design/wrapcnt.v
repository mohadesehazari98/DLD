`timescale 1ns/1ns
module wrapcnt(input clk,rst,drdy,done,cntco,output reg start,dacc,free,rstcnt,inccnt,ld8);
reg [2:0]ps,ns;
always@(drdy,done,cntco,ps) begin
start=0; dacc=0; free=0; ns=3'b 000;
case(ps)
3'b 000:begin free=1'b 1; if(~drdy) ns=3'b 000; else ns=3'b 001; end
3'b 001:begin {rstcnt,ld8}=2'b 11; ns=3'b 010; end
3'b 010:begin dacc=1'b 1; if(drdy) ns=3'b 010; else ns=3'b 011; end
3'b 011:begin if(~drdy) ns=3'b 011; else ns=3'b 100; end
3'b 100:begin start=1'b 1; ns=3'b 101;end
3'b 101:begin inccnt=done?1:0; ns= 3'b 110; end
3'b 110:begin if(~done) ns=3'b 110; else ns=~cntco? 3'b 100: 3'b 000; end
default ns=3'b 000;
endcase
end
always@(posedge clk, posedge rst) begin
if(rst) ps<=3'b 000;
else ps<=ns;
end
endmodule 
