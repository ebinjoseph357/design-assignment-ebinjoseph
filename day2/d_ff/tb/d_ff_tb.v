module d_ff_tb;

    reg D_tb;
    reg clk_tb;
    wire Q_tb;
    wire Qbar_tb;

    d_ff dut(
        .D(D_tb),
        .clk(clk_tb),
        .Q(Q_tb),
        .Qbar(Qbar_tb)
    );

    
    initial
    begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

   
    initial
    begin
        $monitor("Time=%0t clk=%b D=%b Q=%b",
                 $time, clk_tb, D_tb, Q_tb);

        D_tb = 0; #10;
        D_tb = 1; #10;
        D_tb = 0; #10;
        D_tb = 1; #10;

        $finish;
    end

endmodule
