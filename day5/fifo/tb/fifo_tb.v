`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg rst_n;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

fifo dut(
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    data_in = 8'h00;

    #15 rst_n = 1;

    // Write AA
    #10;
    wr_en = 1;
    data_in = 8'hAA;

    // Write BB
    #10;
    data_in = 8'hBB;

    // Write CC
    #10;
    data_in = 8'hCC;

    // Stop Write
    #10;
    wr_en = 0;

    // Read FIFO
    #10;
    rd_en = 1;

    #30;
    rd_en = 0;

    #20;
    $finish;
end

initial
begin
    $display("# run 1000ns");

    $monitor("Time=%0t rst_n=%b wr=%b rd=%b din=%h dout=%h full=%b empty=%b",
              $time,
              rst_n,
              wr_en,
              rd_en,
              data_in,
              data_out,
              full,
              empty);
end

endmodule
