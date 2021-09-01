`timescale 1ns/1ns
module Frequency_Regulato(input clk , rst , PSI ,input[7:0] setPeriod ,output reg [7:0] adjustedDiv,output reg [8:0] duration ,output reg inc,dec);
  reg previous_PSI;
  //reg [7:0]duration;
  //reg inc,dec;
  
  //Set the PSI
  always @(posedge clk, posedge rst)begin: Set_PSI
    if(rst)
      previous_PSI<=1'b0;
    else
      previous_PSI<=PSI;
  end
    
  always @(posedge clk, posedge rst) begin: decide_when_to_count_and_count
    if(rst)
      duration<=9'b0;
    else begin
      case({previous_PSI,PSI})
        2'b01 : duration<=9'b0;            //zero to one
        2'b11 : duration<=duration+1;      //steady at one
        2'b10 : duration<=duration;        //one to zero
        2'b00 : duration<=duration;        //steady at zero
      endcase
    end
  end
  
  always@(negedge PSI) begin: comparison
	 inc<=1'b0;
	 dec<=1'b0;
    if({previous_PSI,PSI}==2'b10)
      if(duration>{1'b0,setPeriod})
        inc<=1'b1;
      else if(duration<{1'b0,setPeriod})
        dec<=1'b1;
  end
  
  always@(posedge clk,posedge rst) begin: increment_decrement
    if(rst)
      adjustedDiv<=8'b01111111;
	 else begin
		if({previous_PSI,PSI}==2'b10)
			if(inc==1'b1) begin
				adjustedDiv<=adjustedDiv+1;
				
			end
			else if(dec==1'b1) begin
				adjustedDiv<=adjustedDiv-1;
				
			end
	 end	
	 
      
  end
        
endmodule 
