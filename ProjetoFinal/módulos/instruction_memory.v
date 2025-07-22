module instruction_memory (
    input [31:0] A, // Endereço
    output reg [31:0] RD // Barramento de elitura de dados
);

reg [31:0] instruction [0:63]; // 32 espaços de instrução de 32 bits cada
wire [29:0] aux;
assign aux = A [31:2];

//espaços de memória para teste inicial    
initial begin
    instruction[0]  = 32'hFF_C4_A3_03;
    instruction[1]  = 32'h0064A623;
    instruction[2]  = 32'h0062E233;
    instruction[3]  = 32'hFE420AE3;
    instruction[4]  = 32'h0064A623;
    instruction[5]  = 32'd0; 
    instruction[6]  = 32'd0; 
    instruction[7]  = 32'd0; 
    instruction[8]  = 32'h0062E233;
    instruction[9]  = 32'd0;
    instruction[10]  = 32'd0;
    instruction[11]  = 32'd0;
    instruction[12]  = 32'hFE420AE3;
    instruction[13]  = 32'd0;
    instruction[14]  = 32'd0;
    instruction[15]  = 32'd0; 
    instruction[16]  = 32'h0064A623;
    instruction[17]  = 32'd0; 
    instruction[18]  = 32'd0;
    instruction[19]  = 32'd0;
    instruction[20]  = 32'hFFC4A303;
    instruction[21]  = 32'd0;
    instruction[22]  = 32'd0;
    instruction[23]  = 32'd0;
    instruction[24]  = 32'd0;
    instruction[25]  = 32'd0; 
    instruction[26]  = 32'd0; 
    instruction[27]  = 32'd0; 
    instruction[28]  = 32'd0;
    instruction[29]  = 32'd0;
    instruction[30]  = 32'd0;
    instruction[31]  = 32'd0;

end
always @ (*)
begin
    RD = instruction[aux]; // Saída recebe a instrução alinhada
end
endmodule