`timescale 1ns / 1ps
module and_tb;
reg [15:0] inp1;
wire [7:0] out;
Top_module uut(.OUT(out),.IN(inp1));
initial 
begin 

inp1=16'b00;
#10 inp1=16'b01;;
#10 inp1=16'b10;
#10 inp1=16'b11;
#10
$finish;
end 
endmodule
