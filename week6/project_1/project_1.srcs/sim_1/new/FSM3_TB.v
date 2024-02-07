module detect_tb;
 
 reg x, clk;
 wire z;
 
 initial clk = 0;
 always #3 clk = ~clk;
 
 reg [41:0] val =
42'b0100_1000_0111_0110_1111_0100_0111_0110_1100_1001_11;
 
 detect fsm(
 .x(x),
 .clk(clk),
 .z(z)
 );
 
 reg [6:0] i = 7'd41;
 initial begin
 x = 0;
 end
 
 always @(posedge clk) begin
 if (i >0) begin
 x <= val[i];
 i = i - 1;
 if(i==0)
 $stop;
 end 
 end
endmodule