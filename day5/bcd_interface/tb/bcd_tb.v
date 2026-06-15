`timescale 1ns/1ps

module bcd_adder_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;

wire [3:0] Sum;
wire Cout;

bcd_adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    $display("\nBCD Adder Verification");
    $display("-------------------------------------");
    $display("Time\tA\tB\tCin\tSum\tCout");
    $display("-------------------------------------");

    $monitor("%0t\t%d\t%d\t%b\t%d\t%b",
              $time, A, B, Cin, Sum, Cout);
end

initial begin

    A = 4'd0; B = 4'd0; Cin = 0; #10;
    A = 4'd3; B = 4'd4; Cin = 0; #10;
    A = 4'd5; B = 4'd4; Cin = 0; #10;
    A = 4'd6; B = 4'd8; Cin = 0; #10;
    A = 4'd9; B = 4'd9; Cin = 0; #10;
    A = 4'd9; B = 4'd9; Cin = 1; #10;

    $display("-------------------------------------");
    $display("Simulation Completed");
    $finish;

end

endmodule
