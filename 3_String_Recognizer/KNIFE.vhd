
---------------------------------KNIFE-----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity KNIFE is
port (x: in std_logic_vector(4 downto 0); W: out std_logic;
CLK,reset: in std_logic);
end entity KNIFE;

architecture struct of KNIFE is

component myDFF is
  port (D, CLK: in std_logic; Q: out std_logic);
end component myDFF;

signal nq1,nq2,nq3,q1,q2,q3,K,N,I,F,E: std_logic ;

begin   
	K <= ( (not x(4)) and  x(3) and (not x(2)) and x(1) and x(0) ) ;
	N <= ( (not x(4)) and x(3) and x(2) and x(1) and (not x(0)) ) ;
	I <= ((not x(4)) and x(3) and (not x(2)) and (not x(1)) and x(0) ) ;
	F <= ((not x(4)) and (not x(3)) and x(2) and x(1) and (not x(0)) ) ;
	E <= ((not x(4)) and (not x(3)) and x(2) and  (not x(1)) and  x(0)) ;

	--not_K <= ( x(4) or (not x(3)) or x(2) or (not x(1)) or (not x(0)) ) ;
	--not_N <= ( x(4) or (not x(3)) or (not x(2)) or (not x(1)) or x(0) ) ;
	--not_I <= ( x(4) or (not x(3)) or (not x(2)) or x(1) or (not x(0)) ) ;
	--not_F <= ( x(4) or  x(3) or (not x(2)) or (not x(1)) or x(0) ) ;
	--not_E <= ( x(4) or  x(3) or (not x(2)) or x(1) or (not x(0)) ) ;
	--not_K,not_N,not_I,not_F,not_E


    nq1 <= (
    	   ((not q1) and q2 and q3 and (not reset) and F ) 
    	or (q1 and (not q2) and (not q3) and (not reset) and (not E))
    	 ) ;
	
	nq2 <= ( 
		   ((not q1) and (not q2) and q3 and (not reset) and N ) 
		or ((not q1) and q2 and (not q3) and (not reset) and I )
		or ((not q1) and q2 and (not q3) and (not reset) and (not I))
        or ((not q1) and q2 and q3 and (not reset) and (not F))
		) ;
	nq3 <= (
		    ((not q1) and (not q2) and (not q3) and (not reset) and K ) 
		or ((not q1) and (not q2) and q3 and (not reset) and (not N) )
		or ((not q1) and q2 and (not q3) and (not reset) and I)
        or ((not q1) and q2 and q3 and (not reset) and (not F))
		) ;
   
    W <=  (q1 and (not q2) and (not q3) and (not reset) and E) ;

    dff1 : myDFF port map (nq1,CLK,q1);
    dff2 : myDFF port map (nq2,CLK,q2);
    dff3 : myDFF port map (nq3,CLK,q3);


end architecture struct;
   