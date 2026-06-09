module bcd_adder(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

wire [4:0] temp_sum;
wire [4:0] corrected_sum;

assign temp_sum = A + B + Cin;

assign corrected_sum = (temp_sum > 9) ?
                       (temp_sum + 5'b00110) :
                       temp_sum;

assign Sum  = corrected_sum[3:0];
assign Cout = corrected_sum[4];

endmodule

