onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_multiplier_fsm/clk
add wave -noupdate -radix binary /tb_multiplier_fsm/rst_n
add wave -noupdate -radix binary /tb_multiplier_fsm/start
add wave -noupdate -radix unsigned /tb_multiplier_fsm/a
add wave -noupdate -radix unsigned /tb_multiplier_fsm/b
add wave -noupdate -radix unsigned /tb_multiplier_fsm/res
add wave -noupdate -radix binary /tb_multiplier_fsm/done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {96348 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 173
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
WaveRestoreZoom {0 ps} {332421 ps}
