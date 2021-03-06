`timescale 1ns/1ns
module ADDorSUB(input addsub,en,input [15:0]rreg ,treg , output reg [15:0] subbus);
  always@(en , addsub , treg, rreg) begin
  if(en)
   subbus = addsub ? (rreg+treg) : (rreg-treg);
 end
endmodule
