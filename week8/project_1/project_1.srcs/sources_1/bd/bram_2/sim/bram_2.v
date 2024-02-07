//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Wed Dec 27 19:52:42 2023
//Host        : DESKTOP-K70G1M4 running 64-bit major release  (build 9200)
//Command     : generate_target bram_2.bd
//Design      : bram_2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bram_2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bram_2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "bram_2.hwdef" *) 
module bram_2
   (addra_0,
    clka_0,
    dina_0,
    douta_0,
    ena_0,
    wea_0);
  input [6:0]addra_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLKA_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLKA_0, CLK_DOMAIN bram_2_clka_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clka_0;
  input [1023:0]dina_0;
  output [1023:0]douta_0;
  input ena_0;
  input [0:0]wea_0;

  wire [6:0]addra_0_1;
  wire [1023:0]blk_mem_gen_0_douta;
  wire clka_0_1;
  wire [1023:0]dina_0_1;
  wire ena_0_1;
  wire [0:0]wea_0_1;

  assign addra_0_1 = addra_0[6:0];
  assign clka_0_1 = clka_0;
  assign dina_0_1 = dina_0[1023:0];
  assign douta_0[1023:0] = blk_mem_gen_0_douta;
  assign ena_0_1 = ena_0;
  assign wea_0_1 = wea_0[0];
  bram_2_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addra_0_1),
        .clka(clka_0_1),
        .dina(dina_0_1),
        .douta(blk_mem_gen_0_douta),
        .ena(ena_0_1),
        .wea(wea_0_1));
endmodule
