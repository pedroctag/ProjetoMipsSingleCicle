module desloca (
    input wire [31:0] SignImm,
    output [31:0] desloca
);
    
assign desloca = SignImm << 2;

endmodule
