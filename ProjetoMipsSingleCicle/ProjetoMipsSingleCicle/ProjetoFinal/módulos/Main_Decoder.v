module Main_Decoder (
    input [6:0] op,
    output reg Branch,
    output reg ResultSrc,
    output reg MemWrite,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg RegWrite,
    output reg [1:0] ALUOp
    );

always @ (*)
begin
    casex (op)
        7'b0000011: begin
            RegWrite = 1;
            ImmSrc = 2'b00;
            ALUSrc = 1;
            MemWrite = 0;
            ResultSrc = 1;
            Branch = 0;
            ALUOp = 2'b00;
        end
        7'b0100011: begin
            RegWrite = 0;
            ImmSrc = 2'b01;
            ALUSrc = 1;
            MemWrite = 1;
            ResultSrc = 1'bx;
            Branch = 0;
            ALUOp = 2'b00;
        end
        7'b0110011: begin
            RegWrite = 1;
            ImmSrc = 2'bxx;
            ALUSrc = 0;
            MemWrite = 0;
            ResultSrc = 0;
            Branch = 0;
            ALUOp = 2'b10;
        end
        7'b1100011: begin
            RegWrite = 0;
            ImmSrc = 2'b10;
            ALUSrc = 0;
            MemWrite = 0;
            ResultSrc = 1'bx;
            Branch = 1;
            ALUOp = 2'b01;
        end 
    endcase
end
endmodule
/*module Main_Decoder (
    input [5:0] Opcode,
    output reg [1:0] ULAOp,
    output reg MemtoReg,
    output reg MemWrite,
    output reg Branch,
    output reg ULASrc,
    output reg RegDst,
    output reg RegWrite
);

always @(*) begin
    case (Opcode)
        6'b000000 : begin
            RegWrite = 1;
            RegDst = 1;
            ULASrc = 0;
            Branch = 0;
            MemWrite = 0;
            MemtoReg = 0;
            ULAOp = 10;
        end 
        6'b100011 : begin
            RegWrite = 1;
            RegDst = 0;
            ULASrc = 1;
            Branch = 0;
            MemWrite = 0;
            MemtoReg = 1;
            ULAOp = 00; 
        end
        6'b101011 : begin
            RegWrite =0;
            RegDst = 0;
            ULASrc = 1;
            Branch = 0;
            MemWrite = 1;
            MemtoReg = 0;
            ULAOp = 00; 
        end
        6'b000100 : begin
            RegWrite = 0;
            RegDst = 0;
            ULASrc = 0;
            Branch = 1;
            MemWrite = 0;
            MemtoReg = 0;
            ULAOp = 01; 
        end
        default: begin
            RegWrite = 0;
            RegDst = 0;
            ULASrc = 0;
            Branch = 0;
            MemWrite = 0;
            MemtoReg = 0;
            ULAOp = 00; 
        end           

    endcase
end
    
endmodule*/
