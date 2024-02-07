`timescale 1ns / 1ps

module ms_dff_tb();
	reg D;
	reg CLK;
	wire Q; 
	wire Qn;
	master_slaveDFF uut(.D(D),.CLK( CLK),.Q(Q),.Qn(Qn));
    initial 
    begin 

    D=0;  CLK=1;
    #10 D=1;  CLK=1;
    #10 D=1;  CLK=0;
    #10 D=1;  CLK=1;
    #10 D=0;  CLK=0; 
    #10 D=1;  CLK=0; 
    #10 D=0;  CLK=1; 
    #10 D=0;  CLK=0; 
    #10
    $finish;
    end
endmodule

