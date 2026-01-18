module fsm_abuse_tb;

    reg clk;
    reg rst;
    reg start;

    wire load;
    wire execute;
    wire done;

    fsm_controller dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .load(load),
        .execute(execute),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        start = 0;

        $dumpfile("fsm_abuse.vcd");
        $dumpvars(0, fsm_abuse_tb);

        #10 rst = 0;

        #10 start = 1;
        #30 start = 0;

        #50;

        #10 start = 1;
        #10 start = 0;
        #10 start = 1; 
        #10 start = 0;

        #60;

        #10 start = 1; #10 start = 0;
        #10 start = 1; #10 start = 0;

        #80;

        #10 start = 1; #10 start = 0;
        #20 rst = 1;
        #10 rst = 0;

        #50;

        $finish;
    end

endmodule
