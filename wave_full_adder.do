onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_full_adder_module/a
add wave -noupdate /tb_full_adder_module/b
add wave -noupdate /tb_full_adder_module/carry_in
add wave -noupdate /tb_full_adder_module/sum
add wave -noupdate /tb_full_adder_module/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13447 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 148
configure wave -valuecolwidth 39
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
WaveRestoreZoom {0 ps} {84 ns}
