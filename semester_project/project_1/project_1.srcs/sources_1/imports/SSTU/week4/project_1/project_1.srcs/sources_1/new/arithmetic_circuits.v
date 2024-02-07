`timescale 1ns / 1ps

module HA(
    input x,
    input y,
    output cout,
    output s
    );
    
    (*dont_touch = "true" *)wire x_wire = x;
    (*dont_touch = "true" *)wire y_wire= y;
    (*dont_touch = "true" *)wire c_wire = cout;
    (*dont_touch = "true" *)wire s_wire = s;
    
    assign s = x ^ y;
    assign cout = x & y;       
endmodule

module FA(
    input x,
    input y,
    input cin,
    output cout,
    output s
    );
    
    (*dont_touch = "true" *)wire x_wire = x;
    (*dont_touch = "true" *)wire y_wire= y;
    (*dont_touch = "true" *)wire cin_wire =cin;
    (*dont_touch = "true" *)wire c_wire = cout;
    (*dont_touch = "true" *)wire s_wire = s;
    (*dont_touch = "true" *)wire ha1_s, ha1_c, ha2_c;
    
    HA HA1(.x(x), .y(y),.cout(ha1_c),.s(ha1_s));
    
    HA HA2(.x(ha1_s), .y(cin),.cout(ha2_c),.s(s));
    
    assign cout = ha2_c | ha1_c;
endmodule

module RCA(
    input [3:0]x,
    input [3:0]y,
    input cin,

    output [3:0]s,        
    output cout
    );
    
    (*dont_touch = "true" *)wire x_wire = x;
    (*dont_touch = "true" *)wire y_wire= y;
    (*dont_touch = "true" *)wire cin_wire =cin;
    (*dont_touch = "true" *)wire s_wire = s;
    (*dont_touch = "true" *)wire c_wire = cout;
    (*dont_touch = "true" *)wire cout0, cout1, cout2;
    
    FA FA0(.x(x[0]), .y(y[0]), .cin(cin),
           .s(s[0]), .cout(cout0));
           
    FA FA1(.x(x[1]), .y(y[1]), .cin(cout0),
           .s(s[1]), .cout(cout1));
           
    FA FA2(.x(x[2]), .y(y[2]), .cin(cout1),
           .s(s[2]), .cout(cout2));
           
    FA FA3(.x(x[3]), .y(y[3]), .cin(cout2),
           .s(s[3]), .cout(cout));          
endmodule

module parametric_RCA#(parameter SIZE=4)(
    input [SIZE-1:0]x,
    input [SIZE-1:0]y,
    input cin,
    
    output [SIZE-1:0]s,
    output cout
    );
    
    (*dont_touch = "true" *) wire x_wire = x;
    (*dont_touch = "true" *) wire y_wire = y;
    (*dont_touch = "true" *) wire cin_wire = cin;
    (*dont_touch = "true" *) wire s_wire = s;
    (*dont_touch = "true" *) wire cout_wire = cout;
    (*dont_touch = "true" *)wire [SIZE:0] carry;
    
    assign carry[0] = cin;
    assign cout = carry[SIZE]; 
    
    genvar i;
    generate 
    for(i=0; i<SIZE; i=i+1)
        begin : FA_loop        
        FA FAs(.x(x[i]), .y(y[i]), .cin(carry[i]), .cout(carry[i+1]), .s(s[i]));
        end   
    endgenerate           
endmodule

module CLA(
    input [3:0]x,
    input [3:0]y,
    input cin,

    output [3:0]s,        
    output cout    
    );
    
    (*dont_touch = "true" *) wire x_wire = x;
    (*dont_touch = "true" *) wire y_wire = y;
    (*dont_touch = "true" *) wire cin_wire = cin;
    (*dont_touch = "true" *) wire s_wire = s;
    (*dont_touch = "true" *) wire cout_wire = cout; 
    (*dont_touch = "true" *) wire [3:0]c;
    
    assign c[0]=((x[0]^y[0])&cin)|(x[0]&y[0]);
    assign c[1]=((x[1]^y[1])&c[0])|(x[1]&y[1]);
    assign c[2]=((x[2]^y[2])&c[1])|(x[2]&y[2]);
    assign c[3]=((x[3]^y[3])&c[2])|(x[3]&y[3]);
    assign cout = c[3];
    
    assign s[0] = x[0] ^ y[0] ^ cin;
    assign s[1] = x[1] ^ y[1] ^ c[0];
    assign s[2] = x[2] ^ y[2] ^ c[1];
    assign s[3] = x[3] ^ y[3] ^ c[2];
               
endmodule

module Add_Sub(
    input [3:0]x,
    input [3:0]y,
    input cin,

    output [3:0]s,        
    output cout,
    output v   
    );
    (*dont_touch = "true" *) wire x_wire = x;
    (*dont_touch = "true" *) wire y_wire = y;
    (*dont_touch = "true" *) wire cin_wire = cin;
    (*dont_touch = "true" *) wire s_wire = s;
    (*dont_touch = "true" *) wire cout_wire = cout; 
    (*dont_touch = "true" *) wire v_wire = v;

    
    (*dont_touch = "true" *) wire y0, y1, y2,y3;
    (*dont_touch = "true" *) wire cout0, cout1, cout2;

    
    assign y0 = y[0] ^ cin;
    assign y1 = y[1] ^ cin;
    assign y2 = y[2] ^ cin;
    assign y3 = y[3] ^ cin;

    FA FA0(.x(x[0]), .y(y0), .cin(cin),
           .s(s[0]), .cout(cout0));
           
    FA FA1(.x(x[1]), .y(y1), .cin(cout0),
           .s(s[1]), .cout(cout1));
           
    FA FA2(.x(x[2]), .y(y2), .cin(cout1),
           .s(s[2]), .cout(cout2));
           
    FA FA3(.x(x[3]), .y(y3), .cin(cout2),
           .s(s[3]), .cout(cout));
           
    assign v = cout ^ cout2;
endmodule


