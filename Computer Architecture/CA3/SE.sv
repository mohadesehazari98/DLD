`timescale 1 us/ 1 us
module SE(input [15:0]in,output [31:0]out);
  genvar i;
  assign out[15:0]=in;
  for(i=0;i<16;i=i+1)begin
    assign out[i+16]=in[15];
  end
endmodule


