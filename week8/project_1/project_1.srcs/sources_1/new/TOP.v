`timescale 1ns / 1ps
module TOP(
input clk,rst,conv_run,
output [1023:0] data_end,
output conv_done);

wire signed [7:0] result [127:0];
wire ram_addres;
reg signed [80:0] kernel; 
reg wea_b2;
initial
begin
assign wea_b2=1'b1; 
assign kernel= 81'b111111111_111111111_111111111_111111111_000001000_111111111_111111111_111111111_111111111;
end

bram1 bram_ins(.ena_0(1'b1),.wea_0(1'b0), .wea_1(wea_b2),.clka_0(clk),.reset_0(rst),.conv_run_0(conv_run),.kernel_0(kernel),.douta_0(data_end),.conv_done_0(conv_done));

always @(posedge conv_done)
if (conv_done==1)
begin
wea_b2 = 1'b0;
end

endmodule
