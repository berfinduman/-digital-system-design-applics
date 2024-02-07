//`timescale 1ns / 1ps

//module Cond_Sum_Adder(
//    input cin,
//    input [7:0] x,
//    input [7:0] y,
//    output  cout,
//    output [7:0] sum
//);

//    wire [14:0] fa_cout;
//    wire [14:0] fa_sum;
//    wire [6:0] mux_1_sum  ;
//    wire [6:0] mux_1_cout;
//    wire [1:0] mux_2_sum [2:0];
//    wire [2:0] mux_2_cout;
//    wire [3:0] mux_3_sum ;
//    wire mux_3_cout;
    
    
//    //x0,y0
//    FA FA0(.x(x[0]), .y(y[0]), .cin(cin), .cout(fa_cout[0]), .s(fa_sum[0]));
    
//    //x1 y1
//    FA FA1(.x(x[1]), .y(y[1]), .cin(1'b0), .cout(fa_cout[1]), .s(fa_sum[1]));
//    FA FA2(.x(x[1]), .y(y[1]), .cin(1'b1), .cout(fa_cout[2]), .s(fa_sum[2]));
    
//    //x2 y2
//    FA FA3(.x(x[2]), .y(y[2]), .cin(1'b0), .cout(fa_cout[3]), .s(fa_sum[3]));
//    FA FA4(.x(x[2]), .y(y[2]), .cin(1'b1), .cout(fa_cout[4]), .s(fa_sum[4]));
    
//    //x3 y3
//    FA FA5(.x(x[3]), .y(y[3]), .cin(1'b0), .cout(fa_cout[5]), .s(fa_sum[5]));
//    FA FA6(.x(x[3]), .y(y[3]), .cin(1'b1), .cout(fa_cout[6]), .s(fa_sum[6]));
    
//    //x4 y4
//    FA FA7(.x(x[4]), .y(y[4]), .cin(1'b0), .cout(fa_cout[7]), .s(fa_sum[7]));
//    FA FA8(.x(x[4]), .y(y[4]), .cin(1'b1), .cout(fa_cout[8]), .s(fa_sum[8]));
    
//    //x5 y5
//    FA FA9(.x(x[5]), .y(y[5]), .cin(1'b0), .cout(fa_cout[9]), .s(fa_sum[9]));
//    FA FA10(.x(x[5]), .y(y[5]), .cin(1'b1), .cout(fa_cout[10]), .s(fa_sum[10])); 
    
//    //x6 y6
//    FA FA11(.x(x[6]), .y(y[6]), .cin(1'b0), .cout(fa_cout[11]), .s(fa_sum[11]));
//    FA FA12(.x(x[6]), .y(y[6]), .cin(1'b1), .cout(fa_cout[12]), .s(fa_sum[12]));  
    
//    //x7 y7
//    FA FA13(.x(x[7]), .y(y[7]), .cin(1'b0), .cout(fa_cout[13]), .s(fa_sum[13]));
//    FA FA14(.x(x[7]), .y(y[7]), .cin(1'b1), .cout(fa_cout[14]), .s(fa_sum[14]));  
    
