`timescale 1ns / 1ps
///DECODER
module top_module(
    input [7:0] sw,
    input [3:0] btn,
    output [7:0] led,
    output [6:0] cat,
    output [3:0] an,
    output dp);
    
    //DEMULTIPLEXER demux1(.D(sw[0]),.S(btn[1:0]), .O(led[3:0]));
    MULTIPLEXER mux1(.D(sw[3:0]),.S(btn[1:0]),.O(led[0]));
    //ENCODER encoder1(.IN(sw[3:0]),.OUT(led[1:0]),.V(led[7]));
    //DECODER decoder1(.IN(sw[3:0]),.OUT({dp,cat,led}));
    //assign an = 4'b1110;
    
endmodule
