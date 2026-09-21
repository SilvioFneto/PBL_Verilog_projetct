
`timescale 1ns / 1ns
module onda  ; 
 
  reg  [7:0]  X   ; 
  wire  [7:0]  A   ; 
  reg    btn1   ; 
  wire  [7:0]  B   ; 
  reg    btn2   ; 
  wire  [1:0]  S   ; 
  wire  [7:0]  C   ; 
  Main  
   DUT  ( 
       .X (X ) ,
      .A (A ) ,
      .btn1 (btn1 ) ,
      .B (B ) ,
      .btn2 (btn2 ) ,
      .S (S ) ,
      .C (C ) ); 

   reg [7 : 0] \VARX ;


// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 20 ns, Period = 20 ns
  initial
  begin
	   btn2  = 1'b1  ;
	  #10  btn2  = 1'b0  ;
	  #10 ;
// 20 ns, repeat pattern in loop.
	#80 ;
  end


// "Counter Pattern"(Range-Up) : step = 1 Range(00000000-11111111)
// Start Time = 0 ns, End Time = 1 us, Period = 10 ns
  initial
  begin
	  X  = 8'b00000000  ;
	 # 10	  X  = 8'b00000001  ;
	 # 10	  X  = 8'b00000010  ;
	 # 10	  X  = 8'b00000011  ;
	 # 10	  X  = 8'b00000100  ;
	 # 10	  X  = 8'b00000101  ;
	 # 10	  X  = 8'b00000110  ;
	 # 10	  X  = 8'b00000111  ;
	 # 10	  X  = 8'b00001000  ;
	 # 10	  X  = 8'b00001001  ;
	 # 10 ;
// dumped values till 100 ns
  end


// "Clock Pattern" : dutyCycle = 50
// Start Time = 10 ns, End Time = 1 us, Period = 20 ns
  initial
  begin
	  btn1  = 1'b0  ;
	 # 20 ;
   repeat(4)
   begin
	   btn1  = 1'b1  ;
	  #10  btn1  = 1'b0  ;
	  #10 ;
// 100 ns, repeat pattern in loop.
   end
  end

  initial
	#200 $stop;
endmodule
