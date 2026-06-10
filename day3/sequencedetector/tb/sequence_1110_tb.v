module sequence_1110_tb(

    );
    reg clk_tb,rst_tb,din_tb;
    wire detetcted_tb;
    sequence_1110 dut(clk_tb,rst_tb,din_tb,detetcted_tb);
    initial begin
    {clk_tb,rst_tb,din_tb}=0;
    end
    always #5 clk_tb=~clk_tb;
    initial begin
    rst_tb=1'b1;
    #10
    rst_tb=1'b0;
    #10
    din_tb=0;
    #10
    din_tb=1;
    #10
    din_tb=1;
    #10
    din_tb=1;
    #10;
    din_tb=0;
    #10;
    end
endmodule
