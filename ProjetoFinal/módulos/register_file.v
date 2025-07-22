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

initial
begin
    register[0] = 32'h0;
    register[1] = 32'h1;
    register[2] = 32'h2;
    register[3] = 32'h3;
    register[4] = 32'h0;
    register[5] = 32'h5;
    register[6] = 32'h6;
    register[7] = 32'h7;
    register[8] = 32'h8;
    register[9] = 32'h9;
    register[10] = 32'h10;

end

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