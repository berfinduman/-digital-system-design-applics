// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Jan  3 21:59:16 2024
// Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Xilinx/SST/semester_project2/project_1/project_1.sim/sim_1/impl/timing/xsim/FSM1_tb_time_impl.v
// Design      : FSM1
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "65538e84" *) 
(* NotValidForBitStream *)
module FSM1
   (x,
    clk,
    rst,
    y);
  input x;
  input clk;
  input rst;
  output y;

  wire [3:0]Q;
  wire Y;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \lock_a[0]_i_1_n_0 ;
  wire \lock_a[1]_i_1_n_0 ;
  wire \lock_a[1]_i_2_n_0 ;
  wire \lock_a_reg_n_0_[0] ;
  wire \lock_a_reg_n_0_[1] ;
  wire \lock_b[0]_i_1_n_0 ;
  wire \lock_b[0]_i_2_n_0 ;
  wire \lock_b[1]_i_1_n_0 ;
  wire \lock_b[1]_i_2_n_0 ;
  wire \lock_b[1]_i_3_n_0 ;
  wire \lock_b_reg_n_0_[0] ;
  wire \lock_b_reg_n_0_[1] ;
  wire p_0_in;
  wire p_0_in13_in;
  wire p_0_in16_in;
  wire p_1_in6_in;
  wire q1;
  wire \q_reg_n_0_[0] ;
  wire x;
  wire x_IBUF;
  wire y;
  wire y_OBUF;
  wire y_OBUFT_inst_i_2_n_0;
  wire y_TRI;

