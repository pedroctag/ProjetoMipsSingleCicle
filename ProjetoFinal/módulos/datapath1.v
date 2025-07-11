module datapath1 (
    input clk,
    input [31:0] PCBranch, in2 // entradas do mux do PC
    output [31:0] out // Sinal Instr
    output [31:0] WriteData,
    output [31:0] SrcA
);

mux2x1_32bits mux (
    
);

PC pc(
    .next_PC(in),
    .PC(PC)
);

instruction_memory im (
    .A(PC),
    .RD(instr)
);

register_file rf (
    .A1(instr[25:21]),

);

endmodule// FAZENDO EM ORDEM, ESTE É O PRIMEIRO DATAPATH QUE APARECE, LER MAIS*/