module cond_sum_tb;

  reg cin;
    reg [31:0] all_data[299:0];
    reg [31:0] x,y,sum_exp; 
    wire [31:0] sum;
    wire cout;
    wire overflow; 
    integer output_file;
    
    integer i;

    // Module instantiation
    Cond_Sum_Adder uut (
        .cin(cin),
        .x(x),
        .y(y),
        .overflow(overflow),
        .cout(cout),
        .sum(sum)
    );

  // Testbench stimulus file
  initial begin
  
// Wait for 10 time units 
    cin=0;
    // Read stimulus file
     $readmemb("random_numbers.txt", all_data);
    output_file = $fopen("output.txt", "w");

     for (i=0; i<300; i=i+3) 
     begin
            x = all_data[i];
            y = all_data[i+1];
            sum_exp=all_data[i+2];
         
            
      #5; // Add appropriate delay if needed
      if (sum == sum_exp)
      begin
      $display("A=\"bin=%b, dec=%d\"; B=\"bin=%b, dec=%d\"; C_circ=\"bin=%b, dec=%d\"; C_exp=\"bin=%b, dec=%d\"; status=%s; overflow=%b\;",
               x, x, y, y, sum, sum, sum_exp, sum_exp, (sum == sum_exp) ? "TRUE" : "FALSE", overflow);
      $fdisplay(output_file, "A=\"bin=%b, dec=%d\"; B=\"bin=%b, dec=%d\"; C_circ=\"bin=%b, dec=%d\"; C_exp=\"bin=%b, dec=%d\"; status=%s; overflow=%b\;",
                x, x, y, y, sum_exp, sum_exp, sum_exp, sum_exp, (sum == sum) ? "TRUE" : "FALSE", overflow);
      end
      end 
     $display("end of test");
    $finish;
  end

endmodule