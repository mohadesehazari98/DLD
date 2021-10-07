`timescale 1ns/1ns
module D(input clk,rst,input [5:0]initial_Q,output reg [6:0]out_D);
  always@ (posedge clk,posedge rst) begin
    if(rst) out_D=6'b 000000;
    else out_D={initial_Q[5],initial_Q};
  end
endmodule  

