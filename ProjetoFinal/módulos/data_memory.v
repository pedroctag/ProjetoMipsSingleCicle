// Escrita síncrona, leitura assíncrona

module data_memory (
    input clk,
    input [31:0] A, // Endereço 
    input [31:0] WD, // Dado de escrita
    output WE, // Enable de escrita
    output [31:0] RD // Dado de leitura
);

reg [31:0] Memory_cell [0:63]; // 32 unidades de memória de 32 bits

initial
begin
    Memory_cell[0] = 32'h0;
    Memory_cell[1] = 32'h1;
    Memory_cell[2] = 32'h2;
    Memory_cell[3] = 32'h3;
    Memory_cell[4] = 32'h4;
    Memory_cell[5] = 32'h5;
    Memory_cell[6] = 32'h6;
    Memory_cell[7] = 32'h7;
    Memory_cell[8] = 32'h8;
    Memory_cell[9] = 32'h9;
    Memory_cell[10] = 32'h10;

end

always @ (posedge clk)
begin
    if(WE)
    begin
        Memory_cell[A] <= WD; // Escreve na unidade de endereço A
    end
end

assign RD = Memory_cell[A]; // Lê da unidade de endereço A

endmodule