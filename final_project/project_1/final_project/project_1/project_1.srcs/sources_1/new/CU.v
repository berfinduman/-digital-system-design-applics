`timescale 1ns / 1ps

module CU(
    input Start, clk, reset, CO, Z,
    output reg [7:0] CUconst,
    output reg [2:0] InMuxAdd,
    output reg [3:0] OutMuxAdd, RegAdd,
    output reg WE, Busy,
    output reg [1:0] InsSel
    );
    
    reg [5:0]state;
    always @(posedge clk or posedge reset)begin
        if (reset)begin
            state <= 4'b0000;
        end
        else if (Start)begin
        CUconst <= 8'b00000001;
            case(state)
                6'd0: begin //a -> reg1
                    Busy <= 1;
                    InMuxAdd <= 3'b000;
                    RegAdd <= 4'b0001;
                    state <= 6'd1;
                    WE <= 1'b1;
                end
                6'd1: begin //1 -> reg2
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0010;
                    CUconst <= 8'b11111111;
                    state <= 6'd2;
                    WE <= 1'b1;
                end
                6'd2: begin //reg1 &reg2
                    state <= 6'd3;
                    InsSel <= 2'b00;
                    RegAdd <= 4'b1111;
                end
                6'd3: begin
                    if(Z==0)begin
                        InMuxAdd <= 3'b001;
                        RegAdd <= 4'b0001;
                        state <= 6'd4;
                        WE <= 1'b1;
                    end
                    else if(Z==1) begin
                        state <= 6'd32;
                        InMuxAdd <= 3'b001;
                        RegAdd <= 4'b0001;
                    end
                end
                6'd4: begin //reg1 &reg2
                    state <= 6'd5;
                    InsSel <= 2'b00;
                    RegAdd <= 4'b1111;
                end
                6'd5: begin
                    if(Z==0)begin
                        state <= 6'd7;
                        InsSel <= 2'b11;
                        RegAdd <= 4'b1111;
                    end
                    else if (Z==1)begin
                        state <= 6'd24;
                        InMuxAdd <= 3'b000;
                        RegAdd <= 4'b0001;
                    end
                end
//                6'd6: begin //
//                    state <= 6'd7;
//                    InsSel <= 2'b11;
//                    RegAdd <= 4'b1111;
//                end
                6'd7: begin
                    if(CO==0)begin
                        state <= 6'd8;
                        InMuxAdd <= 3'b000;
                        RegAdd <= 4'b0001;
                        WE <= 1'b1;
                    end
                    else begin
                        state <= 6'd16;
                        InMuxAdd <= 3'b001;
                        RegAdd <= 4'b0001;
                        WE <= 1'b1;
                    end
                end
                6'd8: begin //reg1 ^reg2
                    state <= 6'd9;
                    InsSel <= 2'b01;
                end
                6'd9: begin //reg1 ^reg2
                    state <= 6'd10;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0001;
                end
                6'd10: begin
                    state <= 6'd11;
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0010;
                end
                6'd11: begin //reg1 ^reg2
                    state <= 6'd12;
                    InsSel <= 2'b010;
                end
                6'd12: begin //reg1 ^reg2
                    state <= 6'd13;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0001;
                end
                6'd13: begin //1 -> reg2
                    InMuxAdd <= 3'b0001;
                    RegAdd <= 4'b0010;
                    state <= 6'd14;
                    WE <= 1'b1;
                end
                6'd14: begin //reg1 ^reg2
                    state <= 6'd15;
                    InsSel <= 2'b010;
                end
                6'd15: begin //reg1 ^reg2
                    state <= 6'd0;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0000;
                    Busy <= 0;
                end
                6'd16: begin //reg1 ^reg2
                    state <= 6'd17;
                    InsSel <= 2'b01;
                end
                6'd17: begin //reg1 ^reg2
                    state <= 6'd18;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0001;
                end
                6'd18: begin
                    state <= 6'd19;
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0010;
                end
                6'd19: begin //reg1 ^reg2
                    state <= 6'd20;
                    InsSel <= 2'b010;
                end
                6'd20: begin //reg1 ^reg2
                    state <= 6'd21;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0001;
                end
                6'd21: begin //1 -> reg2
                    InMuxAdd <= 3'b000;
                    RegAdd <= 4'b0010;
                    state <= 6'd22;
                    WE <= 1'b1;
                end
                6'd22: begin //reg1 ^reg2
                    state <= 6'd23;
                    InsSel <= 2'b010;
                end
                6'd23: begin //reg1 ^reg2
                    state <= 6'd0;
                    Busy <= 0;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0000;
                end
                6'd24: begin //reg1 ^reg2
                    state <= 6'd25;
                    InsSel <= 2'b11;
                end
                6'd25: begin
                    if(CO==0)begin
                        state <= 6'd26;
                        InMuxAdd <= 3'b001;
                        RegAdd <= 4'b0010;
                        WE <= 1'b1;
                    end
                    else begin
                        state <= 6'd28;
                        InsSel <= 2'b01;
                    end
                end
                6'd26: begin //reg1 ^reg2
                    state <= 6'd27;
                    InsSel <= 2'b10;
                end
                6'd27: begin //reg1 ^reg2
                    state <= 6'd0;
                    Busy <= 0;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0000;
                end
                6'd28: begin //reg1 ^reg2
                    state <= 6'd29;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0001;
                end
                6'd29: begin //reg1 ^reg2
                    state <= 6'd30;
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0010;
                end
                6'd30: begin //reg1 ^reg2
                    state <= 6'd31;
                    InsSel <= 2'b10;
                end
                6'd31: begin //reg1 ^reg2
                    state <= 6'd0;
                    Busy <= 0;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0000;
                end
                6'd32: begin //reg1 ^reg2
                    state <= 6'd33;
                    InsSel <= 2'b01;
                end
                6'd33: begin //reg1 ^reg2
                    if(Z==0)begin
                        state <=6'd34;
                        InsSel <= 2'b11;
                    end
                    else if(Z==1) begin
                        state<= 6'd39;
                        CUconst <= 8'b00000001;
                    end
                end
                6'd34:begin
                    if(CO==0)begin
                        InMuxAdd <= 4'b0001;
                        RegAdd <= 4'b0000;
                        state <= 6'd0;
                        Busy <= 0;
                    end
                    else if(CO==1) begin
                        state <= 6'd35;
                        InsSel <= 2'b01;                     
                    end
                end
                6'd35:begin 
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0001;
                    state <= 6'd36;
                end
                6'd36:begin 
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0010;
                    state <= 6'd37;
                end
                6'd37:begin 
                    InsSel <= 2'b10;
                    state <= 6'd38;
                end
                6'd38:begin 
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0000;
                    state <= 6'd0;
                    Busy <= 0;
                end
                6'd38:begin 
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0000;
                    state <= 6'd0;
                    Busy <= 0;
                end
                
                default: begin state <= 6'b0000; end 
            endcase
        end
    end
endmodule
