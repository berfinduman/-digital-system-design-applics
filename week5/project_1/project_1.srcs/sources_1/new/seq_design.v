`timescale 1ns / 1ps

module SR_latch(
    input S, R, output Q, Qn
    );    
NAND nand1(.O(Q),.I1(S),.I2(Qn));
NAND nand2(.O(Qn),.I1(R),.I2(Q));
endmodule

module D_latch(
    input CLK, D, output Q, Qn
    );    
wire D_not;
wire S;
wire R; 
NOT not1(.O(D_not), .I(D));
NAND nand1(.O(R),.I1(D_not),.I2(CLK));
NAND nand2(.O(S),.I1(D),.I2(CLK));
NAND nand3(.O(Q),.I1(S),.I2(Qn));
NAND nand4(.O(Qn),.I1(R),.I2(Q));
endmodule

module master_slaveDFF(input CLK, D, output Q, Qn);
wire wire1;
wire Q_m;
wire CLK_not;
NOT not1(.O(CLK_not), .I(CLK));
D_latch dlatch1(.CLK(CLK),.D(D),.Q(Q_m),.Qn(wire1));
D_latch dlatch2(.CLK(CLK_not),.D(Q_m),.Q(Q),.Qn(Qn));
endmodule


module behavioral_dff(
    input CLK, D, output Q, Qn);
    reg FF;
    always @(posedge CLK)
    begin
         FF<=D;       
    end 
    assign Q=FF;
    assign Qn=~FF;
endmodule
    

module register_8(input CLK, CLEAR, input [7:0] IN, output reg [7:0] OUT);
    always @(posedge CLK or posedge CLEAR)
    begin
        if (CLEAR)
            OUT <= 8'b0;  // Clear the register to zero when CLEAR is asserted
        else
            OUT <= IN;    // Assign input to output on the rising edge of the clock
    end 
endmodule

module top_bram(
  input wea,
  input clk,
  input [3:0] addr,
  output [7:0] dout
);

  wire [7:0] dina;

  BRAM bram_inst(
    .clka_0(clk),
    .wea_0(wea),
    .addra_0(addr),
    .dina_0(dina),
    .douta_0(dout)
  );

endmodule