//    //First Layer
//    //MUX
//    assign mux_1_sum[0]=(fa_cout[0])? fa_sum[2]:fa_sum[1];
//    assign mux_1_cout[0]=(fa_cout[0])? fa_cout[2]:fa_cout[1];
//    //MUX
//    assign mux_1_sum[1]=(fa_cout[3])? fa_sum[6]:fa_sum[5];
//    assign mux_1_cout[1]=(fa_cout[3])? fa_cout[6]:fa_cout[5];
//    //MUX
//    assign mux_1_sum[2]=(fa_cout[4])? fa_sum[6]:fa_sum[5];
//    assign mux_1_cout[2]=(fa_cout[4])? fa_cout[6]:fa_cout[5];
//    //MUX
//    assign mux_1_sum[3]=(fa_cout[7])? fa_sum[10]:fa_sum[9];
//    assign mux_1_cout[3]=(fa_cout[7])? fa_cout[10]:fa_cout[9];
//    //MUX
//    assign mux_1_sum[4]=(fa_cout[8])? fa_sum[10]:fa_sum[9];
//    assign mux_1_cout[4]=(fa_cout[8])? fa_cout[10]:fa_cout[9];
//    //MUX
//    assign mux_1_sum[5]=(fa_cout[11])? fa_sum[14]:fa_sum[13];
//    assign mux_1_cout[5]=(fa_cout[11])? fa_cout[14]:fa_cout[13];
//    //MUX
//    assign mux_1_sum[6]=(fa_cout[12])? fa_sum[14]:fa_sum[13];
//    assign mux_1_cout[6]=(fa_cout[12])? fa_cout[14]:fa_cout[13];
    
     
//    //Second Layer
//    //MUX
//    assign mux_2_sum[0]=(mux_1_cout[0])? {mux_1_sum[2],fa_sum[4]}:{mux_1_sum[1],fa_sum[3]};
//    assign mux_2_cout[0]=(mux_1_cout[0])? mux_1_cout[2]:mux_1_cout[1];
    
//    //MUX
//    assign mux_2_sum[1]=(mux_1_cout[3])? {mux_1_sum[6],fa_sum[12]}:{mux_1_sum[5],fa_sum[11]};
//    assign mux_2_cout[1]=(mux_1_cout[3])? mux_1_cout[5]:mux_1_cout[6];

//    //MUX
//    assign mux_2_sum[2]=(mux_1_cout[4])? {mux_1_sum[6],fa_sum[12]}:{mux_1_sum[5],fa_sum[11]};
//    assign mux_2_cout[2]=(mux_1_cout[4])? mux_1_cout[6]:mux_1_cout[5];
    
//    //Third Layer
//    assign mux_3_sum= (mux_2_cout[0]) ? {mux_2_sum[2][1],mux_2_sum[2][0],mux_1_sum[4],fa_sum[8]} : {mux_2_sum[1][1],mux_2_sum[1][0], mux_1_sum[3], fa_sum[7]}; 
//    assign mux_3_cout= (mux_2_cout[0]) ? mux_2_cout[2]: mux_2_cout[1];
    
//    //OUTPUT Layer
//    assign cout=mux_3_cout;
//    assign sum = {mux_3_sum,mux_2_sum[0][1],mux_2_sum[0][0], mux_1_sum[0], fa_sum[0]};
    
   
    


//endmodule



