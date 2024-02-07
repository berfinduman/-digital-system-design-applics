`timescale 1ns / 1ps

module RCA_tb();
	
	// ----- Inputs & Outputs
	reg [3:0] X,Y;
	reg C_i; 
	wire C_o;
	wire [3:0] S;

	// ----- Testbench Parameters ----- //
	parameter wait_time = 50;
	integer i;
	reg [4:0] A_numbers[0:3];
	reg [4:0] B_numbers[0:3];
	reg [4:0]correct_results[0:3];
	reg [4:0] C= 4'd0;
	reg[0:4] C_out= 4'b00000;
	initial begin
        A_numbers[0] = 8'h1D; A_numbers[1] = 8'h1E; A_numbers[2] = 8'h1B; A_numbers[3] = 8'h17; A_numbers[4] = 8'h15;
        B_numbers[0] = 8'h26; B_numbers[1] = 8'h2A; B_numbers[2] = 8'h2E; B_numbers[3] = 8'h28; B_numbers[4] = 8'h2A;
        correct_results[0] = 4'h43; correct_results[1] = 4'h48; correct_results[2] = 4'h49; correct_results[3] = 4'h4F; correct_results[4] = 4'h4F;
    end

	
	// --------------------------------- //
	
	// ---------- UUT Instantiation -------------- //
	//RCA
	parametric_RCA UUT (.X(X),.Y(Y),.C_i(C_i),.C_o(C_o),.S(S));
	parameter size = 8;
    
	// ------- Test Procedure ------- //
	initial 
	begin
		
		for(i=0;i<4;i=i+1)
		begin
            X=A_numbers[i];
            Y=B_numbers[i];
			C_i=C[i];
			#(wait_time);
//			$write("{X,+ Y ,C_i}=%d%d%d%d + %d%d%d%d, Ci= %d => {C_o,S} = %d%d%d%d%d  -- ",X[0],X[1],X[2],X[3],Y[0],Y[1],Y[2],Y[3],C_i,C_o,S[0],S[1],S[2],S[3]);
			$write("{X,+ Y ,C_i}=%b + %b, Ci= %b => {C_o,S} = %b%b,Cout= %b correct_result:  %b -- ",X,Y,C_i,C_o, S,C_out[i],correct_results[i] );
			if( {C_o, S} == {C_out[i],correct_results[i]})
				$display("TRUE");
			else
				$display("FALSE");
			
		end
		
		$finish();
		
	end
	// ------------------------------- //
	
endmodule
