`timescale 1ns / 1ps

module abs(
    input signed [7:0] a,
    input signed [7:0] b,
    output reg [7:0] c
    );
    
    always @* begin
        if (a[7]==1 && b[7]==0) begin
            c =((a ^ 8'b11111111)+1)+b;
        end
        else if (a[7]==1 && b[7]==1) begin
            c =((b ^ 8'b11111111)+1)+a;
        end
        else if (a[7]==0 && b[7]==0) begin
            c =((a ^ 8'b11111111)+1)+b;
        end
        else if (a[7]==0 && b[7]==1) begin
            c =((b ^ 8'b11111111)+1)+a;
        end
    end
    
endmodule