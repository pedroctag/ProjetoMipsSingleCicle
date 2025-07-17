module instruction_memory (
    input [31:0] A, // Endereço
    output reg [31:0] RD // Barramento de elitura de dados
);

reg [31:0] instruction [0:31]; // 32 espaços de instrução de 32 bits cada

//espaços de memória para teste inicial    
initial begin
    instruction[4]  = 32'd4000;  // Endereço 4 recebe 4000
    instruction[8]  = 32'd8000;  // Endereço 8 recebe 8000
    instruction[16] = 32'd3200;  // Endereço 16 recebe 3200
    instruction[20] = 32'd1000;  // Endereço 20 recebe 1000
    instruction[24] = 32'd1500;  // Endereço 24 recebe 1500
end
always @ (*)
begin
    RD <= instruction[A]; // Saída recebe a instrução
end
endmodule
