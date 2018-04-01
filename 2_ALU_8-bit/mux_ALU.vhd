library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity mux_ALU is
  port (x,b: in std_logic_vector(7 downto 0);
         --s1: in std_logic; 
         o : out std_logic_vector(7 downto 0) );
end entity mux_ALU ;

architecture Struct of mux_ALU is
component mux is
  port (a, b, s : in std_logic;
         o : out std_logic);
end component mux ;

signal s1: std_logic; 
begin 
s1 <= (b(7) or b(6) or b(5) or b(4) or b(3)) ;  
chain1: for i in 0 to 7 generate 
 begin 
  mx: mux port map ( a => x(i) , b => '0' , s => s1, o => o(i) ) ;
 end generate chain1;
end Struct;

