library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

package EE224_Components is
   component INVERTER is
	port (a: in std_logic; b : out std_logic);
   end component;
   component AND_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
   component OR_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
   component NAND_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
   component XOR_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
end EE224_Components;
---------------------D flip-flip used in mealy FSM of debouncing-------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity myDFF is
  port (D, CLK: in std_logic; Q: out std_logic);
end entity myDFF;

architecture WhatDoYouCare of myDFF is
begin 

   process (CLK) 
   begin
	if CLK'event and (CLK = '1') then
	     Q <= D;
	end if;
   end process;

end WhatDoYouCare;
--------------------------2 input Logic Gates----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
  port (a: in std_logic;
         b: out std_logic);
end entity INVERTER;
architecture Behave of INVERTER is
begin
  b <= not a;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity AND_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity AND_2;
architecture Behave of AND_2 is
begin
  c <= a and b;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity OR_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity OR_2;
architecture Behave of OR_2 is
begin
  c <= a or b;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity NAND_2;
architecture Behave of NAND_2 is
begin
  c <= not (a and b);
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity XOR_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity XOR_2;
architecture Behave of XOR_2 is
begin
  c <= (a xor b);
end Behave;

--------------------------Debouncing FSM-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity debounce is
port (x: in std_logic ; W: out std_logic;
CLK,reset: in std_logic);
end entity debounce;

architecture struct of debounce is

component INVERTER is
	port (a: in std_logic; b : out std_logic);
end component;

component AND_2 is
	port (a, b: in std_logic; c : out std_logic);
end component;

component OR_2 is
port (a, b: in std_logic; c : out std_logic);
end component;

component myDFF is
  port (D, CLK: in std_logic; Q: out std_logic);
end component myDFF;

signal nq0,nq1,q0,q1 ,x_bar , q0_bar, q1_bar ,r_bar ,s0,s1,s2 ,nq0a,nq0b,rnq0 ,nq1a,nq1b,rnq1,Wr : std_logic ;

begin  
      inv1 : INVERTER port map (q0,q0_bar) ;
      inv2 : INVERTER port map (q1,q1_bar) ;
      inv3 : INVERTER port map (x,x_bar) ;
      inv4 : INVERTER port map (reset,r_bar);

      s_0 : AND_2 port map (q0_bar,q1_bar,s0); ----------State Encoding
      s_1 : AND_2 port map (q0_bar,q1,s1);
      s_2 : AND_2 port map (q0,q1_bar,s2);
    -----------------------------------------------------------------------------  
      nq0_a : AND_2 port map (s1,x,nq0a) ;
      nq0_b : AND_2 port map (s2,x,nq0b) ;

      r_nq0 : OR_2 port map (nq0a,nq0b,rnq0) ;

      nq_0 : AND_2 port map (rnq0,r_bar,nq0) ; 
----------------------------------------------------------------------------------
      nq1_a : AND_2 port map (s0,x,nq1a) ;
      nq1_b : AND_2 port map (s2,x_bar,nq1b) ;

      r_nq1 : OR_2 port map (nq1a,nq1b,rnq1) ;

      nq_1  : AND_2 port map (rnq1,r_bar,nq1) ;
--------------------------------------------------------------------------------

     W_r : OR_2 port map (nq0a,s2,Wr) ;
      W1 : AND_2 port map (Wr,r_bar,W) ;

   dff2 : myDFF port map (nq1,CLK,q1);

   dff1 : myDFF port map (nq0,CLK,q0);

end architecture struct;
