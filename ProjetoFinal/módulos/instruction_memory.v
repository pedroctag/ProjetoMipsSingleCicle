module instruction_memory (
    input [31:0] A, // Endereço
    output reg [31:0] RD // Barramento de elitura de dados
);

reg [31:0] instruction [0:31]; // 32 espaços de instrução de 32 bits cada

//espaços de memória para teste inicial    
initial begin
    instruction[0]  = 32'd4000;
    instruction[1]  = 32'd4000;
    instruction[2]  = 32'd4000;
    instruction[3]  = 32'd4000;
    instruction[4]  = 32'd4000;
    instruction[5]  = 32'd4000; 
    instruction[6]  = 32'd4000; 
    instruction[7]  = 32'd4000; 
    instruction[8]  = 32'd8000;
    instruction[9]  = 32'd4000;
    instruction[10]  = 32'd4000;
    instruction[11]  = 32'd4000;
    instruction[12]  = 32'd4000;
    instruction[13]  = 32'd4000;
    instruction[14]  = 32'd4000;
    instruction[15]  = 32'd4000; 
    instruction[16]  = 32'd4000; 
    instruction[17]  = 32'd4000; 
    instruction[18]  = 32'd8000;
    instruction[19]  = 32'd4000;
    instruction[20]  = 32'd4000;
    instruction[21]  = 32'd4000;
    instruction[22]  = 32'd4000;
    instruction[23]  = 32'd4000;
    instruction[24]  = 32'd4000;
    instruction[25]  = 32'd4000; 
    instruction[26]  = 32'd4000; 
    instruction[27]  = 32'd4000; 
    instruction[28]  = 32'd8000;
    instruction[29]  = 32'd4000;
    instruction[30]  = 32'd4000;
    instruction[31]  = 32'd4000;

end
always @ (*)
begin
    RD <= instruction[A]; // Saída recebe a instrução
end
endmodule
