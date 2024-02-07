`timescale 1ns / 1ps

module CLA (
  
  input [15:0] X,
  input [15:0] Y,
  input  C_i,
  output C_o,
  output [15:0] S
);
  wire [15:0] g_wires;
  wire [15:0] p_wires;
  wire [16:0] c_wires;

  assign c_wires[0] = C_i;
  assign C_o = c_wires[16];
   
  genvar j;
  generate
    for (j = 0; j < 16; j = j + 1) begin : GandP_loop
      assign g_wires[j] = X[j] & Y[j];
      assign p_wires[j] = X[j] ^ Y[j];
      assign S[j] = p_wires[j] ^ c_wires[j];
      assign c_wires[j + 1] = g_wires[j] | (p_wires[j] & c_wires[j]);
    end
  endgenerate
endmodule


module mults(
    input [7:0] X, A,
    output [15:0] result
    );
    wire [15:0] PP [7:0];
    wire number;
    wire [15:0] sum [6:0];
    wire [6:0] cout;
    initial 
    begin 
    end 
    genvar i;
    generate 
    for (i = 0; i < 8; i = i + 1) begin : PARTIAL_PRODUCTS
        assign PP[i][15:0]  = (X[i] == 1'b1) ? (A << i) : 16'b0;     
    end
    endgenerate
    // sum of partial product 
    CLA CLA1(PP[0], PP[1], 1'b0, cout[0], sum[0]);  
    CLA CLA2(PP[2], PP[3], 1'b0, cout[1], sum[1]);  
    CLA CLA3(PP[4], PP[5], 1'b0, cout[2], sum[2]);  
    CLA CLA4(PP[6], PP[7], 1'b0, cout[3], sum[3]); 
    // sum of result of partial product 
    CLA CLA5(sum[0], sum[1],1'b0, cout[4], sum[4]);  
    CLA CLA6(sum[2], sum[3],1'b0, cout[5], sum[5]);  
    CLA CLA7(sum[4], sum[5],1'b0, cout[6], sum[6]);  
    assign result= sum[6];
    
endmodule

module mults_signed(
     input [7:0] X, A,
    output [15:0] result);
    wire [7:0] PP [7:0];
    wire [15:0] PP_2 [7:0];
    wire [7:0] PP_1 [7:0];
    wire [15:0] sum [7:0]; 
    wire cout [7:0]; 
    genvar i;
    generate 
    for (i = 0; i < 8; i = i + 1) 
    begin : PP_start
        assign PP[i][7:0]  = X[i]*A;      
    end   
    endgenerate
    genvar j,k; 
    generate
    for (j = 0; j < 8; j = j + 1) 
    begin : PP_f1
        for (k = 0; k < 8; k = k + 1) 
        begin 
        if (j!=7)
            begin 
             if (k!=7)
                begin 
                assign PP_1[j][k]  = PP[j][k];  
                end 
             else
                begin 
                assign PP_1[j][k]  = ~PP[j][k];  
                end 
            end
        else
            begin 
             if (k!=7)
                begin 
                assign PP_1[j][k]  =~PP[j][k];  
                end 
             else
                begin 
                assign PP_1[j][k]  = PP[j][k];  
                end 
            end
        end      
    end   
    endgenerate
    
    genvar t;
    generate 
    for (t = 0; t < 8; t = t + 1) 
    begin 
        assign PP_2[t][15:0]  = PP_1[t]<<t;      
    end 
    endgenerate
    
    
    CLA CLA1(PP_2[0][15:0], PP_2[1][15:0], 1'b0, cout[0], sum[0][15:0]);  
    CLA CLA2(PP_2[2][15:0], PP_2[3][15:0], 1'b0, cout[1], sum[1][15:0]);  
    CLA CLA3(PP_2[4][15:0], PP_2[5][15:0], 1'b0, cout[2], sum[2][15:0]);  
    CLA CLA4(PP_2[6][15:0], PP_2[7][15:0], 1'b0, cout[3], sum[3][15:0]); 
    CLA CLA5(sum[0][15:0], sum[1][15:0], 1'b0, cout[4], sum[4][15:0]);  
    CLA CLA6(sum[2][15:0], sum[3][15:0], 1'b0, cout[5], sum[5][15:0]);  
    CLA CLA7(sum[4][15:0], sum[5][15:0], 1'b0, cout[6], sum[6][15:0]);  
    CLA CLA8(sum[6][15:0], 16'b1000000100000000, 0, cout[7], sum[7][15:0]); 
    assign result[15:0] = sum[7][15:0]; 
    
endmodule 

module multb(
input signed [7:0] A,
input signed [7:0] B,
output reg signed [15:0] result
);
always @(*)
begin 
     result <= A * B ;
end 
endmodule


module adderb(
input signed [15:0] A,
input signed [15:0] B,
output reg signed [15:0] result
);
always @(*)
begin 
     result <= A + B ;
end 
endmodule

module MAC(
input clk, rst,
input signed [23:0] data,weight,
output reg signed [19:0] result);
wire signed [15:0] product [2:0];
wire signed [15:0] sum[1:0];
reg signed [19:0] result_temp;
reg signed [19:0] result_temp2;
multb multb1(.A(data[7:0]), .B(weight[7:0]), .result(product[0]));
multb multb2(.A(data[15:8]), .B(weight[15:8]), .result(product[1]));
multb multb3(.A(data[23:16]), .B(weight[23:16]), .result(product[2]));
adderb adderb1(.A(product[0]),.B(product[1]),.result(sum[0]));
adderb adderb2(.A(product[2]),.B(sum[0]),.result(sum[1]));

reg [1:0]count;
always @(posedge clk or posedge rst )
        if (rst) begin 
            result_temp <= 20'd0;
            result_temp2<=20'd0; 
            result <= 20'd0; 
            count <= 2'b00; 
        end 
 
        else begin 
            result_temp <= result_temp + sum[1]; 
            result_temp2<=  result_temp2 + sum[1]; 
            count <= count + 1; 
            if (count == 2'b10) begin 
                result <= result_temp + sum[1]; 
                result_temp <= 20'd0; 
                count <= 2'b00; 
            end 
        end 
endmodule


module conv(
input clk, rst,
  input signed [23:0] data,
  input signed [23:0] weight,
  output signed [19:0] result
);
MAC mac1 (.clk(clk), .rst(rst), .data(data), .weight(weight), .result(result));

endmodule










