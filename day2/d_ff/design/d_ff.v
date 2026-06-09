module d_ff(
    input D,
    input clk,
    output reg Q,
    output Qbar
);

assign Qbar = ~Q;

always @(posedge clk)
begin
    Q <= D;
end
