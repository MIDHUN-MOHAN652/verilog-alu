module top_module_abuse_tb;
    parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg start;
    reg [WIDTH-1:0] A;
    reg [WIDTH-1:0] B;
    reg [2:0] ALU_Sel;

    wire [WIDTH-1:0] ALU_Out;
    wire done;

    top_module dut (
        .clk(clk),.rst(rst),.start(start),.A(A),.B(B),.ALU_Out(ALU_Out),.ALU_Sel(ALU_Sel),.done(done)
    );

    always #5 clk = ~clk;
    initial
        begin
            clk =0;
            rst =1;
            start=0;
            A =0;
            B =0;
            ALU_Sel =0;
            $dumpfile("top_abuse.vcd");
            $dumpvars(0,top_module_abuse_tb);
            #10 rst = 0;

                #10 A = 8'd10;
                B=8'd5;
                ALU_Sel = 3'b000;
                #10 start = 1;
                #10 start = 0;
                #50;

                A = 8'd20;
                B = 8'd3;
                ALU_Sel = 3'b001;
                #10 start = 1;
                #10 start = 0;
                #50;

                A = 8'd50;
                B = 8'd10;
                ALU_Sel = 3'b000;
                #10 start = 1;
                #10 start = 0;
                #10 A = 8'd99;
                B = 8'd99;
                #50;

                #10 start = 1;
                #10 start = 0;
                #10 start = 1;
                #10 start = 0;
                #10 start = 1;
                #10 start = 0;
                #80;
    
                A = 8'd7;
                B = 8'd3;
                ALU_Sel = 3'b000;
                #10 start = 1;
                #10 start = 0;
                #20 rst = 1;
                #20 rst = 0;
                #50;
                $finish;
        end
endmodule