`timescale 1ns / 1ps

(*DONT_TOUCH="TRUE"*)
module Cond_Sum_Adder(
    input cin,
    input [31:0] x,
    input [31:0] y,
    output overflow,
    output  cout,
    output [31:0] sum
);

    wire [6:0] fa_cout;
    wire [6:0] fa_sum;
    wire [2:0] mux_1_sum  ;
    wire [2:0] mux_1_cout;
    wire [1:0] mux_2_sum ;
    wire mux_2_cout;
    wire [3:0] mux_3_sum ;
    wire mux_3_cout;
    wire [3:0] mux_3_sum_2,mux_3_sum_3,mux_3_sum_4,mux_3_sum_5,mux_3_sum_6,mux_3_sum_7;
    wire mux_3_cout_2, mux_3_cout_3, mux_3_cout_4, mux_3_cout_5, mux_3_cout_6, mux_3_cout_7;
    
    
    //x0,y0
    FA FA0(.x(x[0]), .y(y[0]), .cin(cin), .cout(fa_cout[0]), .s(fa_sum[0]));
    
    //x1 y1
    FA FA1(.x(x[1]), .y(y[1]), .cin(1'b0), .cout(fa_cout[1]), .s(fa_sum[1]));
    FA FA2(.x(x[1]), .y(y[1]), .cin(1'b1), .cout(fa_cout[2]), .s(fa_sum[2]));
    
    //x2 y2
    FA FA3(.x(x[2]), .y(y[2]), .cin(1'b0), .cout(fa_cout[3]), .s(fa_sum[3]));
    FA FA4(.x(x[2]), .y(y[2]), .cin(1'b1), .cout(fa_cout[4]), .s(fa_sum[4]));
    
    //x3 y3
    FA FA5(.x(x[3]), .y(y[3]), .cin(1'b0), .cout(fa_cout[5]), .s(fa_sum[5]));
    FA FA6(.x(x[3]), .y(y[3]), .cin(1'b1), .cout(fa_cout[6]), .s(fa_sum[6]));
    
    //First Layer
    //MUX
    assign mux_1_sum[0]=(fa_cout[0])? fa_sum[2]:fa_sum[1];
    assign mux_1_cout[0]=(fa_cout[0])? fa_cout[2]:fa_cout[1];
    //MUX
    assign mux_1_sum[1]=(fa_cout[3])? fa_sum[6]:fa_sum[5];
    assign mux_1_cout[1]=(fa_cout[3])? fa_cout[6]:fa_cout[5];
    //MUX
    assign mux_1_sum[2]=(fa_cout[4])? fa_sum[6]:fa_sum[5];
    assign mux_1_cout[2]=(fa_cout[4])? fa_cout[6]:fa_cout[5];
       
              
    //Second Layer
    //MUX
    assign mux_2_sum=(mux_1_cout[0])? {mux_1_sum[2],fa_sum[4]}:{mux_1_sum[1],fa_sum[3]};
    assign mux_2_cout=(mux_1_cout[0])? mux_1_cout[2]:mux_1_cout[1];
    
    assign cout3=mux_2_cout;

    fourBcond fourb(.x(x[7:4]),.y(y[7:4]),.cout_in(cout3),.mux_3_sum(mux_3_sum),.mux_3_cout(mux_3_cout)); //4-7
    fourBcond fourb2(.x(x[11:8]),.y(y[11:8]),.cout_in(mux_3_cout),.mux_3_sum(mux_3_sum_2),.mux_3_cout(mux_3_cout_2)); //8-11
    fourBcond fourb3(.x(x[15:12]),.y(y[15:12]),.cout_in(mux_3_cout_2),.mux_3_sum(mux_3_sum_3),.mux_3_cout(mux_3_cout_3)); //12-15
    fourBcond fourb4(.x(x[19:16]),.y(y[19:16]),.cout_in(mux_3_cout_3),.mux_3_sum(mux_3_sum_4),.mux_3_cout(mux_3_cout_4)); //16-19
    fourBcond fourb5(.x(x[23:20]),.y(y[23:20]),.cout_in(mux_3_cout_4),.mux_3_sum(mux_3_sum_5),.mux_3_cout(mux_3_cout_5)); //20-23
    fourBcond fourb6(.x(x[27:24]),.y(y[27:24]),.cout_in(mux_3_cout_5),.mux_3_sum(mux_3_sum_6),.mux_3_cout(mux_3_cout_6)); //24-27
    fourBcond fourb7(.x(x[31:28]),.y(y[31:28]),.cout_in(mux_3_cout_6),.mux_3_sum(mux_3_sum_7),.mux_3_cout(mux_3_cout_7)); //28-31    
    
    //OUTPUT Layer
    assign cout=mux_3_cout_7;
    assign sum = {mux_3_sum_7,mux_3_sum_6,mux_3_sum_5,mux_3_sum_4,mux_3_sum_3,mux_3_sum_2, mux_3_sum,mux_2_sum[1],mux_2_sum[0], mux_1_sum[0], fa_sum[0]};
    assign overflow = (x[31] & y[31] & ~sum[31]) | (~x[31] & ~y[31] & sum[31]);
   
endmodule

