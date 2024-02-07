`timescale 1ns / 1ps

module conv_tb();
reg clk, rst;
reg signed [23:0] data1,data2,data3,data4,data5,data6,data7,data8,data9 ; 
reg signed [23:0] weight ; 
reg signed [23:0] weight1 ; 
reg signed [23:0] weight2 ; 
reg signed [23:0] weight3 ; 
wire signed [19:0] result_1,result_2,result_3,result_4,result_5,result_6,result_7,result_8,result_9; 
conv uut1(.clk(clk), .rst(rst), .data(data1),.weight(weight), .result(result_1));
conv uut2 (.clk(clk), .rst(rst), .data(data2),.weight(weight), .result(result_2));
conv uut3 (.clk(clk), .rst(rst), .data(data3), .weight(weight), .result(result_3));

conv uut4(.clk(clk), .rst(rst), .data(data4),.weight(weight), .result(result_4));
conv uut5 (.clk(clk), .rst(rst), .data(data5),.weight(weight), .result(result_5));
conv uut6 (.clk(clk), .rst(rst), .data(data6), .weight(weight), .result(result_6));


conv uut7(.clk(clk), .rst(rst), .data(data7),.weight(weight), .result(result_7));
conv uut8 (.clk(clk), .rst(rst), .data(data8),.weight(weight), .result(result_8));
conv uut9 (.clk(clk), .rst(rst), .data(data9), .weight(weight), .result(result_9));


initial 
begin 
        clk=0;
        rst = 1;  #1
        clk = 0;
        rst=0;  
        weight1 = 24'b11111111_11111111_11111111;  
        weight2 = 24'b11111111_00001000_11111111; 
        weight3 = 24'b11111111_11111111_11111111;
        
        data1=24'b10000000_10000000_10000000; 
        data2=24'b10000000_10000000_10000000; 
        data3=24'b10000000_10000000_10000000;
        data4=24'b11111111_11111111_10000000; 
        data5=24'b11111111_10000000_11111111;
        data6=24'b10000000_11111111_11111111;  
        data7=24'b11111111_11111111_10000000;  
        data8=24'b11111111_10000000_11111111;  
        data9=24'b10000000_11111111_11111111;  
        weight= weight1; #10;
        
      
        data1=24'b11111111_11111111_10000000; 
        data2=24'b11111111_10000000_11111111;
        data3=24'b10000000_11111111_11111111;  
        data4=24'b11111111_11111111_10000000;  
        data5=24'b11111111_10000000_11111111;  
        data6=24'b10000000_11111111_11111111; 
        data7=24'b11111111_11111111_10000000;  
        data8=24'b11111111_10000000_11111111;  
        data9=24'b10000000_11111111_11111111; 
        weight= weight2; #10; 
        
        data1=24'b11111111_11111111_10000000; 
        data2=24'b11111111_10000000_11111111;
        data3=24'b10000000_11111111_11111111;  
        data4=24'b11111111_11111111_10000000;  
        data5=24'b11111111_10000000_11111111;  
        data6=24'b10000000_11111111_11111111; 
        data7=24'b11111111_11111111_10000000;  
        data8=24'b11111111_10000000_11111111;  
        data9=24'b10000000_11111111_11111111; 
        weight= weight3; #10;  
        

        $write("Results \n%d %d %d \n%d %d %d \n%d %d %d ",result_1,result_2,result_3,result_4,result_5,result_6,result_7,result_8,result_9); 
        
        
        
        
        
        #20;        
        $finish; 
end

always 
begin 
    clk<=~clk;
    #5;
    
end


endmodule