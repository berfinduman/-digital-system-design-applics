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
	reg [3:0] A_numbers[0:4];
	reg [3:0] B_numbers[0:4];
	reg [3:0] correct_results[0:4];
	reg [4:0] C= 5'd0;
	reg[0:4] C_out= 5'b11100;
	initial begin
        A_numbers[0] = 4'hD; 
        A_numbers[1] = 4'hE; 
        A_numbers[2] = 4'hB; 
        A_numbers[3] = 4'h7;
        A_numbers[4] = 4'h5;
        B_numbers[0] = 4'h6; 
        B_numbers[1] = 4'hA; 
        B_numbers[2] = 4'hE; 
        B_numbers[3] = 4'h8; 
        B_numbers[4] = 4'hA;
        correct_results[0] = 4'h3; 
        correct_results[1] = 4'h8; 
        correct_results[2] = 4'h9; 
        correct_results[3] = 4'hF;
        correct_results[4] = 4'hF;
    end

	
	// --------------------------------- //
	
	// ---------- UUT Instantiation -------------- //
	//RCA RCA(  input C_i,[3:0] X, [3:0] Y,  output  C_o, [3:0] S);
	//parametric_RCA (input C_i,[size-1:0] X, [size-1:0] Y,  output C_o, [size-1:0] S);
	//CLA UUT(.c0(C_i),.X(X),.Y(Y),.cout(C_o),.sum(S));
	 CLA UUT(.C_i(C_i),.X(X),.Y(Y),.C_o(C_o),.S(S));
	
    
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
			
			$write("{X+ Y ,C_i}=%b + %b, Ci= %b => {C_o,S} = %b%b -- ",X,Y,C_i,C_o, S );
			if( {C_o, S} == {C_out[i],correct_results[i]})
				$display("TRUE");
			else
				$display("FALSE");
				
			
		end
		
		$finish();
		
	end
	// ------------------------------- //
	
endmodule
