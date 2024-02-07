`timescale 1ns / 1ps
module FSM1(
input x,clk,
output z // could use for mealy machine
//output reg z // could use for moore machine
    );
reg q2,q1,q0;
wire Q2,Q1,Q0;
//wire temp_z; // could use for moore machine
initial 
begin
q2=1;
q1=1;
q0=0;
end
assign Q0=(~q2&~q1&~q0)|(x& ~q0)|(x& ~q1);
assign Q1=(~q2&~q1&q0) |(q1&~q0)| (x&~q2&~q1);
assign Q2=(x&q2) | (x&q1&q0);
//assign temp_z=(~x&q1&~q0)|(x&q2&q0);  // could use for moore machine
assign z=(~x&q1&~q0)|(x&q2&q0); // could use for mealy machine
always @(posedge clk) 
begin
q2<=Q2;
q1<=Q1;
q0<=Q0;
//z<=temp_z; // could use for moore machine
end 
endmodule

