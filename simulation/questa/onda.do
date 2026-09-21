onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /Main/S
add wave -noupdate /Main/btn1
add wave -noupdate /Main/btn2
add wave -noupdate /Main/X
add wave -noupdate /Main/A
add wave -noupdate /Main/B
add wave -noupdate /Main/C
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {88 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {159 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 00000001 -starttime 0ns -endtime 20ns sim:/Main/btn2 
wave create -driver freeze -pattern constant -value 00000001 -starttime 0ns -endtime 20ns sim:/Main/btn2 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 1'hz -period 20ns -dutycycle 50 -starttime 0ns -endtime 20ns sim:/Main/btn2 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ns -dutycycle 50 -starttime 20ns -endtime 1000ns sim:/Main/btn1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 10ns -dutycycle 50 -starttime 20ns -endtime 1000ns sim:/Main/btn1 
wave create -driver freeze -pattern counter -startvalue 00000000 -endvalue 11111111 -type Range -direction Up -period 10ns -step 1 -repeat 1 -range 7 0 -starttime 0ns -endtime 1000ns sim:/Main/X 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 0 -period 10ns -dutycycle 50 -starttime 10ns -endtime 1000ns sim:/Main/btn1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 20ns -dutycycle 50 -starttime 10ns -endtime 1000ns sim:/Main/btn1 
{wave export -file onda -starttime 0 -endtime 100 -format vlog -designunit Main} 
WaveCollapseAll -1
wave clipboard restore
