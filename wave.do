onerror {resume}
quietly virtual function -install /tb_main_module -env /tb_main_module/#INITIAL#27 { &{/tb_main_module/a7, /tb_main_module/a6, /tb_main_module/a5, /tb_main_module/a4, /tb_main_module/a3, /tb_main_module/a2, /tb_main_module/a1, /tb_main_module/a0 }} input_A
quietly virtual function -install /tb_main_module -env /tb_main_module/#INITIAL#27 { &{/tb_main_module/a1, /tb_main_module/a0 }} input_S
quietly virtual function -install /tb_main_module -env /tb_main_module/#INITIAL#27 { &{/tb_main_module/b7, /tb_main_module/b6, /tb_main_module/b5, /tb_main_module/b4, /tb_main_module/b3, /tb_main_module/b2, /tb_main_module/b1, /tb_main_module/b0 }} input_B
quietly virtual signal -install /tb_main_module { (context /tb_main_module )&{s7_as , s6_as , s5_as , s4_as , s3_as , s2_as , s1_as , s0_as }} output_AS
quietly virtual signal -install /tb_main_module { (context /tb_main_module )&{ab_7 , ab_6 , ab_5 , ab_4 , ab_3 , ab_2 , ab_1 , ab_0 }} output_AB
quietly virtual function -install /tb_main_module -env /tb_main_module/#INITIAL#27 { &{/tb_main_module/s0, /tb_main_module/s1 }} input_S001
quietly virtual function -install /tb_main_module -env /tb_main_module/#INITIAL#27 { &{/tb_main_module/s1, /tb_main_module/s0 }} input_S002
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_main_module/input_S002
add wave -noupdate -radix unsigned /tb_main_module/input_A
add wave -noupdate -radix unsigned /tb_main_module/input_B
add wave -noupdate -radix unsigned /tb_main_module/output_AS
add wave -noupdate -radix unsigned /tb_main_module/output_AB
add wave -noupdate /tb_main_module/a_gt_b
add wave -noupdate /tb_main_module/a_lt_b
add wave -noupdate /tb_main_module/a_eq_b
add wave -noupdate /tb_main_module/carry_as
add wave -noupdate /tb_main_module/a7
add wave -noupdate /tb_main_module/a6
add wave -noupdate /tb_main_module/a5
add wave -noupdate /tb_main_module/a4
add wave -noupdate /tb_main_module/a3
add wave -noupdate /tb_main_module/a2
add wave -noupdate /tb_main_module/a1
add wave -noupdate /tb_main_module/a0
add wave -noupdate /tb_main_module/s1
add wave -noupdate /tb_main_module/s0
add wave -noupdate /tb_main_module/b7
add wave -noupdate /tb_main_module/b6
add wave -noupdate /tb_main_module/b5
add wave -noupdate /tb_main_module/b4
add wave -noupdate /tb_main_module/b3
add wave -noupdate /tb_main_module/b2
add wave -noupdate /tb_main_module/b1
add wave -noupdate /tb_main_module/b0
add wave -noupdate /tb_main_module/s7_as
add wave -noupdate /tb_main_module/s6_as
add wave -noupdate /tb_main_module/s5_as
add wave -noupdate /tb_main_module/s4_as
add wave -noupdate /tb_main_module/s3_as
add wave -noupdate /tb_main_module/s2_as
add wave -noupdate /tb_main_module/s1_as
add wave -noupdate /tb_main_module/s0_as
add wave -noupdate /tb_main_module/ab_7
add wave -noupdate /tb_main_module/ab_6
add wave -noupdate /tb_main_module/ab_5
add wave -noupdate /tb_main_module/ab_4
add wave -noupdate /tb_main_module/ab_3
add wave -noupdate /tb_main_module/ab_2
add wave -noupdate /tb_main_module/ab_1
add wave -noupdate /tb_main_module/ab_0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5303 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 217
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
WaveRestoreZoom {0 ps} {42 ns}
