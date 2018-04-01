
--------------------------------GUNMAN------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity GUN is
port (x: in std_logic_vector(4 downto 0); W: out std_logic;
CLK,reset: in std_logic);
end entity GUN;

architecture struct of GUN is

component myDFF is
  port (D, CLK: in std_logic; Q: out std_logic);
end component myDFF;

signal nq1,nq2,q1,q2,U,G,N : std_logic ;

begin   
---------------------alphabet encoding-------------------------------------
	G <= ( (not x(4)) and (not x(3)) and x(2) and x(1) and x(0) ) ;
        U <= (x(4) and (not x(3)) and x(2) and (not x(1)) and x(0) ) ;
	N <= ( (not x(4)) and x(3) and x(2) and x(1) and (not x(0) )) ;
	
    nq1 <= (( (not q1) and q2 and (not reset) and U ) 
    	or   (q1 and (not q2) and (not reset) and (not N)  ) ) ;
	
	nq2 <= ( ((not q1) and (not q2) and (not reset) and G ) 
		or ((not reset) and (not q1) and q2 and (not U) ) ) ;
   
    W <=  (q1 and (not q2) and N and (not reset)) ;

   dff2 : myDFF port map (nq2,CLK,q2);

   dff1 : myDFF port map (nq1,CLK,q1);

end architecture struct;
