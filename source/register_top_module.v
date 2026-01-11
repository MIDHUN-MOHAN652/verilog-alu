module top_module_reg #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire start,
    input wire [WIDTH-1:0] A,
    input wire [WIDTH-1:0] B,
    input wire [2:0] ALU_Sel,
    output reg [2:0] ALU_Out,
    output wire done
);
    wire load;
    wire execute;
    wire fsm_done;
    reg [WIDTH-1:0] A_reg;
    reg [WIDTH-1:0] B_reg;
    reg [2:0] ALU_Sel_reg;
    wire [WIDTH-1:0] alu_result;
    fsm_countroller fsm (
        .clk(clk),
        .rst(rst),
        .start(start),
        .execute(execute),
        .done(fsm_done)
    );
    always @(posedge clk or posedge rst)
        begin
            if (rst)
                begin
                    A_reg <=0;
                    B_reg <=0;
                    ALU_Sel_reg <=0;
                end
            else if(load)
                begin
                    A_reg <=A;
                    B_reg <=B;
                    ALU_Sel_reg <= ALU_Sel;
                end
        end
    alu #(.WIDTH(WIDTH)) alu_inst (
        .A(A_reg),
        .B(B_reg),
        .ALU_Sel(ALU_Sel_reg),
        .ALU_Out(alu_result),
        .Zero(),
        .Carry(),
        .Negative()
    );
    always @(posedge clk or posedge rst)
        begin
            if (rst)
                ALU_Out <=0;
            else if(execute)
                ALU_Out <= alu_result;
        end
        assign done =fsm_done;
endmodule
