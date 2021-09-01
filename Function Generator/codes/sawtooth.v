`timescale 1ns/1ns
module sawtooth(input clk,rst,input[7:0] count_clk,output reg[7:0] out_sawtooth);
  always@(posedge clk,posedge rst) begin:count_up
  if(rst)
    out_sawtooth<=8'b10000000;
  else
    out_sawtooth<=out_sawtooth + 1;
  end
endmodule

