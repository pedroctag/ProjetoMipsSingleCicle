module instruction_memory (
    input [31:0] A, // Endereço
    output [31:0] RD // Barramento de elitura de dados
);

reg [31:0] instruction [0:31]; // 32 espaços de instrução de 32 bits cada

always @ (posedge clk)
begin
    RD <= instruction[A]; // Saída recebe a instrução
end
endmodule

