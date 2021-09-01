`timescale 1ns/1ns
module mux_2_1(input clk,rst ,input S,input [7:0] A_1,A_2,output reg[7:0] B);
  always@(posedge clk,posedge rst) begin:part1
    if(rst)
      B<=8'b00000000;
    else begin
    case(S)
      1'b0 : B<=A_1;            //Processor
      1'b1 : B<=A_2;            //Rom
    endcase
    end
  end
endmodule


