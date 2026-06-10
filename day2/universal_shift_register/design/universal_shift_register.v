module universal_shift_register (
    input        clk,
    input        rst,
    input        sid,
    input  [3:0] pid,
    input        shift,
    input        load,
    input  [1:0] mode,

    output reg [3:0] pout,
    output           sout
);

reg [3:0] q;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        q <= 4'b0000;
    end
    else
    begin
        case(mode)

           
            2'b00:
            begin
                if (shift)
                    q <= {sid, q[3:1]};   
            end

            
            2'b01:
            begin
                if (shift)
                    q <= {sid, q[3:1]};  
            end

            2'b10:
            begin
                if (load)
                    q <= pid;            
                else if (shift)
                    q <= {1'b0, q[3:1]}; 
            end

            
            2'b11:
            begin
                if (load)
                    q <= pid;            
            end

            default:
                q <= q;
        endcase
    end
end

always @(*)
begin
    pout = q;
end

assign sout = q[0];

endmodule

