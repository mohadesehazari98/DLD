module display (input psi, clk, rst,
			                 output reg [7:0] oldduration);
   reg  [7:0] duration;
   reg enable;
   reg oldpsi;
   //reg [7:0]oldduration;
   wire[3:0] bcd_0, bcd_1, bcd_2;
    always @(posedge clk, posedge rst) 
      if (rst) 
        oldpsi <= 1'b0;
      else 
	    oldpsi <= psi;
      
    always @(posedge clk) begin
         case ({oldpsi,psi})
         2'b00: duration <= duration;
         2'b01: duration <= 8'b0;
         2'b10: duration <= duration;
         2'b11: duration <= duration+1;
         endcase
    end
  
  // The signal "enable"  gets 1 when psi goes to zero, to start the display procedure 
    always @(posedge clk) begin
            if ({oldpsi,psi}==2'b10) 
				enable<=1'b1;
 			   else
 			if ({oldpsi,psi}==2'b01)   
				enable<=1'b0;   
	end
	
	always @ (posedge clk, posedge rst) begin
	    if (rst) begin 
			oldduration <= 8'h0;
	    end
	    else if (enable) begin
     	    oldduration<= duration; 
       end
	end
endmodule



