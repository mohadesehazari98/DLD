`timescale 1ns/1ns
module cosDP(input [15:0]xin , input[8:0]y,input clk,rst,input ld0cnt,inccnt,rsel,xsel,ldx,ldt,ld1,ldr,en,addsub,output [15:0]z,output reg TLTY,repcnt0);
  reg [2:0]repcnt; reg [15:0]repbus,subbus; reg[15:0]xreg,treg,rreg;
  wire [15:0]muxbus,mulbus;
  always@(posedge clk,posedge rst) begin
    repcnt0 = repcnt[0];
    if(rst) repcnt<=3'b 000;
    else if(ld0cnt) repcnt<=3'b 0;
    else if(inccnt) repcnt<= repcnt+1;
    end
    always@(repcnt) begin repbus=16'b 0;
     case(repcnt)
      3'b 000:  repbus<=16'b 0000000010000000;
      3'b 001:  repbus<=16'b 0000000000010101;
      3'b 010:  repbus<=16'b 0000000000001000;
      3'b 011:  repbus<=16'b 0000000000000100;
      3'b 100:  repbus<=16'b 0000000000000010;
      3'b 101:  repbus<=16'b 0000000000000001;
      3'b 110:  repbus<=16'b 0000000000000001;
      3'b 111:  repbus<=16'b 0000000000000001;
      default repbus<= 16'b0;
      endcase
    end
    always@(posedge clk,posedge rst) begin
      if(rst) xreg<=16'b 0;
      else if(ldx) xreg<=xin;
      end
  assign muxbus=(rsel ? repbus : (xsel ? xreg :16'b 0)) ;
   always@(posedge clk, posedge rst) begin
  if(rst) treg<=16'b 0;
  else if(ldt) treg<=mulbus;
  else if(ld1) treg<=16'b 0000000100000000;
  end
  assign mulbus= muxbus * treg;
  always@(y , treg ) begin
  if(y > treg)
   TLTY =0;
 else TLTY=1;
 end
  always@(posedge clk, posedge rst) begin
  if(rst) rreg<=16'b 0;
  else if(ldr) rreg<=subbus;
  else if(ld1) rreg<=16'b 0000000100000000;
  end
  always@(en , addsub , treg, rreg) begin
  if(en)
   subbus = addsub ? (rreg+treg) : (rreg-treg);
 end
  assign z=rreg;
endmodule
  
  

