`timescale 1ns / 1ps

module TOP_tb();
    reg clk, reset, Start;
    reg signed [7:0] Ina, InB; 
    wire Busy;
    wire [7:0] Out;
    
    TOP uut(.clk(clk),
            .reset(reset),
            .Start(Start),
            .Ina(Ina), 
            .InB(InB),
            .Busy(Busy),
            .Out(Out)
            );

    initial begin
        clk=1'b0;
        reset=1'b1;
        #5;
    end
    always begin
        clk =~clk;
        #5;
    end

    initial begin
        reset=1'b1;
        #5;
        reset=1'b0;
        #5;
        Ina = 8'b00000011;InB = 8'b00000101;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b00000011;InB = 8'b11111011;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b11111101;InB = 8'b00000101;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b11111101;InB = 8'b11111011;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b00000000;InB = 8'b00000011;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b00000000;InB = 8'b11111101;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b00000011;InB = 8'b00000000;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b11111101;InB = 8'b00000000;Start = 1'b1;#1000;Start = 0;
        Ina = 8'b00000000;InB = 8'b00000000;Start = 1'b1;#1000;Start = 0;
        
        $finish;
    end
endmodule
