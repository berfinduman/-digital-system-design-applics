// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Dec 14 06:12:27 2023
// Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Xilinx/SST/week6/project_1/project_1.sim/sim_1/impl/func/xsim/FSM_tb_func_impl.v
// Design      : FSM2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "9dc55c73" *) 
(* NotValidForBitStream *)
module FSM2
   (x,
    clk,
    z);
  input x;
  input clk;
  output z;

  wire Q0;
  wire Q1;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire q0;
  wire q1;
  wire q2;
  wire x;
  wire x_IBUF;
  wire z;
  wire z_OBUF;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0009)) 
    q0_i_1
       (.I0(x_IBUF),
        .I1(q2),
        .I2(q1),
        .I3(q0),
        .O(Q0));
  FDRE #(
    .INIT(1'b0)) 
    q0_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(Q0),
        .Q(q0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hE00E)) 
    q1_i_1
       (.I0(q0),
        .I1(q1),
        .I2(q2),
        .I3(x_IBUF),
        .O(Q1));
  FDRE #(
    .INIT(1'b0)) 
    q1_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(Q1),
        .Q(q1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    q2_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(x_IBUF),
        .Q(q2),
        .R(1'b0));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
  OBUF z_OBUF_inst
       (.I(z_OBUF),
        .O(z));
  LUT3 #(
    .INIT(8'h90)) 
    z_OBUF_inst_i_1
       (.I0(x_IBUF),
        .I1(q2),
        .I2(q1),
        .O(z_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
