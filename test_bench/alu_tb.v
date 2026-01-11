module alu_tb;
    parameter WIDTH=8;
    reg [WIDTH-1:0] A;
    reg [WIDTH-1:0] B;
    reg [2:0] ALU_Sel;
    wire [WIDTH-1:0] ALU_Out;
    wire Zero;
    wire Carry;
    wire Negative;
    alu #(.WIDTH(WIDTH)) dut (
        .A(A),
        .B(B),
        .Zero(Zero),
        .Carry(Carry),
        .Negative(Negative),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out));
    initial
     begin
        $dumpfile("alu.vcd");
        $dumpvars(0,alu_tb);
        A=8'd10; B=8'd5; ALU_Sel=3'b000; #10;
        A=8'd10; B=8'd3; ALU_Sel=3'b001; #10;
        A=8'b10101010; B=8'b11001100; ALU_Sel=3'b010; #10;
        A=8'b10101010; B=8'b11001100; ALU_Sel=3'b011; #10;
        A=8'b10101010; B=8'b11001100; ALU_Sel=3'b100; #10;
        A=8'b00001111; B=8'd1; ALU_Sel=3'b101; #10;
        A=8'b11110000; B=8'd1; ALU_Sel=3'b110; #10;
        A=8'hFF;B=8'hFF;ALU_Sel=3'b111; #10;
        $finish;   
    end
endmodule
