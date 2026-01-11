module alu #(parameter WIDTH=8)
    (input wire [WIDTH-1:0] A,
    input wire [WIDTH-1:0] B,
    input wire [2:0] ALU_Sel,
    output reg [WIDTH-1:0] ALU_Out,
    output reg Zero,
    output reg Carry,
    output reg Negative);
    reg [WIDTH:0] temp;
always @(*)
begin
    ALU_Out  = {WIDTH{1'b0}};
    Carry    = 1'b0;
    Zero     = 1'b0;
    Negative = 1'b0;
    temp     = {WIDTH+1{1'b0}};
       case (ALU_Sel)
            3'b000: begin // ADD
                temp    = A + B;
                ALU_Out = temp[WIDTH-1:0];
                Carry   = temp[WIDTH];
            end

            3'b001: begin // SUB
                temp    = A - B;
                ALU_Out = temp[WIDTH-1:0];
                Carry   = temp[WIDTH]; // borrow flag style
            end

            3'b010: ALU_Out = A & B;
            3'b011: ALU_Out = A | B;
            3'b100: ALU_Out = A ^ B;
            3'b101: ALU_Out = A <<1;
            3'b110: ALU_Out = A >>1;
            3'b111: ALU_Out = {WIDTH{1'b0}};
            default:ALU_Out={WIDTH{1'b0}};
       endcase
       Zero     = (ALU_Out == {WIDTH{1'b0}});
       Negative = ALU_Out[WIDTH-1];
end
endmodule
