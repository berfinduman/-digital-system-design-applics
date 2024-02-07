`timescale 1ns / 1ps

module mults_tb(); 
    reg [7:0] A; 
    reg [7:0] X; 
    wire [15:0] result; 
    integer i;

    reg [7:0] A_s [7:0];
    reg [7:0] X_s [7:0];
    reg [15:0] true_ans [7:0];
    
    initial 
    begin 
        A_s[0]=0;  X_s[0]=0; true_ans[0]=0;
        A_s[1]=8;  X_s[1]=14; true_ans[1]=112;
        A_s[2]=13; X_s[2]=6; true_ans[2]=78;
        A_s[3]=2;  X_s[3]=11;  true_ans[3]=22;
        A_s[4]=36; X_s[4]=82; true_ans[4]=2952;
        A_s[5]=4;  X_s[5]=75;true_ans[5]=300;
        A_s[6]=121;X_s[6]=139;  true_ans[6]=16819;
        A_s[7]=194;X_s[7]=237;true_ans[7]=45978;
    end 

    mults UUT
    //mults_signed UUT
    ( 
        .A(A), 
        .X(X), 
        .result(result) 
    );

    initial
    begin
        for (i = 0; i < 8; i = i + 1) begin
            
            A = A_s[i];
            X = X_s[i];
             #15;
            $write("A * X = %d * %d => Result = %d, True Result= %d \n", A, X, result,true_ans[i] );
             if(result == true_ans[i])
                $display("TRUE");
             else
                $display("FALSE");
            
 
        end
        $finish;
    end 
endmodule
