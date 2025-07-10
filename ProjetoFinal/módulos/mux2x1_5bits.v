module mux2x1_5bits(
    input [4:0] InA, inB,
    input sel,
    output [4:0] out
);

assign out = (sel == 1) ? inB : inA;

endmodule
