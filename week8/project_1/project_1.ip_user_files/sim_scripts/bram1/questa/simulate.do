onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib bram1_opt

do {wave.do}

view wave
view structure
view signals

do {bram1.udo}

run -all

quit -force
