`timescale 1ns / 1ps

module mults_signed_tb(); 
    reg signed [7:0] A; 
    reg signed [7:0] X; 
    wire signed [15:0] result; 
    integer i;

    reg [7:0] A_s [7:0];
    reg [7:0] X_s [7:0];
    reg signed [15:0] true_ans [7:0];
    
    initial 
    begin 
        A_s[0]=0;  X_s[0]=-1; true_ans[0]=0;
        A_s[1]=-13;  X_s[1]=6; true_ans[1]=-78;
        A_s[2]=-40; X_s[2]=-9; true_ans[2]=360;
        A_s[3]=12;  X_s[3]=-12;  true_ans[3]=-144;
        A_s[4]=47; X_s[4]=68; true_ans[4]=3196;
        A_s[5]=-31;  X_s[5]=-47;true_ans[5]=1457;
        A_s[6]=342;X_s[6]=-19;  true_ans[6]=-1634;
        A_s[7]=-48;X_s[7]=18;true_ans[7]=-864;
    end 
    
        multb UUT
    ( 
        .A(A), 
        .B(X), 
        .result(result) 
    );
    /*
    mults_signed UUT
    ( 
        .A(A), 
        .X(X), 
        .result(result) 
    );
    */
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
















