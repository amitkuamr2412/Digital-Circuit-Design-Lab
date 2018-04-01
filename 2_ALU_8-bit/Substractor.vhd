library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity Substractor is
  port (x,y: in std_logic_vector(7 downto 0) ;
         sum: out std_logic_vector(7 downto 0) );
end entity Substractor;

architecture Struct of Substractor is

component FullBitAdder is
  port (a, b, cin: in std_logic;
         sum, cout: out std_logic);
end component FullBitAdder;

signal co: std_logic_vector(6 downto 0); 
signal inv: std_logic_vector(7 downto 0); 
signal cot: std_logic;
begin 
inv <= (not y) ;
FA1: FullBitAdder port map (a =>x(0) , b =>(inv(0)) , cin =>'1' ,sum =>sum(0) ,cout => co(0));
g1: for i in 0 to 5 generate
begin
  FA: FullBitAdder port map (a =>x(i+1), b =>(inv(i+1)), cin => co(i), sum => sum(i+1),
cout => co(i+1));
end generate g1;
FA2: FullBitAdder port map (a =>x(7) , b =>(inv(7)) , cin => co(6) ,sum =>sum(7) ,cout => cot);

end Struct;

