module desloca (
    input wire [31:0] Signlmm,
    output [31:0] desloca
);
    
assign desloca = Signlmm << 2;

endmodule
