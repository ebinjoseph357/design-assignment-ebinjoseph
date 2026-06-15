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


module fifo (
    input clk,
    input rst_n,
    input wr_en,
    input rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem [0:7];
reg [2:0] wptr;
reg [2:0] rptr;
reg [3:0] count;

assign full  = (count == 8);
assign empty = (count == 0);

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        wptr <= 0;
        rptr <= 0;
        count <= 0;
        data_out <= 8'h00;
    end
    else
    begin
        if(wr_en && !full)
        begin
            mem[wptr] <= data_in;
            wptr <= wptr + 1;
            count <= count + 1;
        end

        if(rd_en && !empty)
        begin
            data_out <= mem[rptr];
            rptr <= rptr + 1;
            count <= count - 1;
        end
    end
end

endmodule
