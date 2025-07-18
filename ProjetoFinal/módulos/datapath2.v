module datapath2 (
  input [31:0] SignImm,
  input [31:0] WriteData,
  input [31:0] SrcA,
  input [2:0] ALUControl,
  input MemWrite,
  input MemtoReg,
  input clk,
  input ALUSrc,
  output zero,
  output [31:0] Result
);

  wire [31:0] SrcB;
  wire [31:0] ALUResult;
  wire [31:0] ReadData;
  
  mux2x1_32bits muxin (
    .inA(WriteData),
    .inB(SignImm),
    .sel(ALUSrc),
    .out(SrcB)
  );

  ALU alu (
    .A(SrcA),
    .B(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Zero(zero)
  );

  data_memory dmemory (
    .clk(clk),
    .A(ALUResult),
    .WD(WriteData),
    .WE(MemWrite),
    .RD(ReadData)
  );

  mux2x1_32bits muxout (
    .inA(ALUResult),
    .inB(ReadData),
    .sel(MemtoReg),
    .out(Result)
  );

endmodule
