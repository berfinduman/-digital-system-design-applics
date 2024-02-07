`timescale 1ns / 1ps

module RCA_tb2();
	
	reg [7:0] X;
	reg [7:0] Y;
	reg C_i; 
	wire C_o;
	wire [7:0] S;

	parameter wait_time = 100;
	integer i;
	reg [0:7] A_numbers[4:0];
	reg [0:7] B_numbers [4:0];
	reg [0:7] correct_results[4:0];
	reg [4:0] C= 5'd10101;
	reg[0:4] C_out= 5'b01101;
	initial begin
        A_numbers[0] = 8'h1D; A_numbers[1] = 8'h96; A_numbers[2] = 8'hfb; A_numbers[3] = 8'h17; A_numbers[4] = 8'hFE;
        B_numbers[0] = 8'h26; B_numbers[1] = 8'h88; B_numbers[2] = 8'h1E; B_numbers[3] = 8'h28; B_numbers[4] = 8'h3;
        correct_results[0] = 8'h44; correct_results[1] = 8'h1E; correct_results[2] = 8'h1a; correct_results[3] = 8'h3F; correct_results[4] = 8'h2;
    end

	
	// --------------------------------- //
	
	// ---------- UUT Instantiation -------------- //
	//RCA
	parametric_RCA #(8) UUT (.C_i(C_i),.X(X),.Y(Y),.C_o(C_o),.S(S));
    
	// ------- Test Procedure ------- //
	initial 
	begin
		
		for(i=0;i<5;i=i+1)
		begin
            X=A_numbers[i];
            Y=B_numbers[i];
			C_i=C[i];
			#(wait_time);
			
			
//			$write("{X,+ Y ,C_i}=%d%d%d%d + %d%d%d%d, Ci= %d => {C_o,S} = %d%d%d%d%d  -- ",X[0],X[1],X[2],X[3],Y[0],Y[1],Y[2],Y[3],C_i,C_o,S[0],S[1],S[2],S[3]);
			//$write("!!!!!!{X,+ Y ,C_i}=%b + %b, Ci= %b => {C_o,S} = %b %b %b %b, Cout= %b correct_result:  %b -- ", X, Y, C_i, C_o, S[0], S[1], S[2], S[3], C_out[i], correct_results[i]);

			$write("{X,+ Y ,C_i}=%b + %b, Ci= %b => {C_o,S} = %b%b -- ",X,Y,C_i,C_o, S );
			if( {C_o, S} == {C_out[i],correct_results[i]})
				$display("TRUE");
			else
				$display("FALSE");
			
			
		end
		
		$finish();
		
	end
	// ------------------------------- //
	
endmodule
