module face_detector(
    input clk,
    input rst,
    input wrenb,
    input rdenb,
    input [7:0] data_in,

    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem [7:0];
reg [2:0] wr_ptr;
reg [2:0] rd_ptr;

integer i;

assign full  = ((wr_ptr + 1'b1) == rd_ptr);
assign empty = (wr_ptr == rd_ptr);

always @(posedge clk)
begin
    if(rst)
    begin
        for(i=0;i<8;i=i+1)
            mem[i] <= 8'd0;

        wr_ptr   <= 3'd0;
        rd_ptr   <= 3'd0;
        data_out <= 8'd0;
    end
    else
    begin
        if(wrenb && !full)
        begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1'b1;
        end

        if(rdenb && !empty)
        begin
            data_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
        end
    end
end

endmodule

