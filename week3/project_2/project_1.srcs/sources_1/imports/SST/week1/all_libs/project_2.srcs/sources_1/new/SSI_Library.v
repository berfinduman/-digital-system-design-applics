`timescale 1ns / 1ps


module AND(
    output O,
    input I1, I2 
    );
    assign O= I1&I2;
endmodule

module OR(
    output O,
    input I1, I2 
    );
    assign O= I1|I2;
endmodule

module NOT(
    output O,
    input I
    );
    assign O= !I;
endmodule


module NAND(
    output reg O,
    input I1,I2
    );
    always @(I1,I2)
    begin
        O = !(I1 & I2);
    end
    
endmodule




module NOR(
    output reg O,
    input I1,I2
    );
    always @(I1,I2)
    begin
        O = !(I1 | I2);
    end
    
endmodule




module EXOR(I1,I2,O);
    input I1;
    input I2;
    output  O;
    LUT2 # (
    .INIT ( 4'b0110 ) 
	) LUT2_inst
	(
	.O ( O ),
    .I0( I1 ),
    .I1( I2 )
    );
    
endmodule




module EXNOR(
    output O,
    input I1,I2
    );
    LUT2 #(
    .INIT ( 4'b1001 ) 
	) LUT2_inst1
	(
    .I0( I1 ),
    .I1( I2 ),
    .O ( O )
 );
    
endmodule

module TRI(
    output  O,
    input I,E
    );
    assign O = (E==1) ? I : 1'bz; 
    
endmodule

