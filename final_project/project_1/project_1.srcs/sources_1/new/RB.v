`timescale 1ns / 1ps

module RB(
    input clk, reset, WE,
    input [7:0] Ina, InB, CUconst, ALUout,
    input [2:0] InMuxAdd,
    input [3:0] RegAdd, OutMuxAdd,
    output [7:0] Out, ALUinA, ALUinB  
    );
    
    wire [15:0] decoder_out;
    wire [7:0] mux_inadd_out;
    wire [7:0] mux_outadd_out;
    wire [127:0] reg_out;
       
    (* dont_touch="true" *)DECODER decoder(.in(RegAdd), .out(decoder_out), .sel(WE));
    (* dont_touch="true" *)MUX_INADD mux_inadd (.a0(Ina), 
                         .a1(InB), 
                         .a2(CUconst), 
                         .a3(ALUout), 
                         .a4(mux_outadd_out), 
                         .a5(mux_outadd_out), 
                         .a6(mux_outadd_out), 
                         .a7(mux_outadd_out), 
                         .sel(InMuxAdd), 
                         .out(mux_inadd_out));
    
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_register
            (* dont_touch="true" *)REGISTER genreg (
                .En(decoder_out[i]),
                .clk(clk),
                .reset(reset),
                .Rin(mux_inadd_out),
                .Rout(reg_out[(8*i+7):(8*i)])
            );
        end
    endgenerate
     
    assign Out = reg_out[7:0];
    assign ALUinA = reg_out[15:8];
    assign ALUinB = reg_out[23:16];
    
    (* dont_touch="true" *)MUX_OUTADD mux_outadd (.a0(reg_out[7:0]), 
                           .a1(reg_out[15:8]), 
                           .a2(reg_out[23:16]), 
                           .a3(reg_out[31:24]), 
                           .a4(reg_out[39:32]), 
                           .a5(reg_out[47:40]), 
                           .a6(reg_out[55:48]), 
                           .a7(reg_out[63:56]), 
                           .a8(reg_out[71:64]), 
                           .a9(reg_out[79:72]), 
                           .a10(reg_out[87:80]), 
                           .a11(reg_out[95:88]), 
                           .a12(reg_out[103:96]), 
                           .a13(reg_out[111:104]), 
                           .a14(reg_out[119:112]), 
                           .a15(reg_out[127:120]), 
                           .sel(OutMuxAdd), 
                           .out(mux_outadd_out));
endmodule

module REGISTER(
    input En, clk, reset,
    input [7:0] Rin,
    output reg [7:0] Rout
    );
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Rout <= 8'b00000000; 
        end else if (En ==1'b1) begin
            Rout <= Rin; 
        end
    end

endmodule


module DECODER(
    input [3:0] in,
    input sel,
    output reg [15:0] out 
    );
    always @(in)begin
        if(sel == 1'b0)begin
            out <=16'b0000000000000000;
        end
        else
            case (in)
                4'b0000: out = 16'b0000000000000001;
                4'b0001: out = 16'b0000000000000010;
                4'b0010: out = 16'b0000000000000100;
                4'b0011: out = 16'b0000000000001000;
                4'b0100: out = 16'b0000000000010000;
                4'b0101: out = 16'b0000000000100000;
                4'b0110: out = 16'b0000000001000000;
                4'b0111: out = 16'b0000000010000000;
                4'b1000: out = 16'b0000000100000000;
                4'b1001: out = 16'b0000001000000000;
                4'b1010: out = 16'b0000010000000000;
                4'b1011: out = 16'b0000100000000000;
                4'b1100: out = 16'b0001000000000000;
                4'b1101: out = 16'b0010000000000000;
                4'b1110: out = 16'b0100000000000000;
                4'b1111: out = 16'b1000000000000000;
                default: out = 16'b0000000000000000;
            endcase
       end 
endmodule

module MUX_INADD(
    input  [7:0] a0,a1,a2,a3,a4,a5,a6,a7,
    input  [2:0] sel,
    output reg [7:0] out
    );
    always@* begin
        case (sel)
            3'b000: out = a0;
            3'b001: out = a1;
            3'b010: out = a2;
            3'b011: out = a3;
            3'b100: out = a4;
            3'b101: out = a5;
            3'b110: out = a6;
            3'b111: out = a7;
            default: out = 8'bZ; 
        endcase
    end
endmodule

module MUX_OUTADD(
    input  [7:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,
    input  [3:0] sel,
    output reg [7:0] out
    );
    always@* begin
        case (sel)
            4'b0000: out = a0;
            4'b0001: out = a1;
            4'b0010: out = a2;
            4'b0011: out = a3;
            4'b0100: out = a4;
            4'b0101: out = a5;
            4'b0110: out = a6;
            4'b0111: out = a7;
            4'b1000: out = a8;
            4'b1001: out = a9;
            4'b1010: out = a10;
            4'b1011: out = a11;
            4'b1100: out = a12;
            4'b1101: out = a13;
            4'b1110: out = a14;
            4'b1111: out = a15;
            default: out = 8'bZ; 
        endcase
    end
endmodule