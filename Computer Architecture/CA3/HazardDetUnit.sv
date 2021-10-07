module HazardDU(input MemReeadEX,input [4:0]Inst1EX,Inst1ID,Inst3ID,output reg PCWrite,IF_IDWrite,HazardMUX);
  
  always@(*)begin
    PCWrite=0; IF_IDWrite=0; HazardMUX=0;
    
    if(MemReeadEX && (Inst1EX==Inst1ID || Inst1EX==Inst3ID))begin
      PCWrite = 1; IF_IDWrite=1; HazardMUX=1; 
    end
    
  end 
  
endmodule
