`timescale 1ns / 1ps

module abs_tb();
    reg signed [7:0] a;
    reg signed [7:0] b;
    wire [7:0] c;
    
    abs uut(.a(a),.b(b),.c(c));
    initial begin 
    a = 0; b = 0; 
    #10;
    a = 8'b11111101; b = 8'b00000101;
    #10;
    a = 8'b11111101; b = 8'b11111011;
    #10;
    a = 8'b00000011; b = 8'b00000101;
    #10;
    a = 8'b00000011; b = 8'b11111011;
    #10
    $finish; 
    end
        
endmodule
