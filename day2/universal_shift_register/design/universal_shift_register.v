module universal_shift_register(
    input clk,
    input reset,
    input S1,
    input S0,
    input SR_in,          
    input SL_in,          
    input [3:0] D,        
    output reg [3:0] Q
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        Q <= 4'b0000;
    else
    begin
        case({S1,S0})

            2'b00: Q <= Q;                         

            2'b01: Q <= {SR_in, Q[3:1]};          

            2'b10: Q <= {Q[2:0], SL_in};           

            2'b11: Q <= D;                        

        endcase
    end
end

endmodule
