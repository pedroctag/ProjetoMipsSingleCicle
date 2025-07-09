module PC (
    input clk,
    input [31:0] next_PC,
    output reg [31:0] PC
);

always @ (posedge clk)
begin
    PC <= next_PC;
end
endmodule