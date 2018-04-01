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
-------------------------------------Bomb-----------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity BOMB is
port (x: in std_logic_vector(4 downto 0); W: out std_logic;
CLK,reset: in std_logic);
end entity BOMB;

architecture struct of BOMB is

component myDFF is
  port (D, CLK: in std_logic; Q: out std_logic);
end component myDFF;

signal nq1,nq2,q1,q2,B,O,M : std_logic ;

begin   
	B <= ( (not x(4)) and (not x(3)) and (not x(2)) and x(1) and (not x(0)) ) ;
	O <= ((not x(4)) and x(3) and x(2) and x(1) and x(0) ) ;
	M <= ( (not x(4)) and x(3) and x(2) and (not x(1)) and x(0) ) ;
	
    nq1 <= (
    	   ((not q1) and q2 and (not reset) and O ) 
    	or (q1 and (not q2) and (not reset) and (not M) )
    	or (q1 and (not q2) and (not reset) and M)
    	or (q1 and q2 and (not reset) and (not B)) 
    	 ) ;
	
    nq2 <= (   ((not q1) and (not q2) and (not reset) and B ) 
		or ((not q1) and q2 and (not reset) and (not O) )
		or (q1 and (not q2) and (not reset) and M)
        or (q1 and q2 and (not reset) and (not B))
		) ;
   
    W <=  (q1 and q2 and (not reset) and B) ;

   dff2 : myDFF port map (nq2,CLK,q2);

   dff1 : myDFF port map (nq1,CLK,q1);

end architecture struct;
