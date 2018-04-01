-- A DUT entity is used to wrap your design.
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(6 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is

component string_recognizer is
port (X: in std_logic_vector(4 downto 0) ; W: out std_logic;
clk,reset: in std_logic);
end component string_recognizer;

begin
dut: string_recognizer port map( X => input_vector(4 downto 0), clk => input_vector(5) , reset => input_vector(6) , W => output_vector(0));
end DutWrap;
