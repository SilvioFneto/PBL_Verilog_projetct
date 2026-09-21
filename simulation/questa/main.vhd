LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY main  IS 
END ; 
 
ARCHITECTURE main_arch OF main IS
  SIGNAL X   :  std_logic_vector(7 downto 0)  ; 
  SIGNAL A   :  std_logic_vector(7 downto 0)  ; 
  SIGNAL btn1   :  std_logic  ; 
  SIGNAL B   :  std_logic_vector(7 downto 0)  ; 
  SIGNAL btn2   :  std_logic  ; 
  SIGNAL C   :  std_logic_vector(7 downto 0)  ; 
component Main 
    port(
        X               : in    std_logic_vector(7 downto 0);
        btn1            : in    std_logic;
        btn2            : in    std_logic;
        A               : out   std_logic_vector(7 downto 0);
        B               : out   std_logic_vector(7 downto 0);
        C               : out   std_logic_vector(7 downto 0)
    );
end component;  
BEGIN
  DUT  : Main  
    PORT MAP ( 
      X   => X  ,
      A   => A  ,
      btn1   => btn1  ,
      B   => B  ,
      btn2   => btn2  ,
      C   => C   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 600 ns
  Process
	Begin
	    btn1  <= '1'  ;
	   wait for 300 ns ;
	    btn1  <= '0'  ;
	   wait for 300 ns ;
-- 600 ns, repeat pattern in loop.
	 btn1  <= '1'  ;
	wait for 300 ns ;
	 btn1  <= '0'  ;
	wait for 100 ns ;
-- dumped values till 1 us
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  Process
	Begin
	for Z in 1 to 10
	loop
	    btn2  <= '1'  ;
	   wait for 50 ns ;
	    btn2  <= '0'  ;
	   wait for 50 ns ;
-- 1 us, repeat pattern in loop.
	end  loop;
	wait;
 End Process;


-- "Counter Pattern"(Range-Up) : step = 1 Range(00000000-11111111)
-- Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  Process
	variable VARX  : std_logic_vector(7 downto 0);
	Begin
	VARX  := "00000000" ;
	for repeatLength in 1 to 10
	loop
	    X  <= VARX  ;
	   wait for 100 ns ;
	   VARX  := VARX  + 1 ;
	end loop;
-- 1 us, periods remaining till edit start time.
	wait;
 End Process;
END;
