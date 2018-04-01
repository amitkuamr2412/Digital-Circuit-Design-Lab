library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------------------------------------------
package EE224_Components is
   
	component AND_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
	
   component XOR_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
	
end EE224_Components;
--------------------------------------------------------------------------------------------


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
entity XOR_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity XOR_2;
architecture Behave of XOR_2 is
begin
  c <= (a xor b);
end Behave;


library ieee;
-- std_logic type and associated functions.
use ieee.std_logic_1164.all;

library work;
-- package of component declarations..
use work.EE224_Components.all;

entity HalfBitAdder is
   port(x0,y0: in std_logic;
        s0,c0: out std_logic);
end entity;
architecture Struct of HalfBitAdder is
  -- signal w, z: std_logic;
begin
   output: XOR_2 port map (a => x0, b => y0, c => s0); 
  
   carry: AND_2 port map (a => x0, b => y0, c => c0);

end Struct;

