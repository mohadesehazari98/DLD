`timescale 1ns/1ns
module Q(input clk,rst,input [5:0]initial_Q,input Q0,ldQ0,shQ,output reg [5:0]out_Q);
  always@ (posedge clk,posedge rst) begin
    if(rst) out_Q=initial_Q;
    else begin
    if(shQ) out_Q=out_Q << 1;
    if(Q0) out_Q[0]=1'b1;
    if(ldQ0) out_Q=out_Q;
    end
  end
endmodule  


