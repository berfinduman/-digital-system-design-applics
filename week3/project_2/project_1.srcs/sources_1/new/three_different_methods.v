`timescale 1ns / 1ps

    module with_SSI(
    input a,b,c,d,
    output f0,f1,f2,f3
        );
        AND f0_and(.O(f0),.I1(b),.I2(d));
        wire bcand_wire;
        wire adand_wire;
        AND f1_and1(.O(bcand_wire),.I1(b),.I2(c));
        AND f1_and2(.O(adand_wire),.I1(a),.I2(d));
        EXOR f1_exor(.O(f1),.I1(adand_wire),.I2(bcand_wire));
        wire f2_wire1;
        wire ac_andwire;
        NAND f2_and1(.O(f2_wire1),.I1(b),.I2(d));
        AND f2_and2(.O(ac_andwire),.I1(a),.I2(c));
        AND f2_and3(.O(f2),.I1(ac_andwire),.I2(f2_wire1));
        AND f3_and2(.O(f3),.I1(bcand_wire),.I2(adand_wire));
    endmodule
    

module with_decoder(
input a,b,c,d,
output f0,f1,f2,f3
    );
wire [15:0] OUT1 ;
DECODER decoder1(.IN({a,b,c,d}),.OUT(OUT1));

wire f1_or2;
wire f1_or3;
wire f1_or4;
wire f12_or1;
wire f0_or1;
wire f0_or2;


OR f12or1(.O(f12_or1),.I1(OUT1[14]),.I2(OUT1[11]));
OR f2or2(.O(f2),.I1(f12_or1),.I2(OUT1[10]));

OR f1or2(.O(f1_or2),.I1(OUT1[9]),.I2(OUT1[7]));
OR f1or3(.O(f1_or3),.I1(OUT1[13]),.I2(OUT1[6]));
OR f1or4(.O(f1_or4),.I1(f12_or1),.I2(f1_or2));
OR f1or5(.O(f1),.I1(f1_or4),.I2(f1_or3));
 
OR f0o1(.O(f0_or1),.I1(OUT1[5]),.I2(OUT1[7]));
OR f0o2(.O(f0_or2),.I1(OUT1[13]),.I2(OUT1[15]));
OR f0o3(.O(f0),.I1(f0_or1),.I2(f0_or2));

assign f3 = OUT1[15];

endmodule


module with_MUX(
input a,b,c,d,
output f0,f1,f2,f3
    );
wire nand_bd;
wire and_bd;
wire xor_bd;
AND bd_and(.O(and_bd),.I1(b),.I2(d));
NAND bd_nand(.O(nand_bd),.I1(b),.I2(d));
EXOR bd_exor(.O(xor_bd),.I1(b),.I2(d));
MULTIPLEXER mux_f3(.D({and_bd, 1'b0, 1'b0, 1'b0}),.S({a,c}) ,.O(f3));
MULTIPLEXER mux_f2(.D({nand_bd, 1'b0, 1'b0, 1'b0}),.S({a,c}) ,.O(f2));
MULTIPLEXER mux_f1(.D({xor_bd, d, b, 1'b0}),.S({a,c}) ,.O(f1));
MULTIPLEXER mux_f0(.D({and_bd,and_bd,and_bd,and_bd}),.S({a,c}) ,.O(f0));
endmodule
