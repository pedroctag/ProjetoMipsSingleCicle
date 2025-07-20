module Control_Unit (
  input [5:0] Opcode,
  input [5:0] Funct,
  output MemtoReg,
  output MemWrite,
  output Branch,
  output ULASrc,
  output RegDst,
  output RegWrite,
  output ALUControl
);

wire [1:0] ALUOp;
  
Main_Decoder maindecoder (
  .Opcode(Opcode),
  .ULAOp(ALUOp),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .Branch(Branch),
  .ULASrc(ULASrc),
  .RegDst(RegDst),
  .RegWrite(RegWrite)
);

ULA_Decoder uladecoder (
  .Funct(Funct),
  .ALUOp(ALUOp),
  .ULAControl(ALUControl)
);

endmodule
