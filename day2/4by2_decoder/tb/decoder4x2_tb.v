module decoder2x4_tb;

    reg [1:0] A_tb;
    wire [3:0] Y_tb;

    decoder2x4 dut(
        .A(A_tb),
        .Y(Y_tb)
    );

    initial
    begin
        $monitor("Time=%0t A=%b Y=%b",
                  $time, A_tb, Y_tb);

        A_tb = 2'b00; #10;
        A_tb = 2'b01; #10;
        A_tb = 2'b10; #10;
        A_tb = 2'b11; #10;

        $finish;
    end

endmodule
