    `timescale 1ns / 1ps
    
    module FSM_tb;
        reg x   ; 
        reg clk ; 
        wire z  ;
        //reg [41:0] test_signal = 42'b010011000111000011110000011111000000111111;
            
        //reg[15:0] test_signal =  16'b0010010000100100; //for detector
       reg[15:0] test_signal =  16'b00010110100100100; //for detector
        //FSM1 uut(.x(x), .clk(clk), .z(z));
        //detecs UUT(.x(x), .clk(clk), .z(z));

        //FSM2 uut(.x(x), .clk(clk), .z(z));
        initial begin 
                clk = 0; 
                x  = test_signal[15] ; 
                #20;
        end
        always #10 clk = !clk ;
        always @(negedge clk)
        begin  
        #5
          test_signal = test_signal << 1; 
          x <= test_signal[15] ;   
        
        if (test_signal == 16'b0) begin
            $finish;
        end
        end
    endmodule
