`timescale 1ns / 1ps

module top_tb();
reg clk;
  reg reset;
  reg conv_run;
  integer output_file;
  wire conv_done;
  wire [1023:0] data_out;
 
  TOP top_unit (
    .clk(clk),
    .rst(reset),
    .conv_run(conv_run), .conv_done(conv_done),.data_end(data_out));

  initial begin

     
    output_file = $fopen("output.txt", "w");
    #10 reset = 1; clk=1'b1; conv_run = 1;
    #2 reset = 0;
    
  end
  
  always #20 clk = ~clk;
  always @(*)
  begin
  if (!conv_done)
            $display( "%h",data_out);
            $fdisplay(output_file, "%h",data_out);

  end
endmodule
