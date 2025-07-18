module datapath3 (
  input [31:0] PC,
  input [20:0] Instr,
  input RegDst,
  output [31:0] PCBRanch,
  output [31:0] PCPlus4,
  output [31:0] SignImm
  output [4:0] WriteReg
);

wire C_out;
wire [31:0] desloca;
localparam N = 32;
  
  carry_look_ahead #(.N(N)) sum1 (
    .A(PC),
    .B(32'd4),
    .C_in(1'b0),
    .S(PCPlus4),
    .C_out(C_out),
  );

  SignExtend signextend (
    .in(Instr[15:0]),
    .out(SignImm)
  );

  mux2x1_5bits mux (
    .inA(Instr[20:16]),
    .inB(Instr[15:11]),
    .sel(RegDst),
    .out(WriteReg)
  );

  desloca desloca (
    .SignImm(SignImm),
    .desloca(desloca)
  );

  carry_look_ahead #(.N(N)) sum2 (
    .A(desloca),
    .B(PCPlus4),
    .C_in(1'b0),
    .S(PCBranch),
    .C_out(C_out),
  );

endmodule
  
