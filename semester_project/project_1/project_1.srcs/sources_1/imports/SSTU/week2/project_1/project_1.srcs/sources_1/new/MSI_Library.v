`timescale 1ns / 1ps
///DEMUX
module DEMULTIPLEXER(
    input  D,
    input [1:0] S,
    output [3:0] O
);

wire temp1;
wire temp2; 
NOT not_S0( .O(temp1),.I(S[0]));
NOT not_S1(.O(temp2), .I(S[1]));

wire temp3;
AND and_NS1NS0(.O(temp3), .I1(temp2),.I2(temp1));
TRI tri_moduleO0(.O(O[0]), .I(D), .E(temp3));

wire temp4;
AND and_NS1SO(.O(temp4), .I1(temp2),.I2(S[0]));
TRI tri_moduleO1(.O(O[1]), .I(D), .E(temp4));

wire temp5;
AND and_S1NS0(.O(temp5), .I1(S[1]),.I2(temp1));
TRI tri_moduleO2(.O(O[2]), .I(D), .E(temp5));

wire temp6;
AND and_S1S0(.O(temp6), .I1(S[1]),.I2(S[0]));
TRI tri_moduleO3(.O(O[3]), .I(D), .E(temp6));

endmodule
/*
///MUX2 
module MULTIPLEXER(
    input [3:0] D,
    input [1:0] S,
    output reg O
);
always @(S)
begin 
case (S)
    2'b00: O = D[0];
    2'b01: O = D[1];
    2'b10: O = D[2];
    2'b11: O = D[3];
    default: O= 1'b0; 
endcase
end 
endmodule
*/

module MULTIPLEXER(
    input [3:0] D,
    input [1:0] S,
    output O
);
wire temp1;
wire temp2;
wire temp3;
wire temp4;
assign temp1 = ~S[1] & ~S[0] & D[0];
assign temp2 = ~S[1] & S[0] & D[1];
assign temp3 = S[1] & ~S[0] & D[2];
assign temp4 = S[1] & S[0] & D[3];
assign O= temp1 | temp2 | temp3 |temp4 ; 
endmodule



module ENCODER (
    input [3:0] IN,
    output reg [1:0] OUT,
    output reg V );
    always @(IN)
        begin 
            casex (IN)
                4'b0000:
                begin
                    OUT = 2'bxx; V=0;
                end
                4'b0001: 
                begin
                    OUT = 2'b00; V=1;
                end
                4'b001x: 
                begin
                    OUT = 2'b01; V=1;
                end
                4'b01xx: 
                begin
                    OUT = 2'b10; V=1;
                end
                4'b1xxx: 
                begin
                    OUT = 2'b11; V=1;
                end
                
            
    
            endcase
       end
endmodule 

/*
module ENCODER (
input [3:0] IN,
output [1:0] OUT,
output V );
wire temp1;
wire temp2;
wire temp3; 
or or_module(OUT[1],IN[3], IN[2]);
not not_module(temp1, IN[2] );
and and_module (temp2, temp1, IN[1]);
or or_module2(OUT[0], IN[3], temp2);
or or_module3 (temp3, IN[0], IN[1]);
or or_module4 (V, OUT[1], temp3);
endmodule 
*/


module DECODER(
    input [3:0] IN,
    output reg [15:0] OUT 
    );
    always @(IN)
    begin
    case (IN)
        4'b0000: OUT = 16'b0000000000000001;
        4'b0001: OUT = 16'b0000000000000010;
        4'b0010: OUT = 16'b0000000000000100;
        4'b0011: OUT = 16'b0000000000001000;
        4'b0100: OUT = 16'b0000000000010000;
        4'b0101: OUT = 16'b0000000000100000;
        4'b0110: OUT = 16'b0000000001000000;
        4'b0111: OUT = 16'b0000000010000000;
        4'b1000: OUT = 16'b0000000100000000;
        4'b1001: OUT = 16'b0000001000000000;
        4'b1010: OUT = 16'b0000010000000000;
        4'b1011: OUT = 16'b0000100000000000;
        4'b1100: OUT = 16'b0001000000000000;
        4'b1101: OUT = 16'b0010000000000000;
        4'b1110: OUT = 16'b0100000000000000;
        4'b1111: OUT = 16'b1000000000000000;
        default: OUT = 16'b0000000000000000;
    endcase
    end 
endmodule
