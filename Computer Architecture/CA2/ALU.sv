`timescale 1 us/ 1 us
module ALU(input [31:0]A,B, input [2:0]ALUop, output reg [31:0]ALUresult, output reg zero);
  
  always@(A,B,ALUop)begin  
   case(ALUop)
    0: begin ALUresult=A&B; 
       if(A==B)zero=0;
       end
   1:  begin ALUresult=A|B; 
       if(A==B)zero=0;
       end
     
    2: begin ALUresult=A+B; 
       if(A==B)zero=0;
       end
    
    3: begin ALUresult=A-B; 
       if(A==B)zero=0;
       end
 
    7: begin ALUresult=(A<B)?1:0;
       if(A==B)zero=0;
       end
endcase
 end
endmodule
