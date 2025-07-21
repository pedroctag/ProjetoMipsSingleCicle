module SignExtend(
    input [24:0] in,
    input ImmSrc,
    output [31:0] out
);
    wire [11:0] aux;

    wire [19:0] bitone = {20{1'b1}};
    wire [19:0] bitzero = {20{1'b0}};
    
    assign aux = (ImmSrc == 1) ? {in[24:18],in[4:0]}:in[24:13];
    assign out = (aux[11] == 1) ? {bitone, aux} : {bitzero, aux};

endmodule