initial begin
 $sdf_annotate("FSM1_tb_time_impl.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT5 #(
    .INIT(32'hBBFB4404)) 
    \lock_a[0]_i_1 
       (.I0(p_0_in13_in),
        .I1(\lock_a[1]_i_2_n_0 ),
        .I2(\lock_b_reg_n_0_[1] ),
        .I3(\lock_b_reg_n_0_[0] ),
        .I4(\lock_a_reg_n_0_[0] ),
        .O(\lock_a[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF75FF00008A00)) 
    \lock_a[1]_i_1 
       (.I0(\lock_a_reg_n_0_[0] ),
        .I1(\lock_b_reg_n_0_[0] ),
        .I2(\lock_b_reg_n_0_[1] ),
        .I3(\lock_a[1]_i_2_n_0 ),
        .I4(p_0_in13_in),
        .I5(\lock_a_reg_n_0_[1] ),
        .O(\lock_a[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010110000)) 
    \lock_a[1]_i_2 
       (.I0(p_0_in16_in),
        .I1(x_IBUF),
        .I2(\lock_a_reg_n_0_[0] ),
        .I3(\lock_a_reg_n_0_[1] ),
        .I4(p_1_in6_in),
        .I5(\q_reg_n_0_[0] ),
        .O(\lock_a[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \lock_a_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\lock_a[0]_i_1_n_0 ),
        .Q(\lock_a_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lock_a_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\lock_a[1]_i_1_n_0 ),
        .Q(\lock_a_reg_n_0_[1] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h8ACC8A8A)) 
    \lock_b[0]_i_1 
       (.I0(\lock_b[0]_i_2_n_0 ),
        .I1(\lock_b_reg_n_0_[0] ),
        .I2(\lock_b_reg_n_0_[1] ),
        .I3(\lock_a_reg_n_0_[0] ),
        .I4(\lock_a_reg_n_0_[1] ),
        .O(\lock_b[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA5A959AA6)) 
    \lock_b[0]_i_2 
       (.I0(\lock_b_reg_n_0_[0] ),
        .I1(p_0_in13_in),
        .I2(p_1_in6_in),
        .I3(\q_reg_n_0_[0] ),
        .I4(p_0_in16_in),
        .I5(x_IBUF),
        .O(\lock_b[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFC0FF00AFC0AFC0)) 
    \lock_b[1]_i_1 
       (.I0(\lock_b[1]_i_2_n_0 ),
        .I1(\lock_b[1]_i_3_n_0 ),
        .I2(\lock_b_reg_n_0_[0] ),
        .I3(\lock_b_reg_n_0_[1] ),
        .I4(\lock_a_reg_n_0_[0] ),
        .I5(\lock_a_reg_n_0_[1] ),
        .O(\lock_b[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF38FFBD)) 
    \lock_b[1]_i_2 
       (.I0(p_0_in13_in),
        .I1(p_1_in6_in),
        .I2(\q_reg_n_0_[0] ),
        .I3(x_IBUF),
        .I4(p_0_in16_in),
        .O(\lock_b[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0000C742)) 
    \lock_b[1]_i_3 
       (.I0(p_0_in13_in),
        .I1(p_1_in6_in),
        .I2(\q_reg_n_0_[0] ),
        .I3(p_0_in16_in),
        .I4(x_IBUF),
        .O(\lock_b[1]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \lock_b_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\lock_b[0]_i_1_n_0 ),
        .Q(\lock_b_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lock_b_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\lock_b[1]_i_1_n_0 ),
        .Q(\lock_b_reg_n_0_[1] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF3F0F3F1)) 
    \q[0]_i_1 
       (.I0(p_0_in13_in),
        .I1(\q_reg_n_0_[0] ),
        .I2(x_IBUF),
        .I3(p_1_in6_in),
        .I4(p_0_in16_in),
        .O(Q[0]));
  LUT3 #(
    .INIT(8'h06)) 
    \q[1]_i_1 
       (.I0(\q_reg_n_0_[0] ),
        .I1(p_1_in6_in),
        .I2(x_IBUF),
        .O(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h003C00C1)) 
    \q[2]_i_1 
       (.I0(p_0_in13_in),
        .I1(\q_reg_n_0_[0] ),
        .I2(p_0_in16_in),
        .I3(x_IBUF),
        .I4(p_1_in6_in),
        .O(Q[2]));
  LUT4 #(
    .INIT(16'h44F4)) 
    \q[3]_i_1 
       (.I0(\lock_b_reg_n_0_[0] ),
        .I1(\lock_b_reg_n_0_[1] ),
        .I2(\lock_a_reg_n_0_[1] ),
        .I3(\lock_a_reg_n_0_[0] ),
        .O(q1));
  LUT4 #(
    .INIT(16'hB0BB)) 
    \q[3]_i_2 
       (.I0(\lock_b_reg_n_0_[0] ),
        .I1(\lock_b_reg_n_0_[1] ),
        .I2(\lock_a_reg_n_0_[0] ),
        .I3(\lock_a_reg_n_0_[1] ),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00EB00AA)) 
    \q[3]_i_3 
       (.I0(p_0_in13_in),
        .I1(\q_reg_n_0_[0] ),
        .I2(p_1_in6_in),
        .I3(x_IBUF),
        .I4(p_0_in16_in),
        .O(Q[3]));
  FDSE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(Q[0]),
        .Q(\q_reg_n_0_[0] ),
        .S(q1));
  FDSE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(Q[1]),
        .Q(p_1_in6_in),
        .S(q1));
  FDSE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(Q[2]),
        .Q(p_0_in16_in),
        .S(q1));
  FDSE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in),
        .D(Q[3]),
        .Q(p_0_in13_in),
        .S(q1));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
  OBUFT y_OBUFT_inst
       (.I(y_OBUF),
        .O(y),
        .T(y_TRI));
  FDRE #(
    .INIT(1'b0)) 
    y_OBUFT_inst_i_1
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(y_OBUFT_inst_i_2_n_0),
        .Q(y_TRI),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    y_OBUFT_inst_i_2
       (.I0(p_0_in),
        .O(y_OBUFT_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00EB00EA)) 
    y_tristate_oe_i_1
       (.I0(p_0_in13_in),
        .I1(\q_reg_n_0_[0] ),
        .I2(p_1_in6_in),
        .I3(x_IBUF),
        .I4(p_0_in16_in),
        .O(Y));
  FDRE #(
    .INIT(1'b0)) 
    y_tristate_oe_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(Y),
        .Q(y_OBUF),
        .R(1'b0));
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
