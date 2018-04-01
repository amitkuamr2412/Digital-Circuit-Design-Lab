library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port (a, b, s : in std_logic;
         o : out std_logic);
end entity mux ;

architecture Struct of mux is

--signal o1, c1, c2: std_logic; 
begin 
  o <= (a and (not s) ) or (s and b) ;
  
end Struct;

