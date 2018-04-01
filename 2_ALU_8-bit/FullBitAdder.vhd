library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity FullBitAdder is
  port (a, b, cin: in std_logic;
         sum, cout: out std_logic);
end entity FullBitAdder;

architecture Struct of FullBitAdder is

component HalfBitAdder is
   port(x0,y0: in std_logic;
        s0,c0: out std_logic);
end component;
signal o1, c1, c2: std_logic; 
begin 
  HA1: HalfBitAdder port map ( x0 => a, y0 => b, s0 => o1 , c0 => c1) ;
  HA2: HalfBitAdder port map ( x0 => o1, y0 => cin, s0 => sum , c0 => c2) ;

cout <= c1 or c2 ;
end Struct;

