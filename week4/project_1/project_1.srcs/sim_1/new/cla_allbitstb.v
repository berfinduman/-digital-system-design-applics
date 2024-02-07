`timescale 1ns / 1ps
module CLA_tb();
	// ----- Inputs & Outputs
	reg [3:0] X;
	reg [3:0] Y;
	reg C_i; 
	wire C_o;
	wire [3:0] S;
	// ----- Testbench Parameters ----- //
	parameter wait_time = 30;
	reg [7:0] i; 
	// ---------- UUT Instantiation -------------- //
	//RCA RCA(input [3:0] X, [3:0] Y, C_i, output C_o, [3:0] S)
	//parametric_RCA (input C_i,[size-1:0] X, [size-1:0] Y,  output C_o, [size-1:0] S);
	//parametric_RCA UUT(.C_i(C_i),.X(X),.Y(Y),.C_o(C_o),.S(S));
	CLA UUT(.C_i(C_i),.X(X),.Y(Y),.C_o(C_o),.S(S));
	// ------- Test Procedure ------- //
	initial 
	begin
	for(i=0;i<512;i=i+1)
		begin
		{X,Y, C_i}= i;
	    #(10);
		$write(" {X+ Y }=%b + %b, Ci= %b => {C_o,S} = %b%b -- ",X,Y,C_i,C_o, S );
		$display(""); 
		#(wait_time);
		end
	end
endmodule
