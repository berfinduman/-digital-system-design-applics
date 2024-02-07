`timescale 1ns / 1ps
module register_tb();
    reg CLK;
    reg CLEAR;
    reg [7:0] IN;
    wire [7:0] OUT;
    register_8 uut(.CLK(CLK),.CLEAR(CLEAR),.IN(IN),.OUT(OUT));
initial
begin
    IN=5; CLK=0; CLEAR= 0; #10
    IN=8; CLK=1; CLEAR=0; #10
    IN=9; CLK =1; CLEAR=1; #10
    IN =37; CLK=0; #10
    IN=66; CLK=1; CLEAR= 0; #10 
    #10
    $finish;
end
endmodule
