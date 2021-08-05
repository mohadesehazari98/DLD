`timescale 1ns/1ns
module comp(input [15:0]treg , input [7:0] y ,output reg TLTY);
   always@(y , treg ) begin
  if(y > treg)
   TLTY =0;
 else TLTY=1;
 end 
 endmodule
