onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_main_module/clk
add wave -noupdate /tb_main_module/rst_n
add wave -noupdate /tb_main_module/start
add wave -noupdate -radix unsigned /tb_main_module/s
add wave -noupdate -radix unsigned /tb_main_module/a
add wave -noupdate -radix unsigned /tb_main_module/b
add wave -noupdate -radix unsigned /tb_main_module/s_as
add wave -noupdate /tb_main_module/carry_as
add wave -noupdate /tb_main_module/a_gt_b
add wave -noupdate /tb_main_module/a_lt_b
add wave -noupdate /tb_main_module/a_eq_b
add wave -noupdate -radix unsigned /tb_main_module/ab_and
add wave -noupdate -radix unsigned /tb_main_module/s_m
add wave -noupdate /tb_main_module/done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {794462 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {829500 ps}
