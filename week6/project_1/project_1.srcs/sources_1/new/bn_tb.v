`timescale 1ns / 1ps


module bn_tb();
reg x;
 reg clk;
 wire z;
 
 detecs DUT (
 .x(x),
 .z(z),
 .clk(clk)
 );
 always
 begin
 clk = ~clk; #10;
 end
 
 initial
 begin
 clk = 1'b0;
 x = 1'b1; #15;
 x = 1'b1; #20;
 x = 1'b0; #20;
 x = 1'b1; #20;
 x = 1'b1; #20;
 x = 1'b0; #20;
 x = 1'b1; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 x = 1'b1; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 x = 1'b1; #20;
 x = 1'b1; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 x = 1'b1; #20;
 x = 1'b1; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 x = 1'b1; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 x = 1'b0; #20;
 end
endmodule
