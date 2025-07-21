module datapath3 (
  input [31:0] PC,
  input [25:0] Instr,
  output [31:0] PCTarget,
  output [31:0] PCPlus4,
  output [31:0] ImmExt,
);

wire C_out;
localparam N = 32;

assign SignImm = SignImm_wire;

  carry_look_ahead #(.N(N)) sum1 (
    .A(PC),
    .B(32'd4),
    .C_in(1'b0),
    .S(PCPlus4),
    .C_out(C_out)
  );

  SignExtend signextend (
    .in(Instr[25:0]),
    .out(ImmExt)
  );

  carry_look_ahead #(.N(N)) sum2 (
    .A(desloca),
    .B(PCPlus4),
    .C_in(1'b0),
    .S(PCTarget),
    .C_out(C_out)
  );

endmodule
  
