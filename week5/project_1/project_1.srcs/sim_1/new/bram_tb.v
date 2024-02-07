`timescale 1ns / 1ps


module bram_tb;
wire [7:0] DOUT;
reg [3:0] ADDR=0;
reg CLK;
reg ENB=0;
integer count=0;
top_bram uut(.wea(ENB),
  .clk(CLK),
  .addr(ADDR),
  .dout(DOUT));
initial 
begin 
    CLK=0;
    forever #10 CLK=~CLK;
end 
initial 
$monitor ($time, "ADDR=%b , DOUT=%b", ADDR, DOUT);
initial
begin 
    while(count<16)
    begin
        ADDR=count;
        #20 count=count+1;
    end
    #20 $finish;
end
endmodule
