onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib re2_copro_opt

do {wave.do}

view wave
view structure
view signals

do {re2_copro.udo}

run -all

quit -force
