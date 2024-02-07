`timescale 1ns / 1ps


module top_tb();
reg clk;
  reg reset;
  reg conv_run;

  wire conv_done;
  wire [1023:0] data_out;
 bram1 bram_ins(.ena_0(1'b1),.wea_0(1'b0),.ram_addres_0(ram_addres), .wea_1(1'b0),.clka_0(clk),.reset_0(rst),.conv_run_0(conv_run),.kernel_0(kernel),.douta_0(data_end),.conv_done_0(conv_done));

  TOP top_unit (
    .clk(clk),
    .rst(reset),
    .conv_run(conv_run) );

  initial begin
    #10 reset = 1; clk=1'b1; conv_run = 1;
    #2 reset = 0;
    
  end

  always #20 clk = ~clk;

endmodule
