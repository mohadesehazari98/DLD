module Assignp(input p0,p1,p2,p3,output w);
  assign #(24) w=((p0&p1)&(p2&p3));
endmodule
