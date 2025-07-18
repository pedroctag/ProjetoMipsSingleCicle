module SignExtend(
    input [15:0] in,
    output [31:0] out
);

//  wire [15:0] bitone = 16'b1111111111111111; 
    wire [15:0] bitone = {16{1'b1}};
//  wire [15:0] bitzero = 16'b0000000000000000;
    wire [15:0] bitzero = {16{1'b0}};

assign out = (in[15] == 1) ? {bitone, in} : {bitzero, in};

endmodule
