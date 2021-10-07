module DataPath(input clk,rst);
  
  wire PCWrite,IF_IDWrite,RegWriteWB,HazardMUX,ALUSrcID,RegDstID,MemReadID,MemWriteID,PCSrcID,MemToRegID,RegWriteID,ALUSrcEX,RegDstEX,MemReadEX,MemWriteEX,PCSrcEX,MemToRegEX,RegWriteEX,MemReadMEM,MemWriteMEM,PCSrcMEM,MemToRegMEM,RegWriteMEM,MemToRegWB,zero;
  wire [1:0]ForwardMux1,ForwardMux2;
  wire [2:0]ALUOpID,ALUOpEX;
  wire [31:0]PCin,PCout,AddOutIF,InstIF,AddoutID,InstID,RegDstWB,DMemToRegWB,ReadData1ID,ReadData2ID,SEID,ReadData1EX,ReadData2EX,AddEX,SEEX,Inst1EX,Inst2EX,Inst3EX,ALUResultEX,A,B,ALUSrcOut,SEEXShL,AddOutEX,NRegDstEX,AddOutMEM,AddressMEM,WriteDataMEM,RegDstMEM,ReadDataMEM,AddressWB,ReadDataWB;
  
  //...... IF ......
  PC pc(clk,rst,PCWrite,PCin,PCout);
  adder32 add1(1,PCout,AddOutIF);
  MUX32 muxPC(AddOutIF,AddOutMEM,PCSrcMEM,PCin);
  InstMem InstMem(clk,PCout,InstIF);
  
  IF_ID IfId(clk,rst,IF_IDWrite,AddOutIF,InstIF,AddoutID,InstID);
  
  //...... ID ......
  RegFile RegisterF(clk,rst,RegWriteWB,InstID[25:21],InstID[20:16],RegDstWB,DMemToRegWB,ReadData1ID,ReadData2ID);
  SE SignExtend(InstID[15:0],SEID);
  
  ID_EX IdEx(clk,rst,HazardMUX,ALUSrcID,RegDstID,MemReadID,MemWriteID,PCSrcID,MemToRegID,RegWriteID,ALUOpID,ReadData1ID,ReadData2ID,AddoutID,SEID,InstID[20:16],InstID[15:11],InstID[25:21],ReadData1EX,ReadData2EX,AddEX,SEEX,Inst1EX,Inst2EX,Inst3EX,ALUOpEX,ALUSrcEX,RegDstEX,MemReadEX,MemWriteEX,PCSrcEX,MemToRegEX,RegWriteEX);
  
  //...... EX ......
  ALU alu(A,ALUSrcOut,ALUOpEX,ALUResultEX,zero);
  MUX32 muxALU(B,SEEX,ALUSrcEX,ALUSrcOut);
  MUXin3 muxA(ReadData1EX,AddressMEM,DMemToRegWB,ForwardMux1,A);
  MUXin3 muxB(ReadData2EX,AddressMEM,DMemToRegWB,ForwardMux2,B);
  MUX5 muxRegDst(Inst1EX,Inst2EX,RegDstEX,NRegDstEX);
  ShL2 ShL(SEEX,SEEXShL);
  adder32 add2(,SEEXShL,AddOutEX);
  
  EX_MEM ExMem(clk,rst,MemReadEX,MemWriteEX,PCSrcEX,MemToRegEX,RegWriteEX,AddOutEX,ALUResultEX,ReadData2EX,NRegDstEX,AddOutMEM,AddressMEM,WriteDataMEM,RegDstMEM,MemReadMEM,MemWriteMEM,PCSrcMEM,MemToRegMEM,RegWriteMEM);
  
  //...... MEM ......
  DataMem Memory(clk,AddressMEM,WriteDataMEM,MemReadMEM,MemWriteMEM,ReadDataMEM);
  
  MEM_WB MemWb(clk,rst,MemToRegMEM,RegWriteMEM,AddressMEM,ReadDataMEM,RegDstMEM,AddressWB,ReadDataWB,RegDstWB,MemToRegWB,RegWriteWB);
  
  //...... WB ......
  MUX32 muxWB(AddressWB,ReadDataWB,MemToRegWB,DMemToRegWB);
  
  
  // Forwarding Unit
  ForwardU ForwardUnit(RegWriteMEM,RegWriteWB,Inst1EX,Inst3EX,RegDstMEM,RegDstWB,ForwardMux1,ForwardMux2);
  
  // Hazard Detection Unit
  HazardDU HazardDetUnit(MemReeadEX,Inst1EX,InstID[20:16],InstID[25:21],PCWrite,IF_IDWrite,HazardMUX);
  
  // Controller
  controller Cont(clk,rst,InstID,zero,ALUSrcID,RegDstID,MemReadID,MemWriteID,PCSrcID,MemToRegID,RegWriteID,ALUOpID);
  
  
  
endmodule
