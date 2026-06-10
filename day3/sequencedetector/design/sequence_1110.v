module sequence_1110(input clk,rst,din,output reg detected

    );
parameter idle=2'b00;   
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
reg [1:0]ps,ns;

always @(posedge clk)
begin
if (rst)
ps<=idle;
else 
ps<=ns;
end

always @(*)
begin
case(ps)
idle:begin
detected=1'b1;
if(din==0) begin
ns=idle;
detected=1'b0;

end
else begin
ns=s1;
detected=1'b0;
end
end
s1:begin
if (din==0) begin
ns=idle;
detected=1'b0;
end
else begin
ns=s2;
detected=1'b0;
end
end
s2:begin
if (din==0) begin
ns=idle;
detected=1'b0;
end
else begin
ns=s3;
detected=1'b0;
end
end
s3:begin
if (din==0) begin
ns=idle;
detected=1'b1;
end
else begin
ns=s3;
detected=1'b0;
end
end
endcase
end
endmodule
