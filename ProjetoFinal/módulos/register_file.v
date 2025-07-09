// Escrita síncrona, leitura assíncrona
//completo, precisa de mais testes para confirmar
module register_file (
    input [4:0] A1, A2, A3, //! Endereços
    input [31:0] WD3, // Dados de entrada
    input WE, // Enable
    output reg [31:0] RD1, RD2, // Leitura dos dados
    input clk
);

reg [31:0] register [0:31]; // 32 registradores de 32 bits

always @ (posedge clk)
begin
    if (WE)
        begin
            register[A3] <= WD3; // Escrita no registrador de endereço A3
        end
end

always @ (*)
begin
    RD1 = register[A1]; // Leitura no endereço 1
    RD2 = register[A2]; // Leitura bo endereço 2
end
endmodule