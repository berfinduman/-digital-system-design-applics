`timescale 1ns / 1ps
module Top_module(
    input [15:0] IN, 
    output [7:0] OUT
    );
    AND AND_GATE(.O(OUT[0]), .I1(IN[0]), .I2(IN[1]));
    
endmodule
