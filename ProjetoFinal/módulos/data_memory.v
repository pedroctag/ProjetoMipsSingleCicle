// Escrita síncrona, leitura assíncrona

module data_memory (
    input clk,
    input [31:0] A, // Endereço 
    input [31:0] WD, // Dado de escrita
    output WE, // Enable de escrita
    output [31:0] RD // Dado de leitura
);

reg [31:0] Memory_cell [0:31]; // 32 unidades de memória de 32 bits

always @ (posedge clk)
begin
    if(WE)
    begin
        Memory_cell[A] <= WD; // Escreve na unidade de endereço A
    end
end

always @ (*)
begin
    RD <= Memory_cell[A]; // Lê da unidade de endereço A
end

endmodule