`timescale 1ns / 1ps
module HA_tb();
	reg X,Y; 
	wire C_o,S;
	parameter wait_time = 50;
	integer i;
	reg [1:0]correct_results[0:3];
	initial begin
		correct_results[0]  = 00; correct_results[1]  = 01; correct_results[2]  = 01 ;correct_results[3] = 10;
	end
	HA UUT(.X(X),.Y(Y),.C_o(C_o),.S(S));
	initial 
	begin
		for(i=0;i<4;i=i+1)
		begin
			{X,Y} = i;
			#(wait_time);
			$write("{X,Y}=%d%d => {C_o,S} = %d%d -- ",X,Y,C_o,S);
			if({C_o,S} == correct_results[i])
				$display("TRUE");
		else
				$display("FALSE");
		end
		$finish();
	end 
endmodule