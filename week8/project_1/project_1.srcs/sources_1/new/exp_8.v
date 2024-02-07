`timescale 1ns / 1ps

module multb(
input signed [8:0] A,
input signed [8:0] B,
output reg signed [17:0] result
);
always @(*)
begin 
     result <= A * B ;
end 
endmodule


module adderb(
input signed [17:0] A,
input signed [17:0] B,
output reg signed [17:0] result
);
always @(*)
begin 
     result <= A + B ;
end 
endmodule

module MAC(
input clk, rst,
input signed [23:0] data,
input signed [26:0] weight,
output reg signed [19:0] result);
wire signed [17:0] product [2:0];
wire signed [17:0] sum[1:0];
multb multb1(.A($signed({1'b0,data[7:0]})), .B(weight[8:0]), .result(product[0]));
multb multb2(.A($signed({1'b0,data[15:8]})), .B(weight[17:9]), .result(product[1]));
multb multb3(.A($signed({1'b0,data[23:16]})), .B(weight[26:18]), .result(product[2]));
adderb adderb1(.A(product[0]),.B(product[1]),.result(sum[0]));
adderb adderb2(.A(product[2]),.B(sum[0]),.result(sum[1]));

reg [1:0] count;
always @(posedge clk or posedge rst )
        if (rst) begin 
            result <= 20'd0; 
            count <= 2'b00; 
        end 
 
        else begin 
            if (count==2'b00) begin
                count <= count + 1; 
                result =sum[1]; 
                //result_temp =sum[1]; 
            end  
            else if (count==2'b01) begin
                count <= count + 1; 
                //result_temp <= result_temp + sum[1]; 
                //result= result_temp + sum[1];
                result= result + sum[1];
            end
            else if (count == 2'b10) begin 
                count <= 2'b00; 
                result = result + sum[1]; 
            end
        end 
endmodule

module MAC_Normalize(
input signed [19:0] data,
output  reg  [7:0] result                     
);
  always @(*)
  begin
    // Normalize the 20-bit data to an 8-bit result
    if (data>255)        result <= 8'b11111111;  // Map values greater than 255 to 255
    else if (data<0)     result <= 8'b0;    // Map values less than 0 to 0
    else                   result <= data[7:0];  // Map values within [0, 255] directly
  end
endmodule

module CONV(
  input clk, rst,
  input signed [23:0] data,
  input signed [26:0] weight,
  output  [7:0] result
);
wire signed [19:0] temp_res;
MAC mac1 (.clk(clk), .rst(rst), .data(data), .weight(weight), .result(temp_res));
MAC_Normalize mac_norm (.data(temp_res), .result(result));

endmodule

module CONV128(
  input clk, rst,
  input signed [1039:0] data ,
  input signed [26:0] weight,
  output [1023:0] result ); //reg
genvar i; 
//wire  [7:0] res_temp [127:0];
generate
for (i=0; i<128; i=i+1)
begin
    CONV conv2 (.clk(clk), .rst(rst),.data(data[(i+3)*8-1: i*8]),.weight(weight),.result(result[(i+1)*8-1:i*8]));
/*
    always @(*)
    if (rst)
    begin 
    result <= 1024'b0;
    end
    else  begin
    result[(i+1)*8-1:i*8] <= res_temp;
    end
*/
end

endgenerate
endmodule
/*
module top_bram1(
input ena, clk,
input [7:0] address,
output [1023:0] data);
bram1 bram_ins(.clka_0(clk),.addra_0(address),.ena_0(ena),.douta_0(data));
endmodule
*/
module control_input(
input clk, reset, 
input conv_run, 
input signed [80:0] kernel,
output reg enable_ram,
output reg [7:0] address_ram,
output reg signed [26:0] weight
);
reg [7:0] adr;
reg [1:0] counter; 
always @(posedge clk or posedge reset )
        if (reset) begin
            address_ram <= 8'b00;
            enable_ram <= 8'b1; //deðiþtirdin
            counter <= 2'b00; 
            weight <= kernel[26:0]; //27b
        end 
        else begin
        if (conv_run) 
        begin 
            enable_ram <= 1;
            case(counter)
            2'b00: 
            begin
            counter <= counter + 1;
            address_ram <= address_ram+ 1;
            weight <= kernel[53:27];
            end
            2'b01: 
            begin
            counter <= counter + 1;
            adr<= address_ram;
            address_ram <= address_ram + 1;
            weight<= kernel[80:54];

            end
            2'b10:
            begin
            counter <= 2'b00; 
            address_ram <= adr;
            weight<=  kernel[26:0];
            
            end
            default: counter=00;
            endcase
        end 
        else
       enable_ram<=0;
       end
endmodule
/*
module top_bram2(
input wea, clk,
input [7:0] address,
output [1023:0] data_out);
wire [1023:0] data_in; 
bram_2 bram_ins(.clka_0(clk),.addra_0(address),.wea_0(wea),.douta_0(data_out), .dina_0(data_in));
endmodule
*/
module output_control(
input clk, reset,
input signed [1023:0] data,
output reg conv_done,
output reg [6:0] ram_addres,
output reg signed [1023:0] data_out);
reg [1:0] counter;
always @(posedge clk or posedge reset )
begin
        if (reset) begin 
            counter <= 2'b00; 
            ram_addres <=0;
            data_out <=0;
            conv_done <=0;
        end 
        else begin
            
            counter <= counter + 1;

            if (counter == 2'b10) 
            begin
            data_out<=data;
            ram_addres <= ram_addres + 1;
            counter <= 2'b00; 
            end
        end  
end
always @(posedge clk) 
begin 
    if (ram_addres==127)
    begin
    conv_done <=1;
    ram_addres <=0;
    counter <= 2'b00;
    data_out <=0;
    end
end          
endmodule