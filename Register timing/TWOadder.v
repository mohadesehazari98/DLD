`timescale 1ns/1ns
module TWOadder(input[31:0]A,B,input clk,rst,output[31:0]W,output [31:0]AA,BB,output reg [7:0]Aadd,Badd,output [1:0] gout,output cout);
  reg cin,en1,en2,en3,en4;
  wire coutadd,en;
  wire [7:0]S;
  assign en=cout;
always@(*) begin
  case(gout)
    2'b 00: Aadd<=AA[7:0]; 
    2'b 01: Aadd<=AA[15:8];
    2'b 10: Aadd<=AA[23:16]; 
    2'b 11: Aadd<=AA[31:24];
    default Aadd<= 8'b 0;
  endcase 
  case(gout)
    2'b 00: Badd<=BB[7:0]; 
    2'b 01: Badd<=BB[15:8];
    2'b 10: Badd<=BB[23:16]; 
    2'b 11: Badd<=BB[31:24];
    default Badd<= 8'b 0;
  endcase 
  case(gout)
    2'b00: begin
     en1=1;
     en2=0;
     en3=0;
     en4=0;
    end
    2'b01: en1<=0 && en2<=1 && en3<=0 && en4<=0;
    2'b10: en1<=0 && en2<=0 && en3<=1 && en4<=0;
    2'b11: en1<=0 && en2<=0 && en3<=0 && en4<=1;
    default 
    begin Aadd<= 8'b0; en1<=0;
  end
  endcase 
  if(rst) cin<=1'b 0;
  else cin<=coutadd;
end
genvar j;
generate for(j=0;j<=31;j=j+8) begin:row
regmaster Num1(A[j+7:j],clk,rst,en,AA[j+7:j]);
end
endgenerate
genvar i;
generate for(i=0;i<=31;i=i+8) 
regmaster Num1(B[i+7:i],clk,rst,en,BB[i+7:i]);
endgenerate 
ONEadder Num2(Aadd,Badd , cin,rst , S , coutadd);
regmaster Num3(S,clk,rst,en1,W[7:0]);
regmaster Num4(S,clk,rst,en2,W[15:8]);
regmaster Num5(S,clk,rst,en3,W[23:16]);
regmaster Num6(S,clk,rst,en4,W[31:24]);
TWOcounter Num7(clk,rst,gout,cout);
endmodule