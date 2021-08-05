`timescale 1ns/1ns
module lookup(input [2:0]repcnt , output reg [15:0] repbus);
  always@(repcnt) begin
    repbus<= 16'b 0;
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
  endmodule  
