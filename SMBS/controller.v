`timescale 1ns/1ns
module controller(input clk,rst,si,output reg shePL,output reg valid,output reg[5:0] PL_OUT);
  parameter[2:0] idle=3'b000,getPL=3'b001,pause=3'b011,getC=3'b010,getdata=3'b100,spacer=3'b101;
  reg[2:0]ns,ps;
  reg[5:0]creg;
  reg[2:0]countout;
  reg initc,incc,initcdata,dc;
  reg sheC;
  wire czero;
  wire co;
  reg[5:0]parout;
  always@(si,co,czero,ps)begin
    ns=idle;
    {initc,shePL,sheC,incc,valid,dc,initcdata}=7'b0;
    case(ps)
      idle: begin ns=si?idle:getPL; initc=1'b1;end
      getPL: begin ns=co?getC:getPL; shePL=1'b1; initc=co?1'b1:1'b0; incc=1'b1;sheC=co?1:0;end 
      getC:begin ns=co?pause:getC; sheC=1'b1;incc=1'b1; end //initcdata=co?1'b1:1'b0;
      pause:begin ns=getdata; initcdata=1'b1;end
      getdata:begin ns=czero?spacer:getdata; valid=1'b1;dc=1'b1;end
      spacer:begin ns=si?idle:getdata; initcdata=si?1'b0:1'b1;end
      endcase
    end
    always@(posedge clk,posedge rst)begin
      if(rst) ps<=3'b000;
      else ps<=ns;
      end
      // counter 3bit
    always@(posedge clk,posedge rst)begin
      if(rst) countout<=3'b000;
      else if(initc) countout<=3'b010;
      else if(incc) countout<=countout+1;
      end
      assign co=&{countout};
      //shift register C
      always@(posedge clk,posedge rst)begin
       if(rst) creg<=6'b0;
       else if(sheC)  creg<={si,creg[5:1]};
      end
       //shift register PL
      always@(posedge clk,posedge rst)begin
       if(rst) PL_OUT<=6'b0;
       else if(shePL)  PL_OUT<={si,PL_OUT[5:1]};
      end
      //counter size c
      always@(posedge clk,posedge rst)begin
      if(rst) parout<=6'b0;
    else if(initcdata) parout<=creg;
      else if(dc) parout<=parout-1;
        end
      assign czero=&{~parout};
        
    endmodule
      
      
      
      
        
  
  
  

