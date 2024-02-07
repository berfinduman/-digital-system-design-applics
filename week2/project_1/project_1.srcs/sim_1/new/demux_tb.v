`timescale 1ns / 1ps
module demux_tb;
        reg [7:0] SW;
        reg [3:0] BTN;
        wire [7:0] LED;
        wire [6:0] CAT;
        wire [3:0] AN;
        wire DP;
        top_module uut(.sw(SW),.btn(BTN), .led(LED),.cat(CAT),.an(AN),.dp(DP));
        initial 
            begin 
                SW=1'b1; BTN=2'b00;
                #10 SW=1'b0; BTN=2'b00;
                #10 SW=1'b1; BTN=2'b01;
                #10 SW=1'b0; BTN=2'b01;
                #10 SW=1'b1; BTN=2'b10;
                #10 SW=1'b0; BTN=2'b10; 
                #10 SW=1'b1; BTN=2'b11;
                #10 SW=1'b0; BTN=2'b11;
                #10
                $finish;
            end      
endmodule

