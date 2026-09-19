view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 00000001 -range 7 0 -starttime 0ns -endtime 1000ns sim:/funcao/A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 10000101 -range 7 0 -starttime 0ns -endtime 1000ns sim:/funcao/B 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00000110 -range 7 0 -starttime 0ns -endtime 1000ns sim:/funcao/C 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 00000000 -endvalue 11111111 -type Range -direction Up -period 50ns -step 1 -repeat 1 -range 7 0 -starttime 0ns -endtime 1000ns sim:/funcao/X 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
