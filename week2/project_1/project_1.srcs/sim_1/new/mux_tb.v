`timescale 1ns / 1ps
module mux_tb;
        reg [7:0] SW;
        reg [3:0] BTN;
        wire [7:0] LED;
        wire [6:0] CAT;
        wire [3:0] AN;
        wire DP;
        top_module uut(.sw(SW),.btn(BTN), .led(LED),.cat(CAT),.an(AN),.dp(DP));
        initial 
            begin 
                BTN=2'b00; SW=4'b0001;
                #10 BTN=2'b00; SW=4'b0000;
                #10 BTN=2'b00; SW=4'b0010;
                #10 BTN=2'b00; SW=4'b0011;
                #10 BTN=2'b00; SW=4'b0100;
                #10 BTN=2'b01; SW=4'b0010;
                #10 BTN=2'b01; SW=4'b0000;
                #10 BTN=2'b01; SW=4'b0101;
                #10 BTN=2'b01; SW=4'b0110;
                #10 BTN=2'b01; SW=4'b0111;
                #10 BTN=2'b01; SW=4'b1000;
                #10 BTN=2'b10; SW=4'b0100;
                #10 BTN=2'b10; SW=4'b0000;
                #10 BTN=2'b10; SW=4'b1001;
                #10 BTN=2'b10; SW=4'b1010;
                #10 BTN=2'b10; SW=4'b1111;
                #10 BTN=2'b11; SW=4'b0000;
                #10 BTN=2'b11; SW=4'b1000;
                #10 BTN=2'b11; SW=4'b1100;
                #10 BTN=2'b11; SW=4'b0110;
                #10 BTN=2'b11; SW=4'b1101;
                #10 BTN=2'b11; SW=4'b1111;
                #10
                $finish;
            end      
endmodule

