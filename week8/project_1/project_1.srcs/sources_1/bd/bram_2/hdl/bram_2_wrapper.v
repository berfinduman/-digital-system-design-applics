//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Dec 27 19:52:42 2023
//Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
//Command     : generate_target bram_2_wrapper.bd
//Design      : bram_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bram_2_wrapper
   (addra_0,
    clka_0,
    dina_0,
    douta_0,
    ena_0,
    wea_0);
  input [6:0]addra_0;
  input clka_0;
  input [1023:0]dina_0;
  output [1023:0]douta_0;
  input ena_0;
  input [0:0]wea_0;

  wire [6:0]addra_0;
  wire clka_0;
  wire [1023:0]dina_0;
  wire [1023:0]douta_0;
  wire ena_0;
  wire [0:0]wea_0;

  bram_2 bram_2_i
       (.addra_0(addra_0),
        .clka_0(clka_0),
        .dina_0(dina_0),
        .douta_0(douta_0),
        .ena_0(ena_0),
        .wea_0(wea_0));
endmodule
