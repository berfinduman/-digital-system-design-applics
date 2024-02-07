//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Mon Nov 27 23:14:34 2023
//Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
//Command     : generate_target BRAM_wrapper.bd
//Design      : BRAM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module BRAM_wrapper
   (addra_0,
    clka_0,
    dina_0,
    douta_0,
    wea_0);
  input [3:0]addra_0;
  input clka_0;
  input [7:0]dina_0;
  output [7:0]douta_0;
  input [0:0]wea_0;

  wire [3:0]addra_0;
  wire clka_0;
  wire [7:0]dina_0;
  wire [7:0]douta_0;
  wire [0:0]wea_0;

  BRAM BRAM_i
       (.addra_0(addra_0),
        .clka_0(clka_0),
        .dina_0(dina_0),
        .douta_0(douta_0),
        .wea_0(wea_0));
endmodule
