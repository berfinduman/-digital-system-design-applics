`timescale 1ns / 1ps

module mac_tb();
reg clk, rst;
reg signed [23:0] data,weight; 
wire signed [19:0] result; 
MAC uut(.clk(clk), .rst(rst), .data(data), .weight(weight), .result(result));
initial 
begin 
        rst = 1;  #1
        clk=0;
        rst=0;
        data = 24'b00000000_0000100_00000000; // 0 4 0 
        weight = 24'b11111111_11111111_11111111;  
 
        #9
        data = 24'b00000001_00001001_00000000; // 1 9 0 
        weight = 24'b11111111_00001000_11111111; 
          
        #9
        data = 24'b00000001_00000000_00001000; // 108
        weight = 24'b11111111_11111111_11111111;  
        #20;        
        $finish; 
end

always 
begin 
    clk<=~clk;
    #5;
    
end


endmodule
