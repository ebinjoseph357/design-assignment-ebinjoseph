module tb;

reg clk;
reg rst;
reg [7:0] data_in;
wire [7:0] data_out;

top dut(.clk(clk),.rst(rst),.data_in(data_in),.data_out(data_out));


initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial
begin

    rst = 1;
    data_in = 0;

    #20;
    rst = 0;
    
    @(posedge clk) data_in <= 8'd1;
    @(posedge clk) data_in <= 8'd2;
    @(posedge clk) data_in <= 8'd3;
    @(posedge clk) data_in <= 8'd4;
    @(posedge clk) data_in <= 8'd5;
    @(posedge clk) data_in <= 8'd6;
    @(posedge clk) data_in <= 8'd7;
    @(posedge clk) data_in <= 8'd8;  #200;

    $finish;

end endmodule
