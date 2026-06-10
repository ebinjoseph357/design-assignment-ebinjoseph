module out_module(input clk,input rst,input empty,input [7:0] fifo_data,output reg rdenb,
    output reg [7:0] data_out);

parameter WAIT0 = 2'b00,
          WAIT1 = 2'b01,
          READ  = 2'b10;

reg [1:0] state, next_state;


always @(posedge clk)
begin
    if(rst)
        state <= WAIT0;
    else
        state <= next_state;
end




always @(*)
begin
    case(state)
        WAIT0 : next_state = WAIT1;
        WAIT1 : next_state = READ;
        READ  : next_state = WAIT0;
        default : next_state = WAIT0;
    endcase
end




always @(posedge clk)
begin
    if(rst)
    begin
        rdenb    <= 1'b0;
        data_out <= 8'd0;
    end
    else
    begin
        case(state)

            READ:
            begin
                rdenb <= !empty;

                if(!empty)
                    data_out <= fifo_data;
            end

            default:
                 rdenb <= 1'b0;    

        endcase
    end
end

endmodule
