`timescale 1ns / 1ps
module ASC_tb();
	// ----- Inputs & Outputs
	reg [3:0] X;
	reg [3:0] Y;
	reg C_i; 
	wire C_o;
	wire V;
	wire [3:0] S;
	// ----- Testbench Parameters ----- //
	parameter wait_time = 30;
	reg [7:0] i; 

	Add_Sub UUT(.C_i(C_i),.X(X),.Y(Y),.C_o(C_o),.V(V), .S(S));
	// ------- Test Procedure ------- //
	initial 
	begin
	for(i=0;i<512;i=i+1)
		begin
		{X,Y, C_i}= i;
	    #(10);
		$write(" {X+ Y }=%b + %b, Ci= %b => C_o:%b,V:%b,S:%b -- ",X,Y,C_i,C_o,V,S );
		$display(""); 
		#(wait_time);
		end
	end
endmodule

/*
module ASC_tb();
	
	// ----- Inputs & Outputs
	reg [3:0] X,Y;
	reg C; 
	wire V; 
	wire [3:0] S;

	// ----- Testbench Parameters ----- //
	parameter wait_time = 50;
	integer i;
	reg [3:0] A_numbers[0:2];
	reg [3:0] B_numbers[0:2];
	reg [3:0] correct_results[0:2];
	reg [0:2] C_i= 3'd011;
	reg [0:2] C_out= 3'b010;
	reg [0:2] corr_V= 3'b100;
	initial begin
        A_numbers[0] = 4'h7; 
        A_numbers[1] = 4'h7; 
        A_numbers[2] = 4'h3; 
       
        B_numbers[0] = 4'h1; 
        B_numbers[1] = 4'h7; 
        B_numbers[2] = 4'h8; 
       
        correct_results[0] = 4'bb1000; 
        correct_results[1] = 4'b0000; 
        correct_results[2] = 4'b1011; 

    end

	
	// --------------------------------- //
	
	// ---------- UUT Instantiation -------------- //
	// Add_Sub(input C, [3:0] A, [3:0] B, output Cout, V, [3:0] SUM);
	//RCA
	//parametric_RCA 
	Add_Sub UUT(.C_i(C),.A(X),.B(Y),.C_o(C_o),.V(V), .S(S));
	
    
	// ------- Test Procedure ------- //
	initial 
	begin
		
		for(i=0;i<3;i=i+1)
		begin
            X=A_numbers[i];
            Y=B_numbers[i];
			C=C_i[i];
			#(wait_time);
//			$write("{X,+ Y ,C_i}=%d%d%d%d + %d%d%d%d, Ci= %d => {C_o,S} = %d%d%d%d%d  -- ",X[0],X[1],X[2],X[3],Y[0],Y[1],Y[2],Y[3],C_i,C_o,S[0],S[1],S[2],S[3]);
			
			$write("X= %b Y=%b, Ci=%b  {V=%b, C_o=%b, S=%b} == {corr_V[i]=%b, C_out[i]=%b,correct_results[i]=%b}", X,Y, C, V, C_o, S, corr_V[i],C_out[i],correct_results[i] );
			if( {V, C_o, S} == {corr_V[i], C_out[i],correct_results[i]})
				$display("TRUE");
			else
				$display("FALSE");
				
			
		end
		
		$finish();
		
	end
	// ------------------------------- //
	
endmodule
*/