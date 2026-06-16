onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_add_sub_module/a
add wave -noupdate -radix unsigned /tb_add_sub_module/b
add wave -noupdate -radix unsigned /tb_add_sub_module/M
add wave -noupdate -radix unsigned /tb_add_sub_module/s
add wave -noupdate -radix unsigned /tb_add_sub_module/carry
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27628 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {60279 ps}
