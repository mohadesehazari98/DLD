`timescale 1ns/1ns
module coscnt(input clk,rst,TLTY,repcnt0,start,output reg done,ldx,rsel,xsel,ldt,ld1,ldr,en,addsub,inccnt,ld0cnt);
reg [2:0]ps,ns;
always@(TLTY,repcnt0,start,ps) begin
done = 0; ldx=0; rsel=0; xsel=0; ldt=0; ld1=0; ldr=0; en=0; addsub=1'b 1;
ns=3'b 0;
case(ps)
  3'b 000:begin done=1'b 1; if(~start) ns=3'b 000; else ns=3'b 001; end
  3'b 001:begin if(start) ns=3'b 001; else ns=3'b 010; end
  3'b 010:begin {ldx,ld1,ld0cnt}=3'b 111; ns=3'b 011; end
  3'b 011:begin {xsel,ldt}=2'b 11; ns=3'b 100; end
  3'b 100:begin {rsel,ldt}=2'b 11; ns=3'b 101; end
  3'b 101:begin addsub=repcnt0?1:0; en=TLTY?0:1; ns=3'b 110; end
  3'b 110:begin {ldr,inccnt}=2'b 11; ns=en ? 3'b 011: 3'b 000; end
  default ns=3'b 000;
endcase
end
always@(posedge clk,posedge rst) begin
if(rst) ps<= 3'b 000;
else ps<=ns;
end
endmodule  

