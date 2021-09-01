`timescale 1ns/1ns 
module my_timer(); 
reg clock; 
integer no_of_clocks; 

parameter CLOCK_PERIOD = 17; 
initial clock = 1'b0; 
always 
begin 
#(CLOCK_PERIOD/3.0) clock = 1'b0; 
#(CLOCK_PERIOD - CLOCK_PERIOD/3.0) clock = 1'b1; 
end 

initial no_of_clocks = 0; 

always@(posedge clock) 
no_of_clocks = no_of_clocks +1 ; 

initial 
begin 
#50000; 
$display(" End of simulation time is %d , total number of clocks seen is %d expected is %d",$time,no_of_clocks,($time/5)); 
$stop; 
end 
endmodule 
