`timescale 1ns / 1ps

module TOP(
    input clk, reset, Start,
    input [7:0] Ina, InB,
    output Busy,
    output [7:0] Out
    );
    
    wire CO, Z, WE;
    wire [1:0] InsSel;
    wire [2:0] InMuxAdd;
    wire [3:0] OutMuxAdd, RegAdd;
    wire [7:0] CUconst, ALUinA, ALUinB, ALUout;
    
    CU cu_module(.clk(clk),
                 .reset(reset),
                 .Start(Start),
                 .CO(CO),
                 .Z(Z),
                 .Busy(Busy),
                 .InsSel(InsSel),
                 .CUconst(CUconst),
                 .InMuxAdd(InMuxAdd),
                 .OutMuxAdd(OutMuxAdd),
                 .RegAdd(RegAdd),
                 .WE(WE));
    ALU alu_module(.ALUinA(ALUinA),
                   .ALUinB(ALUinB),
                   .InsSel(InsSel),
                   .CO(CO),
                   .Z(Z),
                   .ALUout(ALUout));
    RB rb_module(.clk(clk),
                 .reset(reset),
                 .Ina(Ina),
                 .InB(InB),
                 .CUconst(CUconst),
                 .InMuxAdd(InMuxAdd),
                 .OutMuxAdd(OutMuxAdd),
                 .RegAdd(RegAdd),
                 .WE(WE),
                 .ALUinA(ALUinA),
                 .ALUinB(ALUinB),
                 .ALUout(ALUout),
                 .Out(Out));
    
endmodule
