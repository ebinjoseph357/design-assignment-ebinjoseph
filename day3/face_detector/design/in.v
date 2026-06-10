module in_module(
    input clk,
    input rst,
    input [7:0] din,
    output reg [7:0] dout
);

always @(posedge clk)
begin
    if(rst)
        dout <= 8'd0;
    else
        dout <= din;
end

endmodule
