`timescale 1ns / 1ps
module FSM2(
input x,clk,
output z // could use for mealy machine
//output reg z // could use for moore machine
    );
reg q2,q1,q0;
//reg a; // could use for moore machine
wire Q2,Q1,Q0;
wire temp_a; 
initial 
begin
q2=1;
q1=1;
q0=0;
//a=0; // could use for moore machine
end
assign Q2=x;
assign Q0=temp_a& ~q1 & ~q0;
assign Q1=temp_a & q0 | temp_a & q1;
assign temp_a= ~(x ^ q2);
//assign temp_z=temp_a&q1;  // could use for moore machine
assign z=temp_a&q1; // could use for mealy machine
always @(posedge clk) 
begin
q2<=Q2;
q1<=Q1;
q0<=Q0;
//z<=temp_z; // could use for moore machine
//a<=temp_a; // could use for moore machine
end 
endmodule
