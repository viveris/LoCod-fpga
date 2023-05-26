library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity bd_enclustra_wrapper is
end bd_enclustra_wrapper;

architecture STRUCTURE of bd_enclustra_wrapper is

	component bd_enclustra is
	end component bd_enclustra;
  
begin

	bd_enclustra_i: component bd_enclustra
	;
	
end STRUCTURE;
