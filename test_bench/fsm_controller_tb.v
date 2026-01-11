module fsm_controller_tb;
    reg clk;
    reg rst;
    reg start;
    wire load;
    wire execute;
    wire done;
    fsm_countroller dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .load(load),
        .execute(excute),
        .done(done)
    );
    always #5 clk=~clk;
    initial
        begin
            $dumpfile("fsm_controller.vcd");
            $dumpvars(0,fsm_controller_tb);
            clk=0;
            rst=1;
            start=0;
            #10 rst=0;
            #10 start=1;
            #10 start=0;
            #50;
            $finish;
        end
endmodule
