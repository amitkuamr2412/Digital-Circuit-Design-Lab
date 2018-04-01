--library ieee;
--use ieee.std_logic_1164.all;
--
--entity myDFF is
--  port (D, CLK: in std_logic; Q: out std_logic);
--end entity myDFF;
--
--architecture WhatDoYouCare of myDFF is
--begin 
--
--   process (CLK) 
--   begin
--	if CLK'event and (CLK = '1') then
--	     Q <= D;
--	end if;
--   end process;
--
--end WhatDoYouCare;
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity TERROR is
port (x: in std_logic_vector(4 downto 0); W: out std_logic;
CLK,reset: in std_logic);
end entity TERROR;

architecture struct of TERROR is

component myDFF is
  port (D, CLK: in std_logic; Q: out std_logic);
end component myDFF;

signal nq1,nq2,nq3,q1,q2,q3,T,E,O,R: std_logic ;

begin  
    T <= (x(4) and (not x(3)) and x(2) and  (not x(1)) and (not x(0)) ) ;  
	E <= ((not x(4)) and (not x(3)) and x(2) and  (not x(1)) and  x(0) ) ;
	O <= ((not x(4)) and x(3) and x(2) and x(1) and x(0) ) ;
	R <= ( x(4) and (not x(3)) and (not x(2)) and x(1) and (not x(0)) ) ; 

    nq1 <= (
    	   ((not q1) and q2 and q3 and (not reset) and R ) 
    	or (q1 and (not q2) and (not q3) and (not reset) and (not O))
    	or (q1 and (not q2) and (not q3) and (not reset) and O)
    	or (q1 and (not q2) and q3 and (not reset) and (not R))
    	 ) ;
	
	nq2 <= ( 
		   ((not q1) and (not q2) and q3 and (not reset) and E)
		or ((not q1) and q2 and (not q3) and (not reset) and R)
		or ((not q1) and q2 and (not q3) and (not reset) and (not R))
        or ((not q1) and q2 and q3 and (not reset) and (not R))
		) ;
	nq3 <= (
		    ((not q1) and (not q2) and (not q3) and (not reset) and T ) 
		or ((not q1) and q2 and (not q3) and (not reset) and R)
      or ((not q1) and q2 and q3 and (not reset) and (not R))
		or (q1 and (not q2) and (not q3) and (not reset) and O )
		or (q1 and (not q2) and q3 and (not reset) and (not R) )
		or ( (not q1) and (not q2) and q3 and (not reset) and (not E))
		);
   
    W <=  (q1 and (not q2) and q3 and (not reset) and R) ;

    dff1 : myDFF port map (nq1,CLK,q1);
    dff2 : myDFF port map (nq2,CLK,q2);
    dff3 : myDFF port map (nq3,CLK,q3);


end architecture struct;