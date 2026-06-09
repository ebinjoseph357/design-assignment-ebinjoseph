module bcd_adder_tb;

    reg  [3:0] A_tb;
    reg  [3:0] B_tb;
    reg        Cin_tb;

    wire [3:0] Sum_tb;
    wire       Cout_tb;

    bcd_adder dut(
        .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_tb),
        .Cout(Cout_tb)
    );

    initial
    begin
        $monitor("Time=%0t A=%d B=%d Cin=%b Sum=%d Cout=%b",
                 $time, A_tb, B_tb, Cin_tb, Sum_tb, Cout_tb);

        
        A_tb = 4'd3; B_tb = 4'd4; Cin_tb = 0;
        #10;

       
        A_tb = 4'd5; B_tb = 4'd7; Cin_tb = 0;
        #10;

        
        A_tb = 4'd9; B_tb = 4'd8; Cin_tb = 0;
        #10;

        
        A_tb = 4'd9; B_tb = 4'd9; Cin_tb = 1;
        #10;

        $finish;
    end

endmodule

