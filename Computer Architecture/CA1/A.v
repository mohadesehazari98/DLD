`timescale 1ns/1ns
module A(input clk,rst,input [5:0]initial_A,input ldA,shA,out_Q_5,input [6:0]out_Add_Sub,output reg [6:0]out_A);
  reg [6:0]A;
  always@ (posedge clk,posedge rst) begin
     A={1'b0,initial_A};
    if(rst) out_A=A;
    else begin
    if(shA) begin 
      out_A=out_A << 1;
      out_A[0]=out_Q_5;
    end
    if(ldA) out_A=out_Add_Sub;
    end
  end
endmodule  

