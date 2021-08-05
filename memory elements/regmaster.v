`timescale 1ns/1ns
module regmaster(input[7:0]din,input clk,input rst,output reg [7:0] gout);
  wire [7:0]g;
  genvar j;
  generate for(j=0;j<=7;j=j+1) begin:row
    masterslaveD UUT3(rst,din[j],clk,g[j]);
  end
endgenerate
  always@(posedge clk) begin
    if(rst) gout<=8'b 0;
    else gout<= g;
    end
endmodule
