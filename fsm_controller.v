module fsm_countroller (
    input wire clk,
    input wire rst,
    input wire start,
    output reg load,
    output reg execute,
    output reg done
);
    parameter IDLE=2'b00;
    parameter LOAD=2'b01;
    parameter EXECUTE=2'b10;
    parameter DONE=2'b11;
    reg [1:0] current_state;
    reg [1:0] next_state;
    always @(posedge clk or posedge rst)
        begin
            if(rst)
                current_state<=IDLE;
            else
                current_state<=next_state; 
        end
    always @(*)
        begin
            next_state=current_state;
            case (current_state)
                IDLE:
                    begin
                        if (start)
                            next_state=LOAD;
                    end
                LOAD:
                    begin
                        next_state=EXECUTE;
                    end
                EXECUTE:
                    begin
                        next_state=DONE;
                    end
                DONE:
                    begin
                        next_state=IDLE;
                    end
                default:
                    begin
                        next_state=IDLE;
                    end
            endcase
        end
        always @(*)
            begin
                load=1'b0;
                execute=1'b0;
                done=1'b0;
                case(current_state)
                    LOAD:
                        load=1'b1;
                    EXECUTE:
                        execute=1'b1;
                    DONE:
                        done=1'b1;
                endcase
            end
endmodule