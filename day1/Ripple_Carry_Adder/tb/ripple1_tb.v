module ripple1_tb();
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire carry;
    ripple1 dut(a,b,cin,sum,carry);
   
    initial begin
    a=4'b0000;
    b=4'b0000;
    cin=1'b0;
   
    #5; a=4'b0011;
    b=4'b0101;
   
    #1;$display("a=%d b=%d sum=%0d,carry=%0d",a,b,sum,carry);
    end
endmodule

