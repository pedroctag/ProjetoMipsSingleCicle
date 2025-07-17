module datapath1 (
    input clk,
    input [31:0] PCBranch, PCPlus4, // entradas do mux do PC
    input [4:0] WriteReg,
    input [31:0] Result, // Valor da saída do mux com data memory e ALU
    input PCSrc, // Sinal do módulo controlador PCSrc
    input RegWrite, // Sinal do módulo controlador RegWrite
    output [31:0] PC,
    output [31:0] Instr,
    output [31:0] WriteData,
    output [31:0] SrcA
);
    wire [31:0] next_PC;
    
mux2x1_32bits mux (
    .inA(PCPlus4),
    .inB(PCBranch),
    .sel(PCSrc),
    .out(next_PC)
);

PC pc(
    .clk(clk),
    .next_PC(next_PC),
    .PC(PC)
);

instruction_memory im (
    .A(PC),
    .RD(Instr)
);

register_file rf (
    .clk(clk),
    .A1(Instr[25:21]),
    .A2(Instr[20:16]),
    .A3(WriteReg),
    .WD3(Result),
    .RD1(SrcA),
    .RD2(WriteData),
    .WE(RegWrite)
);

endmodule

//Datapath azul da imagem de ref.
