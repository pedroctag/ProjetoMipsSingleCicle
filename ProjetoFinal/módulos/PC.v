module PC (
    input [31:0] next_PC,
    output [31:0] PC
);

always @ (posedge clk)
begin
    PC <= next_PC;
end
endmodule