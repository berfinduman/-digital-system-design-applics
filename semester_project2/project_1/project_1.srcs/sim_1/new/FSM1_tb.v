`timescale 1ns / 1ps
module detect_machine_tb();
 wire z;
 reg x; reg clk, rst;

//reg [15:0] test =16'b0100011000100001; reg flag= 1; //2A 8
//reg [15:0] test = 16'b1000001110000101; reg flag= 1; //2B 0
//reg [15:0] test = 16'b1000010000111001; reg flag= 1; //overlap
reg [15:0] test=  16'b0010100001110100; reg flag= 0; //iki tane 
reg [15:0] test1= 16'b0110001000011100;//3 kitleme

detect_machine uut(x, clk,rst, z);               
initial 
    begin 
        clk = 1;
        rst=1 ; #10 rst=0;    
        x=test[15];
        #5; 
 end
always #20 clk = !clk;

always @(posedge clk)
 begin
 
 
 test = test << 1;
x = test[15];

 if (test == 15'b0 ) begin
    if (!flag)
    begin
    rst= 1; #1
    rst=0;
    flag=1;
    test=test1;
    end
    else
    $finish; 
    
 end
 end
always @(negedge clk)
    begin
        $display("%b,%b",x,z);
    end
endmodule