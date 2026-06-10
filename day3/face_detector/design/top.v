module top(input clk,input rst,input [7:0] data_in,output [7:0] data_out);

wire [7:0] in_data;
wire [7:0] fifo_data;

wire rdenb;
wire full;
wire empty;

in_module IN(.clk(clk),.rst(rst),.din(data_in),.dout(in_data));

face_detector FIFO(.clk(clk),.rst(rst),.wrenb(1'b1),.rdenb(rdenb),.data_in(in_data),.data_out(fifo_data),
    .full(full),.empty(empty));

out_module OUT(.clk(clk),.rst(rst),.empty(empty),.fifo_data(fifo_data),
    .rdenb(rdenb),.data_out(data_out));

endmodule
