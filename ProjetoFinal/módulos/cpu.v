module cpu(
input clk, rst
);

wire [5:0] Opcode, Funct;
wire MemtoReg, MemWrite, Branch, ULASrc, RegDst, RegWrite; //outputs de controle da control unit
wire [2:0] ALUControl; //outputs de controle da control unit

wire [31:0] PCBranch, PCPlus4, Result, PC, Instr, WriteData, SrcA; // Sinais datapath1 (Trata instruções)
wire PCSrc, RegWire; // Sinais datapath1 (Trata instruções)

wire [31:0] SignImm; // Sinais datapath2 (Trata da memória e resultado)
wire zero; // Sinais datapath2 (Trata da memória e resultado)

wire [4:0] WriteReg; // Sinal datapath3 (Trata dados internos)
  
assign PCSrc = zero & Branch;
assign Opcode = Instr[31:26];
assign Funct = Instr [5:0];

Control_Unit controlunit(
  .Opcode(Opcode), //input
  .Funct(Funct), //input
  .MemtoReg(MemtoReg), 
  .MemWrite(MemWrite),
  .Branch(Branch),
  .ULASrc(ULASrc),
  .RegDst(RegDst),
  .RegWrite(RegWrite),
  .ALUControl(ALUControl)
);

datapath1 instTr (
  .clk(clk),
  .PCBranch(PCBranch),
  .PCPlus4(PCPlus4),
  .WriteReg(WriteReg),
  .Result(Result),
  .PCSrc(PCSrc),
  .RegWrite(RegWrite),
  .PC(PC),
  .Instr(Instr),
  .WriteData(WriteData),
  .SrcA(SrcA)
);

datapath2 memTr (
  .SignImm(SignImm),
  .WriteData(WriteData),
  .SrcA(SrcA),
  .ALUControl(ALUControl),
  .MemWrite(MemWrite),
  .MemtoReg(MemtoReg),
  .clk(clk),
  .ALUSrc(ULASrc),
  .zero(zero),
  .Result(Result)
);

datapath3 indTr (
  .PC(PC),
  .Instr(Instr[20:0]),
  .RegDst(RegDst),
  .PCBRanch(PCBranch),
  .PCPlus4(PCPlus4),
  .SignImm(SignImm),
  .WriteReg(WriteReg)
);
endmodule
