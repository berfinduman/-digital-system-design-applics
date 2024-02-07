// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Jan  6 16:56:59 2024
// Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Xilinx/SST/semester_project2/project_1/project_1.sim/sim_1/impl/timing/xsim/detect_machine_tb_time_impl.v
// Design      : detect_machine
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "b40dd0ef" *) 
(* NotValidForBitStream *)
module detect_machine
   (x,
    clk,
    rst,
    y);
  input x;
  input clk;
  input rst;
  output y;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire lock_a;
  wire \lock_a_reg_n_0_[0] ;
  wire \lock_a_reg_n_0_[1] ;
  wire \lock_b[0]_i_1_n_0 ;
  wire \lock_b[1]_i_1_n_0 ;
  wire \lock_b[1]_i_2_n_0 ;
  wire \lock_b_reg_n_0_[0] ;
  wire \lock_b_reg_n_0_[1] ;
  wire [1:0]p_0_in;
  wire p_0_in15_in;
  wire p_0_in18_in;
  wire p_1_in8_in;
  wire \q[0]_i_1_n_0 ;
  wire \q[1]_i_1_n_0 ;
  wire \q[2]_i_1_n_0 ;
  wire \q[3]_i_1_n_0 ;
  wire \q[3]_i_2_n_0 ;
  wire \q[3]_i_3_n_0 ;
  wire \q_reg_n_0_[0] ;
  wire rst;
  wire rst_IBUF;
  wire x;
  wire x_IBUF;
  wire y;
  wire y_OBUF;
  wire y_P_i_1_n_0;
  wire y_P_i_2_n_0;

initial begin
 $sdf_annotate("detect_machine_tb_time_impl.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \lock_a[0]_i_1 
       (.I0(\lock_a_reg_n_0_[0] ),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \lock_a[1]_i_1 
       (.I0(x_IBUF),
        .I1(\q[3]_i_3_n_0 ),
        .I2(p_1_in8_in),
        .I3(p_0_in15_in),
        .I4(p_0_in18_in),
        .I5(\q_reg_n_0_[0] ),
        .O(lock_a));
  LUT2 #(
    .INIT(4'h6)) 
    \lock_a[1]_i_2 
       (.I0(\lock_a_reg_n_0_[1] ),
        .I1(\lock_a_reg_n_0_[0] ),
        .O(p_0_in[1]));
  FDCE #(
    .INIT(1'b0)) 
    \lock_a_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(lock_a),
        .CLR(rst_IBUF),
        .D(p_0_in[0]),
        .Q(\lock_a_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \lock_a_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(lock_a),
        .CLR(rst_IBUF),
        .D(p_0_in[1]),
        .Q(\lock_a_reg_n_0_[1] ));
  LUT6 #(
    .INIT(64'h9AA99A99AAA99AAA)) 
    \lock_b[0]_i_1 
       (.I0(\lock_b_reg_n_0_[0] ),
        .I1(x_IBUF),
        .I2(p_1_in8_in),
        .I3(\q_reg_n_0_[0] ),
        .I4(p_0_in15_in),
        .I5(p_0_in18_in),
        .O(\lock_b[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6373C333CCCCCCCC)) 
    \lock_b[1]_i_1 
       (.I0(p_0_in18_in),
        .I1(\lock_b_reg_n_0_[1] ),
        .I2(p_0_in15_in),
        .I3(p_1_in8_in),
        .I4(\q_reg_n_0_[0] ),
        .I5(\lock_b[1]_i_2_n_0 ),
        .O(\lock_b[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0F000E0000000E00)) 
    \lock_b[1]_i_2 
       (.I0(p_0_in15_in),
        .I1(p_0_in18_in),
        .I2(x_IBUF),
        .I3(\lock_b_reg_n_0_[0] ),
        .I4(\q_reg_n_0_[0] ),
        .I5(p_1_in8_in),
        .O(\lock_b[1]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \lock_b_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\q[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\lock_b[0]_i_1_n_0 ),
        .Q(\lock_b_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \lock_b_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\q[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\lock_b[1]_i_1_n_0 ),
        .Q(\lock_b_reg_n_0_[1] ));
  LUT6 #(
    .INIT(64'h00000000FFFF00F1)) 
    \q[0]_i_1 
       (.I0(p_0_in15_in),
        .I1(p_0_in18_in),
        .I2(p_1_in8_in),
        .I3(\q_reg_n_0_[0] ),
        .I4(x_IBUF),
        .I5(\q[3]_i_3_n_0 ),
        .O(\q[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0006)) 
    \q[1]_i_1 
       (.I0(\q_reg_n_0_[0] ),
        .I1(p_1_in8_in),
        .I2(\q[3]_i_3_n_0 ),
        .I3(x_IBUF),
        .O(\q[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000660089)) 
    \q[2]_i_1 
       (.I0(p_0_in18_in),
        .I1(\q_reg_n_0_[0] ),
        .I2(p_0_in15_in),
        .I3(x_IBUF),
        .I4(p_1_in8_in),
        .I5(\q[3]_i_3_n_0 ),
        .O(\q[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hDD0D)) 
    \q[3]_i_1 
       (.I0(\lock_a_reg_n_0_[1] ),
        .I1(\lock_a_reg_n_0_[0] ),
        .I2(\lock_b_reg_n_0_[1] ),
        .I3(\lock_b_reg_n_0_[0] ),
        .O(\q[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000E0D00000C0C)) 
    \q[3]_i_2 
       (.I0(\q_reg_n_0_[0] ),
        .I1(p_0_in15_in),
        .I2(x_IBUF),
        .I3(p_1_in8_in),
        .I4(\q[3]_i_3_n_0 ),
        .I5(p_0_in18_in),
        .O(\q[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4F44)) 
    \q[3]_i_3 
       (.I0(\lock_b_reg_n_0_[0] ),
        .I1(\lock_b_reg_n_0_[1] ),
        .I2(\lock_a_reg_n_0_[0] ),
        .I3(\lock_a_reg_n_0_[1] ),
        .O(\q[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\q[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\q[0]_i_1_n_0 ),
        .Q(\q_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\q[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\q[1]_i_1_n_0 ),
        .Q(p_1_in8_in));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\q[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\q[2]_i_1_n_0 ),
        .Q(p_0_in18_in));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\q[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\q[3]_i_2_n_0 ),
        .Q(p_0_in15_in));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
  OBUF y_OBUF_inst
       (.I(y_OBUF),
        .O(y));
  LUT5 #(
    .INIT(32'hF7F755F7)) 
    y_P_i_1
       (.I0(rst_IBUF),
        .I1(\lock_a_reg_n_0_[1] ),
        .I2(\lock_a_reg_n_0_[0] ),
        .I3(\lock_b_reg_n_0_[1] ),
        .I4(\lock_b_reg_n_0_[0] ),
        .O(y_P_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF55555004)) 
    y_P_i_2
       (.I0(x_IBUF),
        .I1(p_0_in18_in),
        .I2(\q_reg_n_0_[0] ),
        .I3(p_1_in8_in),
        .I4(p_0_in15_in),
        .I5(\q[3]_i_3_n_0 ),
        .O(y_P_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    y_reg_P
       (.C(clk_IBUF_BUFG),
        .CE(y_P_i_1_n_0),
        .D(y_P_i_2_n_0),
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
