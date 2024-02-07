`timescale 1ns / 1ps
module sr_latch_tb();
	reg S;
	reg R;
	wire Q; 
	wire Qn;
	SR_latch uut(.S(S),.R(R),.Q(Q),.Qn(Qn));
    initial 
    begin 
    S=0; R=0;
    #10 S=0; R=1;
    #10 S=1; R=1;
    #10 S=1; R=0;
    #10 S=1; R=1;
    #10 S=0; R=0; 
    #10 S=1; R=0; 
    #10
    $finish;
    end
endmodule

