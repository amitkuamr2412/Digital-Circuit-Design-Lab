-------------------------------------D Flip-flop for counter----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
  port (D,CLK,Reset: in std_logic; q: out std_logic);
end entity D_FF;

architecture WhatDoYouCare of D_FF is
begin 

   process (CLK,Reset) 
   begin
   	if (Reset = '1') then 
   	    q <= '0' ;
	elsif CLK'event and (CLK = '1') then
	     q <= D;
	end if;
   end process;

end WhatDoYouCare;
---------------------------------------------Counter f/2--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity counter is
port (CLK, reset: in std_logic; Qbar: out std_logic);
end entity counter;

architecture struct of counter is

component INVERTER is
	port (a: in std_logic; b : out std_logic);
end component;

component D_FF is
  port (D, CLK,Reset: in std_logic; q: out std_logic);
end component D_FF;
signal Q,Q_bar : std_logic ;

begin
 	dff1 : D_FF port map (D => Q_bar,CLK => CLK,Reset => reset,q => Q) ;
	inv1 : INVERTER port map (Q,Q_bar) ;
	Qbar <= Q_bar ;

end architecture struct;
