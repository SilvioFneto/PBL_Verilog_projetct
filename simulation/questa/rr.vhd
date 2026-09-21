LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY rr  IS 
END ; 
 
ARCHITECTURE rr_arch OF rr IS
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
-- Start Time = 0 ns, End Time = 1 us, Period = 400 ns
  Process
	Begin
	 btn2  <= '0'  ;
	wait for 200 ns ;
-- 200 ns, single loop till start period.
	for Z in 1 to 2
	loop
	    btn2  <= '1'  ;
	   wait for 200 ns ;
	    btn2  <= '0'  ;
	   wait for 200 ns ;
-- 1 us, repeat pattern in loop.
	end  loop;
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  Process
	Begin
	 btn1  <= '0'  ;
	wait for 50 ns ;
-- 50 ns, single loop till start period.
	for Z in 1 to 9
	loop
	    btn1  <= '1'  ;
	   wait for 50 ns ;
	    btn1  <= '0'  ;
	   wait for 50 ns ;
-- 950 ns, repeat pattern in loop.
	end  loop;
	 btn1  <= '1'  ;
	wait for 50 ns ;
-- dumped values till 1 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  Process
	Begin
	 X  <= "00001111"  ;
	wait for 1 us ;
-- dumped values till 1 us
	wait;
 End Process;
END;
