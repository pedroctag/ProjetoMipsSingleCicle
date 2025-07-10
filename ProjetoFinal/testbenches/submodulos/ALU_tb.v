module ALU_tb;

    reg [31:0] A, B;
    reg [2:0] ALUControl;
    wire [31:0] ALUResult;
    wire Zero;

    // Instancia a ALU
    ALU uut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    initial begin
        $display("==== Teste da ALU ====");
        // Teste ADD
        A = 32'd10; B = 32'd15; ALUControl = 3'b010;
        #10;
        $display("ADD: %d + %d = %d | Zero = %b", A, B, ALUResult, Zero);

        // Teste SUB
        A = 32'd20; B = 32'd5; ALUControl = 3'b110;
        #10;
        $display("SUB: %d - %d = %d | Zero = %b", A, B, ALUResult, Zero);

        // Teste SUB com resultado zero
        A = 32'd30; B = 32'd30; ALUControl = 3'b110;
        #10;
        $display("SUB (Zero): %d - %d = %d | Zero = %b", A, B, ALUResult, Zero);

        // Teste AND
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; ALUControl = 3'b000;
        #10;
        $display("AND: %h & %h = %h | Zero = %b", A, B, ALUResult, Zero);

        // Teste OR
        A = 32'hF0000000; B = 32'h0F000000; ALUControl = 3'b001;
        #10;
        $display("OR: %h | %h = %h | Zero = %b", A, B, ALUResult, Zero);

        // Teste SET LESS THAN (A < B)
        A = 32'd5; B = 32'd10; ALUControl = 3'b111;
        #10;
        $display("SLT: %d < %d = %d | Zero = %b", A, B, ALUResult, Zero);

        // Teste SET LESS THAN (A > B)
        A = 32'd15; B = 32'd10; ALUControl = 3'b111;
        #10;
        $display("SLT: %d < %d = %d | Zero = %b", A, B, ALUResult, Zero);

        $display("==== Fim dos Testes ====");
        $finish;
    end

endmodule
