module SignExtend(
    input [31:7] in,
    input [1:0] ImmSrc,
    output reg [31:0] out
);
 
always @ (*)
begin
    case (ImmSrc)
        2'b00 : out = {{20{in[31]}}, in[31:20]};
        2'b01 : out = {{20{in[31]}}, in[11:7]};
        2'b10 : out = {{20{in[31]}}, in[7], in[30:25], in[11:8], 1'b0};
        default: out = 32'bx;
    endcase
end

endmodule
