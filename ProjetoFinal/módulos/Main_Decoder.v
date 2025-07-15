module Main_Decoder (
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
        //default: 
    endcase
end
    
endmodule
