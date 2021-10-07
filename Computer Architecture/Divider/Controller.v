`timescale 1ns/1ns
module Controller(input clk,rst,start,A5,output reg shA,shQ,ldA,add,sub,Q0,ldQ0,done);
reg [3:0]ps,ns;
reg [2:0]cnt;
reg en,Co;
always@(start,A5,ps) begin
shA=1'b0; shQ=1'b0; ldA=1'b0; add=1'b0; sub=1'b0; Q0=1'b0; ldQ0=1'b0; done=1'b0; en=1'b0;
ns=4'b 0000;
case(ps)
  4'b 0000:begin if(~start) ns=4'b 0000; else ns=4'b 0001; end
  4'b 0001:begin shA=1'b 1; ns=4'b 0010; end
  4'b 0010:begin shQ=1'b 1; ns=4'b 0011; end
  4'b 0011:begin sub=1'b 1; ns=4'b 0100; end
  4'b 0100:begin ldA=1'b 1; ns=4'b 0101; end 
  4'b 0101:begin ns=A5 ? 4'b 0110 : 4'b 1000; end 
  4'b 0110:begin add=1'b 1; ns=4'b 0111; end
  4'b 0111:begin ldA=1'b 1; en=1'b 1; ns=4'b 1001; end
  4'b 1000:begin Q0 =1'b 1;ldQ0=1'b 1; en=1'b 1; ns=4'b 1001; end
  4'b 1001:begin en=1'b 0; ns=Co ? 4'b 1010 : 4'b 0001; end
  4'b 1010:begin done=1'b 1; ns=4'b 0000; end
  default ns=4'b 0000;
endcase
end
always@(posedge clk,posedge rst) begin
if(rst) ps<= 4'b 0000;
else ps<=ns;
end

always@(posedge clk,posedge rst) begin
  if(rst) cnt=3'b 000;
  else if(en)begin
    cnt=cnt + 1'b1;
    Co=1'b0;
    if(cnt==3'b110) Co=1'b1;
  end
end
endmodule  
