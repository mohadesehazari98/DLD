module ForwardU(input RegWriteMEM,RegWriteWB,input [4:0]Inst1EX,Inst3EX,RegDstMEM,RegDstWB,output reg [1:0]ForwardMux1,ForwardMux2);
  
  always@(*)begin
    ForwardMux1 = 0;
    ForwardMux2 = 0;
    if(RegWriteMEM && RegDstMEM==Inst3EX && RegDstMEM!=0)begin
      ForwardMux1 = 1;
    end
    if(RegWriteMEM && RegDstMEM==Inst1EX && RegDstMEM!=0)begin
      ForwardMux2 = 1;
    end
    if(RegWriteWB && RegDstWB==Inst3EX && RegDstWB!=0)begin
      ForwardMux1 = 2;
    end
    if(RegWriteWB && RegDstWB==Inst1EX && RegDstWB!=0)begin
      ForwardMux2 = 2;
    end
    
  end 
  
endmodule 
