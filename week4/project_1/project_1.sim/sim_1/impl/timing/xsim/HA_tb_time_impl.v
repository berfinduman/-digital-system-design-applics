// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Nov 22 01:32:23 2023
// Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Xilinx/SST/week4/project_1/project_1.sim/sim_1/impl/timing/xsim/HA_tb_time_impl.v
// Design      : HA
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "87e57b24" *) 
(* NotValidForBitStream *)
module HA
   (X,
    Y,
    C_o,
    S);
  input X;
  input Y;
  (* dont_touch = "true" *) output C_o;
  (* dont_touch = "true" *) output S;

  wire C_o;
  (* DONT_TOUCH *) wire C_o_OBUF;
  wire S;
  (* DONT_TOUCH *) wire S_OBUF;
  wire X;
  wire X_IBUF;
  wire Y;
  wire Y_IBUF;

initial begin
 $sdf_annotate("HA_tb_time_impl.sdf",,,,"tool_control");
end
  (* DONT_TOUCH *) 
  OBUF C_o_OBUF_inst
       (.I(C_o_OBUF),
        .O(C_o));
  LUT2 #(
    .INIT(4'h8)) 
    C_o_inferred_i_1
       (.I0(X_IBUF),
        .I1(Y_IBUF),
        .O(C_o_OBUF));
  (* DONT_TOUCH *) 
  OBUF S_OBUF_inst
       (.I(S_OBUF),
        .O(S));
  LUT2 #(
    .INIT(4'h6)) 
    S_inferred_i_1
       (.I0(Y_IBUF),
        .I1(X_IBUF),
        .O(S_OBUF));
  IBUF X_IBUF_inst
       (.I(X),
        .O(X_IBUF));
  IBUF Y_IBUF_inst
       (.I(Y),
        .O(Y_IBUF));
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
