//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sat Dec 30 22:43:46 2023
//Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
//Command     : generate_target bram1_wrapper.bd
//Design      : bram1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bram1_wrapper
   (clka_0,
    conv_done_0,
    conv_run_0,
    douta_0,
    ena_0,
    kernel_0,
    reset_0,
    wea_0,
    wea_1);
  input clka_0;
  output conv_done_0;
  input conv_run_0;
  output [1023:0]douta_0;
  input ena_0;
  input [80:0]kernel_0;
  input reset_0;
  input [0:0]wea_0;
  input [0:0]wea_1;

  wire clka_0;
  wire conv_done_0;
  wire conv_run_0;
  wire [1023:0]douta_0;
  wire ena_0;
  wire [80:0]kernel_0;
  wire reset_0;
  wire [0:0]wea_0;
  wire [0:0]wea_1;

  bram1 bram1_i
       (.clka_0(clka_0),
        .conv_done_0(conv_done_0),
        .conv_run_0(conv_run_0),
        .douta_0(douta_0),
        .ena_0(ena_0),
        .kernel_0(kernel_0),
        .reset_0(reset_0),
        .wea_0(wea_0),
        .wea_1(wea_1));
endmodule
