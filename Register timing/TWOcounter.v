`timescale 1ns/1ns
module TWOcounter(input clk,rst,output reg [1:0]gout,output cout);
  wire din;
  always @(posedge clk,posedge rst) begin
    if(rst) gout=2'b 11;
    else
      gout[0] = ~gout[0];
      if(din) gout[1]=~gout[1];
    end
  assign din=gout[0];
  assign cout = gout[1] & gout[0];
endmodule
      
  
