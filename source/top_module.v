module top_module #(
    parameter WIDTH=8
)(
    input wire clk,
    input wire rst,
    input wire start,
    input wire [WIDTH-1:0] A,
    input wire [WIDTH-1:0] B,
    input wire [2:0] ALU_Sel,
    output wire [WIDTH-1:0] ALU_Out,
    output wire done
);
    wire load;
    wire execute;
    wire fsm_done;
    fsm_countroller fsm(
        .clk(clk),
        .rst(rst),
        .start(start),
        .load(load),
        .execute(execute),
        .done(fsm_done)
);
alu #(.WIDTH(WIDTH)) alu_inst(
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Zero(),
    .Carry(),
    .Negative()
);
assign done=fsm_done;
endmodule
