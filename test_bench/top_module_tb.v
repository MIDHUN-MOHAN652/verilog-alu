`timescale 1ns/1ps

module top_module_tb;

    parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg start;
    reg [WIDTH-1:0] A;
    reg [WIDTH-1:0] B;
    reg [2:0] ALU_Sel;

    wire [WIDTH-1:0] ALU_Out;
    wire done;

    // DUT
    top_module #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .done(done)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Init
        clk = 0;
        rst = 1;
        start = 0;
        A = 0;
        B = 0;
        ALU_Sel = 3'b000;

        $dumpfile("top_module.vcd");
        $dumpvars(0, top_module_tb);

        // Release reset
        #10 rst = 0;

        // Apply inputs
        #10;
        A = 8'd10;
        B = 8'd5;
        ALU_Sel = 3'b000; // ADD

        // Start operation
        #10 start = 1;
        #10 start = 0;

        // WAIT FOR DONE (safest possible way)
        @(posedge done);

        #1;
        $display("DONE asserted. ALU_Out = %d (expected 15)", ALU_Out);

        #20;
        $finish;
    end

endmodule
