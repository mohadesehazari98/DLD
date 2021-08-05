onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_controller/uut/clk
add wave -noupdate /tb_controller/uut/rst
add wave -noupdate /tb_controller/uut/si
add wave -noupdate /tb_controller/uut/shePL
add wave -noupdate /tb_controller/uut/valid
add wave -noupdate /tb_controller/uut/PL_OUT
add wave -noupdate /tb_controller/uut/ns
add wave -noupdate /tb_controller/uut/ps
add wave -noupdate /tb_controller/uut/creg
add wave -noupdate /tb_controller/uut/countout
add wave -noupdate /tb_controller/uut/initc
add wave -noupdate /tb_controller/uut/incc
add wave -noupdate /tb_controller/uut/initcdata
add wave -noupdate /tb_controller/uut/dc
add wave -noupdate /tb_controller/uut/sheC
add wave -noupdate /tb_controller/uut/czero
add wave -noupdate /tb_controller/uut/co
add wave -noupdate /tb_controller/uut/parout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1450 ns} 0}
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
WaveRestoreZoom {1032 ns} {1996 ns}
