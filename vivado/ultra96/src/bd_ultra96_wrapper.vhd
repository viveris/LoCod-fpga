library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity bd_ultra96_wrapper is
end bd_ultra96_wrapper;

architecture STRUCTURE of bd_ultra96_wrapper is

	component bd_ultra96 is
	end component bd_ultra96;
  
begin

	bd_ultra96_i: component bd_ultra96
	;
	
end STRUCTURE;
