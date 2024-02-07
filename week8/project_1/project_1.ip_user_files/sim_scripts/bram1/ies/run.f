-makelib ies_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_4 \
  "../../../../project_1.srcs/sources_1/bd/bram1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/bram1/ip/bram1_blk_mem_gen_0_0/sim/bram1_blk_mem_gen_0_0.v" \
  "../../../bd/bram1/ip/bram1_control_input_0_0/sim/bram1_control_input_0_0.v" \
  "../../../bd/bram1/ip/bram1_CONV128_0_0/sim/bram1_CONV128_0_0.v" \
  "../../../bd/bram1/ip/bram1_output_control_0_0/sim/bram1_output_control_0_0.v" \
  "../../../bd/bram1/ip/bram1_blk_mem_gen_1_0/sim/bram1_blk_mem_gen_1_0.v" \
  "../../../bd/bram1/sim/bram1.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

