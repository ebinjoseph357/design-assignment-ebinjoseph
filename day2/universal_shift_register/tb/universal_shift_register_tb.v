module universal_shift_register_tb;

    reg clk;
    reg reset;
    reg S1, S0;
    reg SR_in, SL_in;
    reg [3:0] D;

    wire [3:0] Q;

    universal_shift_register dut(
        .clk(clk),
        .reset(reset),
        .S1(S1),
        .S0(S0),
        .SR_in(SR_in),
        .SL_in(SL_in),
        .D(D),
        .Q(Q)
    );

   
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial
    begin
        $monitor("Time=%0t S1=%b S0=%b Q=%b",
                  $time,S1,S0,Q);

        reset = 1;
        #10;
        reset = 0;

       
        S1 = 1; S0 = 1;
        D = 4'b1010;
        #10;

        
        S1 = 0; S0 = 1;
        SR_in = 1;
        #10;

      
        S1 = 1; S0 = 0;
        SL_in = 0;
        #10;


        S1 = 0; S0 = 0;
        #10;

        $finish;
    end

endmodule
