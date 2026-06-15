`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 22:59:12
// Design Name: 
// Module Name: bcd_interface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bcd_adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

wire [4:0] temp_sum;
wire [4:0] corrected_sum;

assign temp_sum = A + B + Cin;

assign corrected_sum = (temp_sum > 9) ? (temp_sum + 6) : temp_sum;

assign Sum = corrected_sum[3:0];
assign Cout = corrected_sum[4];

endmodule
