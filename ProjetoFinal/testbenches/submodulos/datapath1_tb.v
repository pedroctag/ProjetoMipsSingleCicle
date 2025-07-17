module datapath1_tb ();

    reg clk;
    reg [31:0] PCBranch, PCPlus4; // entradas do mux do PC
    reg [4:0] WriteReg;
    reg [31:0] Result; // Valor da saída do mux com data memory e ALU
    reg PCSrc; // Sinal do módulo controlador PCSrc
    reg RegWrite; // Sinal do módulo controlador RegWrite
    wire [31:0] PC;
    wire [31:0] Instr;
    wire [31:0] WriteData;
    wire [31:0] SrcA;

datapath1 uut (
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

always #5 clk = ~clk;

initial begin
    // Inicialização
    clk = 0;
    PCBranch = 32'h00000000;
    PCPlus4  = 32'h00000004;
    WriteReg = 5'd0;
    Result   = 32'h00000000;
    PCSrc    = 0;
    RegWrite = 0;

    // Aguarda alguns ciclos de clock
    #12;

    // Teste 1: Write na posição de registrador 5
    WriteReg = 5'd5;
    Result   = 32'hAABBCCDD;
    RegWrite = 1;
    #10;

    // Teste 2: Alterar PC com PCSrc = 1
    PCBranch = 32'h00000020;
    PCSrc    = 1;
    #10;

    // Teste 3: Normalmente incrementa com PCPlus4
    PCSrc    = 0;
    PCPlus4  = 32'h00000008;
    #10;

    // Teste 4: Outro write
    WriteReg = 5'd10;
    Result   = 32'h11223344;
    RegWrite = 1;
    #30;

    // Finaliza simulação
    $finish;
end

endmodule
