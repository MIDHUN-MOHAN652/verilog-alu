module alu_selfcheck_tb;
    parameter WIDTH =8;
    reg [WIDTH-1:0] A;
    reg [WIDTH-1:0] B;
    reg [2:0] ALU_Sel;
    wire [WIDTH-1:0] ALU_Out;
    wire Zero,Carry,Negative;
    reg [WIDTH:0] expected;
    integer error=0;
    alu #(.WIDTH(WIDTH)) dut (
        .A(A),.B(B),.ALU_Out(ALU_Out),.ALU_Sel(ALU_Sel),.Zero(Zero),.Carry(Carry),.Negative(Negative)
        );
        task check;
            input [WIDTH:0] expected;
            begin
                #1;
                if({Carry,ALU_Out}!=expected)
                begin
                    $display("Fail:Sel=%b A=%d B=%d Expected=%d Got=%d",ALU_Sel,A,B,expected,{Carry,ALU_Out});
                    error=error+1;
                end
                else
                begin
                    $display("Pass:Sel=%b A=%d B=%d Result=%d",ALU_Sel,A,B,ALU_Out);
                end
            end
        endtask
    initial
        begin
            ALU_Sel=3'b000;
            A=8'd10; B=8'd5; expected=A+B; check(expected);
            A=8'd200;B=8'd100;expected=A+B;check(expected);

            ALU_Sel=3'b001;
            A=8'd10;B=8'd3; expected=A-B; check(expected);
            A=8'd3; B=8'd10;expected=A-B; check(expected);

            ALU_Sel=3'b010;
            A=8'hAA;B=8'hCC;expected=A&B; check(expected);

            ALU_Sel=3'b011;
            expected=A|B; check(expected);

            ALU_Sel=3'b100;
            expected=A^B; check(expected);

            ALU_Sel=3'b101;
            A=8'h0F; expected=A<<1; check(expected);

            ALU_Sel=3'b110;
            A=8'hF0; expected=A>>1; check(expected);

            ALU_Sel=3'b111;
            expected=0; check(expected);

            if (error==0)
                $display("All Test Passed");
            else
                $display("Test Failed: %0d errors", error);
                $finish;
        end
endmodule

