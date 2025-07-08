module datapath (
    input clk,
    input in
);

wire [31:0] PC;
wire [31:0] instr;

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

);// FAZENDO EM ORDEM, ESTE É O PRIMEIRO DATAPATH QUE APARECE, LER MAIS