onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -childformat {{{/tb_comparator/a[7]} -radix decimal} {{/tb_comparator/a[6]} -radix decimal} {{/tb_comparator/a[5]} -radix decimal} {{/tb_comparator/a[4]} -radix decimal} {{/tb_comparator/a[3]} -radix decimal} {{/tb_comparator/a[2]} -radix decimal} {{/tb_comparator/a[1]} -radix decimal} {{/tb_comparator/a[0]} -radix decimal}} -subitemconfig {{/tb_comparator/a[7]} {-radix decimal} {/tb_comparator/a[6]} {-radix decimal} {/tb_comparator/a[5]} {-radix decimal} {/tb_comparator/a[4]} {-radix decimal} {/tb_comparator/a[3]} {-radix decimal} {/tb_comparator/a[2]} {-radix decimal} {/tb_comparator/a[1]} {-radix decimal} {/tb_comparator/a[0]} {-radix decimal}} /tb_comparator/a
add wave -noupdate -radix unsigned /tb_comparator/b
add wave -noupdate /tb_comparator/a_gt_b
add wave -noupdate /tb_comparator/a_lt_b
add wave -noupdate /tb_comparator/a_eq_b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14683 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 174
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
WaveRestoreZoom {0 ps} {63 ns}
