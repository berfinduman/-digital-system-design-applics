`timescale 1ns / 1ps

module fourBcond(   
    input [3:0] x,
    input [3:0] y,
    input cout_in,
    output [3:0] mux_3_sum ,
    output mux_3_cout

    );
    wire [7:0] fa_cout;
    wire [7:0] fa_sum;
    wire [3:0] mux_1_sum  ;
    wire [3:0] mux_1_cout;
    wire [1:0] mux_2_sum [1:0];
    wire [1:0] mux_2_cout;


 //x4 y4
    FA FA0(.x(x[0]), .y(y[0]), .cin(1'b0), .cout(fa_cout[0]), .s(fa_sum[0]));
    FA FA1(.x(x[0]), .y(y[0]), .cin(1'b1), .cout(fa_cout[1]), .s(fa_sum[1]));
    
    //x5 y5
    FA FA2(.x(x[1]), .y(y[1]), .cin(1'b0), .cout(fa_cout[2]), .s(fa_sum[2]));
    FA FA3(.x(x[1]), .y(y[1]), .cin(1'b1), .cout(fa_cout[3]), .s(fa_sum[3])); 
    
    //x6 y6
    FA FA4(.x(x[2]), .y(y[2]), .cin(1'b0), .cout(fa_cout[4]), .s(fa_sum[4]));
    FA FA5(.x(x[2]), .y(y[2]), .cin(1'b1), .cout(fa_cout[5]), .s(fa_sum[5]));  
    
    //x7 y7
    FA FA6(.x(x[3]), .y(y[3]), .cin(1'b0), .cout(fa_cout[6]), .s(fa_sum[6]));
    FA FA7(.x(x[3]), .y(y[3]), .cin(1'b1), .cout(fa_cout[7]), .s(fa_sum[7]));  
    
    //FIRST LAY
    //MUX
    assign mux_1_sum[0]=(fa_cout[0])? fa_sum[3]:fa_sum[2];
    assign mux_1_cout[0]=(fa_cout[0])? fa_cout[3]:fa_cout[2];
    //MUX
    assign mux_1_sum[1]=(fa_cout[1])? fa_sum[3]:fa_sum[2];
    assign mux_1_cout[1]=(fa_cout[1])? fa_cout[3]:fa_cout[2];
    //MUX
    assign mux_1_sum[2]=(fa_cout[4])? fa_sum[7]:fa_sum[6];
    assign mux_1_cout[2]=(fa_cout[4])? fa_cout[7]:fa_cout[6];
    //MUX
    assign mux_1_sum[3]=(fa_cout[5])? fa_sum[7]:fa_sum[6];
    assign mux_1_cout[3]=(fa_cout[5])? fa_cout[7]:fa_cout[6];
    
    //SECOND LAY
    //MUX
    assign mux_2_sum[0]=(mux_1_cout[0])? {mux_1_sum[3],fa_sum[5]}:{mux_1_sum[2],fa_sum[4]};
    assign mux_2_cout[0]=(mux_1_cout[0])? mux_1_cout[2]:mux_1_cout[3];

    //MUX
    assign mux_2_sum[1]=(mux_1_cout[1])? {mux_1_sum[3],fa_sum[5]}:{mux_1_sum[2],fa_sum[4]};
    assign mux_2_cout[1]=(mux_1_cout[1])? mux_1_cout[3]:mux_1_cout[2];
    
    assign mux_3_sum= (cout_in) ? {mux_2_sum[1][1],mux_2_sum[1][0],mux_1_sum[1],fa_sum[1]} : {mux_2_sum[0][1],mux_2_sum[0][0], mux_1_sum[0], fa_sum[0]}; 
    assign mux_3_cout= (cout_in) ? mux_2_cout[1]: mux_2_cout[0];
    
endmodule
