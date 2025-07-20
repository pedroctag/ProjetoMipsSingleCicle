module SignExtend(
    input [11:0] in,
    output [31:0] out
);

    //  wire [15:0] bitone = 16'b1111111111111111; 
    wire [19:0] bitone = {20{1'b1}};
//  wire [15:0] bitzero = 16'b0000000000000000;
    wire [19:0] bitzero = {20{1'b0}};

    assign out = (in[11] == 1) ? {bitone, in} : {bitzero, in};

endmodule
