`timescale 1ns / 1ps

module FA_tb();
	// ----- Inputs & Outputs
	reg X,Y,C_i; 
	wire C_o,S;
	// ----- Testbench Parameters ----- //
	parameter wait_time = 50;
	integer i;
	reg [2:0]correct_results[0:7];
	initial begin
		correct_results[0]  = 00; correct_results[1]  = 10; correct_results[2]  = 10 ;correct_results[3] = 01;
		correct_results[4]  = 10; correct_results[5]  = 01; correct_results[6]  = 01 ;correct_results[7] = 11;
	end
	
	// ---------- UUT Instantiation -------------- //
	FA UUT(.X(X),.Y(Y),.C_i(C_i),.C_o(C_o),.S(S));    
	// ------- Test Procedure ------- //
	initial 
	begin
		for(i=0;i<8;i=i+1)
		begin
			{X,Y,C_i} = i;
			#(wait_time);
			$write("{X,Y,C_i}=%d%d%d => {S,C_o} = %d%d -- ",X,Y,C_i,S,C_o);
			if({S,C_o} == correct_results[i])
				$display("TRUE");
			else
				$display("FALSE");
		end
		$finish();
	end
endmodule