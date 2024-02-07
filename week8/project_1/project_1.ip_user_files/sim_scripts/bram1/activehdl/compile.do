vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 \
"../../../../project_1.srcs/sources_1/bd/bram1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/bram1/ip/bram1_blk_mem_gen_0_0/sim/bram1_blk_mem_gen_0_0.v" \
"../../../bd/bram1/ip/bram1_control_input_0_0/sim/bram1_control_input_0_0.v" \
"../../../bd/bram1/ip/bram1_CONV128_0_0/sim/bram1_CONV128_0_0.v" \
"../../../bd/bram1/ip/bram1_output_control_0_0/sim/bram1_output_control_0_0.v" \
"../../../bd/bram1/ip/bram1_blk_mem_gen_1_0/sim/bram1_blk_mem_gen_1_0.v" \
"../../../bd/bram1/sim/bram1.v" \

vlog -work xil_defaultlib \
"glbl.v"

