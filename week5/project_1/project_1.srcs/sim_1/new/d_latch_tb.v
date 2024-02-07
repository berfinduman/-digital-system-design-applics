`timescale 1ns / 1ps

module d_latch_tb();
	reg D;
	reg CLK;
	wire Q; 
	wire Qn;
	D_latch uut(.D(D),.CLK( CLK),.Q(Q),.Qn(Qn));
	//behavioral_dff uut(.D(D),.CLK( CLK),.Q(Q),.Qn(Qn));
    initial 
    begin 
    D=0;  CLK=1;
    #10 D=0;  CLK=1;
    #10 D=1;  CLK=1;
    #10 D=1;  CLK=0;
    #10 D=1;  CLK=1;
    #10 D=0;  CLK=0; 
    #10 D=1;  CLK=0; 
    #10 D=0;  CLK=1; 
    #10
    $finish;
    end
endmodule
