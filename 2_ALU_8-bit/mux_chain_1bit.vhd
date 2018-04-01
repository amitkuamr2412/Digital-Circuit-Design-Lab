library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity mux_chain_1bit is
  port (x: in std_logic_vector(7 downto 0);
         s1: in std_logic;  
         o : out std_logic_vector(7 downto 0) );
end entity mux_chain_1bit ;

architecture Struct of mux_chain_1bit is
component mux is
  port (a, b, s : in std_logic;
         o : out std_logic);
end component mux ;

--signal s1: std_logic; 
begin 
 mx: mux port map ( a => x(0) , b => '0' , s => s1, o => o(0)) ;
chain2 : for i in 1 to 7 generate
begin
 mx1: mux port map ( a => x(i) , b => x(i-1) , s => s1, o => o(i)) ;
end generate chain2 ;
end Struct;

