`timescale 1ns / 1ps

module ALU(
    input [7:0] ALUinA, ALUinB,
    input [1:0] InsSel, 
    output [7:0] ALUout,
    output CO,Z
    );
    
    wire [7:0] AND_r, XOR_r, ADD_r, CLS_r;
    wire  ADDcout, CLSrout;
    wire [7:0] ALU_out;
    
    (* dont_touch="true" *)AND and_op(.a(ALUinA), .b(ALUinB), .r(AND_r));
    (* dont_touch="true" *)XOR xor_op(.a(ALUinA), .b(ALUinB), .r(XOR_r));
    (* dont_touch="true" *)ADD add_op(.a(ALUinA), .b(ALUinB), .r(ADD_r), .cout(ADDcout));
    (* dont_touch="true" *)CLS cls_op(.a(ALUinA), .r(CLS_r));
    (* dont_touch="true" *)ZC   zc_op(.a(ALU_out), .z(Z));
    
    (* dont_touch="true" *)MUX_R mux_r(.sel(InsSel), .a(AND_r), .b(XOR_r), .c(ADD_r), .d(CLS_r), .out(ALU_out));
    (* dont_touch="true" *)MUX_OUT mux_out(.sel(InsSel), .a(1'b0), .b(1'b0), .c(ADDcout), .d(CLSrout), .out(CO));
    
    assign ALUout = ALU_out;
    assign CLSrout = CLS_r[0];
    
endmodule

module AND(
    input  [7:0] a,b,
    output [7:0] r
    );
    assign r = a & b;
endmodule

module XOR(
    input  [7:0] a,b,
    output [7:0] r
    );
    assign r[7] = a[7] ^ b[7];
    assign r[6] = a[6] ^ b[6];
    assign r[5] = a[5] ^ b[5];
    assign r[4] = a[4] ^ b[4];
    assign r[3] = a[3] ^ b[3];
    assign r[2] = a[2] ^ b[2];
    assign r[1] = a[1] ^ b[1];
    assign r[0] = a[0] ^ b[0];
endmodule

module ADD(
    input  [7:0] a,b,
    output [7:0] r,
    output cout
    );
    assign {cout, r} = a + b;
endmodule

module CLS(
    input  [7:0] a,
    output [7:0] r
    );
    assign r[7:0] = {a[6:0],a[7]};
endmodule

module ZC(
    input  [7:0] a,
    output z
    );
    assign z = ~(a[0]|a[1]|a[2]|a[3]|a[4]|a[5]|a[6]|a[7]);
endmodule

module MUX_R(
    input  [7:0] a,b,c,d,
    input  [1:0] sel,
    output reg [7:0] out
    );
    always@* begin
        case (sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            2'b11: out = d;
            default: out = 8'bZZZZZZZZ; 
        endcase
    end
endmodule

module MUX_OUT(
    input  a,b,c,d,
    input  [1:0] sel,
    output reg out
    );
    always@* begin
        case (sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            2'b11: out = d;
            default: out = 1'bZ; 
        endcase
    end
endmodule
