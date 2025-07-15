module ULA_Decoder (
    input [5:0] Funct,
    input [1:0] ALUOp,
    output [2:0] ULAControl
);

always @(*) begin
    casex (ALUOp)
        2'b00 : ULAControl = 3'b010; //add
        2'bx1 : ULAControl = 3'b110; //subtract
        2'b1x : begin
            case (Funct)
                6'b100000 : ULAControl = 3'b010; //add
                6'b100010 : ULAControl = 3'b110; //subtract 
                6'b100100 : ULAControl = 3'b000; //and
                6'b100101 : ULAControl = 3'b001; //or 
                6'b101010 : ULAControl = 3'b111; //set less than 
                default: ULAControl = 6'b0;
            endcase
        end 
        default: ULAControl = 6'b0;
    endcase
end
    
endmodule
