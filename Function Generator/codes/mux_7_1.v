`timescale 1ns/1ns
module mux_7_1(input clk,rst ,input[2:0] SW,input[7:0] A_1,A_2,A_3,A_4,A_5,A_6,A_7,output reg[7:0] B);
  always@(posedge clk,posedge rst) begin:part1
    if(rst)
      B<=8'b00000000;
    else begin
    case(SW)
      3'b000 : B<=A_1;            //Rhomboid
      3'b001 : B<=A_2;            //Sine
      3'b010 : B<=A_3;            //Square
      3'b011 : B<=A_4;            //Triangle
      3'b100 : B<=A_5;            //Saw-tooth
      3'b101 : B<=A_6;            //Full-wave rectified
      3'b110 : B<=A_7;            //Modulated sine wave
    endcase
    end
  end
endmodule

