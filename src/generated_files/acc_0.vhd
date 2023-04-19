-- 
-- Politecnico di Milano
-- Code created using PandA - Version: PandA 0.9.8 - Revision eda4c22d5adaec44fd8489ae49b854b244d2cf70-HEAD - Date 2023-04-19T13:17:00
-- bambu executed with: bambu --writer=H --generate-interface=MINIMAL --memory-allocation-policy=NO_BRAM --channels-type=MEM_ACC_11 --memory-ctrl-type=D21 --top-fname=acc_0 --top-rtldesign-name=acc_0 ../src/main.c 
-- 
-- Send any bug to: panda-info@polimi.it
-- ************************************************************************
-- The following text holds for all the components tagged with PANDA_LGPLv3.
-- They are all part of the BAMBU/PANDA IP LIBRARY.
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with the PandA framework; see the files COPYING.LIB
-- If not, see <http://www.gnu.org/licenses/>.
-- ************************************************************************


library IEEE;
use IEEE.numeric_std.all;

package panda_pkg is
   function resize_signed(input : signed; size : integer) return signed;
end;

package body panda_pkg is
   function resize_signed(input : signed; size : integer) return signed is
   begin
     if (size > input'length) then
       return resize(input, size);
     else
       return input(size-1+input'right downto input'right);
     end if;
   end function;
end package body;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity constant_value is 
generic(
 BITSIZE_out1: integer;
 value: std_logic_vector);
port (
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end constant_value;

architecture constant_value_arch of constant_value is
  begin
   out1 <= value;
end constant_value_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity register_SE is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  wenable : in std_logic;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end register_SE;

architecture register_SE_arch of register_SE is
  
  signal reg_out1 : std_logic_vector(BITSIZE_out1-1 downto 0) := (others => '0');
  begin
    out1 <= reg_out1;
    process(clock)
    begin
      if(clock'event and clock = '1') then
        if(wenable = '1') then
          reg_out1 <= in1;
        end if;
      end if;
    end process;

end register_SE_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity register_STD is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  wenable : in std_logic;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end register_STD;

architecture register_STD_arch of register_STD is
  
  signal reg_out1 : std_logic_vector(BITSIZE_out1-1 downto 0) := (others => '0');
  begin
  out1 <= reg_out1;
  process(clock)
  begin
    if(clock'event and clock = '1') then
      reg_out1 <= in1;
    end if;
  end process;

end register_STD_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity UUdata_converter_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end UUdata_converter_FU;

architecture UUdata_converter_FU_arch of UUdata_converter_FU is
  begin
  out1 <= std_logic_vector(resize(unsigned(in1), BITSIZE_out1));
end UUdata_converter_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_pointer_plus_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer;
 LSB_PARAMETER: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_pointer_plus_expr_FU;

architecture ui_pointer_plus_expr_FU_arch of ui_pointer_plus_expr_FU is
  begin
    out1 <= resize(in1, BITSIZE_out1) + resize(in2, BITSIZE_out1);
end ui_pointer_plus_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ASSIGN_UNSIGNED_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ASSIGN_UNSIGNED_FU;

architecture ASSIGN_UNSIGNED_FU_arch of ASSIGN_UNSIGNED_FU is
  begin
    out1 <= resize(in1, BITSIZE_out1);
end ASSIGN_UNSIGNED_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2020-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_extract_bit_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out std_logic

);
end ui_extract_bit_expr_FU;

architecture ui_extract_bit_expr_FU_arch of ui_extract_bit_expr_FU is
  begin
    process(in1, in2)
    begin
      out1 <= shift_right(unsigned(in1), to_integer(unsigned(in2)))(0);
    end process;

end ui_extract_bit_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2016-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity lut_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  in2 : in std_logic;
  in3 : in std_logic;
  in4 : in std_logic;
  in5 : in std_logic;
  in6 : in std_logic;
  in7 : in std_logic;
  in8 : in std_logic;
  in9 : in std_logic;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end lut_expr_FU;

architecture lut_expr_FU_arch of lut_expr_FU is
    signal in0 : std_logic_vector(7 downto 0);
    signal shifted_s : unsigned(in1'range) := (others => '0');
  begin
    in0(0) <= in2;
    in0(1) <= in3;
    in0(2) <= in4;
    in0(3) <= in5;
    in0(4) <= in6;
    in0(5) <= in7;
    in0(6) <= in8;
    in0(7) <= in9;
    out1 <= std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1)) when (shifted_s(0) = '1') else (others => '0');
    process(in0, in1)
    begin
      shifted_s <= shift_right(unsigned(in1), to_integer(unsigned(in0)));
    end process;

end lut_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity UIdata_converter_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end UIdata_converter_FU;

architecture UIdata_converter_FU_arch of UIdata_converter_FU is
  begin
    process(in1)
    begin
      if(BITSIZE_out1 > BITSIZE_in1) then
        out1 <= signed(resize(in1, BITSIZE_out1));
      else
        out1 <= signed(in1 (BITSIZE_out1-1 downto 0));
      end if;
    end process;
end UIdata_converter_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2020-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity extract_bit_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out std_logic

);
end extract_bit_expr_FU;

architecture extract_bit_expr_FU_arch of extract_bit_expr_FU is
  begin
    process(in1, in2)
    begin
      out1 <= shift_right(in1, to_integer(unsigned(in2)))(0);
    end process;

end extract_bit_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity bit_and_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end bit_and_expr_FU;

architecture bit_and_expr_FU_arch of bit_and_expr_FU is
  begin
  out1 <= resize_signed(in1, BITSIZE_out1) and resize_signed(in2, BITSIZE_out1);
end bit_and_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity bit_ior_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end bit_ior_expr_FU;

architecture bit_ior_expr_FU_arch of bit_ior_expr_FU is
  begin
  out1 <= resize_signed(in1, BITSIZE_out1) or resize_signed(in2, BITSIZE_out1);
end bit_ior_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_bit_and_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_bit_and_expr_FU;

architecture ui_bit_and_expr_FU_arch of ui_bit_and_expr_FU is
  begin
  out1 <= resize(in1, BITSIZE_out1) and resize(in2, BITSIZE_out1);
end ui_bit_and_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_bit_ior_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_bit_ior_expr_FU;

architecture ui_bit_ior_expr_FU_arch of ui_bit_ior_expr_FU is
  begin
  out1 <= resize(in1, BITSIZE_out1) or resize(in2, BITSIZE_out1);
end ui_bit_ior_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_cond_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_in3: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  in3 : in unsigned (BITSIZE_in3-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_cond_expr_FU;

architecture ui_cond_expr_FU_arch of ui_cond_expr_FU is
  constant zeroes : std_logic_vector(in1'range) := (others => '0');
  begin
    out1 <= resize(in2, BITSIZE_out1) when (in1 /= zeroes) else resize(in3, BITSIZE_out1);

end ui_cond_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_eq_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ui_eq_expr_FU;

architecture ui_eq_expr_FU_arch of ui_eq_expr_FU is
  begin
    out1 <= std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1)) when (in1 = in2) else (others => '0');

end ui_eq_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_lshift_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer;
 PRECISION: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_lshift_expr_FU;

architecture ui_lshift_expr_FU_arch of ui_lshift_expr_FU is
  begin
    process(in1, in2)
    begin
      out1 <= shift_left(resize(in1, BITSIZE_out1), to_integer(unsigned(in2) rem PRECISION));
    end process;

end ui_lshift_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_mult_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer;
 PIPE_PARAMETER: integer);
port (
  -- IN
  clock : in std_logic;
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_mult_expr_FU;

architecture ui_mult_expr_FU_arch of ui_mult_expr_FU is
    signal in1_int : unsigned (BITSIZE_in1-1 downto 0);
    signal in2_int : unsigned (BITSIZE_in2-1 downto 0);
  begin
    cond: if(PIPE_PARAMETER=0) generate
      out1 <= resize(in1 * in2, BITSIZE_out1);
    end generate cond;
    cond1 : if(PIPE_PARAMETER=1) generate
      out1 <= resize(in1_int * in2_int, BITSIZE_out1);
      process(clock)
      begin
        if clock'event and clock = '1' then
          in1_int <= in1;
          in2_int <= in2;
        end if;
      end process;
    end generate cond1;
    cond2 : if(PIPE_PARAMETER >1) generate
      type levels_of_registers is array (PIPE_PARAMETER-1 downto 0) of unsigned (BITSIZE_out1-1 downto 0);
      signal out1_int : levels_of_registers;
    begin
      out1 <= out1_int (0);
      process(clock)
      begin
        if clock'event and clock = '1' then
          in1_int <= in1;
          in2_int <= in2;
          out1_int(PIPE_PARAMETER-2) <= resize(in1_int * in2_int, BITSIZE_out1);
          for i in 0 to PIPE_PARAMETER-3 loop
            out1_int (i) <= out1_int (i+1);
          end loop;
        end if;
      end process;
    end generate cond2;

end ui_mult_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_ne_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ui_ne_expr_FU;

architecture ui_ne_expr_FU_arch of ui_ne_expr_FU is
  signal xs1 : unsigned(in1'range) := (others => 'X');
  signal xs2 : unsigned(in2'range) := (others => 'X');
  begin
    out1 <= (others => 'X') when (not((in1 >= in2) or (in1 <= in2))) else std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1)) when (in1 /= in2) else (others => '0');

end ui_ne_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_plus_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_plus_expr_FU;

architecture ui_plus_expr_FU_arch of ui_plus_expr_FU is
    signal resized_in1 : unsigned(BITSIZE_out1-1 downto 0);
    signal resized_in2 : unsigned(BITSIZE_out1-1 downto 0);
    begin
      process(in1,in2,resized_in1,resized_in2)
      begin
        if(BITSIZE_out1 <= BITSIZE_in1) then
          resized_in1 <= in1(BITSIZE_out1-1 downto 0);
        else
          resized_in1 <= resize(in1, BITSIZE_out1);
        end if;
        if(BITSIZE_out1 < BITSIZE_in2) then
          resized_in2 <= in2(BITSIZE_out1-1 downto 0);
        else
          resized_in2 <= resize(in2, BITSIZE_out1);
        end if;
        out1 <= resized_in1 + resized_in2;
      end process;

end ui_plus_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_rshift_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer;
 PRECISION: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_rshift_expr_FU;

architecture ui_rshift_expr_FU_arch of ui_rshift_expr_FU is
  begin
    process(in1, in2)
    begin
      out1 <= resize(shift_right(in1, to_integer(unsigned(in2) rem PRECISION)), BITSIZE_out1);
    end process;

end ui_rshift_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_ternary_plus_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_in3: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  in3 : in unsigned (BITSIZE_in3-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_ternary_plus_expr_FU;

architecture ui_ternary_plus_expr_FU_arch of ui_ternary_plus_expr_FU is
  begin
  out1 <= resize(in1, BITSIZE_out1) + resize(in2, BITSIZE_out1) + resize(in3, BITSIZE_out1);
end ui_ternary_plus_expr_FU_arch;

-- Datapath RTL description for __float_mule8m23b_127nih
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity \datapath___float_mule8m23b_127nih\ is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in_port_a : in unsigned (63 downto 0);
  in_port_b : in unsigned (63 downto 0);
  wrenable_reg_0 : in std_logic;
  wrenable_reg_1 : in std_logic;
  wrenable_reg_10 : in std_logic;
  wrenable_reg_2 : in std_logic;
  wrenable_reg_3 : in std_logic;
  wrenable_reg_4 : in std_logic;
  wrenable_reg_5 : in std_logic;
  wrenable_reg_6 : in std_logic;
  wrenable_reg_7 : in std_logic;
  wrenable_reg_8 : in std_logic;
  wrenable_reg_9 : in std_logic;
  -- OUT
  return_port : out unsigned (63 downto 0)

);
end \datapath___float_mule8m23b_127nih\;

architecture \datapath___float_mule8m23b_127nih_arch\ of \datapath___float_mule8m23b_127nih\ is
  -- Component and signal declarations
  
  component constant_value
  generic(
   BITSIZE_out1: integer;
   value: std_logic_vector);
  port (
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_STD
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ASSIGN_UNSIGNED_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_extract_bit_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component lut_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic;
    in3 : in std_logic;
    in4 : in std_logic;
    in5 : in std_logic;
    in6 : in std_logic;
    in7 : in std_logic;
    in8 : in std_logic;
    in9 : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UIdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component extract_bit_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component bit_and_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component bit_ior_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_bit_and_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_bit_ior_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_cond_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    in3 : in unsigned (BITSIZE_in3-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_eq_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_lshift_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   PRECISION: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_mult_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   PIPE_PARAMETER: integer);
  port (
    -- IN
    clock : in std_logic;
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_ne_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_rshift_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   PRECISION: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_ternary_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    in3 : in unsigned (BITSIZE_in3-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  signal \out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_31900_33561\ : unsigned (7 downto 0);
  signal \out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_31900_33563\ : unsigned (7 downto 0);
  signal \out_UIdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_31900_32242\ : signed (2 downto 0);
  signal \out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_31900_32245\ : signed (1 downto 0);
  signal \out_UIdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_31900_32275\ : signed (1 downto 0);
  signal \out_UIdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_31900_32248\ : signed (2 downto 0);
  signal \out_UIdata_converter_FU_64_i0_fu___float_mule8m23b_127nih_31900_32278\ : signed (1 downto 0);
  signal \out_UIdata_converter_FU_67_i0_fu___float_mule8m23b_127nih_31900_32293\ : signed (1 downto 0);
  signal \out_UIdata_converter_FU_74_i0_fu___float_mule8m23b_127nih_31900_32561\ : signed (1 downto 0);
  signal \out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_31900_32007\ : std_logic_vector(7 downto 0) ;
  signal \out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_31900_33554\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_45_i0_fu___float_mule8m23b_127nih_31900_32133\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_49_i0_fu___float_mule8m23b_127nih_31900_32272\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_31900_32021\ : std_logic_vector(7 downto 0) ;
  signal \out_UUdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_31900_33557\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_62_i0_fu___float_mule8m23b_127nih_31900_32209\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_66_i0_fu___float_mule8m23b_127nih_31900_32290\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_69_i0_fu___float_mule8m23b_127nih_31900_32546\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_70_i0_fu___float_mule8m23b_127nih_31900_32549\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_73_i0_fu___float_mule8m23b_127nih_31900_32558\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_75_i0_fu___float_mule8m23b_127nih_31900_32579\ : std_logic_vector(9 downto 0) ;
  signal \out_UUdata_converter_FU_80_i0_fu___float_mule8m23b_127nih_31900_32688\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_31900_32044\ : std_logic_vector(0 downto 0);
  signal \out_bit_and_expr_FU_8_8_8_124_i0_fu___float_mule8m23b_127nih_31900_32254\ : signed (1 downto 0);
  signal \out_bit_and_expr_FU_8_8_8_124_i1_fu___float_mule8m23b_127nih_31900_32281\ : signed (1 downto 0);
  signal \out_bit_and_expr_FU_8_8_8_124_i2_fu___float_mule8m23b_127nih_31900_32296\ : signed (1 downto 0);
  signal \out_bit_ior_expr_FU_8_8_8_125_i0_fu___float_mule8m23b_127nih_31900_32251\ : signed (2 downto 0);
  signal out_const_0 : std_logic_vector(0 downto 0);
  signal out_const_1 : std_logic_vector(1 downto 0) ;
  signal out_const_10 : std_logic_vector(16 downto 0) ;
  signal out_const_11 : std_logic_vector(23 downto 0) ;
  signal out_const_12 : std_logic_vector(63 downto 0) ;
  signal out_const_13 : std_logic_vector(48 downto 0) ;
  signal out_const_14 : std_logic_vector(60 downto 0) ;
  signal out_const_15 : std_logic_vector(3 downto 0) ;
  signal out_const_16 : std_logic_vector(4 downto 0) ;
  signal out_const_17 : std_logic_vector(4 downto 0) ;
  signal out_const_18 : std_logic_vector(5 downto 0) ;
  signal out_const_19 : std_logic_vector(1 downto 0) ;
  signal out_const_2 : std_logic_vector(5 downto 0) ;
  signal out_const_20 : std_logic_vector(2 downto 0) ;
  signal out_const_21 : std_logic_vector(4 downto 0) ;
  signal out_const_22 : std_logic_vector(4 downto 0) ;
  signal out_const_23 : std_logic_vector(4 downto 0) ;
  signal out_const_24 : std_logic_vector(4 downto 0) ;
  signal out_const_25 : std_logic_vector(4 downto 0) ;
  signal out_const_26 : std_logic_vector(7 downto 0) ;
  signal out_const_27 : std_logic_vector(55 downto 0) ;
  signal out_const_28 : std_logic_vector(11 downto 0) ;
  signal out_const_29 : std_logic_vector(10 downto 0) ;
  signal out_const_3 : std_logic_vector(5 downto 0) ;
  signal out_const_30 : std_logic_vector(4 downto 0) ;
  signal out_const_31 : std_logic_vector(4 downto 0) ;
  signal out_const_32 : std_logic_vector(4 downto 0) ;
  signal out_const_33 : std_logic_vector(7 downto 0) ;
  signal out_const_34 : std_logic_vector(30 downto 0) ;
  signal out_const_35 : std_logic_vector(9 downto 0) ;
  signal out_const_36 : std_logic_vector(16 downto 0) ;
  signal out_const_37 : std_logic_vector(16 downto 0) ;
  signal out_const_38 : std_logic_vector(22 downto 0) ;
  signal out_const_39 : std_logic_vector(31 downto 0) ;
  signal out_const_4 : std_logic_vector(5 downto 0) ;
  signal out_const_40 : std_logic_vector(30 downto 0) ;
  signal out_const_41 : std_logic_vector(31 downto 0) ;
  signal out_const_42 : std_logic_vector(32 downto 0) ;
  signal out_const_43 : std_logic_vector(46 downto 0) ;
  signal out_const_5 : std_logic_vector(0 downto 0);
  signal out_const_6 : std_logic_vector(3 downto 0) ;
  signal out_const_7 : std_logic_vector(5 downto 0) ;
  signal out_const_8 : std_logic_vector(7 downto 0) ;
  signal out_const_9 : std_logic_vector(9 downto 0) ;
  signal out_conv_in_port_a_64_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_in_port_b_64_32 : std_logic_vector(31 downto 0) ;
  signal \out_conv_out_ui_cond_expr_FU_32_32_32_32_140_i2_fu___float_mule8m23b_127nih_31900_33559_32_64\ : std_logic_vector(63 downto 0) ;
  signal \out_extract_bit_expr_FU_101_i0_fu___float_mule8m23b_127nih_31900_34968\ : std_logic;
  signal \out_extract_bit_expr_FU_103_i0_fu___float_mule8m23b_127nih_31900_34719\ : std_logic;
  signal \out_extract_bit_expr_FU_104_i0_fu___float_mule8m23b_127nih_31900_34722\ : std_logic;
  signal \out_extract_bit_expr_FU_106_i0_fu___float_mule8m23b_127nih_31900_34979\ : std_logic;
  signal \out_extract_bit_expr_FU_112_i0_fu___float_mule8m23b_127nih_31900_34745\ : std_logic;
  signal \out_extract_bit_expr_FU_113_i0_fu___float_mule8m23b_127nih_31900_34748\ : std_logic;
  signal \out_extract_bit_expr_FU_115_i0_fu___float_mule8m23b_127nih_31900_34991\ : std_logic;
  signal \out_extract_bit_expr_FU_118_i0_fu___float_mule8m23b_127nih_31900_34771\ : std_logic;
  signal \out_extract_bit_expr_FU_119_i0_fu___float_mule8m23b_127nih_31900_34774\ : std_logic;
  signal \out_extract_bit_expr_FU_121_i0_fu___float_mule8m23b_127nih_31900_35003\ : std_logic;
  signal \out_extract_bit_expr_FU_83_i0_fu___float_mule8m23b_127nih_31900_34677\ : std_logic;
  signal \out_extract_bit_expr_FU_84_i0_fu___float_mule8m23b_127nih_31900_34680\ : std_logic;
  signal \out_extract_bit_expr_FU_86_i0_fu___float_mule8m23b_127nih_31900_34957\ : std_logic;
  signal \out_extract_bit_expr_FU_98_i0_fu___float_mule8m23b_127nih_31900_34698\ : std_logic;
  signal \out_extract_bit_expr_FU_99_i0_fu___float_mule8m23b_127nih_31900_34701\ : std_logic;
  signal \out_lut_expr_FU_102_i0_fu___float_mule8m23b_127nih_31900_33496\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_107_i0_fu___float_mule8m23b_127nih_31900_35113\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_108_i0_fu___float_mule8m23b_127nih_31900_35116\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_109_i0_fu___float_mule8m23b_127nih_31900_35120\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_110_i0_fu___float_mule8m23b_127nih_31900_35124\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_111_i0_fu___float_mule8m23b_127nih_31900_33499\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_116_i0_fu___float_mule8m23b_127nih_31900_35129\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_117_i0_fu___float_mule8m23b_127nih_31900_33512\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_122_i0_fu___float_mule8m23b_127nih_31900_33481\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_31900_35074\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_31900_35078\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_31900_32087\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_31900_32874\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_31900_35083\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_31900_35086\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_31900_32163\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_31900_32866\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_43_i0_fu___float_mule8m23b_127nih_31900_35091\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_31900_33842\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_48_i0_fu___float_mule8m23b_127nih_31900_33679\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_60_i0_fu___float_mule8m23b_127nih_31900_35098\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_61_i0_fu___float_mule8m23b_127nih_31900_33846\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_65_i0_fu___float_mule8m23b_127nih_31900_33725\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_72_i0_fu___float_mule8m23b_127nih_31900_33732\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_79_i0_fu___float_mule8m23b_127nih_31900_33746\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_31900_35106\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_88_i0_fu___float_mule8m23b_127nih_31900_33007\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_31900_32041\ : std_logic_vector(0 downto 0);
  signal out_reg_0_reg_0 : std_logic_vector(31 downto 0) ;
  signal out_reg_10_reg_10 : std_logic_vector(0 downto 0);
  signal out_reg_1_reg_1 : std_logic_vector(9 downto 0) ;
  signal out_reg_2_reg_2 : std_logic_vector(47 downto 0) ;
  signal out_reg_3_reg_3 : std_logic_vector(0 downto 0);
  signal out_reg_4_reg_4 : std_logic_vector(1 downto 0) ;
  signal out_reg_5_reg_5 : std_logic_vector(31 downto 0) ;
  signal out_reg_6_reg_6 : std_logic_vector(0 downto 0);
  signal out_reg_7_reg_7 : std_logic_vector(31 downto 0) ;
  signal out_reg_8_reg_8 : std_logic_vector(0 downto 0);
  signal out_reg_9_reg_9 : std_logic_vector(0 downto 0);
  signal \out_ui_bit_and_expr_FU_0_32_32_126_i0_fu___float_mule8m23b_127nih_31900_32787\ : unsigned (30 downto 0);
  signal \out_ui_bit_and_expr_FU_0_64_64_127_i0_fu___float_mule8m23b_127nih_31900_32573\ : unsigned (46 downto 0);
  signal \out_ui_bit_and_expr_FU_0_64_64_128_i0_fu___float_mule8m23b_127nih_31900_32617\ : unsigned (32 downto 0);
  signal \out_ui_bit_and_expr_FU_0_8_8_129_i0_fu___float_mule8m23b_127nih_31900_32018\ : unsigned (7 downto 0);
  signal \out_ui_bit_and_expr_FU_1_1_1_130_i0_fu___float_mule8m23b_127nih_31900_32236\ : unsigned (0 downto 0);
  signal \out_ui_bit_and_expr_FU_32_0_32_131_i0_fu___float_mule8m23b_127nih_31900_31987\ : unsigned (22 downto 0);
  signal \out_ui_bit_and_expr_FU_32_0_32_131_i1_fu___float_mule8m23b_127nih_31900_32024\ : unsigned (22 downto 0);
  signal \out_ui_bit_and_expr_FU_32_0_32_131_i2_fu___float_mule8m23b_127nih_31900_32588\ : unsigned (22 downto 0);
  signal \out_ui_bit_and_expr_FU_32_0_32_131_i3_fu___float_mule8m23b_127nih_31900_32673\ : unsigned (22 downto 0);
  signal \out_ui_bit_and_expr_FU_32_0_32_132_i0_fu___float_mule8m23b_127nih_31900_32358\ : unsigned (23 downto 0);
  signal \out_ui_bit_and_expr_FU_32_0_32_132_i1_fu___float_mule8m23b_127nih_31900_32364\ : unsigned (23 downto 0);
  signal \out_ui_bit_and_expr_FU_8_0_8_133_i0_fu___float_mule8m23b_127nih_31900_32004\ : unsigned (7 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_32_32_134_i0_fu___float_mule8m23b_127nih_31900_32340\ : unsigned (23 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_32_32_134_i1_fu___float_mule8m23b_127nih_31900_32355\ : unsigned (23 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_32_32_135_i0_fu___float_mule8m23b_127nih_31900_32790\ : unsigned (31 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_32_32_136_i0_fu___float_mule8m23b_127nih_31900_32842\ : unsigned (31 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_64_64_137_i0_fu___float_mule8m23b_127nih_31900_32591\ : unsigned (32 downto 0);
  signal \out_ui_bit_ior_expr_FU_8_8_8_138_i0_fu___float_mule8m23b_127nih_31900_32136\ : unsigned (1 downto 0);
  signal \out_ui_bit_ior_expr_FU_8_8_8_138_i1_fu___float_mule8m23b_127nih_31900_32139\ : unsigned (1 downto 0);
  signal \out_ui_bit_ior_expr_FU_8_8_8_138_i2_fu___float_mule8m23b_127nih_31900_32212\ : unsigned (1 downto 0);
  signal \out_ui_bit_ior_expr_FU_8_8_8_138_i3_fu___float_mule8m23b_127nih_31900_32215\ : unsigned (1 downto 0);
  signal \out_ui_cond_expr_FU_16_16_16_16_139_i0_fu___float_mule8m23b_127nih_31900_33476\ : unsigned (9 downto 0);
  signal \out_ui_cond_expr_FU_16_16_16_16_139_i1_fu___float_mule8m23b_127nih_31900_33530\ : unsigned (9 downto 0);
  signal \out_ui_cond_expr_FU_32_32_32_32_140_i0_fu___float_mule8m23b_127nih_31900_33515\ : unsigned (31 downto 0);
  signal \out_ui_cond_expr_FU_32_32_32_32_140_i1_fu___float_mule8m23b_127nih_31900_33533\ : unsigned (31 downto 0);
  signal \out_ui_cond_expr_FU_32_32_32_32_140_i2_fu___float_mule8m23b_127nih_31900_33559\ : unsigned (31 downto 0);
  signal \out_ui_cond_expr_FU_8_8_8_8_141_i0_fu___float_mule8m23b_127nih_31900_33386\ : unsigned (1 downto 0);
  signal \out_ui_cond_expr_FU_8_8_8_8_141_i1_fu___float_mule8m23b_127nih_31900_33395\ : unsigned (1 downto 0);
  signal \out_ui_cond_expr_FU_8_8_8_8_141_i2_fu___float_mule8m23b_127nih_31900_33521\ : unsigned (1 downto 0);
  signal \out_ui_cond_expr_FU_8_8_8_8_141_i3_fu___float_mule8m23b_127nih_31900_33527\ : unsigned (1 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_142_i0_fu___float_mule8m23b_127nih_31900_32067\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_142_i1_fu___float_mule8m23b_127nih_31900_32151\ : std_logic_vector(0 downto 0);
  signal \out_ui_extract_bit_expr_FU_100_i0_fu___float_mule8m23b_127nih_31900_35035\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_105_i0_fu___float_mule8m23b_127nih_31900_35043\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_31900_34488\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_114_i0_fu___float_mule8m23b_127nih_31900_35051\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_31900_34492\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_120_i0_fu___float_mule8m23b_127nih_31900_35059\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_31900_34496\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_31900_34500\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_31900_34504\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_31900_34508\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_31900_34512\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_31900_34516\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_31900_34520\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_31900_34524\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_31900_34528\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_31900_34532\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_31900_34536\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_31900_34540\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_31900_34544\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_31900_34548\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_35_i0_fu___float_mule8m23b_127nih_31900_34552\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_36_i0_fu___float_mule8m23b_127nih_31900_34556\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_37_i0_fu___float_mule8m23b_127nih_31900_34560\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_38_i0_fu___float_mule8m23b_127nih_31900_34564\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_39_i0_fu___float_mule8m23b_127nih_31900_34568\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_40_i0_fu___float_mule8m23b_127nih_31900_34572\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_41_i0_fu___float_mule8m23b_127nih_31900_34576\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_42_i0_fu___float_mule8m23b_127nih_31900_34580\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_31900_34600\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_53_i0_fu___float_mule8m23b_127nih_31900_34604\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_54_i0_fu___float_mule8m23b_127nih_31900_34608\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_55_i0_fu___float_mule8m23b_127nih_31900_34612\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_56_i0_fu___float_mule8m23b_127nih_31900_34616\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_57_i0_fu___float_mule8m23b_127nih_31900_34620\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_58_i0_fu___float_mule8m23b_127nih_31900_34624\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_31900_34628\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_31900_34026\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_31900_33859\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_31900_34030\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_31900_33212\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_31900_34842\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_31900_34666\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_31900_33863\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_81_i0_fu___float_mule8m23b_127nih_31900_34950\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_82_i0_fu___float_mule8m23b_127nih_31900_34049\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_85_i0_fu___float_mule8m23b_127nih_31900_35027\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_89_i0_fu___float_mule8m23b_127nih_31900_34365\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_90_i0_fu___float_mule8m23b_127nih_31900_34369\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_91_i0_fu___float_mule8m23b_127nih_31900_34373\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_92_i0_fu___float_mule8m23b_127nih_31900_34378\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_93_i0_fu___float_mule8m23b_127nih_31900_34383\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_94_i0_fu___float_mule8m23b_127nih_31900_34388\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_95_i0_fu___float_mule8m23b_127nih_31900_34393\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_96_i0_fu___float_mule8m23b_127nih_31900_34398\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_97_i0_fu___float_mule8m23b_127nih_31900_34095\ : std_logic;
  signal \out_ui_lshift_expr_FU_32_0_32_143_i0_fu___float_mule8m23b_127nih_31900_32047\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_144_i0_fu___float_mule8m23b_127nih_31900_33171\ : unsigned (23 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_145_i0_fu___float_mule8m23b_127nih_31900_33492\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_145_i1_fu___float_mule8m23b_127nih_31900_33551\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_64_0_64_146_i0_fu___float_mule8m23b_127nih_31900_32576\ : unsigned (47 downto 0);
  signal \out_ui_lshift_expr_FU_64_0_64_147_i0_fu___float_mule8m23b_127nih_31900_32582\ : unsigned (32 downto 0);
  signal \out_ui_lshift_expr_FU_64_64_64_148_i0_fu___float_mule8m23b_127nih_31900_32564\ : unsigned (46 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i0_fu___float_mule8m23b_127nih_31900_33537\ : unsigned (1 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i1_fu___float_mule8m23b_127nih_31900_33541\ : unsigned (1 downto 0);
  signal \out_ui_mult_expr_FU_32_32_32_0_150_i0_fu___float_mule8m23b_127nih_31900_32367\ : unsigned (47 downto 0);
  signal \out_ui_ne_expr_FU_32_0_32_151_i0_fu___float_mule8m23b_127nih_31900_32676\ : std_logic_vector(0 downto 0);
  signal \out_ui_ne_expr_FU_32_0_32_152_i0_fu___float_mule8m23b_127nih_31900_32863\ : std_logic_vector(0 downto 0);
  signal \out_ui_ne_expr_FU_32_0_32_152_i1_fu___float_mule8m23b_127nih_31900_32871\ : std_logic_vector(0 downto 0);
  signal \out_ui_plus_expr_FU_16_16_16_153_i0_fu___float_mule8m23b_127nih_31900_32552\ : unsigned (9 downto 0);
  signal \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\ : unsigned (32 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_155_i0_fu___float_mule8m23b_127nih_31900_31995\ : unsigned (7 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_155_i1_fu___float_mule8m23b_127nih_31900_32013\ : unsigned (7 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_156_i0_fu___float_mule8m23b_127nih_31900_33174\ : unsigned (22 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_157_i0_fu___float_mule8m23b_127nih_31900_33485\ : unsigned (9 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_157_i1_fu___float_mule8m23b_127nih_31900_33547\ : unsigned (9 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_158_i0_fu___float_mule8m23b_127nih_31900_33544\ : unsigned (9 downto 0);
  signal \out_ui_rshift_expr_FU_64_0_64_159_i0_fu___float_mule8m23b_127nih_31900_32585\ : unsigned (22 downto 0);
  signal \out_ui_rshift_expr_FU_64_0_64_160_i0_fu___float_mule8m23b_127nih_31900_33161\ : unsigned (22 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_161_i0_fu___float_mule8m23b_127nih_31900_32218\ : unsigned (0 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_161_i1_fu___float_mule8m23b_127nih_31900_32221\ : unsigned (0 downto 0);
  signal \out_ui_ternary_plus_expr_FU_0_16_16_16_162_i0_fu___float_mule8m23b_127nih_31900_32323\ : unsigned (9 downto 0);
begin
  const_0 : constant_value generic map(BITSIZE_out1=>1,
    value=>"0") port map (out1 => out_const_0);
  const_1 : constant_value generic map(BITSIZE_out1=>2,
    value=>"01") port map (out1 => out_const_1);
  const_10 : constant_value generic map(BITSIZE_out1=>17,
    value=>"10000000000000000") port map (out1 => out_const_10);
  const_11 : constant_value generic map(BITSIZE_out1=>24,
    value=>"100000000000000000000000") port map (out1 => out_const_11);
  const_12 : constant_value generic map(BITSIZE_out1=>64,
    value=>"1000000000000000000000000000000000000000000000000000000000000000") port map (out1 => out_const_12);
  const_13 : constant_value generic map(BITSIZE_out1=>49,
    value=>"1000000000000111100010001000100011111111111111111") port map (out1 => out_const_13);
  const_14 : constant_value generic map(BITSIZE_out1=>61,
    value=>"1000100010001000000000000111100010001000100010000000000000000") port map (out1 => out_const_14);
  const_15 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1001") port map (out1 => out_const_15);
  const_16 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10110") port map (out1 => out_const_16);
  const_17 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10111") port map (out1 => out_const_17);
  const_18 : constant_value generic map(BITSIZE_out1=>6,
    value=>"101111") port map (out1 => out_const_18);
  const_19 : constant_value generic map(BITSIZE_out1=>2,
    value=>"11") port map (out1 => out_const_19);
  const_2 : constant_value generic map(BITSIZE_out1=>6,
    value=>"010111") port map (out1 => out_const_2);
  const_20 : constant_value generic map(BITSIZE_out1=>3,
    value=>"110") port map (out1 => out_const_20);
  const_21 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11000") port map (out1 => out_const_21);
  const_22 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11001") port map (out1 => out_const_22);
  const_23 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11010") port map (out1 => out_const_23);
  const_24 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11011") port map (out1 => out_const_24);
  const_25 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11100") port map (out1 => out_const_25);
  const_26 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11100000") port map (out1 => out_const_26);
  const_27 : constant_value generic map(BITSIZE_out1=>56,
    value=>"11100000000000000000000011111111000111111111111111111111") port map (out1 => out_const_27);
  const_28 : constant_value generic map(BITSIZE_out1=>12,
    value=>"111000001111") port map (out1 => out_const_28);
  const_29 : constant_value generic map(BITSIZE_out1=>11,
    value=>"11100001111") port map (out1 => out_const_29);
  const_3 : constant_value generic map(BITSIZE_out1=>6,
    value=>"011001") port map (out1 => out_const_3);
  const_30 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11101") port map (out1 => out_const_30);
  const_31 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11110") port map (out1 => out_const_31);
  const_32 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11111") port map (out1 => out_const_32);
  const_33 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11111111") port map (out1 => out_const_33);
  const_34 : constant_value generic map(BITSIZE_out1=>31,
    value=>"1111111100000000000000000000000") port map (out1 => out_const_34);
  const_35 : constant_value generic map(BITSIZE_out1=>10,
    value=>"1111111111") port map (out1 => out_const_35);
  const_36 : constant_value generic map(BITSIZE_out1=>17,
    value=>"11111111111111110") port map (out1 => out_const_36);
  const_37 : constant_value generic map(BITSIZE_out1=>17,
    value=>"11111111111111111") port map (out1 => out_const_37);
  const_38 : constant_value generic map(BITSIZE_out1=>23,
    value=>"11111111111111111111111") port map (out1 => out_const_38);
  const_39 : constant_value generic map(BITSIZE_out1=>32,
    value=>"11111111111111111111111110000001") port map (out1 => out_const_39);
  const_4 : constant_value generic map(BITSIZE_out1=>6,
    value=>"011111") port map (out1 => out_const_4);
  const_40 : constant_value generic map(BITSIZE_out1=>31,
    value=>"1111111111111111111111111111111") port map (out1 => out_const_40);
  const_41 : constant_value generic map(BITSIZE_out1=>32,
    value=>"11111111111111111111111111111111") port map (out1 => out_const_41);
  const_42 : constant_value generic map(BITSIZE_out1=>33,
    value=>"111111111111111111111111111111111") port map (out1 => out_const_42);
  const_43 : constant_value generic map(BITSIZE_out1=>47,
    value=>"11111111111111111111111111111111111111111111111") port map (out1 => out_const_43);
  const_5 : constant_value generic map(BITSIZE_out1=>1,
    value=>"1") port map (out1 => out_const_5);
  const_6 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1000") port map (out1 => out_const_6);
  const_7 : constant_value generic map(BITSIZE_out1=>6,
    value=>"100000") port map (out1 => out_const_7);
  const_8 : constant_value generic map(BITSIZE_out1=>8,
    value=>"10000000") port map (out1 => out_const_8);
  const_9 : constant_value generic map(BITSIZE_out1=>10,
    value=>"1000000000") port map (out1 => out_const_9);
  conv_in_port_a_64_32 : UUdata_converter_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>32) port map (out1 => out_conv_in_port_a_64_32,
    in1 => std_logic_vector(in_port_a));
  conv_in_port_b_64_32 : UUdata_converter_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>32) port map (out1 => out_conv_in_port_b_64_32,
    in1 => std_logic_vector(in_port_b));
  \conv_out_ui_cond_expr_FU_32_32_32_32_140_i2_fu___float_mule8m23b_127nih_31900_33559_32_64\ : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>64) port map (out1 => \out_conv_out_ui_cond_expr_FU_32_32_32_32_140_i2_fu___float_mule8m23b_127nih_31900_33559_32_64\,
    in1 => std_logic_vector(\out_ui_cond_expr_FU_32_32_32_32_140_i2_fu___float_mule8m23b_127nih_31900_33559\));
  \fu___float_mule8m23b_127nih_31900_31987\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_131_i0_fu___float_mule8m23b_127nih_31900_31987\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => unsigned(out_const_38));
  \fu___float_mule8m23b_127nih_31900_31995\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>6,
    BITSIZE_out1=>8,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_155_i0_fu___float_mule8m23b_127nih_31900_31995\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_2);
  \fu___float_mule8m23b_127nih_31900_32004\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>8,
    BITSIZE_out1=>8) port map (out1 => \out_ui_bit_and_expr_FU_8_0_8_133_i0_fu___float_mule8m23b_127nih_31900_32004\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_155_i0_fu___float_mule8m23b_127nih_31900_31995\,
    in2 => unsigned(out_const_33));
  \fu___float_mule8m23b_127nih_31900_32007\ : UUdata_converter_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>8) port map (out1 => \out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_31900_32007\,
    in1 => std_logic_vector(\out_ui_bit_and_expr_FU_8_0_8_133_i0_fu___float_mule8m23b_127nih_31900_32004\));
  \fu___float_mule8m23b_127nih_31900_32013\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>6,
    BITSIZE_out1=>8,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_155_i1_fu___float_mule8m23b_127nih_31900_32013\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_2);
  \fu___float_mule8m23b_127nih_31900_32018\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>8,
    BITSIZE_out1=>8) port map (out1 => \out_ui_bit_and_expr_FU_0_8_8_129_i0_fu___float_mule8m23b_127nih_31900_32018\,
    in1 => unsigned(out_const_33),
    in2 => \out_ui_rshift_expr_FU_32_0_32_155_i1_fu___float_mule8m23b_127nih_31900_32013\);
  \fu___float_mule8m23b_127nih_31900_32021\ : UUdata_converter_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>8) port map (out1 => \out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_31900_32021\,
    in1 => std_logic_vector(\out_ui_bit_and_expr_FU_0_8_8_129_i0_fu___float_mule8m23b_127nih_31900_32018\));
  \fu___float_mule8m23b_127nih_31900_32024\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_131_i1_fu___float_mule8m23b_127nih_31900_32024\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => unsigned(out_const_38));
  \fu___float_mule8m23b_127nih_31900_32041\ : lut_expr_FU generic map(BITSIZE_in1=>3,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_31900_32041\,
    in1 => out_const_20,
    in2 => \out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_31900_33859\,
    in3 => \out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_31900_33863\,
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_32044\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_31900_32044\,
    in1 => \out_lut_expr_FU_8_i0_fu___float_mule8m23b_127nih_31900_32041\);
  \fu___float_mule8m23b_127nih_31900_32047\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>6,
    BITSIZE_out1=>32,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_143_i0_fu___float_mule8m23b_127nih_31900_32047\,
    in1 => unsigned(\out_UUdata_converter_FU_9_i0_fu___float_mule8m23b_127nih_31900_32044\),
    in2 => out_const_4);
  \fu___float_mule8m23b_127nih_31900_32067\ : ui_eq_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_142_i0_fu___float_mule8m23b_127nih_31900_32067\,
    in1 => \out_ui_bit_and_expr_FU_32_0_32_131_i0_fu___float_mule8m23b_127nih_31900_31987\,
    in2 => unsigned(out_const_0));
  \fu___float_mule8m23b_127nih_31900_32087\ : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_31900_32087\,
    in1 => out_const_6,
    in2 => \out_ui_eq_expr_FU_32_0_32_142_i0_fu___float_mule8m23b_127nih_31900_32067\(0),
    in3 => \out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_31900_35078\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_32133\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_45_i0_fu___float_mule8m23b_127nih_31900_32133\,
    in1 => \out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_31900_33842\);
  \fu___float_mule8m23b_127nih_31900_32136\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2) port map (out1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i0_fu___float_mule8m23b_127nih_31900_32136\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_149_i0_fu___float_mule8m23b_127nih_31900_33537\,
    in2 => \out_ui_cond_expr_FU_8_8_8_8_141_i3_fu___float_mule8m23b_127nih_31900_33527\);
  \fu___float_mule8m23b_127nih_31900_32139\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2) port map (out1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i1_fu___float_mule8m23b_127nih_31900_32139\,
    in1 => unsigned(\out_UUdata_converter_FU_45_i0_fu___float_mule8m23b_127nih_31900_32133\),
    in2 => \out_ui_bit_ior_expr_FU_8_8_8_138_i0_fu___float_mule8m23b_127nih_31900_32136\);
  \fu___float_mule8m23b_127nih_31900_32151\ : ui_eq_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_142_i1_fu___float_mule8m23b_127nih_31900_32151\,
    in1 => \out_ui_bit_and_expr_FU_32_0_32_131_i1_fu___float_mule8m23b_127nih_31900_32024\,
    in2 => unsigned(out_const_0));
  \fu___float_mule8m23b_127nih_31900_32163\ : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_31900_32163\,
    in1 => out_const_6,
    in2 => \out_ui_eq_expr_FU_32_0_32_142_i1_fu___float_mule8m23b_127nih_31900_32151\(0),
    in3 => \out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_31900_35086\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_32209\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_62_i0_fu___float_mule8m23b_127nih_31900_32209\,
    in1 => \out_lut_expr_FU_61_i0_fu___float_mule8m23b_127nih_31900_33846\);
  \fu___float_mule8m23b_127nih_31900_32212\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2) port map (out1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i2_fu___float_mule8m23b_127nih_31900_32212\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_149_i1_fu___float_mule8m23b_127nih_31900_33541\,
    in2 => \out_ui_cond_expr_FU_8_8_8_8_141_i2_fu___float_mule8m23b_127nih_31900_33521\);
  \fu___float_mule8m23b_127nih_31900_32215\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2) port map (out1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i3_fu___float_mule8m23b_127nih_31900_32215\,
    in1 => unsigned(\out_UUdata_converter_FU_62_i0_fu___float_mule8m23b_127nih_31900_32209\),
    in2 => \out_ui_bit_ior_expr_FU_8_8_8_138_i2_fu___float_mule8m23b_127nih_31900_32212\);
  \fu___float_mule8m23b_127nih_31900_32218\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>2,
    BITSIZE_out1=>1,
    PRECISION=>8) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_161_i0_fu___float_mule8m23b_127nih_31900_32218\,
    in1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i1_fu___float_mule8m23b_127nih_31900_32139\,
    in2 => out_const_1);
  \fu___float_mule8m23b_127nih_31900_32221\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>2,
    BITSIZE_out1=>1,
    PRECISION=>8) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_161_i1_fu___float_mule8m23b_127nih_31900_32221\,
    in1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i3_fu___float_mule8m23b_127nih_31900_32215\,
    in2 => out_const_1);
  \fu___float_mule8m23b_127nih_31900_32236\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_out1=>1) port map (out1 => \out_ui_bit_and_expr_FU_1_1_1_130_i0_fu___float_mule8m23b_127nih_31900_32236\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_161_i1_fu___float_mule8m23b_127nih_31900_32221\,
    in2 => \out_ui_bit_ior_expr_FU_8_8_8_138_i3_fu___float_mule8m23b_127nih_31900_32215\);
  \fu___float_mule8m23b_127nih_31900_32242\ : UIdata_converter_FU generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>3) port map (out1 => \out_UIdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_31900_32242\,
    in1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i1_fu___float_mule8m23b_127nih_31900_32139\);
  \fu___float_mule8m23b_127nih_31900_32245\ : UIdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>2) port map (out1 => \out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_31900_32245\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_161_i0_fu___float_mule8m23b_127nih_31900_32218\);
  \fu___float_mule8m23b_127nih_31900_32248\ : UIdata_converter_FU generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>3) port map (out1 => \out_UIdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_31900_32248\,
    in1 => \out_ui_bit_ior_expr_FU_8_8_8_138_i3_fu___float_mule8m23b_127nih_31900_32215\);
  \fu___float_mule8m23b_127nih_31900_32251\ : bit_ior_expr_FU generic map(BITSIZE_in1=>3,
    BITSIZE_in2=>2,
    BITSIZE_out1=>3) port map (out1 => \out_bit_ior_expr_FU_8_8_8_125_i0_fu___float_mule8m23b_127nih_31900_32251\,
    in1 => \out_UIdata_converter_FU_63_i0_fu___float_mule8m23b_127nih_31900_32248\,
    in2 => \out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_31900_32245\);
  \fu___float_mule8m23b_127nih_31900_32254\ : bit_and_expr_FU generic map(BITSIZE_in1=>3,
    BITSIZE_in2=>3,
    BITSIZE_out1=>2) port map (out1 => \out_bit_and_expr_FU_8_8_8_124_i0_fu___float_mule8m23b_127nih_31900_32254\,
    in1 => \out_bit_ior_expr_FU_8_8_8_125_i0_fu___float_mule8m23b_127nih_31900_32251\,
    in2 => \out_UIdata_converter_FU_46_i0_fu___float_mule8m23b_127nih_31900_32242\);
  \fu___float_mule8m23b_127nih_31900_32272\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_49_i0_fu___float_mule8m23b_127nih_31900_32272\,
    in1 => \out_lut_expr_FU_48_i0_fu___float_mule8m23b_127nih_31900_33679\);
  \fu___float_mule8m23b_127nih_31900_32275\ : UIdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>2) port map (out1 => \out_UIdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_31900_32275\,
    in1 => unsigned(\out_UUdata_converter_FU_49_i0_fu___float_mule8m23b_127nih_31900_32272\));
  \fu___float_mule8m23b_127nih_31900_32278\ : UIdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>2) port map (out1 => \out_UIdata_converter_FU_64_i0_fu___float_mule8m23b_127nih_31900_32278\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_161_i1_fu___float_mule8m23b_127nih_31900_32221\);
  \fu___float_mule8m23b_127nih_31900_32281\ : bit_and_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2) port map (out1 => \out_bit_and_expr_FU_8_8_8_124_i1_fu___float_mule8m23b_127nih_31900_32281\,
    in1 => \out_UIdata_converter_FU_50_i0_fu___float_mule8m23b_127nih_31900_32275\,
    in2 => \out_UIdata_converter_FU_64_i0_fu___float_mule8m23b_127nih_31900_32278\);
  \fu___float_mule8m23b_127nih_31900_32290\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_66_i0_fu___float_mule8m23b_127nih_31900_32290\,
    in1 => \out_lut_expr_FU_65_i0_fu___float_mule8m23b_127nih_31900_33725\);
  \fu___float_mule8m23b_127nih_31900_32293\ : UIdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>2) port map (out1 => \out_UIdata_converter_FU_67_i0_fu___float_mule8m23b_127nih_31900_32293\,
    in1 => unsigned(\out_UUdata_converter_FU_66_i0_fu___float_mule8m23b_127nih_31900_32290\));
  \fu___float_mule8m23b_127nih_31900_32296\ : bit_and_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2) port map (out1 => \out_bit_and_expr_FU_8_8_8_124_i2_fu___float_mule8m23b_127nih_31900_32296\,
    in1 => \out_UIdata_converter_FU_67_i0_fu___float_mule8m23b_127nih_31900_32293\,
    in2 => \out_UIdata_converter_FU_47_i0_fu___float_mule8m23b_127nih_31900_32245\);
  \fu___float_mule8m23b_127nih_31900_32323\ : ui_ternary_plus_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>8,
    BITSIZE_in3=>8,
    BITSIZE_out1=>10) port map (out1 => \out_ui_ternary_plus_expr_FU_0_16_16_16_162_i0_fu___float_mule8m23b_127nih_31900_32323\,
    in1 => unsigned(out_const_39),
    in2 => \out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_31900_33561\,
    in3 => \out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_31900_33563\);
  \fu___float_mule8m23b_127nih_31900_32340\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>23,
    BITSIZE_out1=>24) port map (out1 => \out_ui_bit_ior_expr_FU_0_32_32_134_i0_fu___float_mule8m23b_127nih_31900_32340\,
    in1 => unsigned(out_const_11),
    in2 => \out_ui_bit_and_expr_FU_32_0_32_131_i0_fu___float_mule8m23b_127nih_31900_31987\);
  \fu___float_mule8m23b_127nih_31900_32355\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>23,
    BITSIZE_out1=>24) port map (out1 => \out_ui_bit_ior_expr_FU_0_32_32_134_i1_fu___float_mule8m23b_127nih_31900_32355\,
    in1 => unsigned(out_const_11),
    in2 => \out_ui_bit_and_expr_FU_32_0_32_131_i1_fu___float_mule8m23b_127nih_31900_32024\);
  \fu___float_mule8m23b_127nih_31900_32358\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>32,
    BITSIZE_out1=>24) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_132_i0_fu___float_mule8m23b_127nih_31900_32358\,
    in1 => \out_ui_bit_ior_expr_FU_0_32_32_134_i0_fu___float_mule8m23b_127nih_31900_32340\,
    in2 => unsigned(out_const_41));
  \fu___float_mule8m23b_127nih_31900_32364\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>32,
    BITSIZE_out1=>24) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_132_i1_fu___float_mule8m23b_127nih_31900_32364\,
    in1 => \out_ui_bit_ior_expr_FU_0_32_32_134_i1_fu___float_mule8m23b_127nih_31900_32355\,
    in2 => unsigned(out_const_41));
  \fu___float_mule8m23b_127nih_31900_32367\ : ui_mult_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>24,
    BITSIZE_out1=>48,
    PIPE_PARAMETER=>0) port map (out1 => \out_ui_mult_expr_FU_32_32_32_0_150_i0_fu___float_mule8m23b_127nih_31900_32367\,
    clock => clock,
    in1 => \out_ui_bit_and_expr_FU_32_0_32_132_i0_fu___float_mule8m23b_127nih_31900_32358\,
    in2 => \out_ui_bit_and_expr_FU_32_0_32_132_i1_fu___float_mule8m23b_127nih_31900_32364\);
  \fu___float_mule8m23b_127nih_31900_32546\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_69_i0_fu___float_mule8m23b_127nih_31900_32546\,
    in1(0) => \out_ui_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_31900_34026\);
  \fu___float_mule8m23b_127nih_31900_32549\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_70_i0_fu___float_mule8m23b_127nih_31900_32549\,
    in1 => \out_UUdata_converter_FU_69_i0_fu___float_mule8m23b_127nih_31900_32546\);
  \fu___float_mule8m23b_127nih_31900_32552\ : ui_plus_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>10,
    BITSIZE_out1=>10) port map (out1 => \out_ui_plus_expr_FU_16_16_16_153_i0_fu___float_mule8m23b_127nih_31900_32552\,
    in1 => unsigned(out_reg_3_reg_3),
    in2 => unsigned(out_reg_1_reg_1));
  \fu___float_mule8m23b_127nih_31900_32558\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_73_i0_fu___float_mule8m23b_127nih_31900_32558\,
    in1 => \out_lut_expr_FU_72_i0_fu___float_mule8m23b_127nih_31900_33732\);
  \fu___float_mule8m23b_127nih_31900_32561\ : UIdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>2) port map (out1 => \out_UIdata_converter_FU_74_i0_fu___float_mule8m23b_127nih_31900_32561\,
    in1 => unsigned(\out_UUdata_converter_FU_73_i0_fu___float_mule8m23b_127nih_31900_32558\));
  \fu___float_mule8m23b_127nih_31900_32564\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>2,
    BITSIZE_out1=>47,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_64_64_64_148_i0_fu___float_mule8m23b_127nih_31900_32564\,
    in1 => unsigned(out_reg_2_reg_2),
    in2 => out_reg_4_reg_4);
  \fu___float_mule8m23b_127nih_31900_32573\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>47,
    BITSIZE_out1=>47) port map (out1 => \out_ui_bit_and_expr_FU_0_64_64_127_i0_fu___float_mule8m23b_127nih_31900_32573\,
    in1 => unsigned(out_const_43),
    in2 => \out_ui_lshift_expr_FU_64_64_64_148_i0_fu___float_mule8m23b_127nih_31900_32564\);
  \fu___float_mule8m23b_127nih_31900_32576\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>2,
    BITSIZE_out1=>48,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_64_0_64_146_i0_fu___float_mule8m23b_127nih_31900_32576\,
    in1 => \out_ui_bit_and_expr_FU_0_64_64_127_i0_fu___float_mule8m23b_127nih_31900_32573\,
    in2 => out_const_1);
  \fu___float_mule8m23b_127nih_31900_32579\ : UUdata_converter_FU generic map(BITSIZE_in1=>10,
    BITSIZE_out1=>10) port map (out1 => \out_UUdata_converter_FU_75_i0_fu___float_mule8m23b_127nih_31900_32579\,
    in1 => std_logic_vector(\out_ui_plus_expr_FU_16_16_16_153_i0_fu___float_mule8m23b_127nih_31900_32552\));
  \fu___float_mule8m23b_127nih_31900_32582\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>6,
    BITSIZE_out1=>33,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_64_0_64_147_i0_fu___float_mule8m23b_127nih_31900_32582\,
    in1 => unsigned(\out_UUdata_converter_FU_75_i0_fu___float_mule8m23b_127nih_31900_32579\),
    in2 => out_const_2);
  \fu___float_mule8m23b_127nih_31900_32585\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>6,
    BITSIZE_out1=>23,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_64_0_64_159_i0_fu___float_mule8m23b_127nih_31900_32585\,
    in1 => \out_ui_lshift_expr_FU_64_0_64_146_i0_fu___float_mule8m23b_127nih_31900_32576\,
    in2 => out_const_3);
  \fu___float_mule8m23b_127nih_31900_32588\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_131_i2_fu___float_mule8m23b_127nih_31900_32588\,
    in1 => \out_ui_rshift_expr_FU_64_0_64_159_i0_fu___float_mule8m23b_127nih_31900_32585\,
    in2 => unsigned(out_const_38));
  \fu___float_mule8m23b_127nih_31900_32591\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>23,
    BITSIZE_out1=>33) port map (out1 => \out_ui_bit_ior_expr_FU_0_64_64_137_i0_fu___float_mule8m23b_127nih_31900_32591\,
    in1 => \out_ui_lshift_expr_FU_64_0_64_147_i0_fu___float_mule8m23b_127nih_31900_32582\,
    in2 => \out_ui_bit_and_expr_FU_32_0_32_131_i2_fu___float_mule8m23b_127nih_31900_32588\);
  \fu___float_mule8m23b_127nih_31900_32617\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>33,
    BITSIZE_out1=>33) port map (out1 => \out_ui_bit_and_expr_FU_0_64_64_128_i0_fu___float_mule8m23b_127nih_31900_32617\,
    in1 => unsigned(out_const_42),
    in2 => \out_ui_bit_ior_expr_FU_0_64_64_137_i0_fu___float_mule8m23b_127nih_31900_32591\);
  \fu___float_mule8m23b_127nih_31900_32673\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_131_i3_fu___float_mule8m23b_127nih_31900_32673\,
    in1 => \out_ui_rshift_expr_FU_64_0_64_160_i0_fu___float_mule8m23b_127nih_31900_33161\,
    in2 => unsigned(out_const_38));
  \fu___float_mule8m23b_127nih_31900_32676\ : ui_ne_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_ne_expr_FU_32_0_32_151_i0_fu___float_mule8m23b_127nih_31900_32676\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_156_i0_fu___float_mule8m23b_127nih_31900_33174\,
    in2 => unsigned(out_const_0));
  \fu___float_mule8m23b_127nih_31900_32688\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_80_i0_fu___float_mule8m23b_127nih_31900_32688\,
    in1 => \out_lut_expr_FU_79_i0_fu___float_mule8m23b_127nih_31900_33746\);
  \fu___float_mule8m23b_127nih_31900_32698\ : ui_plus_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>1,
    BITSIZE_out1=>33) port map (out1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in1 => \out_ui_bit_and_expr_FU_0_64_64_128_i0_fu___float_mule8m23b_127nih_31900_32617\,
    in2 => unsigned(\out_UUdata_converter_FU_80_i0_fu___float_mule8m23b_127nih_31900_32688\));
  \fu___float_mule8m23b_127nih_31900_32787\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>33,
    BITSIZE_out1=>31) port map (out1 => \out_ui_bit_and_expr_FU_0_32_32_126_i0_fu___float_mule8m23b_127nih_31900_32787\,
    in1 => unsigned(out_const_40),
    in2 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\);
  \fu___float_mule8m23b_127nih_31900_32790\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => \out_ui_bit_ior_expr_FU_0_32_32_135_i0_fu___float_mule8m23b_127nih_31900_32790\,
    in1 => \out_ui_bit_and_expr_FU_0_32_32_126_i0_fu___float_mule8m23b_127nih_31900_32787\,
    in2 => unsigned(out_reg_0_reg_0));
  \fu___float_mule8m23b_127nih_31900_32842\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => \out_ui_bit_ior_expr_FU_0_32_32_136_i0_fu___float_mule8m23b_127nih_31900_32842\,
    in1 => unsigned(out_const_34),
    in2 => \out_ui_lshift_expr_FU_32_0_32_143_i0_fu___float_mule8m23b_127nih_31900_32047\);
  \fu___float_mule8m23b_127nih_31900_32863\ : ui_ne_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_ne_expr_FU_32_0_32_152_i0_fu___float_mule8m23b_127nih_31900_32863\,
    in1 => \out_ui_bit_and_expr_FU_32_0_32_131_i1_fu___float_mule8m23b_127nih_31900_32024\,
    in2 => unsigned(out_const_0));
  \fu___float_mule8m23b_127nih_31900_32866\ : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_31900_32866\,
    in1 => out_const_6,
    in2 => \out_ui_ne_expr_FU_32_0_32_152_i0_fu___float_mule8m23b_127nih_31900_32863\(0),
    in3 => \out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_31900_35086\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_32871\ : ui_ne_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_ne_expr_FU_32_0_32_152_i1_fu___float_mule8m23b_127nih_31900_32871\,
    in1 => \out_ui_bit_and_expr_FU_32_0_32_131_i0_fu___float_mule8m23b_127nih_31900_31987\,
    in2 => unsigned(out_const_0));
  \fu___float_mule8m23b_127nih_31900_32874\ : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_31900_32874\,
    in1 => out_const_6,
    in2 => \out_ui_ne_expr_FU_32_0_32_152_i1_fu___float_mule8m23b_127nih_31900_32871\(0),
    in3 => \out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_31900_35078\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33007\ : lut_expr_FU generic map(BITSIZE_in1=>17,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_88_i0_fu___float_mule8m23b_127nih_31900_33007\,
    in1 => out_const_10,
    in2 => \out_extract_bit_expr_FU_83_i0_fu___float_mule8m23b_127nih_31900_34677\,
    in3 => \out_extract_bit_expr_FU_84_i0_fu___float_mule8m23b_127nih_31900_34680\,
    in4 => \out_ui_extract_bit_expr_FU_85_i0_fu___float_mule8m23b_127nih_31900_35027\,
    in5 => \out_extract_bit_expr_FU_86_i0_fu___float_mule8m23b_127nih_31900_34957\,
    in6 => \out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_31900_35106\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33161\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>1,
    BITSIZE_out1=>23,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_64_0_64_160_i0_fu___float_mule8m23b_127nih_31900_33161\,
    in1 => \out_ui_lshift_expr_FU_64_0_64_146_i0_fu___float_mule8m23b_127nih_31900_32576\,
    in2 => out_const_5);
  \fu___float_mule8m23b_127nih_31900_33171\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>24,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_144_i0_fu___float_mule8m23b_127nih_31900_33171\,
    in1 => \out_ui_bit_and_expr_FU_32_0_32_131_i3_fu___float_mule8m23b_127nih_31900_32673\,
    in2 => out_const_5);
  \fu___float_mule8m23b_127nih_31900_33174\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>1,
    BITSIZE_out1=>23,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_156_i0_fu___float_mule8m23b_127nih_31900_33174\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_144_i0_fu___float_mule8m23b_127nih_31900_33171\,
    in2 => out_const_5);
  \fu___float_mule8m23b_127nih_31900_33212\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>4) port map (out1 => \out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_31900_33212\,
    in1 => \out_ui_plus_expr_FU_16_16_16_153_i0_fu___float_mule8m23b_127nih_31900_32552\,
    in2 => out_const_15);
  \fu___float_mule8m23b_127nih_31900_33386\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_in3=>1,
    BITSIZE_out1=>2) port map (out1 => \out_ui_cond_expr_FU_8_8_8_8_141_i0_fu___float_mule8m23b_127nih_31900_33386\,
    in1 => \out_lut_expr_FU_33_i0_fu___float_mule8m23b_127nih_31900_32866\,
    in2 => unsigned(out_const_19),
    in3 => unsigned(out_const_0));
  \fu___float_mule8m23b_127nih_31900_33395\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_in3=>1,
    BITSIZE_out1=>2) port map (out1 => \out_ui_cond_expr_FU_8_8_8_8_141_i1_fu___float_mule8m23b_127nih_31900_33395\,
    in1 => \out_lut_expr_FU_21_i0_fu___float_mule8m23b_127nih_31900_32874\,
    in2 => unsigned(out_const_19),
    in3 => unsigned(out_const_0));
  \fu___float_mule8m23b_127nih_31900_33476\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>10,
    BITSIZE_in3=>10,
    BITSIZE_out1=>10) port map (out1 => \out_ui_cond_expr_FU_16_16_16_16_139_i0_fu___float_mule8m23b_127nih_31900_33476\,
    in1 => \out_lut_expr_FU_88_i0_fu___float_mule8m23b_127nih_31900_33007\,
    in2 => \out_ui_rshift_expr_FU_32_0_32_157_i0_fu___float_mule8m23b_127nih_31900_33485\,
    in3 => unsigned(out_const_35));
  \fu___float_mule8m23b_127nih_31900_33481\ : lut_expr_FU generic map(BITSIZE_in1=>17,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_122_i0_fu___float_mule8m23b_127nih_31900_33481\,
    in1 => out_const_36,
    in2 => \out_extract_bit_expr_FU_118_i0_fu___float_mule8m23b_127nih_31900_34771\,
    in3 => \out_extract_bit_expr_FU_119_i0_fu___float_mule8m23b_127nih_31900_34774\,
    in4 => \out_ui_extract_bit_expr_FU_120_i0_fu___float_mule8m23b_127nih_31900_35059\,
    in5 => \out_extract_bit_expr_FU_121_i0_fu___float_mule8m23b_127nih_31900_35003\,
    in6 => \out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_31900_35106\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33485\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>10,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_157_i0_fu___float_mule8m23b_127nih_31900_33485\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_143_i0_fu___float_mule8m23b_127nih_31900_32047\,
    in2 => out_const_16);
  \fu___float_mule8m23b_127nih_31900_33492\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>5,
    BITSIZE_out1=>32,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_145_i0_fu___float_mule8m23b_127nih_31900_33492\,
    in1 => \out_ui_cond_expr_FU_16_16_16_16_139_i0_fu___float_mule8m23b_127nih_31900_33476\,
    in2 => out_const_16);
  \fu___float_mule8m23b_127nih_31900_33496\ : lut_expr_FU generic map(BITSIZE_in1=>17,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_102_i0_fu___float_mule8m23b_127nih_31900_33496\,
    in1 => out_const_37,
    in2 => \out_extract_bit_expr_FU_98_i0_fu___float_mule8m23b_127nih_31900_34698\,
    in3 => \out_extract_bit_expr_FU_99_i0_fu___float_mule8m23b_127nih_31900_34701\,
    in4 => \out_ui_extract_bit_expr_FU_100_i0_fu___float_mule8m23b_127nih_31900_35035\,
    in5 => \out_extract_bit_expr_FU_101_i0_fu___float_mule8m23b_127nih_31900_34968\,
    in6 => \out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_31900_35106\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33499\ : lut_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_111_i0_fu___float_mule8m23b_127nih_31900_33499\,
    in1 => out_const_9,
    in2 => out_reg_8_reg_8(0),
    in3 => out_reg_9_reg_9(0),
    in4 => \out_lut_expr_FU_109_i0_fu___float_mule8m23b_127nih_31900_35120\(0),
    in5 => \out_lut_expr_FU_110_i0_fu___float_mule8m23b_127nih_31900_35124\(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33512\ : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_117_i0_fu___float_mule8m23b_127nih_31900_33512\,
    in1 => out_const_8,
    in2 => out_reg_8_reg_8(0),
    in3 => \out_lut_expr_FU_109_i0_fu___float_mule8m23b_127nih_31900_35120\(0),
    in4 => \out_lut_expr_FU_110_i0_fu___float_mule8m23b_127nih_31900_35124\(0),
    in5 => out_reg_10_reg_10(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33515\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>32,
    BITSIZE_out1=>32) port map (out1 => \out_ui_cond_expr_FU_32_32_32_32_140_i0_fu___float_mule8m23b_127nih_31900_33515\,
    in1 => \out_lut_expr_FU_117_i0_fu___float_mule8m23b_127nih_31900_33512\,
    in2 => \out_ui_bit_ior_expr_FU_0_32_32_135_i0_fu___float_mule8m23b_127nih_31900_32790\,
    in3 => unsigned(out_reg_0_reg_0));
  \fu___float_mule8m23b_127nih_31900_33521\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1,
    BITSIZE_in3=>2,
    BITSIZE_out1=>2) port map (out1 => \out_ui_cond_expr_FU_8_8_8_8_141_i2_fu___float_mule8m23b_127nih_31900_33521\,
    in1 => \out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_31900_32163\,
    in2 => unsigned(out_const_0),
    in3 => \out_ui_cond_expr_FU_8_8_8_8_141_i0_fu___float_mule8m23b_127nih_31900_33386\);
  \fu___float_mule8m23b_127nih_31900_33527\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1,
    BITSIZE_in3=>2,
    BITSIZE_out1=>2) port map (out1 => \out_ui_cond_expr_FU_8_8_8_8_141_i3_fu___float_mule8m23b_127nih_31900_33527\,
    in1 => \out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_31900_32087\,
    in2 => unsigned(out_const_0),
    in3 => \out_ui_cond_expr_FU_8_8_8_8_141_i1_fu___float_mule8m23b_127nih_31900_33395\);
  \fu___float_mule8m23b_127nih_31900_33530\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>10,
    BITSIZE_in3=>10,
    BITSIZE_out1=>10) port map (out1 => \out_ui_cond_expr_FU_16_16_16_16_139_i1_fu___float_mule8m23b_127nih_31900_33530\,
    in1 => \out_lut_expr_FU_122_i0_fu___float_mule8m23b_127nih_31900_33481\,
    in2 => \out_ui_rshift_expr_FU_32_0_32_158_i0_fu___float_mule8m23b_127nih_31900_33544\,
    in3 => \out_ui_rshift_expr_FU_32_0_32_157_i1_fu___float_mule8m23b_127nih_31900_33547\);
  \fu___float_mule8m23b_127nih_31900_33533\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>32,
    BITSIZE_out1=>32) port map (out1 => \out_ui_cond_expr_FU_32_32_32_32_140_i1_fu___float_mule8m23b_127nih_31900_33533\,
    in1 => \out_lut_expr_FU_111_i0_fu___float_mule8m23b_127nih_31900_33499\,
    in2 => unsigned(out_reg_5_reg_5),
    in3 => \out_ui_cond_expr_FU_32_32_32_32_140_i0_fu___float_mule8m23b_127nih_31900_33515\);
  \fu___float_mule8m23b_127nih_31900_33537\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1,
    BITSIZE_out1=>2,
    PRECISION=>8) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i0_fu___float_mule8m23b_127nih_31900_33537\,
    in1 => unsigned(\out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_31900_33554\),
    in2 => out_const_5);
  \fu___float_mule8m23b_127nih_31900_33541\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1,
    BITSIZE_out1=>2,
    PRECISION=>8) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i1_fu___float_mule8m23b_127nih_31900_33541\,
    in1 => unsigned(\out_UUdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_31900_33557\),
    in2 => out_const_5);
  \fu___float_mule8m23b_127nih_31900_33544\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>10,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_158_i0_fu___float_mule8m23b_127nih_31900_33544\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_145_i0_fu___float_mule8m23b_127nih_31900_33492\,
    in2 => out_const_16);
  \fu___float_mule8m23b_127nih_31900_33547\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>10,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_157_i1_fu___float_mule8m23b_127nih_31900_33547\,
    in1 => \out_ui_bit_ior_expr_FU_0_32_32_136_i0_fu___float_mule8m23b_127nih_31900_32842\,
    in2 => out_const_16);
  \fu___float_mule8m23b_127nih_31900_33551\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>5,
    BITSIZE_out1=>32,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_145_i1_fu___float_mule8m23b_127nih_31900_33551\,
    in1 => \out_ui_cond_expr_FU_16_16_16_16_139_i1_fu___float_mule8m23b_127nih_31900_33530\,
    in2 => out_const_16);
  \fu___float_mule8m23b_127nih_31900_33554\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_31900_33554\,
    in1 => \out_lut_expr_FU_20_i0_fu___float_mule8m23b_127nih_31900_32087\);
  \fu___float_mule8m23b_127nih_31900_33557\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_51_i0_fu___float_mule8m23b_127nih_31900_33557\,
    in1 => \out_lut_expr_FU_32_i0_fu___float_mule8m23b_127nih_31900_32163\);
  \fu___float_mule8m23b_127nih_31900_33559\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>32,
    BITSIZE_out1=>32) port map (out1 => \out_ui_cond_expr_FU_32_32_32_32_140_i2_fu___float_mule8m23b_127nih_31900_33559\,
    in1 => out_reg_6_reg_6,
    in2 => unsigned(out_reg_7_reg_7),
    in3 => \out_ui_cond_expr_FU_32_32_32_32_140_i1_fu___float_mule8m23b_127nih_31900_33533\);
  \fu___float_mule8m23b_127nih_31900_33561\ : ASSIGN_UNSIGNED_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>8) port map (out1 => \out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_31900_33561\,
    in1 => unsigned(\out_UUdata_converter_FU_2_i0_fu___float_mule8m23b_127nih_31900_32007\));
  \fu___float_mule8m23b_127nih_31900_33563\ : ASSIGN_UNSIGNED_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>8) port map (out1 => \out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_31900_33563\,
    in1 => unsigned(\out_UUdata_converter_FU_4_i0_fu___float_mule8m23b_127nih_31900_32021\));
  \fu___float_mule8m23b_127nih_31900_33679\ : lut_expr_FU generic map(BITSIZE_in1=>61,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_48_i0_fu___float_mule8m23b_127nih_31900_33679\,
    in1 => out_const_14,
    in2 => \out_ui_eq_expr_FU_32_0_32_142_i0_fu___float_mule8m23b_127nih_31900_32067\(0),
    in3 => \out_ui_ne_expr_FU_32_0_32_152_i1_fu___float_mule8m23b_127nih_31900_32871\(0),
    in4 => \out_ui_extract_bit_expr_FU_39_i0_fu___float_mule8m23b_127nih_31900_34568\,
    in5 => \out_ui_extract_bit_expr_FU_40_i0_fu___float_mule8m23b_127nih_31900_34572\,
    in6 => \out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_31900_35078\(0),
    in7 => \out_lut_expr_FU_43_i0_fu___float_mule8m23b_127nih_31900_35091\(0),
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33725\ : lut_expr_FU generic map(BITSIZE_in1=>61,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_65_i0_fu___float_mule8m23b_127nih_31900_33725\,
    in1 => out_const_14,
    in2 => \out_ui_eq_expr_FU_32_0_32_142_i1_fu___float_mule8m23b_127nih_31900_32151\(0),
    in3 => \out_ui_ne_expr_FU_32_0_32_152_i0_fu___float_mule8m23b_127nih_31900_32863\(0),
    in4 => \out_ui_extract_bit_expr_FU_56_i0_fu___float_mule8m23b_127nih_31900_34616\,
    in5 => \out_ui_extract_bit_expr_FU_57_i0_fu___float_mule8m23b_127nih_31900_34620\,
    in6 => \out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_31900_35086\(0),
    in7 => \out_lut_expr_FU_60_i0_fu___float_mule8m23b_127nih_31900_35098\(0),
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33732\ : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_72_i0_fu___float_mule8m23b_127nih_31900_33732\,
    in1 => out_const_5,
    in2 => \out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_31900_34030\,
    in3 => '0',
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33746\ : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_79_i0_fu___float_mule8m23b_127nih_31900_33746\,
    in1 => out_const_26,
    in2 => \out_ui_ne_expr_FU_32_0_32_151_i0_fu___float_mule8m23b_127nih_31900_32676\(0),
    in3 => \out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_31900_34842\,
    in4 => \out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_31900_34666\,
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33842\ : lut_expr_FU generic map(BITSIZE_in1=>12,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_44_i0_fu___float_mule8m23b_127nih_31900_33842\,
    in1 => out_const_28,
    in2 => \out_ui_extract_bit_expr_FU_39_i0_fu___float_mule8m23b_127nih_31900_34568\,
    in3 => \out_ui_extract_bit_expr_FU_40_i0_fu___float_mule8m23b_127nih_31900_34572\,
    in4 => \out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_31900_35078\(0),
    in5 => \out_lut_expr_FU_43_i0_fu___float_mule8m23b_127nih_31900_35091\(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33846\ : lut_expr_FU generic map(BITSIZE_in1=>12,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_61_i0_fu___float_mule8m23b_127nih_31900_33846\,
    in1 => out_const_28,
    in2 => \out_ui_extract_bit_expr_FU_56_i0_fu___float_mule8m23b_127nih_31900_34616\,
    in3 => \out_ui_extract_bit_expr_FU_57_i0_fu___float_mule8m23b_127nih_31900_34620\,
    in4 => \out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_31900_35086\(0),
    in5 => \out_lut_expr_FU_60_i0_fu___float_mule8m23b_127nih_31900_35098\(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_33859\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_6_i0_fu___float_mule8m23b_127nih_31900_33859\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_32);
  \fu___float_mule8m23b_127nih_31900_33863\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_7_i0_fu___float_mule8m23b_127nih_31900_33863\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_32);
  \fu___float_mule8m23b_127nih_31900_34026\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>6) port map (out1 => \out_ui_extract_bit_expr_FU_68_i0_fu___float_mule8m23b_127nih_31900_34026\,
    in1 => \out_ui_mult_expr_FU_32_32_32_0_150_i0_fu___float_mule8m23b_127nih_31900_32367\,
    in2 => out_const_18);
  \fu___float_mule8m23b_127nih_31900_34030\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>6) port map (out1 => \out_ui_extract_bit_expr_FU_71_i0_fu___float_mule8m23b_127nih_31900_34030\,
    in1 => \out_ui_mult_expr_FU_32_32_32_0_150_i0_fu___float_mule8m23b_127nih_31900_32367\,
    in2 => out_const_18);
  \fu___float_mule8m23b_127nih_31900_34049\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>6) port map (out1 => \out_ui_extract_bit_expr_FU_82_i0_fu___float_mule8m23b_127nih_31900_34049\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_7);
  \fu___float_mule8m23b_127nih_31900_34095\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_97_i0_fu___float_mule8m23b_127nih_31900_34095\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_32);
  \fu___float_mule8m23b_127nih_31900_34365\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_89_i0_fu___float_mule8m23b_127nih_31900_34365\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_17);
  \fu___float_mule8m23b_127nih_31900_34369\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_90_i0_fu___float_mule8m23b_127nih_31900_34369\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_21);
  \fu___float_mule8m23b_127nih_31900_34373\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_91_i0_fu___float_mule8m23b_127nih_31900_34373\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_22);
  \fu___float_mule8m23b_127nih_31900_34378\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_92_i0_fu___float_mule8m23b_127nih_31900_34378\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_23);
  \fu___float_mule8m23b_127nih_31900_34383\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_93_i0_fu___float_mule8m23b_127nih_31900_34383\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_24);
  \fu___float_mule8m23b_127nih_31900_34388\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_94_i0_fu___float_mule8m23b_127nih_31900_34388\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_25);
  \fu___float_mule8m23b_127nih_31900_34393\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_95_i0_fu___float_mule8m23b_127nih_31900_34393\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_30);
  \fu___float_mule8m23b_127nih_31900_34398\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_96_i0_fu___float_mule8m23b_127nih_31900_34398\,
    in1 => \out_ui_plus_expr_FU_32_32_32_154_i0_fu___float_mule8m23b_127nih_31900_32698\,
    in2 => out_const_31);
  \fu___float_mule8m23b_127nih_31900_34488\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_31900_34488\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_17);
  \fu___float_mule8m23b_127nih_31900_34492\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_31900_34492\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_21);
  \fu___float_mule8m23b_127nih_31900_34496\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_31900_34496\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_22);
  \fu___float_mule8m23b_127nih_31900_34500\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_31900_34500\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_23);
  \fu___float_mule8m23b_127nih_31900_34504\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_31900_34504\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_24);
  \fu___float_mule8m23b_127nih_31900_34508\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_31900_34508\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_25);
  \fu___float_mule8m23b_127nih_31900_34512\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_31900_34512\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_30);
  \fu___float_mule8m23b_127nih_31900_34516\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_31900_34516\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_31);
  \fu___float_mule8m23b_127nih_31900_34520\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_31900_34520\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_17);
  \fu___float_mule8m23b_127nih_31900_34524\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_31900_34524\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_21);
  \fu___float_mule8m23b_127nih_31900_34528\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_31900_34528\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_22);
  \fu___float_mule8m23b_127nih_31900_34532\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_31900_34532\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_23);
  \fu___float_mule8m23b_127nih_31900_34536\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_31900_34536\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_24);
  \fu___float_mule8m23b_127nih_31900_34540\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_31900_34540\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_25);
  \fu___float_mule8m23b_127nih_31900_34544\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_31900_34544\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_30);
  \fu___float_mule8m23b_127nih_31900_34548\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_31900_34548\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_31);
  \fu___float_mule8m23b_127nih_31900_34552\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_35_i0_fu___float_mule8m23b_127nih_31900_34552\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_24);
  \fu___float_mule8m23b_127nih_31900_34556\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_36_i0_fu___float_mule8m23b_127nih_31900_34556\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_25);
  \fu___float_mule8m23b_127nih_31900_34560\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_37_i0_fu___float_mule8m23b_127nih_31900_34560\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_30);
  \fu___float_mule8m23b_127nih_31900_34564\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_38_i0_fu___float_mule8m23b_127nih_31900_34564\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_31);
  \fu___float_mule8m23b_127nih_31900_34568\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_39_i0_fu___float_mule8m23b_127nih_31900_34568\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_17);
  \fu___float_mule8m23b_127nih_31900_34572\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_40_i0_fu___float_mule8m23b_127nih_31900_34572\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_21);
  \fu___float_mule8m23b_127nih_31900_34576\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_41_i0_fu___float_mule8m23b_127nih_31900_34576\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_22);
  \fu___float_mule8m23b_127nih_31900_34580\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_42_i0_fu___float_mule8m23b_127nih_31900_34580\,
    in1 => unsigned(out_conv_in_port_a_64_32),
    in2 => out_const_23);
  \fu___float_mule8m23b_127nih_31900_34600\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_31900_34600\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_24);
  \fu___float_mule8m23b_127nih_31900_34604\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_53_i0_fu___float_mule8m23b_127nih_31900_34604\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_25);
  \fu___float_mule8m23b_127nih_31900_34608\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_54_i0_fu___float_mule8m23b_127nih_31900_34608\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_30);
  \fu___float_mule8m23b_127nih_31900_34612\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_55_i0_fu___float_mule8m23b_127nih_31900_34612\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_31);
  \fu___float_mule8m23b_127nih_31900_34616\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_56_i0_fu___float_mule8m23b_127nih_31900_34616\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_17);
  \fu___float_mule8m23b_127nih_31900_34620\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_57_i0_fu___float_mule8m23b_127nih_31900_34620\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_21);
  \fu___float_mule8m23b_127nih_31900_34624\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_58_i0_fu___float_mule8m23b_127nih_31900_34624\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_22);
  \fu___float_mule8m23b_127nih_31900_34628\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_31900_34628\,
    in1 => unsigned(out_conv_in_port_b_64_32),
    in2 => out_const_23);
  \fu___float_mule8m23b_127nih_31900_34666\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_31900_34666\,
    in1 => \out_ui_lshift_expr_FU_64_64_64_148_i0_fu___float_mule8m23b_127nih_31900_32564\,
    in2 => out_const_17);
  \fu___float_mule8m23b_127nih_31900_34677\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_83_i0_fu___float_mule8m23b_127nih_31900_34677\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i1_fu___float_mule8m23b_127nih_31900_32281\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34680\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_84_i0_fu___float_mule8m23b_127nih_31900_34680\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i2_fu___float_mule8m23b_127nih_31900_32296\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34698\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_98_i0_fu___float_mule8m23b_127nih_31900_34698\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i1_fu___float_mule8m23b_127nih_31900_32281\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34701\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_99_i0_fu___float_mule8m23b_127nih_31900_34701\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i2_fu___float_mule8m23b_127nih_31900_32296\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34719\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_103_i0_fu___float_mule8m23b_127nih_31900_34719\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i1_fu___float_mule8m23b_127nih_31900_32281\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34722\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_104_i0_fu___float_mule8m23b_127nih_31900_34722\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i2_fu___float_mule8m23b_127nih_31900_32296\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34745\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_112_i0_fu___float_mule8m23b_127nih_31900_34745\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i1_fu___float_mule8m23b_127nih_31900_32281\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34748\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_113_i0_fu___float_mule8m23b_127nih_31900_34748\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i2_fu___float_mule8m23b_127nih_31900_32296\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34771\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_118_i0_fu___float_mule8m23b_127nih_31900_34771\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i1_fu___float_mule8m23b_127nih_31900_32281\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34774\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_119_i0_fu___float_mule8m23b_127nih_31900_34774\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i2_fu___float_mule8m23b_127nih_31900_32296\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34842\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>5) port map (out1 => \out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_31900_34842\,
    in1 => \out_ui_lshift_expr_FU_64_64_64_148_i0_fu___float_mule8m23b_127nih_31900_32564\,
    in2 => out_const_21);
  \fu___float_mule8m23b_127nih_31900_34950\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>4) port map (out1 => \out_ui_extract_bit_expr_FU_81_i0_fu___float_mule8m23b_127nih_31900_34950\,
    in1 => \out_ui_plus_expr_FU_16_16_16_153_i0_fu___float_mule8m23b_127nih_31900_32552\,
    in2 => out_const_15);
  \fu___float_mule8m23b_127nih_31900_34957\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_86_i0_fu___float_mule8m23b_127nih_31900_34957\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i0_fu___float_mule8m23b_127nih_31900_32254\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34968\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_101_i0_fu___float_mule8m23b_127nih_31900_34968\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i0_fu___float_mule8m23b_127nih_31900_32254\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34979\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_106_i0_fu___float_mule8m23b_127nih_31900_34979\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i0_fu___float_mule8m23b_127nih_31900_32254\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_34991\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_115_i0_fu___float_mule8m23b_127nih_31900_34991\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i0_fu___float_mule8m23b_127nih_31900_32254\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_35003\ : extract_bit_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_121_i0_fu___float_mule8m23b_127nih_31900_35003\,
    in1 => \out_bit_and_expr_FU_8_8_8_124_i0_fu___float_mule8m23b_127nih_31900_32254\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_35027\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1) port map (out1 => \out_ui_extract_bit_expr_FU_85_i0_fu___float_mule8m23b_127nih_31900_35027\,
    in1 => \out_ui_bit_and_expr_FU_1_1_1_130_i0_fu___float_mule8m23b_127nih_31900_32236\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_35035\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1) port map (out1 => \out_ui_extract_bit_expr_FU_100_i0_fu___float_mule8m23b_127nih_31900_35035\,
    in1 => \out_ui_bit_and_expr_FU_1_1_1_130_i0_fu___float_mule8m23b_127nih_31900_32236\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_35043\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1) port map (out1 => \out_ui_extract_bit_expr_FU_105_i0_fu___float_mule8m23b_127nih_31900_35043\,
    in1 => \out_ui_bit_and_expr_FU_1_1_1_130_i0_fu___float_mule8m23b_127nih_31900_32236\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_35051\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1) port map (out1 => \out_ui_extract_bit_expr_FU_114_i0_fu___float_mule8m23b_127nih_31900_35051\,
    in1 => \out_ui_bit_and_expr_FU_1_1_1_130_i0_fu___float_mule8m23b_127nih_31900_32236\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_35059\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1) port map (out1 => \out_ui_extract_bit_expr_FU_120_i0_fu___float_mule8m23b_127nih_31900_35059\,
    in1 => \out_ui_bit_and_expr_FU_1_1_1_130_i0_fu___float_mule8m23b_127nih_31900_32236\,
    in2 => out_const_0);
  \fu___float_mule8m23b_127nih_31900_35074\ : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_31900_35074\,
    in1 => out_const_12,
    in2 => \out_ui_extract_bit_expr_FU_10_i0_fu___float_mule8m23b_127nih_31900_34488\,
    in3 => \out_ui_extract_bit_expr_FU_11_i0_fu___float_mule8m23b_127nih_31900_34492\,
    in4 => \out_ui_extract_bit_expr_FU_12_i0_fu___float_mule8m23b_127nih_31900_34496\,
    in5 => \out_ui_extract_bit_expr_FU_13_i0_fu___float_mule8m23b_127nih_31900_34500\,
    in6 => \out_ui_extract_bit_expr_FU_16_i0_fu___float_mule8m23b_127nih_31900_34512\,
    in7 => \out_ui_extract_bit_expr_FU_17_i0_fu___float_mule8m23b_127nih_31900_34516\,
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35078\ : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_31900_35078\,
    in1 => out_const_8,
    in2 => \out_ui_extract_bit_expr_FU_14_i0_fu___float_mule8m23b_127nih_31900_34504\,
    in3 => \out_ui_extract_bit_expr_FU_15_i0_fu___float_mule8m23b_127nih_31900_34508\,
    in4 => \out_lut_expr_FU_18_i0_fu___float_mule8m23b_127nih_31900_35074\(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35083\ : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_31900_35083\,
    in1 => out_const_12,
    in2 => \out_ui_extract_bit_expr_FU_22_i0_fu___float_mule8m23b_127nih_31900_34520\,
    in3 => \out_ui_extract_bit_expr_FU_23_i0_fu___float_mule8m23b_127nih_31900_34524\,
    in4 => \out_ui_extract_bit_expr_FU_24_i0_fu___float_mule8m23b_127nih_31900_34528\,
    in5 => \out_ui_extract_bit_expr_FU_25_i0_fu___float_mule8m23b_127nih_31900_34532\,
    in6 => \out_ui_extract_bit_expr_FU_28_i0_fu___float_mule8m23b_127nih_31900_34544\,
    in7 => \out_ui_extract_bit_expr_FU_29_i0_fu___float_mule8m23b_127nih_31900_34548\,
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35086\ : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_31900_35086\,
    in1 => out_const_8,
    in2 => \out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_31900_34536\,
    in3 => \out_ui_extract_bit_expr_FU_27_i0_fu___float_mule8m23b_127nih_31900_34540\,
    in4 => \out_lut_expr_FU_30_i0_fu___float_mule8m23b_127nih_31900_35083\(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35091\ : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_43_i0_fu___float_mule8m23b_127nih_31900_35091\,
    in1 => out_const_5,
    in2 => \out_ui_extract_bit_expr_FU_35_i0_fu___float_mule8m23b_127nih_31900_34552\,
    in3 => \out_ui_extract_bit_expr_FU_36_i0_fu___float_mule8m23b_127nih_31900_34556\,
    in4 => \out_ui_extract_bit_expr_FU_37_i0_fu___float_mule8m23b_127nih_31900_34560\,
    in5 => \out_ui_extract_bit_expr_FU_38_i0_fu___float_mule8m23b_127nih_31900_34564\,
    in6 => \out_ui_extract_bit_expr_FU_41_i0_fu___float_mule8m23b_127nih_31900_34576\,
    in7 => \out_ui_extract_bit_expr_FU_42_i0_fu___float_mule8m23b_127nih_31900_34580\,
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35098\ : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_60_i0_fu___float_mule8m23b_127nih_31900_35098\,
    in1 => out_const_5,
    in2 => \out_ui_extract_bit_expr_FU_52_i0_fu___float_mule8m23b_127nih_31900_34600\,
    in3 => \out_ui_extract_bit_expr_FU_53_i0_fu___float_mule8m23b_127nih_31900_34604\,
    in4 => \out_ui_extract_bit_expr_FU_54_i0_fu___float_mule8m23b_127nih_31900_34608\,
    in5 => \out_ui_extract_bit_expr_FU_55_i0_fu___float_mule8m23b_127nih_31900_34612\,
    in6 => \out_ui_extract_bit_expr_FU_58_i0_fu___float_mule8m23b_127nih_31900_34624\,
    in7 => \out_ui_extract_bit_expr_FU_59_i0_fu___float_mule8m23b_127nih_31900_34628\,
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35106\ : lut_expr_FU generic map(BITSIZE_in1=>49,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_31900_35106\,
    in1 => out_const_13,
    in2 => \out_ui_eq_expr_FU_32_0_32_142_i0_fu___float_mule8m23b_127nih_31900_32067\(0),
    in3 => \out_ui_ne_expr_FU_32_0_32_152_i1_fu___float_mule8m23b_127nih_31900_32871\(0),
    in4 => \out_ui_eq_expr_FU_32_0_32_142_i1_fu___float_mule8m23b_127nih_31900_32151\(0),
    in5 => \out_ui_ne_expr_FU_32_0_32_152_i0_fu___float_mule8m23b_127nih_31900_32863\(0),
    in6 => \out_lut_expr_FU_19_i0_fu___float_mule8m23b_127nih_31900_35078\(0),
    in7 => \out_lut_expr_FU_31_i0_fu___float_mule8m23b_127nih_31900_35086\(0),
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35113\ : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_107_i0_fu___float_mule8m23b_127nih_31900_35113\,
    in1 => out_const_5,
    in2 => \out_extract_bit_expr_FU_103_i0_fu___float_mule8m23b_127nih_31900_34719\,
    in3 => \out_extract_bit_expr_FU_104_i0_fu___float_mule8m23b_127nih_31900_34722\,
    in4 => \out_ui_extract_bit_expr_FU_105_i0_fu___float_mule8m23b_127nih_31900_35043\,
    in5 => \out_extract_bit_expr_FU_106_i0_fu___float_mule8m23b_127nih_31900_34979\,
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35116\ : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_108_i0_fu___float_mule8m23b_127nih_31900_35116\,
    in1 => out_const_12,
    in2 => \out_ui_extract_bit_expr_FU_89_i0_fu___float_mule8m23b_127nih_31900_34365\,
    in3 => \out_ui_extract_bit_expr_FU_90_i0_fu___float_mule8m23b_127nih_31900_34369\,
    in4 => \out_ui_extract_bit_expr_FU_91_i0_fu___float_mule8m23b_127nih_31900_34373\,
    in5 => \out_ui_extract_bit_expr_FU_92_i0_fu___float_mule8m23b_127nih_31900_34378\,
    in6 => \out_ui_extract_bit_expr_FU_95_i0_fu___float_mule8m23b_127nih_31900_34393\,
    in7 => \out_ui_extract_bit_expr_FU_96_i0_fu___float_mule8m23b_127nih_31900_34398\,
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35120\ : lut_expr_FU generic map(BITSIZE_in1=>11,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_109_i0_fu___float_mule8m23b_127nih_31900_35120\,
    in1 => out_const_29,
    in2 => \out_ui_extract_bit_expr_FU_93_i0_fu___float_mule8m23b_127nih_31900_34383\,
    in3 => \out_ui_extract_bit_expr_FU_94_i0_fu___float_mule8m23b_127nih_31900_34388\,
    in4 => \out_ui_extract_bit_expr_FU_97_i0_fu___float_mule8m23b_127nih_31900_34095\,
    in5 => \out_lut_expr_FU_108_i0_fu___float_mule8m23b_127nih_31900_35116\(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35124\ : lut_expr_FU generic map(BITSIZE_in1=>56,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_110_i0_fu___float_mule8m23b_127nih_31900_35124\,
    in1 => out_const_27,
    in2 => \out_ui_ne_expr_FU_32_0_32_151_i0_fu___float_mule8m23b_127nih_31900_32676\(0),
    in3 => \out_ui_extract_bit_expr_FU_77_i0_fu___float_mule8m23b_127nih_31900_34842\,
    in4 => \out_ui_extract_bit_expr_FU_78_i0_fu___float_mule8m23b_127nih_31900_34666\,
    in5 => \out_ui_extract_bit_expr_FU_81_i0_fu___float_mule8m23b_127nih_31900_34950\,
    in6 => \out_ui_extract_bit_expr_FU_82_i0_fu___float_mule8m23b_127nih_31900_34049\,
    in7 => \out_ui_extract_bit_expr_FU_76_i0_fu___float_mule8m23b_127nih_31900_33212\,
    in8 => '0',
    in9 => '0');
  \fu___float_mule8m23b_127nih_31900_35129\ : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_116_i0_fu___float_mule8m23b_127nih_31900_35129\,
    in1 => out_const_5,
    in2 => \out_extract_bit_expr_FU_112_i0_fu___float_mule8m23b_127nih_31900_34745\,
    in3 => \out_extract_bit_expr_FU_113_i0_fu___float_mule8m23b_127nih_31900_34748\,
    in4 => \out_ui_extract_bit_expr_FU_114_i0_fu___float_mule8m23b_127nih_31900_35051\,
    in5 => \out_extract_bit_expr_FU_115_i0_fu___float_mule8m23b_127nih_31900_34991\,
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  reg_0 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_0_reg_0,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_lshift_expr_FU_32_0_32_143_i0_fu___float_mule8m23b_127nih_31900_32047\),
    wenable => wrenable_reg_0);
  reg_1 : register_STD generic map(BITSIZE_in1=>10,
    BITSIZE_out1=>10) port map (out1 => out_reg_1_reg_1,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_ternary_plus_expr_FU_0_16_16_16_162_i0_fu___float_mule8m23b_127nih_31900_32323\),
    wenable => wrenable_reg_1);
  reg_10 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_10_reg_10,
    clock => clock,
    reset => reset,
    in1 => \out_lut_expr_FU_116_i0_fu___float_mule8m23b_127nih_31900_35129\,
    wenable => wrenable_reg_10);
  reg_2 : register_STD generic map(BITSIZE_in1=>48,
    BITSIZE_out1=>48) port map (out1 => out_reg_2_reg_2,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_mult_expr_FU_32_32_32_0_150_i0_fu___float_mule8m23b_127nih_31900_32367\),
    wenable => wrenable_reg_2);
  reg_3 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_3_reg_3,
    clock => clock,
    reset => reset,
    in1 => \out_UUdata_converter_FU_70_i0_fu___float_mule8m23b_127nih_31900_32549\,
    wenable => wrenable_reg_3);
  reg_4 : register_STD generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>2) port map (out1 => out_reg_4_reg_4,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_UIdata_converter_FU_74_i0_fu___float_mule8m23b_127nih_31900_32561\),
    wenable => wrenable_reg_4);
  reg_5 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_5_reg_5,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_bit_ior_expr_FU_0_32_32_136_i0_fu___float_mule8m23b_127nih_31900_32842\),
    wenable => wrenable_reg_5);
  reg_6 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_6_reg_6,
    clock => clock,
    reset => reset,
    in1 => \out_lut_expr_FU_102_i0_fu___float_mule8m23b_127nih_31900_33496\,
    wenable => wrenable_reg_6);
  reg_7 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_7_reg_7,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_lshift_expr_FU_32_0_32_145_i1_fu___float_mule8m23b_127nih_31900_33551\),
    wenable => wrenable_reg_7);
  reg_8 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_8_reg_8,
    clock => clock,
    reset => reset,
    in1 => \out_lut_expr_FU_87_i0_fu___float_mule8m23b_127nih_31900_35106\,
    wenable => wrenable_reg_8);
  reg_9 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_9_reg_9,
    clock => clock,
    reset => reset,
    in1 => \out_lut_expr_FU_107_i0_fu___float_mule8m23b_127nih_31900_35113\,
    wenable => wrenable_reg_9);
  -- io-signal post fix
  return_port <= unsigned(\out_conv_out_ui_cond_expr_FU_32_32_32_32_140_i2_fu___float_mule8m23b_127nih_31900_33559_32_64\);

end \datapath___float_mule8m23b_127nih_arch\;

-- FSM based controller description for __float_mule8m23b_127nih
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity \controller___float_mule8m23b_127nih\ is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  wrenable_reg_0 : out std_logic;
  wrenable_reg_1 : out std_logic;
  wrenable_reg_10 : out std_logic;
  wrenable_reg_2 : out std_logic;
  wrenable_reg_3 : out std_logic;
  wrenable_reg_4 : out std_logic;
  wrenable_reg_5 : out std_logic;
  wrenable_reg_6 : out std_logic;
  wrenable_reg_7 : out std_logic;
  wrenable_reg_8 : out std_logic;
  wrenable_reg_9 : out std_logic

);
end \controller___float_mule8m23b_127nih\;

architecture \controller___float_mule8m23b_127nih_arch\ of \controller___float_mule8m23b_127nih\ is
  -- define the states of FSM model
  constant S_0: std_logic_vector(2 downto 0) := "001";
  constant S_1: std_logic_vector(2 downto 0) := "010";
  constant S_2: std_logic_vector(2 downto 0) := "100";
  signal present_state : std_logic_vector(2 downto 0) := S_0;
  signal next_state : std_logic_vector(2 downto 0);
begin
  -- concurrent process#1: state registers
  state_reg: process(clock)
  begin
    if (clock'event and clock='1') then
      if (reset='0') then
        present_state <= S_0;
      else
        present_state <= next_state;
      end if;
    end if;
  end process;
  -- concurrent process#0: combinational logic
  comb_logic0: process(present_state, start_port)
  begin
    done_port <= '0';
    wrenable_reg_0 <= '0';
    wrenable_reg_1 <= '0';
    wrenable_reg_10 <= '0';
    wrenable_reg_2 <= '0';
    wrenable_reg_3 <= '0';
    wrenable_reg_4 <= '0';
    wrenable_reg_5 <= '0';
    wrenable_reg_6 <= '0';
    wrenable_reg_7 <= '0';
    wrenable_reg_8 <= '0';
    wrenable_reg_9 <= '0';
    next_state <= S_0;
    case present_state is
      when S_0 =>
        if(start_port /= '1') then
          wrenable_reg_0 <= 'X';
          wrenable_reg_1 <= 'X';
          wrenable_reg_10 <= 'X';
          wrenable_reg_2 <= 'X';
          wrenable_reg_3 <= 'X';
          wrenable_reg_4 <= 'X';
          wrenable_reg_5 <= 'X';
          wrenable_reg_6 <= 'X';
          wrenable_reg_7 <= 'X';
          wrenable_reg_8 <= 'X';
          wrenable_reg_9 <= 'X';
          next_state <= S_0;
        else
          next_state <= S_1;
        end if;
      when S_1 =>
        wrenable_reg_0 <= '1';
        wrenable_reg_1 <= '1';
        wrenable_reg_10 <= '1';
        wrenable_reg_2 <= '1';
        wrenable_reg_3 <= '1';
        wrenable_reg_4 <= '1';
        wrenable_reg_5 <= '1';
        wrenable_reg_6 <= '1';
        wrenable_reg_7 <= '1';
        wrenable_reg_8 <= '1';
        wrenable_reg_9 <= '1';
        next_state <= S_2;
        done_port <= '1';
      when S_2 =>
        next_state <= S_0;
      when others =>
        wrenable_reg_0 <= 'X';
        wrenable_reg_1 <= 'X';
        wrenable_reg_10 <= 'X';
        wrenable_reg_2 <= 'X';
        wrenable_reg_3 <= 'X';
        wrenable_reg_4 <= 'X';
        wrenable_reg_5 <= 'X';
        wrenable_reg_6 <= 'X';
        wrenable_reg_7 <= 'X';
        wrenable_reg_8 <= 'X';
        wrenable_reg_9 <= 'X';
    end case;
  end process;

end \controller___float_mule8m23b_127nih_arch\;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Marco Lattuada <marco.lattuada@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity flipflop_AR is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in1 : in std_logic;
  -- OUT
  out1 : out std_logic

);
end flipflop_AR;

architecture flipflop_AR_arch of flipflop_AR is
  
  signal reg_out1 : std_logic := '0';
  begin
    process(clock,reset)
    begin
      if(reset = '0') then
        reg_out1 <= '0';
      elsif(clock'event and clock = '1') then
        reg_out1 <= in1;
      end if;
    end process;
    out1 <= reg_out1;

end flipflop_AR_arch;

-- Top component for __float_mule8m23b_127nih
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity \__float_mule8m23b_127nih\ is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  a : in unsigned (63 downto 0);
  b : in unsigned (63 downto 0);
  -- OUT
  done_port : out std_logic;
  return_port : out unsigned (63 downto 0)

);
end \__float_mule8m23b_127nih\;

architecture \__float_mule8m23b_127nih_arch\ of \__float_mule8m23b_127nih\ is
  -- Component and signal declarations
  
  component \datapath___float_mule8m23b_127nih\
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in_port_a : in unsigned (63 downto 0);
    in_port_b : in unsigned (63 downto 0);
    wrenable_reg_0 : in std_logic;
    wrenable_reg_1 : in std_logic;
    wrenable_reg_10 : in std_logic;
    wrenable_reg_2 : in std_logic;
    wrenable_reg_3 : in std_logic;
    wrenable_reg_4 : in std_logic;
    wrenable_reg_5 : in std_logic;
    wrenable_reg_6 : in std_logic;
    wrenable_reg_7 : in std_logic;
    wrenable_reg_8 : in std_logic;
    wrenable_reg_9 : in std_logic;
    -- OUT
    return_port : out unsigned (63 downto 0)
  
  );
  end component;
  
  component \controller___float_mule8m23b_127nih\
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    wrenable_reg_0 : out std_logic;
    wrenable_reg_1 : out std_logic;
    wrenable_reg_10 : out std_logic;
    wrenable_reg_2 : out std_logic;
    wrenable_reg_3 : out std_logic;
    wrenable_reg_4 : out std_logic;
    wrenable_reg_5 : out std_logic;
    wrenable_reg_6 : out std_logic;
    wrenable_reg_7 : out std_logic;
    wrenable_reg_8 : out std_logic;
    wrenable_reg_9 : out std_logic
  
  );
  end component;
  
  component flipflop_AR
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component register_STD
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal in_port_a_SIGI1 : unsigned (63 downto 0);
  signal in_port_a_SIGI2 : std_logic_vector(63 downto 0) ;
  signal in_port_b_SIGI1 : unsigned (63 downto 0);
  signal in_port_b_SIGI2 : std_logic_vector(63 downto 0) ;
  signal wrenable_reg_0 : std_logic;
  signal wrenable_reg_1 : std_logic;
  signal wrenable_reg_10 : std_logic;
  signal wrenable_reg_2 : std_logic;
  signal wrenable_reg_3 : std_logic;
  signal wrenable_reg_4 : std_logic;
  signal wrenable_reg_5 : std_logic;
  signal wrenable_reg_6 : std_logic;
  signal wrenable_reg_7 : std_logic;
  signal wrenable_reg_8 : std_logic;
  signal wrenable_reg_9 : std_logic;
begin
  Controller_i : \controller___float_mule8m23b_127nih\ port map (done_port => done_delayed_REG_signal_in,
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_10 => wrenable_reg_10,
    wrenable_reg_2 => wrenable_reg_2,
    wrenable_reg_3 => wrenable_reg_3,
    wrenable_reg_4 => wrenable_reg_4,
    wrenable_reg_5 => wrenable_reg_5,
    wrenable_reg_6 => wrenable_reg_6,
    wrenable_reg_7 => wrenable_reg_7,
    wrenable_reg_8 => wrenable_reg_8,
    wrenable_reg_9 => wrenable_reg_9,
    clock => clock,
    reset => reset,
    start_port => start_port);
  Datapath_i : \datapath___float_mule8m23b_127nih\ port map (return_port => return_port,
    clock => clock,
    reset => reset,
    in_port_a => unsigned(in_port_a_SIGI2),
    in_port_b => unsigned(in_port_b_SIGI2),
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_10 => wrenable_reg_10,
    wrenable_reg_2 => wrenable_reg_2,
    wrenable_reg_3 => wrenable_reg_3,
    wrenable_reg_4 => wrenable_reg_4,
    wrenable_reg_5 => wrenable_reg_5,
    wrenable_reg_6 => wrenable_reg_6,
    wrenable_reg_7 => wrenable_reg_7,
    wrenable_reg_8 => wrenable_reg_8,
    wrenable_reg_9 => wrenable_reg_9);
  done_delayed_REG : flipflop_AR generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => done_delayed_REG_signal_out,
    clock => clock,
    reset => reset,
    in1 => done_delayed_REG_signal_in);
  in_port_a_REG : register_STD generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>64) port map (out1 => in_port_a_SIGI2,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(in_port_a_SIGI1),
    wenable => '0');
  in_port_b_REG : register_STD generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>64) port map (out1 => in_port_b_SIGI2,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(in_port_b_SIGI1),
    wenable => '0');
  -- io-signal post fix
  in_port_a_SIGI1 <= a;
  in_port_b_SIGI1 <= b;
  done_port <= done_delayed_REG_signal_out;

end \__float_mule8m23b_127nih_arch\;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity IUdata_converter_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end IUdata_converter_FU;

architecture IUdata_converter_FU_arch of IUdata_converter_FU is
  begin
    process(in1)
    begin
      if(BITSIZE_out1 <= BITSIZE_in1) then
        out1 <= unsigned(in1(BITSIZE_out1-1 downto 0));
      else
        out1 <= unsigned(resize(in1, BITSIZE_out1));
      end if;
    end process;
end IUdata_converter_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity IIdata_converter_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end IIdata_converter_FU;

architecture IIdata_converter_FU_arch of IIdata_converter_FU is
  begin
    process(in1)
    begin
      if(BITSIZE_out1 > BITSIZE_in1) then
        out1 <= resize(in1, BITSIZE_out1);
      else
        out1 <= in1 (BITSIZE_out1-1 downto 0);
      end if;
    end process;
end IIdata_converter_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity multi_read_cond_FU is 
generic(
 BITSIZE_in1: integer;
 PORTSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end multi_read_cond_FU;

architecture multi_read_cond_FU_arch of multi_read_cond_FU is
  begin
    out1 <= in1;
end multi_read_cond_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity bit_not_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end bit_not_expr_FU;

architecture bit_not_expr_FU_arch of bit_not_expr_FU is
  begin
  out1 <= not resize_signed(in1, BITSIZE_out1);
end bit_not_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity eq_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end eq_expr_FU;

architecture eq_expr_FU_arch of eq_expr_FU is
  begin
    out1 <= std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1)) when (in1 = in2) else (others => '0');

end eq_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity minus_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end minus_expr_FU;

architecture minus_expr_FU_arch of minus_expr_FU is
  begin
  out1 <= resize_signed(in1, BITSIZE_out1) - resize_signed(in2, BITSIZE_out1);
end minus_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity negate_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end negate_expr_FU;

architecture negate_expr_FU_arch of negate_expr_FU is
  begin
    out1 <= -resize_signed(in1, BITSIZE_out1);

end negate_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity plus_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end plus_expr_FU;

architecture plus_expr_FU_arch of plus_expr_FU is
    signal resized_in1 : signed (BITSIZE_out1-1 downto 0);
    signal resized_in2 : signed (BITSIZE_out1-1 downto 0);
    begin
      process(in1,in2,resized_in1,resized_in2)
      begin
        if(BITSIZE_out1 <= BITSIZE_in1) then
          resized_in1 <= in1(BITSIZE_out1-1 downto 0);
        else
          resized_in1 <= resize(in1, BITSIZE_out1);
        end if;
        if(BITSIZE_out1 < BITSIZE_in2) then
          resized_in2 <= in2(BITSIZE_out1-1 downto 0);
        else
          resized_in2 <= resize(in2, BITSIZE_out1);
        end if;
        out1 <= resized_in1 + resized_in2;
      end process;

end plus_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2016-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_bit_ior_concat_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_in3: integer;
 BITSIZE_out1: integer;
 OFFSET_PARAMETER: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  in3 : in unsigned (BITSIZE_in3-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_bit_ior_concat_expr_FU;

architecture ui_bit_ior_concat_expr_FU_arch of ui_bit_ior_concat_expr_FU is
  function integer_ternary_operator(cond : boolean; op1 : integer; op2 : integer) return integer is
    begin
      if cond then
        return op1;
      else
        return op2;
      end if;
  end integer_ternary_operator;
    constant nbit_out : integer := integer_ternary_operator(BITSIZE_out1 > OFFSET_PARAMETER, BITSIZE_out1, 1+OFFSET_PARAMETER);
    signal tmp_in1 : unsigned(nbit_out-1 downto 0);
    signal tmp_in2 : unsigned(nbit_out-1 downto 0);
    begin
      tmp_in1 <= resize(in1, nbit_out);
      tmp_in2 <= resize(in2, nbit_out);
      out1 <= resize(tmp_in1(nbit_out-1 downto OFFSET_PARAMETER) & tmp_in2(OFFSET_PARAMETER-1 downto 0), BITSIZE_out1);
      
end ui_bit_ior_concat_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity MUX_GATE is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  sel : in std_logic;
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end MUX_GATE;

architecture MUX_GATE_arch of MUX_GATE is
  begin
  out1 <= in1 when sel='1' else in2;
end MUX_GATE_arch;

-- Datapath RTL description for __int32_to_float32e8m23b_127nih
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity \datapath___int32_to_float32e8m23b_127nih\ is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in_port_a : in signed (31 downto 0);
  selector_MUX_137_gimple_return_FU_102_i0_0_0_0 : in std_logic;
  wrenable_reg_0 : in std_logic;
  wrenable_reg_1 : in std_logic;
  wrenable_reg_2 : in std_logic;
  wrenable_reg_3 : in std_logic;
  wrenable_reg_4 : in std_logic;
  -- OUT
  return_port : out unsigned (31 downto 0);
  \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ : out std_logic_vector(0 downto 0)

);
end \datapath___int32_to_float32e8m23b_127nih\;

architecture \datapath___int32_to_float32e8m23b_127nih_arch\ of \datapath___int32_to_float32e8m23b_127nih\ is
  -- Component and signal declarations
  
  component constant_value
  generic(
   BITSIZE_out1: integer;
   value: std_logic_vector);
  port (
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_STD
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component extract_bit_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component IUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component UUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component lut_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic;
    in3 : in std_logic;
    in4 : in std_logic;
    in5 : in std_logic;
    in6 : in std_logic;
    in7 : in std_logic;
    in8 : in std_logic;
    in9 : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UIdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component IIdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component multi_read_cond_FU
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_extract_bit_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component bit_not_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component eq_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component minus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component negate_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_bit_and_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_bit_ior_concat_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer;
   OFFSET_PARAMETER: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    in3 : in unsigned (BITSIZE_in3-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_bit_ior_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_cond_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    in3 : in unsigned (BITSIZE_in3-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_eq_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_lshift_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   PRECISION: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_rshift_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   PRECISION: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component MUX_GATE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    sel : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  signal \out_IIdata_converter_FU_99_i0_fu___int32_to_float32e8m23b_127nih_31394_31677\ : signed (6 downto 0);
  signal \out_IUdata_converter_FU_100_i0_fu___int32_to_float32e8m23b_127nih_31394_31729\ : unsigned (7 downto 0);
  signal \out_IUdata_converter_FU_113_i0_fu___int32_to_float32e8m23b_127nih_31394_31865\ : unsigned (24 downto 0);
  signal \out_IUdata_converter_FU_3_i0_fu___int32_to_float32e8m23b_127nih_31394_31532\ : unsigned (31 downto 0);
  signal \out_IUdata_converter_FU_4_i0_fu___int32_to_float32e8m23b_127nih_31394_31529\ : unsigned (31 downto 0);
  signal out_MUX_137_gimple_return_FU_102_i0_0_0_0 : std_logic_vector(31 downto 0) ;
  signal \out_UIdata_converter_FU_112_i0_fu___int32_to_float32e8m23b_127nih_31394_31859\ : signed (1 downto 0);
  signal \out_UIdata_converter_FU_98_i0_fu___int32_to_float32e8m23b_127nih_31394_31671\ : signed (5 downto 0);
  signal \out_UUdata_converter_FU_10_i0_fu___int32_to_float32e8m23b_127nih_31394_31576\ : std_logic_vector(7 downto 0) ;
  signal \out_UUdata_converter_FU_11_i0_fu___int32_to_float32e8m23b_127nih_31394_31656\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_37_i0_fu___int32_to_float32e8m23b_127nih_31394_35207\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_50_i0_fu___int32_to_float32e8m23b_127nih_31394_31647\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_5_i0_fu___int32_to_float32e8m23b_127nih_31394_31732\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_83_i0_fu___int32_to_float32e8m23b_127nih_31394_31641\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_97_i0_fu___int32_to_float32e8m23b_127nih_31394_31638\ : std_logic_vector(0 downto 0);
  signal \out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\ : std_logic_vector(31 downto 0) ;
  signal \out_bit_not_expr_FU_8_8_114_i0_fu___int32_to_float32e8m23b_127nih_31394_31862\ : signed (1 downto 0);
  signal out_const_0 : std_logic_vector(0 downto 0);
  signal out_const_1 : std_logic_vector(1 downto 0) ;
  signal out_const_10 : std_logic_vector(5 downto 0) ;
  signal out_const_11 : std_logic_vector(3 downto 0) ;
  signal out_const_12 : std_logic_vector(5 downto 0) ;
  signal out_const_13 : std_logic_vector(0 downto 0);
  signal out_const_14 : std_logic_vector(1 downto 0) ;
  signal out_const_15 : std_logic_vector(2 downto 0) ;
  signal out_const_16 : std_logic_vector(3 downto 0) ;
  signal out_const_17 : std_logic_vector(31 downto 0) ;
  signal out_const_18 : std_logic_vector(32 downto 0) ;
  signal out_const_19 : std_logic_vector(58 downto 0) ;
  signal out_const_2 : std_logic_vector(2 downto 0) ;
  signal out_const_20 : std_logic_vector(4 downto 0) ;
  signal out_const_21 : std_logic_vector(3 downto 0) ;
  signal out_const_22 : std_logic_vector(4 downto 0) ;
  signal out_const_23 : std_logic_vector(2 downto 0) ;
  signal out_const_24 : std_logic_vector(26 downto 0) ;
  signal out_const_25 : std_logic_vector(4 downto 0) ;
  signal out_const_26 : std_logic_vector(63 downto 0) ;
  signal out_const_27 : std_logic_vector(47 downto 0) ;
  signal out_const_28 : std_logic_vector(3 downto 0) ;
  signal out_const_29 : std_logic_vector(4 downto 0) ;
  signal out_const_3 : std_logic_vector(3 downto 0) ;
  signal out_const_30 : std_logic_vector(1 downto 0) ;
  signal out_const_31 : std_logic_vector(2 downto 0) ;
  signal out_const_32 : std_logic_vector(4 downto 0) ;
  signal out_const_33 : std_logic_vector(4 downto 0) ;
  signal out_const_34 : std_logic_vector(7 downto 0) ;
  signal out_const_35 : std_logic_vector(3 downto 0) ;
  signal out_const_36 : std_logic_vector(4 downto 0) ;
  signal out_const_37 : std_logic_vector(4 downto 0) ;
  signal out_const_38 : std_logic_vector(7 downto 0) ;
  signal out_const_39 : std_logic_vector(2 downto 0) ;
  signal out_const_4 : std_logic_vector(4 downto 0) ;
  signal out_const_40 : std_logic_vector(4 downto 0) ;
  signal out_const_41 : std_logic_vector(4 downto 0) ;
  signal out_const_42 : std_logic_vector(7 downto 0) ;
  signal out_const_43 : std_logic_vector(3 downto 0) ;
  signal out_const_44 : std_logic_vector(4 downto 0) ;
  signal out_const_45 : std_logic_vector(31 downto 0) ;
  signal out_const_46 : std_logic_vector(4 downto 0) ;
  signal out_const_47 : std_logic_vector(31 downto 0) ;
  signal out_const_48 : std_logic_vector(5 downto 0) ;
  signal out_const_49 : std_logic_vector(7 downto 0) ;
  signal out_const_5 : std_logic_vector(5 downto 0) ;
  signal out_const_50 : std_logic_vector(31 downto 0) ;
  signal out_const_51 : std_logic_vector(22 downto 0) ;
  signal out_const_52 : std_logic_vector(30 downto 0) ;
  signal out_const_6 : std_logic_vector(8 downto 0) ;
  signal out_const_7 : std_logic_vector(5 downto 0) ;
  signal out_const_8 : std_logic_vector(5 downto 0) ;
  signal out_const_9 : std_logic_vector(4 downto 0) ;
  signal \out_eq_expr_FU_32_0_32_115_i0_fu___int32_to_float32e8m23b_127nih_31394_33017\ : std_logic_vector(0 downto 0);
  signal \out_eq_expr_FU_32_0_32_116_i0_fu___int32_to_float32e8m23b_127nih_31394_33023\ : std_logic_vector(0 downto 0);
  signal \out_extract_bit_expr_FU_14_i0_fu___int32_to_float32e8m23b_127nih_31394_35657\ : std_logic;
  signal \out_extract_bit_expr_FU_15_i0_fu___int32_to_float32e8m23b_127nih_31394_35661\ : std_logic;
  signal \out_extract_bit_expr_FU_16_i0_fu___int32_to_float32e8m23b_127nih_31394_35665\ : std_logic;
  signal \out_extract_bit_expr_FU_17_i0_fu___int32_to_float32e8m23b_127nih_31394_35669\ : std_logic;
  signal \out_extract_bit_expr_FU_18_i0_fu___int32_to_float32e8m23b_127nih_31394_35673\ : std_logic;
  signal \out_extract_bit_expr_FU_19_i0_fu___int32_to_float32e8m23b_127nih_31394_35677\ : std_logic;
  signal \out_extract_bit_expr_FU_20_i0_fu___int32_to_float32e8m23b_127nih_31394_35681\ : std_logic;
  signal \out_extract_bit_expr_FU_21_i0_fu___int32_to_float32e8m23b_127nih_31394_35685\ : std_logic;
  signal \out_extract_bit_expr_FU_22_i0_fu___int32_to_float32e8m23b_127nih_31394_35689\ : std_logic;
  signal \out_extract_bit_expr_FU_23_i0_fu___int32_to_float32e8m23b_127nih_31394_35693\ : std_logic;
  signal \out_extract_bit_expr_FU_24_i0_fu___int32_to_float32e8m23b_127nih_31394_35697\ : std_logic;
  signal \out_extract_bit_expr_FU_25_i0_fu___int32_to_float32e8m23b_127nih_31394_35701\ : std_logic;
  signal \out_extract_bit_expr_FU_26_i0_fu___int32_to_float32e8m23b_127nih_31394_35705\ : std_logic;
  signal \out_extract_bit_expr_FU_27_i0_fu___int32_to_float32e8m23b_127nih_31394_35709\ : std_logic;
  signal \out_extract_bit_expr_FU_28_i0_fu___int32_to_float32e8m23b_127nih_31394_35713\ : std_logic;
  signal \out_extract_bit_expr_FU_29_i0_fu___int32_to_float32e8m23b_127nih_31394_35717\ : std_logic;
  signal \out_extract_bit_expr_FU_2_i0_fu___int32_to_float32e8m23b_127nih_31394_35282\ : std_logic;
  signal \out_extract_bit_expr_FU_38_i0_fu___int32_to_float32e8m23b_127nih_31394_35721\ : std_logic;
  signal \out_extract_bit_expr_FU_39_i0_fu___int32_to_float32e8m23b_127nih_31394_35725\ : std_logic;
  signal \out_extract_bit_expr_FU_40_i0_fu___int32_to_float32e8m23b_127nih_31394_35729\ : std_logic;
  signal \out_extract_bit_expr_FU_41_i0_fu___int32_to_float32e8m23b_127nih_31394_35733\ : std_logic;
  signal \out_extract_bit_expr_FU_42_i0_fu___int32_to_float32e8m23b_127nih_31394_35737\ : std_logic;
  signal \out_extract_bit_expr_FU_43_i0_fu___int32_to_float32e8m23b_127nih_31394_35741\ : std_logic;
  signal \out_extract_bit_expr_FU_44_i0_fu___int32_to_float32e8m23b_127nih_31394_35745\ : std_logic;
  signal \out_extract_bit_expr_FU_45_i0_fu___int32_to_float32e8m23b_127nih_31394_35749\ : std_logic;
  signal \out_extract_bit_expr_FU_51_i0_fu___int32_to_float32e8m23b_127nih_31394_36164\ : std_logic;
  signal \out_extract_bit_expr_FU_52_i0_fu___int32_to_float32e8m23b_127nih_31394_36168\ : std_logic;
  signal \out_extract_bit_expr_FU_53_i0_fu___int32_to_float32e8m23b_127nih_31394_36295\ : std_logic;
  signal \out_extract_bit_expr_FU_54_i0_fu___int32_to_float32e8m23b_127nih_31394_36299\ : std_logic;
  signal \out_extract_bit_expr_FU_55_i0_fu___int32_to_float32e8m23b_127nih_31394_36373\ : std_logic;
  signal \out_extract_bit_expr_FU_56_i0_fu___int32_to_float32e8m23b_127nih_31394_36377\ : std_logic;
  signal \out_extract_bit_expr_FU_57_i0_fu___int32_to_float32e8m23b_127nih_31394_36106\ : std_logic;
  signal \out_extract_bit_expr_FU_58_i0_fu___int32_to_float32e8m23b_127nih_31394_36110\ : std_logic;
  signal \out_extract_bit_expr_FU_59_i0_fu___int32_to_float32e8m23b_127nih_31394_36041\ : std_logic;
  signal \out_extract_bit_expr_FU_60_i0_fu___int32_to_float32e8m23b_127nih_31394_36045\ : std_logic;
  signal \out_extract_bit_expr_FU_61_i0_fu___int32_to_float32e8m23b_127nih_31394_36226\ : std_logic;
  signal \out_extract_bit_expr_FU_62_i0_fu___int32_to_float32e8m23b_127nih_31394_36230\ : std_logic;
  signal \out_extract_bit_expr_FU_63_i0_fu___int32_to_float32e8m23b_127nih_31394_36339\ : std_logic;
  signal \out_extract_bit_expr_FU_64_i0_fu___int32_to_float32e8m23b_127nih_31394_36343\ : std_logic;
  signal \out_extract_bit_expr_FU_65_i0_fu___int32_to_float32e8m23b_127nih_31394_35980\ : std_logic;
  signal \out_extract_bit_expr_FU_66_i0_fu___int32_to_float32e8m23b_127nih_31394_35984\ : std_logic;
  signal \out_extract_bit_expr_FU_67_i0_fu___int32_to_float32e8m23b_127nih_31394_36191\ : std_logic;
  signal \out_extract_bit_expr_FU_68_i0_fu___int32_to_float32e8m23b_127nih_31394_36195\ : std_logic;
  signal \out_extract_bit_expr_FU_69_i0_fu___int32_to_float32e8m23b_127nih_31394_36315\ : std_logic;
  signal \out_extract_bit_expr_FU_6_i0_fu___int32_to_float32e8m23b_127nih_31394_35213\ : std_logic;
  signal \out_extract_bit_expr_FU_70_i0_fu___int32_to_float32e8m23b_127nih_31394_36319\ : std_logic;
  signal \out_extract_bit_expr_FU_71_i0_fu___int32_to_float32e8m23b_127nih_31394_36381\ : std_logic;
  signal \out_extract_bit_expr_FU_72_i0_fu___int32_to_float32e8m23b_127nih_31394_36385\ : std_logic;
  signal \out_extract_bit_expr_FU_73_i0_fu___int32_to_float32e8m23b_127nih_31394_36137\ : std_logic;
  signal \out_extract_bit_expr_FU_74_i0_fu___int32_to_float32e8m23b_127nih_31394_36141\ : std_logic;
  signal \out_extract_bit_expr_FU_75_i0_fu___int32_to_float32e8m23b_127nih_31394_36075\ : std_logic;
  signal \out_extract_bit_expr_FU_76_i0_fu___int32_to_float32e8m23b_127nih_31394_36079\ : std_logic;
  signal \out_extract_bit_expr_FU_77_i0_fu___int32_to_float32e8m23b_127nih_31394_36246\ : std_logic;
  signal \out_extract_bit_expr_FU_78_i0_fu___int32_to_float32e8m23b_127nih_31394_36250\ : std_logic;
  signal \out_extract_bit_expr_FU_79_i0_fu___int32_to_float32e8m23b_127nih_31394_36351\ : std_logic;
  signal \out_extract_bit_expr_FU_80_i0_fu___int32_to_float32e8m23b_127nih_31394_36355\ : std_logic;
  signal \out_extract_bit_expr_FU_81_i0_fu___int32_to_float32e8m23b_127nih_31394_36015\ : std_logic;
  signal \out_extract_bit_expr_FU_82_i0_fu___int32_to_float32e8m23b_127nih_31394_36019\ : std_logic;
  signal \out_lut_expr_FU_110_i0_fu___int32_to_float32e8m23b_127nih_31394_36484\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_111_i0_fu___int32_to_float32e8m23b_127nih_31394_31856\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_12_i0_fu___int32_to_float32e8m23b_127nih_31394_35160\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_13_i0_fu___int32_to_float32e8m23b_127nih_31394_35166\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_30_i0_fu___int32_to_float32e8m23b_127nih_31394_36502\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_31_i0_fu___int32_to_float32e8m23b_127nih_31394_36505\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_32_i0_fu___int32_to_float32e8m23b_127nih_31394_36508\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_33_i0_fu___int32_to_float32e8m23b_127nih_31394_36511\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_34_i0_fu___int32_to_float32e8m23b_127nih_31394_35192\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_36_i0_fu___int32_to_float32e8m23b_127nih_31394_36427\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_46_i0_fu___int32_to_float32e8m23b_127nih_31394_36519\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_47_i0_fu___int32_to_float32e8m23b_127nih_31394_36522\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_48_i0_fu___int32_to_float32e8m23b_127nih_31394_36525\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_49_i0_fu___int32_to_float32e8m23b_127nih_31394_35205\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_84_i0_fu___int32_to_float32e8m23b_127nih_31394_36529\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_85_i0_fu___int32_to_float32e8m23b_127nih_31394_36533\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_86_i0_fu___int32_to_float32e8m23b_127nih_31394_36537\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_87_i0_fu___int32_to_float32e8m23b_127nih_31394_36540\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_88_i0_fu___int32_to_float32e8m23b_127nih_31394_36543\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_89_i0_fu___int32_to_float32e8m23b_127nih_31394_36546\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_8_i0_fu___int32_to_float32e8m23b_127nih_31394_35169\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_90_i0_fu___int32_to_float32e8m23b_127nih_31394_36549\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_91_i0_fu___int32_to_float32e8m23b_127nih_31394_36552\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_92_i0_fu___int32_to_float32e8m23b_127nih_31394_36555\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_93_i0_fu___int32_to_float32e8m23b_127nih_31394_36558\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_94_i0_fu___int32_to_float32e8m23b_127nih_31394_36561\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_95_i0_fu___int32_to_float32e8m23b_127nih_31394_36564\ : std_logic_vector(0 downto 0);
  signal \out_lut_expr_FU_96_i0_fu___int32_to_float32e8m23b_127nih_31394_35187\ : std_logic_vector(0 downto 0);
  signal \out_minus_expr_FU_0_8_8_117_i0_fu___int32_to_float32e8m23b_127nih_31394_31683\ : signed (8 downto 0);
  signal \out_multi_read_cond_FU_101_i0_fu___int32_to_float32e8m23b_127nih_31394_35140\ : std_logic_vector(0 downto 0);
  signal \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\ : signed (31 downto 0);
  signal \out_plus_expr_FU_8_0_8_119_i0_fu___int32_to_float32e8m23b_127nih_31394_31674\ : signed (6 downto 0);
  signal out_reg_0_reg_0 : std_logic_vector(31 downto 0) ;
  signal out_reg_1_reg_1 : std_logic_vector(31 downto 0) ;
  signal out_reg_2_reg_2 : std_logic_vector(6 downto 0) ;
  signal out_reg_3_reg_3 : std_logic_vector(31 downto 0) ;
  signal out_reg_4_reg_4 : std_logic_vector(7 downto 0) ;
  signal \out_ui_bit_and_expr_FU_32_0_32_120_i0_fu___int32_to_float32e8m23b_127nih_31394_33343\ : unsigned (24 downto 0);
  signal \out_ui_bit_and_expr_FU_32_0_32_121_i0_fu___int32_to_float32e8m23b_127nih_31394_33375\ : unsigned (22 downto 0);
  signal \out_ui_bit_and_expr_FU_32_32_32_122_i0_fu___int32_to_float32e8m23b_127nih_31394_31868\ : unsigned (24 downto 0);
  signal \out_ui_bit_and_expr_FU_8_0_8_123_i0_fu___int32_to_float32e8m23b_127nih_31394_31573\ : unsigned (7 downto 0);
  signal \out_ui_bit_and_expr_FU_8_0_8_124_i0_fu___int32_to_float32e8m23b_127nih_31394_31585\ : unsigned (5 downto 0);
  signal \out_ui_bit_and_expr_FU_8_0_8_125_i0_fu___int32_to_float32e8m23b_127nih_31394_31608\ : unsigned (1 downto 0);
  signal \out_ui_bit_ior_concat_expr_FU_126_i0_fu___int32_to_float32e8m23b_127nih_31394_31878\ : unsigned (31 downto 0);
  signal \out_ui_bit_ior_concat_expr_FU_127_i0_fu___int32_to_float32e8m23b_127nih_31394_31881\ : unsigned (31 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_8_8_128_i0_fu___int32_to_float32e8m23b_127nih_31394_31653\ : unsigned (2 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_8_8_129_i0_fu___int32_to_float32e8m23b_127nih_31394_31662\ : unsigned (4 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_8_8_130_i0_fu___int32_to_float32e8m23b_127nih_31394_31665\ : unsigned (4 downto 0);
  signal \out_ui_bit_ior_expr_FU_0_8_8_131_i0_fu___int32_to_float32e8m23b_127nih_31394_31668\ : unsigned (4 downto 0);
  signal \out_ui_cond_expr_FU_32_32_32_32_132_i0_fu___int32_to_float32e8m23b_127nih_31394_35171\ : unsigned (31 downto 0);
  signal \out_ui_cond_expr_FU_32_32_32_32_132_i1_fu___int32_to_float32e8m23b_127nih_31394_35185\ : unsigned (17 downto 0);
  signal \out_ui_cond_expr_FU_32_32_32_32_132_i2_fu___int32_to_float32e8m23b_127nih_31394_35195\ : unsigned (23 downto 0);
  signal \out_ui_cond_expr_FU_32_32_32_32_132_i3_fu___int32_to_float32e8m23b_127nih_31394_35203\ : unsigned (21 downto 0);
  signal \out_ui_cond_expr_FU_8_8_8_8_133_i0_fu___int32_to_float32e8m23b_127nih_31394_35177\ : unsigned (5 downto 0);
  signal \out_ui_cond_expr_FU_8_8_8_8_133_i1_fu___int32_to_float32e8m23b_127nih_31394_35189\ : unsigned (7 downto 0);
  signal \out_ui_cond_expr_FU_8_8_8_8_133_i2_fu___int32_to_float32e8m23b_127nih_31394_35210\ : unsigned (7 downto 0);
  signal \out_ui_eq_expr_FU_16_0_16_134_i0_fu___int32_to_float32e8m23b_127nih_31394_31552\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_16_0_16_134_i1_fu___int32_to_float32e8m23b_127nih_31394_31582\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_135_i0_fu___int32_to_float32e8m23b_127nih_31394_31570\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_135_i1_fu___int32_to_float32e8m23b_127nih_31394_31593\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_135_i2_fu___int32_to_float32e8m23b_127nih_31394_31619\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_135_i3_fu___int32_to_float32e8m23b_127nih_31394_33031\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_135_i4_fu___int32_to_float32e8m23b_127nih_31394_33037\ : std_logic_vector(0 downto 0);
  signal \out_ui_eq_expr_FU_32_0_32_136_i0_fu___int32_to_float32e8m23b_127nih_31394_33051\ : std_logic_vector(0 downto 0);
  signal \out_ui_extract_bit_expr_FU_103_i0_fu___int32_to_float32e8m23b_127nih_31394_35529\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_104_i0_fu___int32_to_float32e8m23b_127nih_31394_35533\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_105_i0_fu___int32_to_float32e8m23b_127nih_31394_35537\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_106_i0_fu___int32_to_float32e8m23b_127nih_31394_35541\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_107_i0_fu___int32_to_float32e8m23b_127nih_31394_35545\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_108_i0_fu___int32_to_float32e8m23b_127nih_31394_35549\ : std_logic;
  signal \out_ui_extract_bit_expr_FU_109_i0_fu___int32_to_float32e8m23b_127nih_31394_35553\ : std_logic;
  signal \out_ui_lshift_expr_FU_32_0_32_137_i0_fu___int32_to_float32e8m23b_127nih_31394_31735\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_138_i0_fu___int32_to_float32e8m23b_127nih_31394_31873\ : unsigned (30 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_139_i0_fu___int32_to_float32e8m23b_127nih_31394_33326\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_140_i0_fu___int32_to_float32e8m23b_127nih_31394_33339\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_141_i0_fu___int32_to_float32e8m23b_127nih_31394_33372\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_141_i1_fu___int32_to_float32e8m23b_127nih_31394_35456\ : unsigned (30 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_142_i0_fu___int32_to_float32e8m23b_127nih_31394_35326\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_143_i0_fu___int32_to_float32e8m23b_127nih_31394_35405\ : unsigned (19 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_143_i1_fu___int32_to_float32e8m23b_127nih_31394_35777\ : unsigned (18 downto 0);
  signal \out_ui_lshift_expr_FU_32_0_32_144_i0_fu___int32_to_float32e8m23b_127nih_31394_36398\ : unsigned (23 downto 0);
  signal \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\ : unsigned (31 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_146_i0_fu___int32_to_float32e8m23b_127nih_31394_31644\ : unsigned (1 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_147_i0_fu___int32_to_float32e8m23b_127nih_31394_31650\ : unsigned (2 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_148_i0_fu___int32_to_float32e8m23b_127nih_31394_31659\ : unsigned (4 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i0_fu___int32_to_float32e8m23b_127nih_31394_33246\ : unsigned (7 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i1_fu___int32_to_float32e8m23b_127nih_31394_33254\ : unsigned (3 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i2_fu___int32_to_float32e8m23b_127nih_31394_35336\ : unsigned (7 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i3_fu___int32_to_float32e8m23b_127nih_31394_35852\ : unsigned (2 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i4_fu___int32_to_float32e8m23b_127nih_31394_36161\ : unsigned (6 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_149_i5_fu___int32_to_float32e8m23b_127nih_31394_36292\ : unsigned (6 downto 0);
  signal \out_ui_lshift_expr_FU_8_0_8_150_i0_fu___int32_to_float32e8m23b_127nih_31394_35379\ : unsigned (3 downto 0);
  signal \out_ui_plus_expr_FU_0_32_32_151_i0_fu___int32_to_float32e8m23b_127nih_31394_33323\ : unsigned (25 downto 0);
  signal \out_ui_plus_expr_FU_8_8_8_152_i0_fu___int32_to_float32e8m23b_127nih_31394_33369\ : unsigned (8 downto 0);
  signal \out_ui_rshift_expr_FU_16_0_16_153_i0_fu___int32_to_float32e8m23b_127nih_31394_33241\ : unsigned (6 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_154_i0_fu___int32_to_float32e8m23b_127nih_31394_31549\ : unsigned (15 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_155_i0_fu___int32_to_float32e8m23b_127nih_31394_31557\ : unsigned (23 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_156_i0_fu___int32_to_float32e8m23b_127nih_31394_31562\ : unsigned (7 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_157_i0_fu___int32_to_float32e8m23b_127nih_31394_31567\ : unsigned (27 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_157_i1_fu___int32_to_float32e8m23b_127nih_31394_31611\ : unsigned (19 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_158_i0_fu___int32_to_float32e8m23b_127nih_31394_31579\ : unsigned (11 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_159_i0_fu___int32_to_float32e8m23b_127nih_31394_31596\ : unsigned (19 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_160_i0_fu___int32_to_float32e8m23b_127nih_31394_31616\ : unsigned (17 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_161_i0_fu___int32_to_float32e8m23b_127nih_31394_31853\ : unsigned (24 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_162_i0_fu___int32_to_float32e8m23b_127nih_31394_33249\ : unsigned (2 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_162_i1_fu___int32_to_float32e8m23b_127nih_31394_35401\ : unsigned (18 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_162_i2_fu___int32_to_float32e8m23b_127nih_31394_35772\ : unsigned (17 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_163_i0_fu___int32_to_float32e8m23b_127nih_31394_33319\ : unsigned (25 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_164_i0_fu___int32_to_float32e8m23b_127nih_31394_33334\ : unsigned (0 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_165_i0_fu___int32_to_float32e8m23b_127nih_31394_33363\ : unsigned (8 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_165_i1_fu___int32_to_float32e8m23b_127nih_31394_33367\ : unsigned (7 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_165_i2_fu___int32_to_float32e8m23b_127nih_31394_35452\ : unsigned (7 downto 0);
  signal \out_ui_rshift_expr_FU_32_0_32_166_i0_fu___int32_to_float32e8m23b_127nih_31394_36390\ : unsigned (21 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i0_fu___int32_to_float32e8m23b_127nih_31394_35329\ : unsigned (6 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i1_fu___int32_to_float32e8m23b_127nih_31394_35332\ : unsigned (6 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i2_fu___int32_to_float32e8m23b_127nih_31394_35398\ : unsigned (2 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i3_fu___int32_to_float32e8m23b_127nih_31394_35769\ : unsigned (1 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i4_fu___int32_to_float32e8m23b_127nih_31394_35848\ : unsigned (1 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i5_fu___int32_to_float32e8m23b_127nih_31394_36153\ : unsigned (5 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i6_fu___int32_to_float32e8m23b_127nih_31394_36157\ : unsigned (5 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_167_i7_fu___int32_to_float32e8m23b_127nih_31394_36288\ : unsigned (5 downto 0);
  signal \out_ui_rshift_expr_FU_8_0_8_168_i0_fu___int32_to_float32e8m23b_127nih_31394_36394\ : unsigned (5 downto 0);
begin
  MUX_137_gimple_return_FU_102_i0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_137_gimple_return_FU_102_i0_0_0_0,
    sel => selector_MUX_137_gimple_return_FU_102_i0_0_0_0,
    in1 => out_reg_0_reg_0,
    in2 => std_logic_vector(\out_ui_bit_ior_concat_expr_FU_127_i0_fu___int32_to_float32e8m23b_127nih_31394_31881\));
  const_0 : constant_value generic map(BITSIZE_out1=>1,
    value=>"0") port map (out1 => out_const_0);
  const_1 : constant_value generic map(BITSIZE_out1=>2,
    value=>"01") port map (out1 => out_const_1);
  const_10 : constant_value generic map(BITSIZE_out1=>6,
    value=>"011000") port map (out1 => out_const_10);
  const_11 : constant_value generic map(BITSIZE_out1=>4,
    value=>"0111") port map (out1 => out_const_11);
  const_12 : constant_value generic map(BITSIZE_out1=>6,
    value=>"011111") port map (out1 => out_const_12);
  const_13 : constant_value generic map(BITSIZE_out1=>1,
    value=>"1") port map (out1 => out_const_13);
  const_14 : constant_value generic map(BITSIZE_out1=>2,
    value=>"10") port map (out1 => out_const_14);
  const_15 : constant_value generic map(BITSIZE_out1=>3,
    value=>"100") port map (out1 => out_const_15);
  const_16 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1000") port map (out1 => out_const_16);
  const_17 : constant_value generic map(BITSIZE_out1=>32,
    value=>"10000000000000000000000000000000") port map (out1 => out_const_17);
  const_18 : constant_value generic map(BITSIZE_out1=>33,
    value=>"100000000000000000000000000000000") port map (out1 => out_const_18);
  const_19 : constant_value generic map(BITSIZE_out1=>59,
    value=>"10000010101100011001001110100100110001101111010111010111111") port map (out1 => out_const_19);
  const_2 : constant_value generic map(BITSIZE_out1=>3,
    value=>"010") port map (out1 => out_const_2);
  const_20 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10001") port map (out1 => out_const_20);
  const_21 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1001") port map (out1 => out_const_21);
  const_22 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10011") port map (out1 => out_const_22);
  const_23 : constant_value generic map(BITSIZE_out1=>3,
    value=>"101") port map (out1 => out_const_23);
  const_24 : constant_value generic map(BITSIZE_out1=>27,
    value=>"101000001010000000000110011") port map (out1 => out_const_24);
  const_25 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10101") port map (out1 => out_const_25);
  const_26 : constant_value generic map(BITSIZE_out1=>64,
    value=>"1010101010101010110011001100110011110000111100001111111100000000") port map (out1 => out_const_26);
  const_27 : constant_value generic map(BITSIZE_out1=>48,
    value=>"101011001111111100000000000000001010110000000000") port map (out1 => out_const_27);
  const_28 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1011") port map (out1 => out_const_28);
  const_29 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10111") port map (out1 => out_const_29);
  const_3 : constant_value generic map(BITSIZE_out1=>4,
    value=>"0100") port map (out1 => out_const_3);
  const_30 : constant_value generic map(BITSIZE_out1=>2,
    value=>"11") port map (out1 => out_const_30);
  const_31 : constant_value generic map(BITSIZE_out1=>3,
    value=>"110") port map (out1 => out_const_31);
  const_32 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11000") port map (out1 => out_const_32);
  const_33 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11001") port map (out1 => out_const_33);
  const_34 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11001111") port map (out1 => out_const_34);
  const_35 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1101") port map (out1 => out_const_35);
  const_36 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11010") port map (out1 => out_const_36);
  const_37 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11011") port map (out1 => out_const_37);
  const_38 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11011000") port map (out1 => out_const_38);
  const_39 : constant_value generic map(BITSIZE_out1=>3,
    value=>"111") port map (out1 => out_const_39);
  const_4 : constant_value generic map(BITSIZE_out1=>5,
    value=>"01000") port map (out1 => out_const_4);
  const_40 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11100") port map (out1 => out_const_40);
  const_41 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11101") port map (out1 => out_const_41);
  const_42 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11101010") port map (out1 => out_const_42);
  const_43 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1111") port map (out1 => out_const_43);
  const_44 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11110") port map (out1 => out_const_44);
  const_45 : constant_value generic map(BITSIZE_out1=>32,
    value=>"11110111101000101101010110000000") port map (out1 => out_const_45);
  const_46 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11111") port map (out1 => out_const_46);
  const_47 : constant_value generic map(BITSIZE_out1=>32,
    value=>"11111010111110101111111111001100") port map (out1 => out_const_47);
  const_48 : constant_value generic map(BITSIZE_out1=>6,
    value=>"111111") port map (out1 => out_const_48);
  const_49 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11111111") port map (out1 => out_const_49);
  const_5 : constant_value generic map(BITSIZE_out1=>6,
    value=>"010000") port map (out1 => out_const_5);
  const_50 : constant_value generic map(BITSIZE_out1=>32,
    value=>"11111111111111111010110000000000") port map (out1 => out_const_50);
  const_51 : constant_value generic map(BITSIZE_out1=>23,
    value=>"11111111111111111111111") port map (out1 => out_const_51);
  const_52 : constant_value generic map(BITSIZE_out1=>31,
    value=>"1111111111111111111111111111111") port map (out1 => out_const_52);
  const_6 : constant_value generic map(BITSIZE_out1=>9,
    value=>"010011100") port map (out1 => out_const_6);
  const_7 : constant_value generic map(BITSIZE_out1=>6,
    value=>"010100") port map (out1 => out_const_7);
  const_8 : constant_value generic map(BITSIZE_out1=>6,
    value=>"010111") port map (out1 => out_const_8);
  const_9 : constant_value generic map(BITSIZE_out1=>5,
    value=>"01100") port map (out1 => out_const_9);
  \fu___int32_to_float32e8m23b_127nih_31394_31526\ : negate_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in1 => in_port_a);
  \fu___int32_to_float32e8m23b_127nih_31394_31529\ : IUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => \out_IUdata_converter_FU_4_i0_fu___int32_to_float32e8m23b_127nih_31394_31529\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\);
  \fu___int32_to_float32e8m23b_127nih_31394_31532\ : IUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => \out_IUdata_converter_FU_3_i0_fu___int32_to_float32e8m23b_127nih_31394_31532\,
    in1 => in_port_a);
  \fu___int32_to_float32e8m23b_127nih_31394_31546\ : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => \out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\,
    in1 => std_logic_vector(\out_ui_cond_expr_FU_32_32_32_32_132_i0_fu___int32_to_float32e8m23b_127nih_31394_35171\));
  \fu___int32_to_float32e8m23b_127nih_31394_31549\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>6,
    BITSIZE_out1=>16,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_154_i0_fu___int32_to_float32e8m23b_127nih_31394_31549\,
    in1 => unsigned(\out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\),
    in2 => out_const_5);
  \fu___int32_to_float32e8m23b_127nih_31394_31552\ : ui_eq_expr_FU generic map(BITSIZE_in1=>16,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_16_0_16_134_i0_fu___int32_to_float32e8m23b_127nih_31394_31552\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_154_i0_fu___int32_to_float32e8m23b_127nih_31394_31549\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_31557\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>24,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_155_i0_fu___int32_to_float32e8m23b_127nih_31394_31557\,
    in1 => unsigned(\out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\),
    in2 => out_const_4);
  \fu___int32_to_float32e8m23b_127nih_31394_31562\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>6,
    BITSIZE_out1=>8,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_156_i0_fu___int32_to_float32e8m23b_127nih_31394_31562\,
    in1 => unsigned(\out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\),
    in2 => out_const_10);
  \fu___int32_to_float32e8m23b_127nih_31394_31567\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4,
    BITSIZE_out1=>28,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_157_i0_fu___int32_to_float32e8m23b_127nih_31394_31567\,
    in1 => unsigned(\out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\),
    in2 => out_const_3);
  \fu___int32_to_float32e8m23b_127nih_31394_31570\ : ui_eq_expr_FU generic map(BITSIZE_in1=>28,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_135_i0_fu___int32_to_float32e8m23b_127nih_31394_31570\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_157_i0_fu___int32_to_float32e8m23b_127nih_31394_31567\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_31573\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>8,
    BITSIZE_out1=>8) port map (out1 => \out_ui_bit_and_expr_FU_8_0_8_123_i0_fu___int32_to_float32e8m23b_127nih_31394_31573\,
    in1 => \out_ui_cond_expr_FU_32_32_32_32_132_i0_fu___int32_to_float32e8m23b_127nih_31394_35171\,
    in2 => unsigned(out_const_49));
  \fu___int32_to_float32e8m23b_127nih_31394_31576\ : UUdata_converter_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>8) port map (out1 => \out_UUdata_converter_FU_10_i0_fu___int32_to_float32e8m23b_127nih_31394_31576\,
    in1 => std_logic_vector(\out_ui_bit_and_expr_FU_8_0_8_123_i0_fu___int32_to_float32e8m23b_127nih_31394_31573\));
  \fu___int32_to_float32e8m23b_127nih_31394_31579\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>6,
    BITSIZE_out1=>12,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_158_i0_fu___int32_to_float32e8m23b_127nih_31394_31579\,
    in1 => unsigned(\out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\),
    in2 => out_const_7);
  \fu___int32_to_float32e8m23b_127nih_31394_31582\ : ui_eq_expr_FU generic map(BITSIZE_in1=>12,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_16_0_16_134_i1_fu___int32_to_float32e8m23b_127nih_31394_31582\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_158_i0_fu___int32_to_float32e8m23b_127nih_31394_31579\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_31585\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>6,
    BITSIZE_in2=>6,
    BITSIZE_out1=>6) port map (out1 => \out_ui_bit_and_expr_FU_8_0_8_124_i0_fu___int32_to_float32e8m23b_127nih_31394_31585\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_167_i7_fu___int32_to_float32e8m23b_127nih_31394_36288\,
    in2 => unsigned(out_const_48));
  \fu___int32_to_float32e8m23b_127nih_31394_31593\ : ui_eq_expr_FU generic map(BITSIZE_in1=>20,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_135_i1_fu___int32_to_float32e8m23b_127nih_31394_31593\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_159_i0_fu___int32_to_float32e8m23b_127nih_31394_31596\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_31596\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>20,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_159_i0_fu___int32_to_float32e8m23b_127nih_31394_31596\,
    in1 => unsigned(\out_UUdata_converter_FU_9_i0_fu___int32_to_float32e8m23b_127nih_31394_31546\),
    in2 => out_const_9);
  \fu___int32_to_float32e8m23b_127nih_31394_31608\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2) port map (out1 => \out_ui_bit_and_expr_FU_8_0_8_125_i0_fu___int32_to_float32e8m23b_127nih_31394_31608\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_167_i4_fu___int32_to_float32e8m23b_127nih_31394_35848\,
    in2 => unsigned(out_const_30));
  \fu___int32_to_float32e8m23b_127nih_31394_31611\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>4,
    BITSIZE_out1=>20,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_157_i1_fu___int32_to_float32e8m23b_127nih_31394_31611\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_144_i0_fu___int32_to_float32e8m23b_127nih_31394_36398\,
    in2 => out_const_3);
  \fu___int32_to_float32e8m23b_127nih_31394_31616\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>20,
    BITSIZE_in2=>3,
    BITSIZE_out1=>18,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_160_i0_fu___int32_to_float32e8m23b_127nih_31394_31616\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_143_i0_fu___int32_to_float32e8m23b_127nih_31394_35405\,
    in2 => out_const_2);
  \fu___int32_to_float32e8m23b_127nih_31394_31619\ : ui_eq_expr_FU generic map(BITSIZE_in1=>18,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_135_i2_fu___int32_to_float32e8m23b_127nih_31394_31619\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_160_i0_fu___int32_to_float32e8m23b_127nih_31394_31616\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_31638\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_97_i0_fu___int32_to_float32e8m23b_127nih_31394_31638\,
    in1 => \out_lut_expr_FU_96_i0_fu___int32_to_float32e8m23b_127nih_31394_35187\);
  \fu___int32_to_float32e8m23b_127nih_31394_31641\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_83_i0_fu___int32_to_float32e8m23b_127nih_31394_31641\,
    in1 => \out_ui_eq_expr_FU_32_0_32_135_i2_fu___int32_to_float32e8m23b_127nih_31394_31619\);
  \fu___int32_to_float32e8m23b_127nih_31394_31644\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_out1=>2,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_146_i0_fu___int32_to_float32e8m23b_127nih_31394_31644\,
    in1 => unsigned(\out_UUdata_converter_FU_83_i0_fu___int32_to_float32e8m23b_127nih_31394_31641\),
    in2 => out_const_1);
  \fu___int32_to_float32e8m23b_127nih_31394_31647\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_50_i0_fu___int32_to_float32e8m23b_127nih_31394_31647\,
    in1 => \out_lut_expr_FU_49_i0_fu___int32_to_float32e8m23b_127nih_31394_35205\);
  \fu___int32_to_float32e8m23b_127nih_31394_31650\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>3,
    BITSIZE_out1=>3,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_147_i0_fu___int32_to_float32e8m23b_127nih_31394_31650\,
    in1 => unsigned(\out_UUdata_converter_FU_50_i0_fu___int32_to_float32e8m23b_127nih_31394_31647\),
    in2 => out_const_2);
  \fu___int32_to_float32e8m23b_127nih_31394_31653\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>3,
    BITSIZE_out1=>3) port map (out1 => \out_ui_bit_ior_expr_FU_0_8_8_128_i0_fu___int32_to_float32e8m23b_127nih_31394_31653\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_146_i0_fu___int32_to_float32e8m23b_127nih_31394_31644\,
    in2 => \out_ui_lshift_expr_FU_8_0_8_147_i0_fu___int32_to_float32e8m23b_127nih_31394_31650\);
  \fu___int32_to_float32e8m23b_127nih_31394_31656\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_11_i0_fu___int32_to_float32e8m23b_127nih_31394_31656\,
    in1 => \out_ui_eq_expr_FU_16_0_16_134_i0_fu___int32_to_float32e8m23b_127nih_31394_31552\);
  \fu___int32_to_float32e8m23b_127nih_31394_31659\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>4,
    BITSIZE_out1=>5,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_148_i0_fu___int32_to_float32e8m23b_127nih_31394_31659\,
    in1 => unsigned(\out_UUdata_converter_FU_11_i0_fu___int32_to_float32e8m23b_127nih_31394_31656\),
    in2 => out_const_3);
  \fu___int32_to_float32e8m23b_127nih_31394_31662\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>5,
    BITSIZE_in2=>4,
    BITSIZE_out1=>5) port map (out1 => \out_ui_bit_ior_expr_FU_0_8_8_129_i0_fu___int32_to_float32e8m23b_127nih_31394_31662\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_148_i0_fu___int32_to_float32e8m23b_127nih_31394_31659\,
    in2 => \out_ui_lshift_expr_FU_8_0_8_150_i0_fu___int32_to_float32e8m23b_127nih_31394_35379\);
  \fu___int32_to_float32e8m23b_127nih_31394_31665\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>5,
    BITSIZE_in2=>3,
    BITSIZE_out1=>5) port map (out1 => \out_ui_bit_ior_expr_FU_0_8_8_130_i0_fu___int32_to_float32e8m23b_127nih_31394_31665\,
    in1 => \out_ui_bit_ior_expr_FU_0_8_8_129_i0_fu___int32_to_float32e8m23b_127nih_31394_31662\,
    in2 => \out_ui_bit_ior_expr_FU_0_8_8_128_i0_fu___int32_to_float32e8m23b_127nih_31394_31653\);
  \fu___int32_to_float32e8m23b_127nih_31394_31668\ : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>5,
    BITSIZE_out1=>5) port map (out1 => \out_ui_bit_ior_expr_FU_0_8_8_131_i0_fu___int32_to_float32e8m23b_127nih_31394_31668\,
    in1 => unsigned(\out_UUdata_converter_FU_97_i0_fu___int32_to_float32e8m23b_127nih_31394_31638\),
    in2 => \out_ui_bit_ior_expr_FU_0_8_8_130_i0_fu___int32_to_float32e8m23b_127nih_31394_31665\);
  \fu___int32_to_float32e8m23b_127nih_31394_31671\ : UIdata_converter_FU generic map(BITSIZE_in1=>5,
    BITSIZE_out1=>6) port map (out1 => \out_UIdata_converter_FU_98_i0_fu___int32_to_float32e8m23b_127nih_31394_31671\,
    in1 => \out_ui_bit_ior_expr_FU_0_8_8_131_i0_fu___int32_to_float32e8m23b_127nih_31394_31668\);
  \fu___int32_to_float32e8m23b_127nih_31394_31674\ : plus_expr_FU generic map(BITSIZE_in1=>6,
    BITSIZE_in2=>1,
    BITSIZE_out1=>7) port map (out1 => \out_plus_expr_FU_8_0_8_119_i0_fu___int32_to_float32e8m23b_127nih_31394_31674\,
    in1 => \out_UIdata_converter_FU_98_i0_fu___int32_to_float32e8m23b_127nih_31394_31671\,
    in2 => signed(out_const_13));
  \fu___int32_to_float32e8m23b_127nih_31394_31677\ : IIdata_converter_FU generic map(BITSIZE_in1=>7,
    BITSIZE_out1=>7) port map (out1 => \out_IIdata_converter_FU_99_i0_fu___int32_to_float32e8m23b_127nih_31394_31677\,
    in1 => \out_plus_expr_FU_8_0_8_119_i0_fu___int32_to_float32e8m23b_127nih_31394_31674\);
  \fu___int32_to_float32e8m23b_127nih_31394_31680\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>7,
    BITSIZE_out1=>32,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in1 => unsigned(out_reg_1_reg_1),
    in2 => out_reg_2_reg_2);
  \fu___int32_to_float32e8m23b_127nih_31394_31683\ : minus_expr_FU generic map(BITSIZE_in1=>9,
    BITSIZE_in2=>7,
    BITSIZE_out1=>9) port map (out1 => \out_minus_expr_FU_0_8_8_117_i0_fu___int32_to_float32e8m23b_127nih_31394_31683\,
    in1 => signed(out_const_6),
    in2 => \out_IIdata_converter_FU_99_i0_fu___int32_to_float32e8m23b_127nih_31394_31677\);
  \fu___int32_to_float32e8m23b_127nih_31394_31729\ : IUdata_converter_FU generic map(BITSIZE_in1=>9,
    BITSIZE_out1=>8) port map (out1 => \out_IUdata_converter_FU_100_i0_fu___int32_to_float32e8m23b_127nih_31394_31729\,
    in1 => \out_minus_expr_FU_0_8_8_117_i0_fu___int32_to_float32e8m23b_127nih_31394_31683\);
  \fu___int32_to_float32e8m23b_127nih_31394_31732\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_5_i0_fu___int32_to_float32e8m23b_127nih_31394_31732\,
    in1(0) => \out_extract_bit_expr_FU_2_i0_fu___int32_to_float32e8m23b_127nih_31394_35282\);
  \fu___int32_to_float32e8m23b_127nih_31394_31735\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>6,
    BITSIZE_out1=>32,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_137_i0_fu___int32_to_float32e8m23b_127nih_31394_31735\,
    in1 => unsigned(\out_UUdata_converter_FU_5_i0_fu___int32_to_float32e8m23b_127nih_31394_31732\),
    in2 => out_const_12);
  \fu___int32_to_float32e8m23b_127nih_31394_31853\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4,
    BITSIZE_out1=>25,
    PRECISION=>32) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_161_i0_fu___int32_to_float32e8m23b_127nih_31394_31853\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_139_i0_fu___int32_to_float32e8m23b_127nih_31394_33326\,
    in2 => out_const_11);
  \fu___int32_to_float32e8m23b_127nih_31394_31856\ : lut_expr_FU generic map(BITSIZE_in1=>3,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_111_i0_fu___int32_to_float32e8m23b_127nih_31394_31856\,
    in1 => out_const_15,
    in2 => \out_ui_extract_bit_expr_FU_107_i0_fu___int32_to_float32e8m23b_127nih_31394_35545\,
    in3 => \out_lut_expr_FU_110_i0_fu___int32_to_float32e8m23b_127nih_31394_36484\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_31859\ : UIdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>2) port map (out1 => \out_UIdata_converter_FU_112_i0_fu___int32_to_float32e8m23b_127nih_31394_31859\,
    in1 => unsigned(\out_lut_expr_FU_111_i0_fu___int32_to_float32e8m23b_127nih_31394_31856\));
  \fu___int32_to_float32e8m23b_127nih_31394_31862\ : bit_not_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>2) port map (out1 => \out_bit_not_expr_FU_8_8_114_i0_fu___int32_to_float32e8m23b_127nih_31394_31862\,
    in1 => \out_UIdata_converter_FU_112_i0_fu___int32_to_float32e8m23b_127nih_31394_31859\);
  \fu___int32_to_float32e8m23b_127nih_31394_31865\ : IUdata_converter_FU generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>25) port map (out1 => \out_IUdata_converter_FU_113_i0_fu___int32_to_float32e8m23b_127nih_31394_31865\,
    in1 => \out_bit_not_expr_FU_8_8_114_i0_fu___int32_to_float32e8m23b_127nih_31394_31862\);
  \fu___int32_to_float32e8m23b_127nih_31394_31868\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>25,
    BITSIZE_in2=>25,
    BITSIZE_out1=>25) port map (out1 => \out_ui_bit_and_expr_FU_32_32_32_122_i0_fu___int32_to_float32e8m23b_127nih_31394_31868\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_161_i0_fu___int32_to_float32e8m23b_127nih_31394_31853\,
    in2 => \out_IUdata_converter_FU_113_i0_fu___int32_to_float32e8m23b_127nih_31394_31865\);
  \fu___int32_to_float32e8m23b_127nih_31394_31873\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>6,
    BITSIZE_out1=>31,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_138_i0_fu___int32_to_float32e8m23b_127nih_31394_31873\,
    in1 => \out_IUdata_converter_FU_100_i0_fu___int32_to_float32e8m23b_127nih_31394_31729\,
    in2 => out_const_8);
  \fu___int32_to_float32e8m23b_127nih_31394_31878\ : ui_bit_ior_concat_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>25,
    BITSIZE_in3=>5,
    BITSIZE_out1=>32,
    OFFSET_PARAMETER=>31) port map (out1 => \out_ui_bit_ior_concat_expr_FU_126_i0_fu___int32_to_float32e8m23b_127nih_31394_31878\,
    in1 => unsigned(out_reg_3_reg_3),
    in2 => \out_ui_bit_and_expr_FU_32_0_32_120_i0_fu___int32_to_float32e8m23b_127nih_31394_33343\,
    in3 => unsigned(out_const_46));
  \fu___int32_to_float32e8m23b_127nih_31394_31881\ : ui_bit_ior_concat_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>23,
    BITSIZE_in3=>5,
    BITSIZE_out1=>32,
    OFFSET_PARAMETER=>23) port map (out1 => \out_ui_bit_ior_concat_expr_FU_127_i0_fu___int32_to_float32e8m23b_127nih_31394_31881\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_141_i0_fu___int32_to_float32e8m23b_127nih_31394_33372\,
    in2 => \out_ui_bit_and_expr_FU_32_0_32_121_i0_fu___int32_to_float32e8m23b_127nih_31394_33375\,
    in3 => unsigned(out_const_29));
  \fu___int32_to_float32e8m23b_127nih_31394_33017\ : eq_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_eq_expr_FU_32_0_32_115_i0_fu___int32_to_float32e8m23b_127nih_31394_33017\,
    in1 => in_port_a,
    in2 => signed(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_33023\ : eq_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>1) port map (out1 => \out_eq_expr_FU_32_0_32_116_i0_fu___int32_to_float32e8m23b_127nih_31394_33023\,
    in1 => in_port_a,
    in2 => signed(out_const_17));
  \fu___int32_to_float32e8m23b_127nih_31394_33029\ : ui_eq_expr_FU generic map(BITSIZE_in1=>16,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_154_i0_fu___int32_to_float32e8m23b_127nih_31394_31549\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_33031\ : ui_eq_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_135_i3_fu___int32_to_float32e8m23b_127nih_31394_33031\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_155_i0_fu___int32_to_float32e8m23b_127nih_31394_31557\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_33037\ : ui_eq_expr_FU generic map(BITSIZE_in1=>18,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_135_i4_fu___int32_to_float32e8m23b_127nih_31394_33037\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_160_i0_fu___int32_to_float32e8m23b_127nih_31394_31616\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_33051\ : ui_eq_expr_FU generic map(BITSIZE_in1=>25,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => \out_ui_eq_expr_FU_32_0_32_136_i0_fu___int32_to_float32e8m23b_127nih_31394_33051\,
    in1 => \out_ui_bit_and_expr_FU_32_32_32_122_i0_fu___int32_to_float32e8m23b_127nih_31394_31868\,
    in2 => unsigned(out_const_0));
  \fu___int32_to_float32e8m23b_127nih_31394_33241\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>16,
    BITSIZE_in2=>1,
    BITSIZE_out1=>7,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_16_0_16_153_i0_fu___int32_to_float32e8m23b_127nih_31394_33241\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_154_i0_fu___int32_to_float32e8m23b_127nih_31394_31549\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_33246\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>7,
    BITSIZE_in2=>1,
    BITSIZE_out1=>8,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i0_fu___int32_to_float32e8m23b_127nih_31394_33246\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_149_i5_fu___int32_to_float32e8m23b_127nih_31394_36292\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_33249\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>1,
    BITSIZE_out1=>3,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_162_i0_fu___int32_to_float32e8m23b_127nih_31394_33249\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_144_i0_fu___int32_to_float32e8m23b_127nih_31394_36398\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_33254\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>3,
    BITSIZE_in2=>1,
    BITSIZE_out1=>4,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i1_fu___int32_to_float32e8m23b_127nih_31394_33254\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_149_i3_fu___int32_to_float32e8m23b_127nih_31394_35852\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_33319\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3,
    BITSIZE_out1=>26,
    PRECISION=>32) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_163_i0_fu___int32_to_float32e8m23b_127nih_31394_33319\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_31);
  \fu___int32_to_float32e8m23b_127nih_31394_33323\ : ui_plus_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>26,
    BITSIZE_out1=>26) port map (out1 => \out_ui_plus_expr_FU_0_32_32_151_i0_fu___int32_to_float32e8m23b_127nih_31394_33323\,
    in1 => unsigned(out_const_13),
    in2 => \out_ui_rshift_expr_FU_32_0_32_163_i0_fu___int32_to_float32e8m23b_127nih_31394_33319\);
  \fu___int32_to_float32e8m23b_127nih_31394_33326\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>26,
    BITSIZE_in2=>3,
    BITSIZE_out1=>32,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_139_i0_fu___int32_to_float32e8m23b_127nih_31394_33326\,
    in1 => \out_ui_plus_expr_FU_0_32_32_151_i0_fu___int32_to_float32e8m23b_127nih_31394_33323\,
    in2 => out_const_31);
  \fu___int32_to_float32e8m23b_127nih_31394_33334\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>1,
    PRECISION=>32) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_164_i0_fu___int32_to_float32e8m23b_127nih_31394_33334\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_137_i0_fu___int32_to_float32e8m23b_127nih_31394_31735\,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_33339\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>5,
    BITSIZE_out1=>32,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_140_i0_fu___int32_to_float32e8m23b_127nih_31394_33339\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_164_i0_fu___int32_to_float32e8m23b_127nih_31394_33334\,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_33343\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>25,
    BITSIZE_in2=>31,
    BITSIZE_out1=>25) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_120_i0_fu___int32_to_float32e8m23b_127nih_31394_33343\,
    in1 => \out_ui_bit_and_expr_FU_32_32_32_122_i0_fu___int32_to_float32e8m23b_127nih_31394_31868\,
    in2 => unsigned(out_const_52));
  \fu___int32_to_float32e8m23b_127nih_31394_33363\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>9,
    PRECISION=>32) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_165_i0_fu___int32_to_float32e8m23b_127nih_31394_33363\,
    in1 => \out_ui_bit_ior_concat_expr_FU_126_i0_fu___int32_to_float32e8m23b_127nih_31394_31878\,
    in2 => out_const_29);
  \fu___int32_to_float32e8m23b_127nih_31394_33367\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>5,
    BITSIZE_out1=>8,
    PRECISION=>32) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_165_i1_fu___int32_to_float32e8m23b_127nih_31394_33367\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_141_i1_fu___int32_to_float32e8m23b_127nih_31394_35456\,
    in2 => out_const_29);
  \fu___int32_to_float32e8m23b_127nih_31394_33369\ : ui_plus_expr_FU generic map(BITSIZE_in1=>9,
    BITSIZE_in2=>8,
    BITSIZE_out1=>9) port map (out1 => \out_ui_plus_expr_FU_8_8_8_152_i0_fu___int32_to_float32e8m23b_127nih_31394_33369\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_165_i0_fu___int32_to_float32e8m23b_127nih_31394_33363\,
    in2 => \out_ui_rshift_expr_FU_32_0_32_165_i1_fu___int32_to_float32e8m23b_127nih_31394_33367\);
  \fu___int32_to_float32e8m23b_127nih_31394_33372\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>9,
    BITSIZE_in2=>5,
    BITSIZE_out1=>32,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_141_i0_fu___int32_to_float32e8m23b_127nih_31394_33372\,
    in1 => \out_ui_plus_expr_FU_8_8_8_152_i0_fu___int32_to_float32e8m23b_127nih_31394_33369\,
    in2 => out_const_29);
  \fu___int32_to_float32e8m23b_127nih_31394_33375\ : ui_bit_and_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => \out_ui_bit_and_expr_FU_32_0_32_121_i0_fu___int32_to_float32e8m23b_127nih_31394_33375\,
    in1 => \out_ui_bit_ior_concat_expr_FU_126_i0_fu___int32_to_float32e8m23b_127nih_31394_31878\,
    in2 => unsigned(out_const_51));
  \fu___int32_to_float32e8m23b_127nih_31394_35140\ : multi_read_cond_FU generic map(BITSIZE_in1=>1, PORTSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_multi_read_cond_FU_101_i0_fu___int32_to_float32e8m23b_127nih_31394_35140\,
      in1(0 downto 0) => \out_lut_expr_FU_8_i0_fu___int32_to_float32e8m23b_127nih_31394_35169\);
  \fu___int32_to_float32e8m23b_127nih_31394_35143\ : lut_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\,
    in1 => out_const_14,
    in2 => \out_extract_bit_expr_FU_6_i0_fu___int32_to_float32e8m23b_127nih_31394_35213\,
    in3 => \out_eq_expr_FU_32_0_32_116_i0_fu___int32_to_float32e8m23b_127nih_31394_33023\(0),
    in4 => \out_eq_expr_FU_32_0_32_115_i0_fu___int32_to_float32e8m23b_127nih_31394_33017\(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_35160\ : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_12_i0_fu___int32_to_float32e8m23b_127nih_31394_35160\,
    in1 => out_const_16,
    in2 => \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\(0),
    in3 => \out_ui_eq_expr_FU_32_0_32_135_i3_fu___int32_to_float32e8m23b_127nih_31394_33031\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_35166\ : lut_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_13_i0_fu___int32_to_float32e8m23b_127nih_31394_35166\,
    in1 => out_const_14,
    in2 => \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\(0),
    in3 => \out_ui_eq_expr_FU_32_0_32_135_i3_fu___int32_to_float32e8m23b_127nih_31394_33031\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_35169\ : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_8_i0_fu___int32_to_float32e8m23b_127nih_31394_35169\,
    in1 => out_const_13,
    in2 => \out_eq_expr_FU_32_0_32_116_i0_fu___int32_to_float32e8m23b_127nih_31394_33023\(0),
    in3 => \out_eq_expr_FU_32_0_32_115_i0_fu___int32_to_float32e8m23b_127nih_31394_33017\(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_35171\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>32,
    BITSIZE_out1=>32) port map (out1 => \out_ui_cond_expr_FU_32_32_32_32_132_i0_fu___int32_to_float32e8m23b_127nih_31394_35171\,
    in1 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\,
    in2 => \out_IUdata_converter_FU_4_i0_fu___int32_to_float32e8m23b_127nih_31394_31529\,
    in3 => \out_IUdata_converter_FU_3_i0_fu___int32_to_float32e8m23b_127nih_31394_31532\);
  \fu___int32_to_float32e8m23b_127nih_31394_35177\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>6,
    BITSIZE_in3=>6,
    BITSIZE_out1=>6) port map (out1 => \out_ui_cond_expr_FU_8_8_8_8_133_i0_fu___int32_to_float32e8m23b_127nih_31394_35177\,
    in1 => \out_lut_expr_FU_12_i0_fu___int32_to_float32e8m23b_127nih_31394_35160\,
    in2 => \out_ui_rshift_expr_FU_8_0_8_167_i5_fu___int32_to_float32e8m23b_127nih_31394_36153\,
    in3 => \out_ui_rshift_expr_FU_8_0_8_167_i6_fu___int32_to_float32e8m23b_127nih_31394_36157\);
  \fu___int32_to_float32e8m23b_127nih_31394_35185\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_in3=>18,
    BITSIZE_out1=>18) port map (out1 => \out_ui_cond_expr_FU_32_32_32_32_132_i1_fu___int32_to_float32e8m23b_127nih_31394_35185\,
    in1 => \out_lut_expr_FU_49_i0_fu___int32_to_float32e8m23b_127nih_31394_35205\,
    in2 => \out_ui_rshift_expr_FU_8_0_8_167_i3_fu___int32_to_float32e8m23b_127nih_31394_35769\,
    in3 => \out_ui_rshift_expr_FU_32_0_32_162_i2_fu___int32_to_float32e8m23b_127nih_31394_35772\);
  \fu___int32_to_float32e8m23b_127nih_31394_35187\ : lut_expr_FU generic map(BITSIZE_in1=>59,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_96_i0_fu___int32_to_float32e8m23b_127nih_31394_35187\,
    in1 => out_const_19,
    in2 => \out_ui_eq_expr_FU_32_0_32_135_i4_fu___int32_to_float32e8m23b_127nih_31394_33037\(0),
    in3 => \out_lut_expr_FU_49_i0_fu___int32_to_float32e8m23b_127nih_31394_35205\(0),
    in4 => \out_lut_expr_FU_86_i0_fu___int32_to_float32e8m23b_127nih_31394_36537\(0),
    in5 => \out_lut_expr_FU_89_i0_fu___int32_to_float32e8m23b_127nih_31394_36546\(0),
    in6 => \out_lut_expr_FU_92_i0_fu___int32_to_float32e8m23b_127nih_31394_36555\(0),
    in7 => \out_lut_expr_FU_95_i0_fu___int32_to_float32e8m23b_127nih_31394_36564\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_35189\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1,
    BITSIZE_in3=>8,
    BITSIZE_out1=>8) port map (out1 => \out_ui_cond_expr_FU_8_8_8_8_133_i1_fu___int32_to_float32e8m23b_127nih_31394_35189\,
    in1 => \out_ui_eq_expr_FU_32_0_32_136_i0_fu___int32_to_float32e8m23b_127nih_31394_33051\,
    in2 => unsigned(out_const_0),
    in3 => unsigned(out_reg_4_reg_4));
  \fu___int32_to_float32e8m23b_127nih_31394_35192\ : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_34_i0_fu___int32_to_float32e8m23b_127nih_31394_35192\,
    in1 => out_const_42,
    in2 => \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\(0),
    in3 => \out_lut_expr_FU_31_i0_fu___int32_to_float32e8m23b_127nih_31394_36505\(0),
    in4 => \out_lut_expr_FU_33_i0_fu___int32_to_float32e8m23b_127nih_31394_36511\(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_35195\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>24,
    BITSIZE_in3=>8,
    BITSIZE_out1=>24) port map (out1 => \out_ui_cond_expr_FU_32_32_32_32_132_i2_fu___int32_to_float32e8m23b_127nih_31394_35195\,
    in1 => \out_lut_expr_FU_13_i0_fu___int32_to_float32e8m23b_127nih_31394_35166\,
    in2 => \out_ui_rshift_expr_FU_32_0_32_155_i0_fu___int32_to_float32e8m23b_127nih_31394_31557\,
    in3 => \out_ui_lshift_expr_FU_8_0_8_149_i2_fu___int32_to_float32e8m23b_127nih_31394_35336\);
  \fu___int32_to_float32e8m23b_127nih_31394_35203\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>22,
    BITSIZE_in3=>6,
    BITSIZE_out1=>22) port map (out1 => \out_ui_cond_expr_FU_32_32_32_32_132_i3_fu___int32_to_float32e8m23b_127nih_31394_35203\,
    in1 => \out_lut_expr_FU_34_i0_fu___int32_to_float32e8m23b_127nih_31394_35192\,
    in2 => \out_ui_rshift_expr_FU_32_0_32_166_i0_fu___int32_to_float32e8m23b_127nih_31394_36390\,
    in3 => \out_ui_rshift_expr_FU_8_0_8_168_i0_fu___int32_to_float32e8m23b_127nih_31394_36394\);
  \fu___int32_to_float32e8m23b_127nih_31394_35205\ : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_49_i0_fu___int32_to_float32e8m23b_127nih_31394_35205\,
    in1 => out_const_38,
    in2 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in3 => \out_lut_expr_FU_47_i0_fu___int32_to_float32e8m23b_127nih_31394_36522\(0),
    in4 => \out_lut_expr_FU_48_i0_fu___int32_to_float32e8m23b_127nih_31394_36525\(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_35207\ : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \out_UUdata_converter_FU_37_i0_fu___int32_to_float32e8m23b_127nih_31394_35207\,
    in1 => \out_lut_expr_FU_36_i0_fu___int32_to_float32e8m23b_127nih_31394_36427\);
  \fu___int32_to_float32e8m23b_127nih_31394_35210\ : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1,
    BITSIZE_in3=>8,
    BITSIZE_out1=>8) port map (out1 => \out_ui_cond_expr_FU_8_8_8_8_133_i2_fu___int32_to_float32e8m23b_127nih_31394_35210\,
    in1 => \out_eq_expr_FU_32_0_32_115_i0_fu___int32_to_float32e8m23b_127nih_31394_33017\,
    in2 => unsigned(out_const_0),
    in3 => unsigned(out_const_34));
  \fu___int32_to_float32e8m23b_127nih_31394_35213\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_6_i0_fu___int32_to_float32e8m23b_127nih_31394_35213\,
    in1 => in_port_a,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_35282\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_2_i0_fu___int32_to_float32e8m23b_127nih_31394_35282\,
    in1 => in_port_a,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_35326\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>5,
    BITSIZE_out1=>32,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_142_i0_fu___int32_to_float32e8m23b_127nih_31394_35326\,
    in1 => \out_ui_cond_expr_FU_8_8_8_8_133_i2_fu___int32_to_float32e8m23b_127nih_31394_35210\,
    in2 => out_const_32);
  \fu___int32_to_float32e8m23b_127nih_31394_35329\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>1,
    BITSIZE_out1=>7,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i0_fu___int32_to_float32e8m23b_127nih_31394_35329\,
    in1 => unsigned(\out_UUdata_converter_FU_10_i0_fu___int32_to_float32e8m23b_127nih_31394_31576\),
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35332\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>1,
    BITSIZE_out1=>7,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i1_fu___int32_to_float32e8m23b_127nih_31394_35332\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_149_i0_fu___int32_to_float32e8m23b_127nih_31394_33246\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35336\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>7,
    BITSIZE_in2=>1,
    BITSIZE_out1=>8,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i2_fu___int32_to_float32e8m23b_127nih_31394_35336\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_149_i4_fu___int32_to_float32e8m23b_127nih_31394_36161\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35379\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>2,
    BITSIZE_out1=>4,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_150_i0_fu___int32_to_float32e8m23b_127nih_31394_35379\,
    in1 => unsigned(\out_UUdata_converter_FU_37_i0_fu___int32_to_float32e8m23b_127nih_31394_35207\),
    in2 => out_const_30);
  \fu___int32_to_float32e8m23b_127nih_31394_35398\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_in2=>1,
    BITSIZE_out1=>3,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i2_fu___int32_to_float32e8m23b_127nih_31394_35398\,
    in1 => \out_ui_lshift_expr_FU_8_0_8_149_i1_fu___int32_to_float32e8m23b_127nih_31394_33254\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35401\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>20,
    BITSIZE_in2=>1,
    BITSIZE_out1=>19,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_162_i1_fu___int32_to_float32e8m23b_127nih_31394_35401\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_157_i1_fu___int32_to_float32e8m23b_127nih_31394_31611\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35405\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>19,
    BITSIZE_in2=>1,
    BITSIZE_out1=>20,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_143_i0_fu___int32_to_float32e8m23b_127nih_31394_35405\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_143_i1_fu___int32_to_float32e8m23b_127nih_31394_35777\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35452\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>5,
    BITSIZE_out1=>8,
    PRECISION=>32) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_165_i2_fu___int32_to_float32e8m23b_127nih_31394_35452\,
    in1 => \out_ui_lshift_expr_FU_32_0_32_138_i0_fu___int32_to_float32e8m23b_127nih_31394_31873\,
    in2 => out_const_29);
  \fu___int32_to_float32e8m23b_127nih_31394_35456\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>5,
    BITSIZE_out1=>31,
    PRECISION=>32) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_141_i1_fu___int32_to_float32e8m23b_127nih_31394_35456\,
    in1 => \out_ui_cond_expr_FU_8_8_8_8_133_i1_fu___int32_to_float32e8m23b_127nih_31394_35189\,
    in2 => out_const_29);
  \fu___int32_to_float32e8m23b_127nih_31394_35529\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>1) port map (out1 => \out_ui_extract_bit_expr_FU_103_i0_fu___int32_to_float32e8m23b_127nih_31394_35529\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_0);
  \fu___int32_to_float32e8m23b_127nih_31394_35533\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>1) port map (out1 => \out_ui_extract_bit_expr_FU_104_i0_fu___int32_to_float32e8m23b_127nih_31394_35533\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35537\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>2) port map (out1 => \out_ui_extract_bit_expr_FU_105_i0_fu___int32_to_float32e8m23b_127nih_31394_35537\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_14);
  \fu___int32_to_float32e8m23b_127nih_31394_35541\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>2) port map (out1 => \out_ui_extract_bit_expr_FU_106_i0_fu___int32_to_float32e8m23b_127nih_31394_35541\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_30);
  \fu___int32_to_float32e8m23b_127nih_31394_35545\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3) port map (out1 => \out_ui_extract_bit_expr_FU_107_i0_fu___int32_to_float32e8m23b_127nih_31394_35545\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_15);
  \fu___int32_to_float32e8m23b_127nih_31394_35549\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3) port map (out1 => \out_ui_extract_bit_expr_FU_108_i0_fu___int32_to_float32e8m23b_127nih_31394_35549\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_23);
  \fu___int32_to_float32e8m23b_127nih_31394_35553\ : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3) port map (out1 => \out_ui_extract_bit_expr_FU_109_i0_fu___int32_to_float32e8m23b_127nih_31394_35553\,
    in1 => \out_ui_lshift_expr_FU_32_32_32_145_i0_fu___int32_to_float32e8m23b_127nih_31394_31680\,
    in2 => out_const_31);
  \fu___int32_to_float32e8m23b_127nih_31394_35657\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_14_i0_fu___int32_to_float32e8m23b_127nih_31394_35657\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_32);
  \fu___int32_to_float32e8m23b_127nih_31394_35661\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_15_i0_fu___int32_to_float32e8m23b_127nih_31394_35661\,
    in1 => in_port_a,
    in2 => out_const_32);
  \fu___int32_to_float32e8m23b_127nih_31394_35665\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_16_i0_fu___int32_to_float32e8m23b_127nih_31394_35665\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_33);
  \fu___int32_to_float32e8m23b_127nih_31394_35669\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_17_i0_fu___int32_to_float32e8m23b_127nih_31394_35669\,
    in1 => in_port_a,
    in2 => out_const_33);
  \fu___int32_to_float32e8m23b_127nih_31394_35673\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_18_i0_fu___int32_to_float32e8m23b_127nih_31394_35673\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_36);
  \fu___int32_to_float32e8m23b_127nih_31394_35677\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_19_i0_fu___int32_to_float32e8m23b_127nih_31394_35677\,
    in1 => in_port_a,
    in2 => out_const_36);
  \fu___int32_to_float32e8m23b_127nih_31394_35681\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_20_i0_fu___int32_to_float32e8m23b_127nih_31394_35681\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_37);
  \fu___int32_to_float32e8m23b_127nih_31394_35685\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_21_i0_fu___int32_to_float32e8m23b_127nih_31394_35685\,
    in1 => in_port_a,
    in2 => out_const_37);
  \fu___int32_to_float32e8m23b_127nih_31394_35689\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_22_i0_fu___int32_to_float32e8m23b_127nih_31394_35689\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_40);
  \fu___int32_to_float32e8m23b_127nih_31394_35693\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_23_i0_fu___int32_to_float32e8m23b_127nih_31394_35693\,
    in1 => in_port_a,
    in2 => out_const_40);
  \fu___int32_to_float32e8m23b_127nih_31394_35697\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_24_i0_fu___int32_to_float32e8m23b_127nih_31394_35697\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_41);
  \fu___int32_to_float32e8m23b_127nih_31394_35701\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_25_i0_fu___int32_to_float32e8m23b_127nih_31394_35701\,
    in1 => in_port_a,
    in2 => out_const_41);
  \fu___int32_to_float32e8m23b_127nih_31394_35705\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_26_i0_fu___int32_to_float32e8m23b_127nih_31394_35705\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_44);
  \fu___int32_to_float32e8m23b_127nih_31394_35709\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_27_i0_fu___int32_to_float32e8m23b_127nih_31394_35709\,
    in1 => in_port_a,
    in2 => out_const_44);
  \fu___int32_to_float32e8m23b_127nih_31394_35713\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_28_i0_fu___int32_to_float32e8m23b_127nih_31394_35713\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_35717\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_29_i0_fu___int32_to_float32e8m23b_127nih_31394_35717\,
    in1 => in_port_a,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_35721\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_38_i0_fu___int32_to_float32e8m23b_127nih_31394_35721\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_40);
  \fu___int32_to_float32e8m23b_127nih_31394_35725\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_39_i0_fu___int32_to_float32e8m23b_127nih_31394_35725\,
    in1 => in_port_a,
    in2 => out_const_40);
  \fu___int32_to_float32e8m23b_127nih_31394_35729\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_40_i0_fu___int32_to_float32e8m23b_127nih_31394_35729\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_41);
  \fu___int32_to_float32e8m23b_127nih_31394_35733\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_41_i0_fu___int32_to_float32e8m23b_127nih_31394_35733\,
    in1 => in_port_a,
    in2 => out_const_41);
  \fu___int32_to_float32e8m23b_127nih_31394_35737\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_42_i0_fu___int32_to_float32e8m23b_127nih_31394_35737\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_44);
  \fu___int32_to_float32e8m23b_127nih_31394_35741\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_43_i0_fu___int32_to_float32e8m23b_127nih_31394_35741\,
    in1 => in_port_a,
    in2 => out_const_44);
  \fu___int32_to_float32e8m23b_127nih_31394_35745\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_44_i0_fu___int32_to_float32e8m23b_127nih_31394_35745\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_35749\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_45_i0_fu___int32_to_float32e8m23b_127nih_31394_35749\,
    in1 => in_port_a,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_35769\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>3,
    BITSIZE_in2=>1,
    BITSIZE_out1=>2,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i3_fu___int32_to_float32e8m23b_127nih_31394_35769\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_167_i2_fu___int32_to_float32e8m23b_127nih_31394_35398\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35772\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>19,
    BITSIZE_in2=>1,
    BITSIZE_out1=>18,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_162_i2_fu___int32_to_float32e8m23b_127nih_31394_35772\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_162_i1_fu___int32_to_float32e8m23b_127nih_31394_35401\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35777\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>18,
    BITSIZE_in2=>1,
    BITSIZE_out1=>19,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_143_i1_fu___int32_to_float32e8m23b_127nih_31394_35777\,
    in1 => \out_ui_cond_expr_FU_32_32_32_32_132_i1_fu___int32_to_float32e8m23b_127nih_31394_35185\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35848\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>3,
    BITSIZE_in2=>1,
    BITSIZE_out1=>2,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i4_fu___int32_to_float32e8m23b_127nih_31394_35848\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_162_i0_fu___int32_to_float32e8m23b_127nih_31394_33249\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35852\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>1,
    BITSIZE_out1=>3,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i3_fu___int32_to_float32e8m23b_127nih_31394_35852\,
    in1 => \out_ui_bit_and_expr_FU_8_0_8_125_i0_fu___int32_to_float32e8m23b_127nih_31394_31608\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_35980\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_65_i0_fu___int32_to_float32e8m23b_127nih_31394_35980\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_35984\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_66_i0_fu___int32_to_float32e8m23b_127nih_31394_35984\,
    in1 => in_port_a,
    in2 => out_const_46);
  \fu___int32_to_float32e8m23b_127nih_31394_36015\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_81_i0_fu___int32_to_float32e8m23b_127nih_31394_36015\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_41);
  \fu___int32_to_float32e8m23b_127nih_31394_36019\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_82_i0_fu___int32_to_float32e8m23b_127nih_31394_36019\,
    in1 => in_port_a,
    in2 => out_const_41);
  \fu___int32_to_float32e8m23b_127nih_31394_36041\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_59_i0_fu___int32_to_float32e8m23b_127nih_31394_36041\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_43);
  \fu___int32_to_float32e8m23b_127nih_31394_36045\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_60_i0_fu___int32_to_float32e8m23b_127nih_31394_36045\,
    in1 => in_port_a,
    in2 => out_const_43);
  \fu___int32_to_float32e8m23b_127nih_31394_36075\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_75_i0_fu___int32_to_float32e8m23b_127nih_31394_36075\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_35);
  \fu___int32_to_float32e8m23b_127nih_31394_36079\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_76_i0_fu___int32_to_float32e8m23b_127nih_31394_36079\,
    in1 => in_port_a,
    in2 => out_const_35);
  \fu___int32_to_float32e8m23b_127nih_31394_36106\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_57_i0_fu___int32_to_float32e8m23b_127nih_31394_36106\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_37);
  \fu___int32_to_float32e8m23b_127nih_31394_36110\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_58_i0_fu___int32_to_float32e8m23b_127nih_31394_36110\,
    in1 => in_port_a,
    in2 => out_const_37);
  \fu___int32_to_float32e8m23b_127nih_31394_36137\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_73_i0_fu___int32_to_float32e8m23b_127nih_31394_36137\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_33);
  \fu___int32_to_float32e8m23b_127nih_31394_36141\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_74_i0_fu___int32_to_float32e8m23b_127nih_31394_36141\,
    in1 => in_port_a,
    in2 => out_const_33);
  \fu___int32_to_float32e8m23b_127nih_31394_36153\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>7,
    BITSIZE_in2=>1,
    BITSIZE_out1=>6,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i5_fu___int32_to_float32e8m23b_127nih_31394_36153\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_167_i0_fu___int32_to_float32e8m23b_127nih_31394_35329\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_36157\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>7,
    BITSIZE_in2=>1,
    BITSIZE_out1=>6,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i6_fu___int32_to_float32e8m23b_127nih_31394_36157\,
    in1 => \out_ui_rshift_expr_FU_8_0_8_167_i1_fu___int32_to_float32e8m23b_127nih_31394_35332\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_36161\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>6,
    BITSIZE_in2=>1,
    BITSIZE_out1=>7,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i4_fu___int32_to_float32e8m23b_127nih_31394_36161\,
    in1 => \out_ui_cond_expr_FU_8_8_8_8_133_i0_fu___int32_to_float32e8m23b_127nih_31394_35177\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_36164\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_51_i0_fu___int32_to_float32e8m23b_127nih_31394_36164\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_28);
  \fu___int32_to_float32e8m23b_127nih_31394_36168\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_52_i0_fu___int32_to_float32e8m23b_127nih_31394_36168\,
    in1 => in_port_a,
    in2 => out_const_28);
  \fu___int32_to_float32e8m23b_127nih_31394_36191\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_67_i0_fu___int32_to_float32e8m23b_127nih_31394_36191\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_21);
  \fu___int32_to_float32e8m23b_127nih_31394_36195\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4) port map (out1 => \out_extract_bit_expr_FU_68_i0_fu___int32_to_float32e8m23b_127nih_31394_36195\,
    in1 => in_port_a,
    in2 => out_const_21);
  \fu___int32_to_float32e8m23b_127nih_31394_36226\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3) port map (out1 => \out_extract_bit_expr_FU_61_i0_fu___int32_to_float32e8m23b_127nih_31394_36226\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_39);
  \fu___int32_to_float32e8m23b_127nih_31394_36230\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3) port map (out1 => \out_extract_bit_expr_FU_62_i0_fu___int32_to_float32e8m23b_127nih_31394_36230\,
    in1 => in_port_a,
    in2 => out_const_39);
  \fu___int32_to_float32e8m23b_127nih_31394_36246\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3) port map (out1 => \out_extract_bit_expr_FU_77_i0_fu___int32_to_float32e8m23b_127nih_31394_36246\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_23);
  \fu___int32_to_float32e8m23b_127nih_31394_36250\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3) port map (out1 => \out_extract_bit_expr_FU_78_i0_fu___int32_to_float32e8m23b_127nih_31394_36250\,
    in1 => in_port_a,
    in2 => out_const_23);
  \fu___int32_to_float32e8m23b_127nih_31394_36288\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>7,
    BITSIZE_in2=>1,
    BITSIZE_out1=>6,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_167_i7_fu___int32_to_float32e8m23b_127nih_31394_36288\,
    in1 => \out_ui_rshift_expr_FU_16_0_16_153_i0_fu___int32_to_float32e8m23b_127nih_31394_33241\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_36292\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>6,
    BITSIZE_in2=>1,
    BITSIZE_out1=>7,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_8_0_8_149_i5_fu___int32_to_float32e8m23b_127nih_31394_36292\,
    in1 => \out_ui_bit_and_expr_FU_8_0_8_124_i0_fu___int32_to_float32e8m23b_127nih_31394_31585\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_36295\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>2) port map (out1 => \out_extract_bit_expr_FU_53_i0_fu___int32_to_float32e8m23b_127nih_31394_36295\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_30);
  \fu___int32_to_float32e8m23b_127nih_31394_36299\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>2) port map (out1 => \out_extract_bit_expr_FU_54_i0_fu___int32_to_float32e8m23b_127nih_31394_36299\,
    in1 => in_port_a,
    in2 => out_const_30);
  \fu___int32_to_float32e8m23b_127nih_31394_36315\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_69_i0_fu___int32_to_float32e8m23b_127nih_31394_36315\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_36319\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>1) port map (out1 => \out_extract_bit_expr_FU_70_i0_fu___int32_to_float32e8m23b_127nih_31394_36319\,
    in1 => in_port_a,
    in2 => out_const_13);
  \fu___int32_to_float32e8m23b_127nih_31394_36339\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_63_i0_fu___int32_to_float32e8m23b_127nih_31394_36339\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_29);
  \fu___int32_to_float32e8m23b_127nih_31394_36343\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_64_i0_fu___int32_to_float32e8m23b_127nih_31394_36343\,
    in1 => in_port_a,
    in2 => out_const_29);
  \fu___int32_to_float32e8m23b_127nih_31394_36351\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_79_i0_fu___int32_to_float32e8m23b_127nih_31394_36351\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_25);
  \fu___int32_to_float32e8m23b_127nih_31394_36355\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_80_i0_fu___int32_to_float32e8m23b_127nih_31394_36355\,
    in1 => in_port_a,
    in2 => out_const_25);
  \fu___int32_to_float32e8m23b_127nih_31394_36373\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_55_i0_fu___int32_to_float32e8m23b_127nih_31394_36373\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_22);
  \fu___int32_to_float32e8m23b_127nih_31394_36377\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_56_i0_fu___int32_to_float32e8m23b_127nih_31394_36377\,
    in1 => in_port_a,
    in2 => out_const_22);
  \fu___int32_to_float32e8m23b_127nih_31394_36381\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_71_i0_fu___int32_to_float32e8m23b_127nih_31394_36381\,
    in1 => \out_negate_expr_FU_32_32_118_i0_fu___int32_to_float32e8m23b_127nih_31394_31526\,
    in2 => out_const_20);
  \fu___int32_to_float32e8m23b_127nih_31394_36385\ : extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => \out_extract_bit_expr_FU_72_i0_fu___int32_to_float32e8m23b_127nih_31394_36385\,
    in1 => in_port_a,
    in2 => out_const_20);
  \fu___int32_to_float32e8m23b_127nih_31394_36390\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>2,
    BITSIZE_out1=>22,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_32_0_32_166_i0_fu___int32_to_float32e8m23b_127nih_31394_36390\,
    in1 => \out_ui_cond_expr_FU_32_32_32_32_132_i2_fu___int32_to_float32e8m23b_127nih_31394_35195\,
    in2 => out_const_14);
  \fu___int32_to_float32e8m23b_127nih_31394_36394\ : ui_rshift_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>2,
    BITSIZE_out1=>6,
    PRECISION=>64) port map (out1 => \out_ui_rshift_expr_FU_8_0_8_168_i0_fu___int32_to_float32e8m23b_127nih_31394_36394\,
    in1 => \out_ui_rshift_expr_FU_32_0_32_156_i0_fu___int32_to_float32e8m23b_127nih_31394_31562\,
    in2 => out_const_14);
  \fu___int32_to_float32e8m23b_127nih_31394_36398\ : ui_lshift_expr_FU generic map(BITSIZE_in1=>22,
    BITSIZE_in2=>2,
    BITSIZE_out1=>24,
    PRECISION=>64) port map (out1 => \out_ui_lshift_expr_FU_32_0_32_144_i0_fu___int32_to_float32e8m23b_127nih_31394_36398\,
    in1 => \out_ui_cond_expr_FU_32_32_32_32_132_i3_fu___int32_to_float32e8m23b_127nih_31394_35203\,
    in2 => out_const_14);
  \fu___int32_to_float32e8m23b_127nih_31394_36427\ : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_36_i0_fu___int32_to_float32e8m23b_127nih_31394_36427\,
    in1 => out_const_35,
    in2 => \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\(0),
    in3 => \out_ui_eq_expr_FU_32_0_32_135_i3_fu___int32_to_float32e8m23b_127nih_31394_33031\(0),
    in4 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36484\ : lut_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_110_i0_fu___int32_to_float32e8m23b_127nih_31394_36484\,
    in1 => out_const_18,
    in2 => \out_ui_extract_bit_expr_FU_103_i0_fu___int32_to_float32e8m23b_127nih_31394_35529\,
    in3 => \out_ui_extract_bit_expr_FU_104_i0_fu___int32_to_float32e8m23b_127nih_31394_35533\,
    in4 => \out_ui_extract_bit_expr_FU_105_i0_fu___int32_to_float32e8m23b_127nih_31394_35537\,
    in5 => \out_ui_extract_bit_expr_FU_106_i0_fu___int32_to_float32e8m23b_127nih_31394_35541\,
    in6 => \out_ui_extract_bit_expr_FU_108_i0_fu___int32_to_float32e8m23b_127nih_31394_35549\,
    in7 => \out_ui_extract_bit_expr_FU_109_i0_fu___int32_to_float32e8m23b_127nih_31394_35553\,
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36502\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_30_i0_fu___int32_to_float32e8m23b_127nih_31394_36502\,
    in1 => out_const_47,
    in2 => \out_extract_bit_expr_FU_18_i0_fu___int32_to_float32e8m23b_127nih_31394_35673\,
    in3 => \out_extract_bit_expr_FU_19_i0_fu___int32_to_float32e8m23b_127nih_31394_35677\,
    in4 => \out_extract_bit_expr_FU_20_i0_fu___int32_to_float32e8m23b_127nih_31394_35681\,
    in5 => \out_extract_bit_expr_FU_21_i0_fu___int32_to_float32e8m23b_127nih_31394_35685\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36505\ : lut_expr_FU generic map(BITSIZE_in1=>27,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_31_i0_fu___int32_to_float32e8m23b_127nih_31394_36505\,
    in1 => out_const_24,
    in2 => \out_extract_bit_expr_FU_14_i0_fu___int32_to_float32e8m23b_127nih_31394_35657\,
    in3 => \out_extract_bit_expr_FU_15_i0_fu___int32_to_float32e8m23b_127nih_31394_35661\,
    in4 => \out_extract_bit_expr_FU_16_i0_fu___int32_to_float32e8m23b_127nih_31394_35665\,
    in5 => \out_extract_bit_expr_FU_17_i0_fu___int32_to_float32e8m23b_127nih_31394_35669\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => \out_lut_expr_FU_30_i0_fu___int32_to_float32e8m23b_127nih_31394_36502\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36508\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_32_i0_fu___int32_to_float32e8m23b_127nih_31394_36508\,
    in1 => out_const_47,
    in2 => \out_extract_bit_expr_FU_26_i0_fu___int32_to_float32e8m23b_127nih_31394_35705\,
    in3 => \out_extract_bit_expr_FU_27_i0_fu___int32_to_float32e8m23b_127nih_31394_35709\,
    in4 => \out_extract_bit_expr_FU_28_i0_fu___int32_to_float32e8m23b_127nih_31394_35713\,
    in5 => \out_extract_bit_expr_FU_29_i0_fu___int32_to_float32e8m23b_127nih_31394_35717\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36511\ : lut_expr_FU generic map(BITSIZE_in1=>27,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_33_i0_fu___int32_to_float32e8m23b_127nih_31394_36511\,
    in1 => out_const_24,
    in2 => \out_extract_bit_expr_FU_22_i0_fu___int32_to_float32e8m23b_127nih_31394_35689\,
    in3 => \out_extract_bit_expr_FU_23_i0_fu___int32_to_float32e8m23b_127nih_31394_35693\,
    in4 => \out_extract_bit_expr_FU_24_i0_fu___int32_to_float32e8m23b_127nih_31394_35697\,
    in5 => \out_extract_bit_expr_FU_25_i0_fu___int32_to_float32e8m23b_127nih_31394_35701\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => \out_lut_expr_FU_32_i0_fu___int32_to_float32e8m23b_127nih_31394_36508\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36515\ : lut_expr_FU generic map(BITSIZE_in1=>5,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\,
    in1 => out_const_25,
    in2 => \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\(0),
    in3 => \out_lut_expr_FU_31_i0_fu___int32_to_float32e8m23b_127nih_31394_36505\(0),
    in4 => \out_lut_expr_FU_33_i0_fu___int32_to_float32e8m23b_127nih_31394_36511\(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36519\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_46_i0_fu___int32_to_float32e8m23b_127nih_31394_36519\,
    in1 => out_const_47,
    in2 => \out_extract_bit_expr_FU_38_i0_fu___int32_to_float32e8m23b_127nih_31394_35721\,
    in3 => \out_extract_bit_expr_FU_39_i0_fu___int32_to_float32e8m23b_127nih_31394_35725\,
    in4 => \out_extract_bit_expr_FU_40_i0_fu___int32_to_float32e8m23b_127nih_31394_35729\,
    in5 => \out_extract_bit_expr_FU_41_i0_fu___int32_to_float32e8m23b_127nih_31394_35733\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36522\ : lut_expr_FU generic map(BITSIZE_in1=>27,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_47_i0_fu___int32_to_float32e8m23b_127nih_31394_36522\,
    in1 => out_const_24,
    in2 => \out_extract_bit_expr_FU_42_i0_fu___int32_to_float32e8m23b_127nih_31394_35737\,
    in3 => \out_extract_bit_expr_FU_43_i0_fu___int32_to_float32e8m23b_127nih_31394_35741\,
    in4 => \out_extract_bit_expr_FU_44_i0_fu___int32_to_float32e8m23b_127nih_31394_35745\,
    in5 => \out_extract_bit_expr_FU_45_i0_fu___int32_to_float32e8m23b_127nih_31394_35749\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => \out_lut_expr_FU_46_i0_fu___int32_to_float32e8m23b_127nih_31394_36519\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36525\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_48_i0_fu___int32_to_float32e8m23b_127nih_31394_36525\,
    in1 => out_const_45,
    in2 => \out_ui_eq_expr_FU_16_0_16_134_i2_fu___int32_to_float32e8m23b_127nih_31394_33029\(0),
    in3 => \out_ui_eq_expr_FU_32_0_32_135_i3_fu___int32_to_float32e8m23b_127nih_31394_33031\(0),
    in4 => \out_ui_eq_expr_FU_32_0_32_135_i0_fu___int32_to_float32e8m23b_127nih_31394_31570\(0),
    in5 => \out_ui_eq_expr_FU_16_0_16_134_i1_fu___int32_to_float32e8m23b_127nih_31394_31582\(0),
    in6 => \out_ui_eq_expr_FU_32_0_32_135_i1_fu___int32_to_float32e8m23b_127nih_31394_31593\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36529\ : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_84_i0_fu___int32_to_float32e8m23b_127nih_31394_36529\,
    in1 => out_const_26,
    in2 => \out_extract_bit_expr_FU_53_i0_fu___int32_to_float32e8m23b_127nih_31394_36295\,
    in3 => \out_extract_bit_expr_FU_54_i0_fu___int32_to_float32e8m23b_127nih_31394_36299\,
    in4 => \out_extract_bit_expr_FU_55_i0_fu___int32_to_float32e8m23b_127nih_31394_36373\,
    in5 => \out_extract_bit_expr_FU_56_i0_fu___int32_to_float32e8m23b_127nih_31394_36377\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => \out_lut_expr_FU_12_i0_fu___int32_to_float32e8m23b_127nih_31394_35160\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36533\ : lut_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_85_i0_fu___int32_to_float32e8m23b_127nih_31394_36533\,
    in1 => out_const_27,
    in2 => \out_extract_bit_expr_FU_51_i0_fu___int32_to_float32e8m23b_127nih_31394_36164\,
    in3 => \out_extract_bit_expr_FU_52_i0_fu___int32_to_float32e8m23b_127nih_31394_36168\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_13_i0_fu___int32_to_float32e8m23b_127nih_31394_35166\(0),
    in6 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in7 => \out_lut_expr_FU_84_i0_fu___int32_to_float32e8m23b_127nih_31394_36529\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36537\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_86_i0_fu___int32_to_float32e8m23b_127nih_31394_36537\,
    in1 => out_const_50,
    in2 => \out_extract_bit_expr_FU_57_i0_fu___int32_to_float32e8m23b_127nih_31394_36106\,
    in3 => \out_extract_bit_expr_FU_58_i0_fu___int32_to_float32e8m23b_127nih_31394_36110\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in6 => \out_lut_expr_FU_85_i0_fu___int32_to_float32e8m23b_127nih_31394_36533\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36540\ : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_87_i0_fu___int32_to_float32e8m23b_127nih_31394_36540\,
    in1 => out_const_26,
    in2 => \out_extract_bit_expr_FU_61_i0_fu___int32_to_float32e8m23b_127nih_31394_36226\,
    in3 => \out_extract_bit_expr_FU_62_i0_fu___int32_to_float32e8m23b_127nih_31394_36230\,
    in4 => \out_extract_bit_expr_FU_63_i0_fu___int32_to_float32e8m23b_127nih_31394_36339\,
    in5 => \out_extract_bit_expr_FU_64_i0_fu___int32_to_float32e8m23b_127nih_31394_36343\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => \out_lut_expr_FU_12_i0_fu___int32_to_float32e8m23b_127nih_31394_35160\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36543\ : lut_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_88_i0_fu___int32_to_float32e8m23b_127nih_31394_36543\,
    in1 => out_const_27,
    in2 => \out_extract_bit_expr_FU_59_i0_fu___int32_to_float32e8m23b_127nih_31394_36041\,
    in3 => \out_extract_bit_expr_FU_60_i0_fu___int32_to_float32e8m23b_127nih_31394_36045\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_13_i0_fu___int32_to_float32e8m23b_127nih_31394_35166\(0),
    in6 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in7 => \out_lut_expr_FU_87_i0_fu___int32_to_float32e8m23b_127nih_31394_36540\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36546\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_89_i0_fu___int32_to_float32e8m23b_127nih_31394_36546\,
    in1 => out_const_50,
    in2 => \out_extract_bit_expr_FU_65_i0_fu___int32_to_float32e8m23b_127nih_31394_35980\,
    in3 => \out_extract_bit_expr_FU_66_i0_fu___int32_to_float32e8m23b_127nih_31394_35984\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in6 => \out_lut_expr_FU_88_i0_fu___int32_to_float32e8m23b_127nih_31394_36543\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36549\ : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_90_i0_fu___int32_to_float32e8m23b_127nih_31394_36549\,
    in1 => out_const_26,
    in2 => \out_extract_bit_expr_FU_69_i0_fu___int32_to_float32e8m23b_127nih_31394_36315\,
    in3 => \out_extract_bit_expr_FU_70_i0_fu___int32_to_float32e8m23b_127nih_31394_36319\,
    in4 => \out_extract_bit_expr_FU_71_i0_fu___int32_to_float32e8m23b_127nih_31394_36381\,
    in5 => \out_extract_bit_expr_FU_72_i0_fu___int32_to_float32e8m23b_127nih_31394_36385\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => \out_lut_expr_FU_12_i0_fu___int32_to_float32e8m23b_127nih_31394_35160\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36552\ : lut_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_91_i0_fu___int32_to_float32e8m23b_127nih_31394_36552\,
    in1 => out_const_27,
    in2 => \out_extract_bit_expr_FU_67_i0_fu___int32_to_float32e8m23b_127nih_31394_36191\,
    in3 => \out_extract_bit_expr_FU_68_i0_fu___int32_to_float32e8m23b_127nih_31394_36195\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_13_i0_fu___int32_to_float32e8m23b_127nih_31394_35166\(0),
    in6 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in7 => \out_lut_expr_FU_90_i0_fu___int32_to_float32e8m23b_127nih_31394_36549\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36555\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_92_i0_fu___int32_to_float32e8m23b_127nih_31394_36555\,
    in1 => out_const_50,
    in2 => \out_extract_bit_expr_FU_73_i0_fu___int32_to_float32e8m23b_127nih_31394_36137\,
    in3 => \out_extract_bit_expr_FU_74_i0_fu___int32_to_float32e8m23b_127nih_31394_36141\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in6 => \out_lut_expr_FU_91_i0_fu___int32_to_float32e8m23b_127nih_31394_36552\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36558\ : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_93_i0_fu___int32_to_float32e8m23b_127nih_31394_36558\,
    in1 => out_const_26,
    in2 => \out_extract_bit_expr_FU_77_i0_fu___int32_to_float32e8m23b_127nih_31394_36246\,
    in3 => \out_extract_bit_expr_FU_78_i0_fu___int32_to_float32e8m23b_127nih_31394_36250\,
    in4 => \out_extract_bit_expr_FU_79_i0_fu___int32_to_float32e8m23b_127nih_31394_36351\,
    in5 => \out_extract_bit_expr_FU_80_i0_fu___int32_to_float32e8m23b_127nih_31394_36355\,
    in6 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in7 => \out_lut_expr_FU_12_i0_fu___int32_to_float32e8m23b_127nih_31394_35160\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36561\ : lut_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_94_i0_fu___int32_to_float32e8m23b_127nih_31394_36561\,
    in1 => out_const_27,
    in2 => \out_extract_bit_expr_FU_75_i0_fu___int32_to_float32e8m23b_127nih_31394_36075\,
    in3 => \out_extract_bit_expr_FU_76_i0_fu___int32_to_float32e8m23b_127nih_31394_36079\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_13_i0_fu___int32_to_float32e8m23b_127nih_31394_35166\(0),
    in6 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in7 => \out_lut_expr_FU_93_i0_fu___int32_to_float32e8m23b_127nih_31394_36558\(0),
    in8 => '0',
    in9 => '0');
  \fu___int32_to_float32e8m23b_127nih_31394_36564\ : lut_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>1) port map (out1 => \out_lut_expr_FU_95_i0_fu___int32_to_float32e8m23b_127nih_31394_36564\,
    in1 => out_const_50,
    in2 => \out_extract_bit_expr_FU_81_i0_fu___int32_to_float32e8m23b_127nih_31394_36015\,
    in3 => \out_extract_bit_expr_FU_82_i0_fu___int32_to_float32e8m23b_127nih_31394_36019\,
    in4 => \out_lut_expr_FU_7_i0_fu___int32_to_float32e8m23b_127nih_31394_35143\(0),
    in5 => \out_lut_expr_FU_35_i0_fu___int32_to_float32e8m23b_127nih_31394_36515\(0),
    in6 => \out_lut_expr_FU_94_i0_fu___int32_to_float32e8m23b_127nih_31394_36561\(0),
    in7 => '0',
    in8 => '0',
    in9 => '0');
  reg_0 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_0_reg_0,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_lshift_expr_FU_32_0_32_142_i0_fu___int32_to_float32e8m23b_127nih_31394_35326\),
    wenable => wrenable_reg_0);
  reg_1 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_1_reg_1,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_cond_expr_FU_32_32_32_32_132_i0_fu___int32_to_float32e8m23b_127nih_31394_35171\),
    wenable => wrenable_reg_1);
  reg_2 : register_STD generic map(BITSIZE_in1=>7,
    BITSIZE_out1=>7) port map (out1 => out_reg_2_reg_2,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_IIdata_converter_FU_99_i0_fu___int32_to_float32e8m23b_127nih_31394_31677\),
    wenable => wrenable_reg_2);
  reg_3 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_3_reg_3,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_lshift_expr_FU_32_0_32_140_i0_fu___int32_to_float32e8m23b_127nih_31394_33339\),
    wenable => wrenable_reg_3);
  reg_4 : register_STD generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>8) port map (out1 => out_reg_4_reg_4,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out_ui_rshift_expr_FU_32_0_32_165_i2_fu___int32_to_float32e8m23b_127nih_31394_35452\),
    wenable => wrenable_reg_4);
  -- io-signal post fix
  return_port <= unsigned(out_MUX_137_gimple_return_FU_102_i0_0_0_0);
  \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ <= \out_multi_read_cond_FU_101_i0_fu___int32_to_float32e8m23b_127nih_31394_35140\;

end \datapath___int32_to_float32e8m23b_127nih_arch\;

-- FSM based controller description for __int32_to_float32e8m23b_127nih
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity \controller___int32_to_float32e8m23b_127nih\ is 
port (
  -- IN
  \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ : in std_logic_vector(0 downto 0);
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  selector_MUX_137_gimple_return_FU_102_i0_0_0_0 : out std_logic;
  wrenable_reg_0 : out std_logic;
  wrenable_reg_1 : out std_logic;
  wrenable_reg_2 : out std_logic;
  wrenable_reg_3 : out std_logic;
  wrenable_reg_4 : out std_logic

);
end \controller___int32_to_float32e8m23b_127nih\;

architecture \controller___int32_to_float32e8m23b_127nih_arch\ of \controller___int32_to_float32e8m23b_127nih\ is
  -- define the states of FSM model
  constant S_0: std_logic_vector(3 downto 0) := "0001";
  constant S_1: std_logic_vector(3 downto 0) := "0010";
  constant S_3: std_logic_vector(3 downto 0) := "1000";
  constant S_2: std_logic_vector(3 downto 0) := "0100";
  signal present_state : std_logic_vector(3 downto 0) := S_0;
  signal next_state : std_logic_vector(3 downto 0);
begin
  -- concurrent process#1: state registers
  state_reg: process(clock)
  begin
    if (clock'event and clock='1') then
      if (reset='0') then
        present_state <= S_0;
      else
        present_state <= next_state;
      end if;
    end if;
  end process;
  -- concurrent process#0: combinational logic
  comb_logic0: process(present_state, \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\, start_port)
  begin
    done_port <= '0';
    selector_MUX_137_gimple_return_FU_102_i0_0_0_0 <= '0';
    wrenable_reg_0 <= '0';
    wrenable_reg_1 <= '0';
    wrenable_reg_2 <= '0';
    wrenable_reg_3 <= '0';
    wrenable_reg_4 <= '0';
    next_state <= S_0;
    case present_state is
      when S_0 =>
        if(start_port /= '1') then
          selector_MUX_137_gimple_return_FU_102_i0_0_0_0 <= 'X';
          wrenable_reg_0 <= 'X';
          wrenable_reg_1 <= 'X';
          wrenable_reg_2 <= 'X';
          wrenable_reg_3 <= 'X';
          wrenable_reg_4 <= 'X';
          next_state <= S_0;
        else
          next_state <= S_1;
        end if;
      when S_1 =>
        wrenable_reg_0 <= '1';
        wrenable_reg_1 <= '1';
        wrenable_reg_2 <= '1';
        wrenable_reg_3 <= '1';
        wrenable_reg_4 <= '1';
        if (\OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\(0) = '1') then
          next_state <= S_2;
          done_port <= '1';
          wrenable_reg_0 <= '0';
        else
          next_state <= S_3;
          done_port <= '1';
          wrenable_reg_1 <= '0';
          wrenable_reg_2 <= '0';
          wrenable_reg_3 <= '0';
          wrenable_reg_4 <= '0';
        end if;
      when S_3 =>
        selector_MUX_137_gimple_return_FU_102_i0_0_0_0 <= '1';
        next_state <= S_0;
      when S_2 =>
        next_state <= S_0;
      when others =>
        selector_MUX_137_gimple_return_FU_102_i0_0_0_0 <= 'X';
        wrenable_reg_0 <= 'X';
        wrenable_reg_1 <= 'X';
        wrenable_reg_2 <= 'X';
        wrenable_reg_3 <= 'X';
        wrenable_reg_4 <= 'X';
    end case;
  end process;

end \controller___int32_to_float32e8m23b_127nih_arch\;

-- Top component for __int32_to_float32e8m23b_127nih
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity \__int32_to_float32e8m23b_127nih\ is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  a : in signed (31 downto 0);
  -- OUT
  done_port : out std_logic;
  return_port : out unsigned (31 downto 0)

);
end \__int32_to_float32e8m23b_127nih\;

architecture \__int32_to_float32e8m23b_127nih_arch\ of \__int32_to_float32e8m23b_127nih\ is
  -- Component and signal declarations
  
  component \datapath___int32_to_float32e8m23b_127nih\
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in_port_a : in signed (31 downto 0);
    selector_MUX_137_gimple_return_FU_102_i0_0_0_0 : in std_logic;
    wrenable_reg_0 : in std_logic;
    wrenable_reg_1 : in std_logic;
    wrenable_reg_2 : in std_logic;
    wrenable_reg_3 : in std_logic;
    wrenable_reg_4 : in std_logic;
    -- OUT
    return_port : out unsigned (31 downto 0);
    \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ : out std_logic_vector(0 downto 0)
  
  );
  end component;
  
  component \controller___int32_to_float32e8m23b_127nih\
  port (
    -- IN
    \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ : in std_logic_vector(0 downto 0);
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    selector_MUX_137_gimple_return_FU_102_i0_0_0_0 : out std_logic;
    wrenable_reg_0 : out std_logic;
    wrenable_reg_1 : out std_logic;
    wrenable_reg_2 : out std_logic;
    wrenable_reg_3 : out std_logic;
    wrenable_reg_4 : out std_logic
  
  );
  end component;
  
  component flipflop_AR
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component register_STD
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  signal \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ : std_logic_vector(0 downto 0);
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal in_port_a_SIGI1 : signed (31 downto 0);
  signal in_port_a_SIGI2 : std_logic_vector(31 downto 0) ;
  signal selector_MUX_137_gimple_return_FU_102_i0_0_0_0 : std_logic;
  signal wrenable_reg_0 : std_logic;
  signal wrenable_reg_1 : std_logic;
  signal wrenable_reg_2 : std_logic;
  signal wrenable_reg_3 : std_logic;
  signal wrenable_reg_4 : std_logic;
begin
  Controller_i : \controller___int32_to_float32e8m23b_127nih\ port map (done_port => done_delayed_REG_signal_in,
    selector_MUX_137_gimple_return_FU_102_i0_0_0_0 => selector_MUX_137_gimple_return_FU_102_i0_0_0_0,
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_2 => wrenable_reg_2,
    wrenable_reg_3 => wrenable_reg_3,
    wrenable_reg_4 => wrenable_reg_4,
    \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ => \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\,
    clock => clock,
    reset => reset,
    start_port => start_port);
  Datapath_i : \datapath___int32_to_float32e8m23b_127nih\ port map (return_port => return_port,
    \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\ => \OUT_MULTIIF___int32_to_float32e8m23b_127nih_31394_35140\,
    clock => clock,
    reset => reset,
    in_port_a => signed(in_port_a_SIGI2),
    selector_MUX_137_gimple_return_FU_102_i0_0_0_0 => selector_MUX_137_gimple_return_FU_102_i0_0_0_0,
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_2 => wrenable_reg_2,
    wrenable_reg_3 => wrenable_reg_3,
    wrenable_reg_4 => wrenable_reg_4);
  done_delayed_REG : flipflop_AR generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => done_delayed_REG_signal_out,
    clock => clock,
    reset => reset,
    in1 => done_delayed_REG_signal_in);
  in_port_a_REG : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => in_port_a_SIGI2,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(in_port_a_SIGI1),
    wenable => '0');
  -- io-signal post fix
  in_port_a_SIGI1 <= a;
  done_port <= done_delayed_REG_signal_out;

end \__int32_to_float32e8m23b_127nih_arch\;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2013-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity bus_merger is 
generic(
 BITSIZE_in1: integer;
 PORTSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end bus_merger;

architecture bus_merger_arch of bus_merger is
  begin
  process(in1)
  variable temp_out1 : std_logic_vector(BITSIZE_out1-1 downto 0);
  begin
    temp_out1 := (others => '0');
    for I in 0 to PORTSIZE_in1-1 loop
      temp_out1 := temp_out1 or in1(((I+1)*BITSIZE_in1)-1 downto (I*BITSIZE_in1));
    end loop;  out1 <= temp_out1;
  end process;

end bus_merger_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2022 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ASSIGN_VECTOR_BOOL_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ASSIGN_VECTOR_BOOL_FU;

architecture ASSIGN_VECTOR_BOOL_FU_arch of ASSIGN_VECTOR_BOOL_FU is
  begin
    out1 <= in1;
end ASSIGN_VECTOR_BOOL_FU_arch;

-- Datapath RTL description for acc_0
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity datapath_acc_0 is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in_port_param : in std_logic_vector(31 downto 0) ;
  in_port_result : in std_logic_vector(31 downto 0) ;
  M_Rdata_ram : in std_logic_vector(31 downto 0) ;
  M_DataRdy : in std_logic;
  Min_oe_ram : in std_logic;
  Min_we_ram : in std_logic;
  Min_addr_ram : in std_logic_vector(31 downto 0) ;
  Min_Wdata_ram : in std_logic_vector(31 downto 0) ;
  Min_data_ram_size : in std_logic_vector(5 downto 0) ;
  selector_IN_UNBOUNDED_acc_0_31017_31048 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31049 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31050 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31051 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31052 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31053 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31054 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31055 : in std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31056 : in std_logic;
  fuselector_MEMORY_CTRL_D21_18_i0_LOAD : in std_logic;
  fuselector_MEMORY_CTRL_D21_18_i0_STORE : in std_logic;
  selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 : in std_logic;
  \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ : in std_logic;
  \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 : in std_logic;
  \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ : in std_logic;
  \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ : in std_logic;
  selector_MUX_44_vb_assign_conn_obj_0_0_0_0 : in std_logic;
  wrenable_reg_0 : in std_logic;
  wrenable_reg_1 : in std_logic;
  wrenable_reg_10 : in std_logic;
  wrenable_reg_11 : in std_logic;
  wrenable_reg_12 : in std_logic;
  wrenable_reg_13 : in std_logic;
  wrenable_reg_14 : in std_logic;
  wrenable_reg_15 : in std_logic;
  wrenable_reg_2 : in std_logic;
  wrenable_reg_3 : in std_logic;
  wrenable_reg_4 : in std_logic;
  wrenable_reg_5 : in std_logic;
  wrenable_reg_6 : in std_logic;
  wrenable_reg_7 : in std_logic;
  wrenable_reg_8 : in std_logic;
  wrenable_reg_9 : in std_logic;
  -- OUT
  Mout_oe_ram : out std_logic;
  Mout_we_ram : out std_logic;
  Mout_addr_ram : out std_logic_vector(31 downto 0) ;
  Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
  Mout_data_ram_size : out std_logic_vector(5 downto 0) ;
  OUT_UNBOUNDED_acc_0_31017_31048 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31049 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31050 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31051 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31052 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31053 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31054 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31055 : out std_logic;
  OUT_UNBOUNDED_acc_0_31017_31056 : out std_logic

);
end datapath_acc_0;

architecture datapath_acc_0_arch of datapath_acc_0 is
  -- Component and signal declarations
  
  component constant_value
  generic(
   BITSIZE_out1: integer;
   value: std_logic_vector);
  port (
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_SE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_STD
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component MEMORY_CTRL_D21
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer;
   BITSIZE_Min_addr_ram: integer;
   BITSIZE_Mout_addr_ram: integer;
   BITSIZE_M_Rdata_ram: integer;
   BITSIZE_Min_Wdata_ram: integer;
   BITSIZE_Mout_Wdata_ram: integer;
   BITSIZE_Min_data_ram_size: integer;
   BITSIZE_Mout_data_ram_size: integer);
  port (
    -- IN
    clock : in std_logic;
    start_port : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    in3 : in std_logic_vector(BITSIZE_in3-1 downto 0) ;
    in4 : in std_logic;
    sel_LOAD : in std_logic;
    sel_STORE : in std_logic;
    Min_oe_ram : in std_logic;
    Min_we_ram : in std_logic;
    Min_addr_ram : in std_logic_vector(BITSIZE_Min_addr_ram-1 downto 0) ;
    M_Rdata_ram : in std_logic_vector(BITSIZE_M_Rdata_ram-1 downto 0) ;
    Min_Wdata_ram : in std_logic_vector(BITSIZE_Min_Wdata_ram-1 downto 0) ;
    Min_data_ram_size : in std_logic_vector(BITSIZE_Min_data_ram_size-1 downto 0) ;
    M_DataRdy : in std_logic;
    -- OUT
    done_port : out std_logic;
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) ;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(BITSIZE_Mout_addr_ram-1 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(BITSIZE_Mout_Wdata_ram-1 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(BITSIZE_Mout_data_ram_size-1 downto 0) 
  
  );
  end component;
  
  component ui_pointer_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   LSB_PARAMETER: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component \__float_mule8m23b_127nih\
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    a : in unsigned (63 downto 0);
    b : in unsigned (63 downto 0);
    -- OUT
    done_port : out std_logic;
    return_port : out unsigned (63 downto 0)
  
  );
  end component;
  
  component \__int32_to_float32e8m23b_127nih\
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    a : in signed (31 downto 0);
    -- OUT
    done_port : out std_logic;
    return_port : out unsigned (31 downto 0)
  
  );
  end component;
  
  component bus_merger
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component OR_GATE
  generic(
   BITSIZE_in: integer;
   PORTSIZE_in: integer);
  port (
    -- IN
    \in\ : in std_logic_vector((PORTSIZE_in*BITSIZE_in)-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component ASSIGN_VECTOR_BOOL_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component MUX_GATE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    sel : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  signal out_MEMORY_CTRL_D21_18_i0_MEMORY_CTRL_D21_18_i0 : std_logic_vector(31 downto 0) ;
  signal out_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 : std_logic_vector(31 downto 0) ;
  signal \out_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ : std_logic_vector(63 downto 0) ;
  signal \out_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ : std_logic_vector(63 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 : std_logic_vector(31 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 : std_logic_vector(31 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 : std_logic_vector(31 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 : std_logic_vector(31 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 : std_logic_vector(31 downto 0) ;
  signal \out_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ : std_logic_vector(63 downto 0) ;
  signal \out_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ : std_logic_vector(31 downto 0) ;
  signal out_MUX_44_vb_assign_conn_obj_0_0_0_0 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_10_i0_fu_acc_0_31017_31349 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_11_i0_fu_acc_0_31017_31283 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_12_i0_fu_acc_0_31017_32947 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_13_i0_fu_acc_0_31017_32950 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_14_i0_fu_acc_0_31017_32944 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_15_i0_fu_acc_0_31017_31361 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_16_i0_fu_acc_0_31017_31296 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_2_i0_fu_acc_0_31017_31310 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_3_i0_fu_acc_0_31017_31243 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_4_i0_fu_acc_0_31017_31326 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_6_i0_fu_acc_0_31017_32910 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_7_i0_fu_acc_0_31017_32904 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_8_i0_fu_acc_0_31017_31335 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_9_i0_fu_acc_0_31017_31269 : std_logic_vector(31 downto 0) ;
  signal \out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0\ : unsigned (63 downto 0);
  signal \out___int32_to_float32e8m23b_127nih_22_i0___int32_to_float32e8m23b_127nih_22_i0\ : unsigned (31 downto 0);
  signal out_const_0 : std_logic_vector(6 downto 0) ;
  signal out_const_1 : std_logic_vector(0 downto 0);
  signal out_const_2 : std_logic_vector(2 downto 0) ;
  signal out_const_3 : std_logic_vector(3 downto 0) ;
  signal out_conv_out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907_32_64 : std_logic_vector(63 downto 0) ;
  signal \out_conv_out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0_64_32\ : std_logic_vector(31 downto 0) ;
  signal out_conv_out_const_0_7_6 : std_logic_vector(5 downto 0) ;
  signal out_conv_out_reg_11_reg_11_32_64 : std_logic_vector(63 downto 0) ;
  signal out_conv_out_reg_14_reg_14_32_64 : std_logic_vector(63 downto 0) ;
  signal out_conv_out_reg_8_reg_8_32_64 : std_logic_vector(63 downto 0) ;
  signal out_conv_out_reg_9_reg_9_32_64 : std_logic_vector(63 downto 0) ;
  signal out_reg_0_reg_0 : std_logic_vector(31 downto 0) ;
  signal out_reg_10_reg_10 : std_logic_vector(31 downto 0) ;
  signal out_reg_11_reg_11 : std_logic_vector(31 downto 0) ;
  signal out_reg_12_reg_12 : std_logic_vector(31 downto 0) ;
  signal out_reg_13_reg_13 : std_logic_vector(31 downto 0) ;
  signal out_reg_14_reg_14 : std_logic_vector(31 downto 0) ;
  signal out_reg_15_reg_15 : std_logic_vector(31 downto 0) ;
  signal out_reg_1_reg_1 : std_logic_vector(31 downto 0) ;
  signal out_reg_2_reg_2 : std_logic_vector(31 downto 0) ;
  signal out_reg_3_reg_3 : std_logic_vector(31 downto 0) ;
  signal out_reg_4_reg_4 : std_logic_vector(31 downto 0) ;
  signal out_reg_5_reg_5 : std_logic_vector(31 downto 0) ;
  signal out_reg_6_reg_6 : std_logic_vector(31 downto 0) ;
  signal out_reg_7_reg_7 : std_logic_vector(31 downto 0) ;
  signal out_reg_8_reg_8 : std_logic_vector(31 downto 0) ;
  signal out_reg_9_reg_9 : std_logic_vector(31 downto 0) ;
  signal out_ui_pointer_plus_expr_FU_32_0_32_19_i0_fu_acc_0_31017_31292 : unsigned (31 downto 0);
  signal out_ui_pointer_plus_expr_FU_32_0_32_19_i1_fu_acc_0_31017_31305 : unsigned (31 downto 0);
  signal out_ui_pointer_plus_expr_FU_32_0_32_20_i0_fu_acc_0_31017_31330 : unsigned (31 downto 0);
  signal out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0 : std_logic_vector(31 downto 0) ;
  signal out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1 : std_logic_vector(31 downto 0) ;
  signal s_MEMORY_CTRL_D21_18_i00 : std_logic;
  signal \s___float_mule8m23b_127nih_21_i01\ : std_logic;
  signal \s___int32_to_float32e8m23b_127nih_22_i02\ : std_logic;
  signal s_done_MEMORY_CTRL_D21_18_i0 : std_logic;
  signal \s_done___float_mule8m23b_127nih_21_i0\ : std_logic;
  signal \s_done___int32_to_float32e8m23b_127nih_22_i0\ : std_logic;
  signal sig_in_bus_mergerMout_Wdata_ram0_0 : std_logic_vector(31 downto 0) ;
  signal sig_in_bus_mergerMout_addr_ram1_0 : std_logic_vector(31 downto 0) ;
  signal sig_in_bus_mergerMout_data_ram_size2_0 : std_logic_vector(5 downto 0) ;
  signal sig_in_bus_mergerMout_oe_ram3_0 : std_logic;
  signal sig_in_bus_mergerMout_we_ram4_0 : std_logic;
  signal \sig_out_bus_mergerMout_Wdata_ram0_\ : std_logic_vector(31 downto 0) ;
  signal \sig_out_bus_mergerMout_addr_ram1_\ : std_logic_vector(31 downto 0) ;
  signal \sig_out_bus_mergerMout_data_ram_size2_\ : std_logic_vector(5 downto 0) ;
  signal \sig_out_bus_mergerMout_oe_ram3_\ : std_logic_vector(0 downto 0);
  signal \sig_out_bus_mergerMout_we_ram4_\ : std_logic_vector(0 downto 0);
begin
  ASSIGN_VECTOR_BOOL_FU_vb_assign_0 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0,
    in1 => out_MUX_44_vb_assign_conn_obj_0_0_0_0);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_1 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1,
    in1 => out_reg_15_reg_15);
  MEMORY_CTRL_D21_18_i0 : MEMORY_CTRL_D21 generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_in3=>6,
    BITSIZE_out1=>32,
    BITSIZE_Min_addr_ram=>32,
    BITSIZE_Mout_addr_ram=>32,
    BITSIZE_M_Rdata_ram=>32,
    BITSIZE_Min_Wdata_ram=>32,
    BITSIZE_Mout_Wdata_ram=>32,
    BITSIZE_Min_data_ram_size=>6,
    BITSIZE_Mout_data_ram_size=>6) port map (done_port => s_done_MEMORY_CTRL_D21_18_i0,
    out1 => out_MEMORY_CTRL_D21_18_i0_MEMORY_CTRL_D21_18_i0,
    Mout_oe_ram => sig_in_bus_mergerMout_oe_ram3_0,
    Mout_we_ram => sig_in_bus_mergerMout_we_ram4_0,
    Mout_addr_ram => sig_in_bus_mergerMout_addr_ram1_0,
    Mout_Wdata_ram => sig_in_bus_mergerMout_Wdata_ram0_0,
    Mout_data_ram_size => sig_in_bus_mergerMout_data_ram_size2_0,
    clock => clock,
    start_port => s_MEMORY_CTRL_D21_18_i00,
    in1 => out_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0,
    in2 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1,
    in3 => out_conv_out_const_0_7_6,
    in4 => out_const_1(0),
    sel_LOAD => fuselector_MEMORY_CTRL_D21_18_i0_LOAD,
    sel_STORE => fuselector_MEMORY_CTRL_D21_18_i0_STORE,
    Min_oe_ram => Min_oe_ram,
    Min_we_ram => Min_we_ram,
    Min_addr_ram => Min_addr_ram,
    M_Rdata_ram => M_Rdata_ram,
    Min_Wdata_ram => Min_Wdata_ram,
    Min_data_ram_size => Min_data_ram_size,
    M_DataRdy => M_DataRdy);
  MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0,
    sel => selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0,
    in1 => out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0,
    in2 => out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1);
  \MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ : MUX_GATE generic map(BITSIZE_in1=>64,
    BITSIZE_in2=>64,
    BITSIZE_out1=>64) port map (out1 => \out_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\,
    sel => \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\,
    in1 => out_conv_out_reg_9_reg_9_32_64,
    in2 => out_conv_out_reg_11_reg_11_32_64);
  \MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ : MUX_GATE generic map(BITSIZE_in1=>64,
    BITSIZE_in2=>64,
    BITSIZE_out1=>64) port map (out1 => \out_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\,
    sel => \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\,
    in1 => out_conv_out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907_32_64,
    in2 => \out_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\);
  MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0,
    sel => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0,
    in1 => out_reg_5_reg_5,
    in2 => out_reg_4_reg_4);
  MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1,
    sel => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1,
    in1 => out_reg_3_reg_3,
    in2 => out_reg_2_reg_2);
  MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2,
    sel => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2,
    in1 => out_reg_1_reg_1,
    in2 => out_UUdata_converter_FU_3_i0_fu_acc_0_31017_31243);
  MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0,
    sel => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0,
    in1 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0,
    in2 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1);
  MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1,
    sel => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1,
    in1 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2,
    in2 => out_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0);
  \MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ : MUX_GATE generic map(BITSIZE_in1=>64,
    BITSIZE_in2=>64,
    BITSIZE_out1=>64) port map (out1 => \out_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\,
    sel => \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\,
    in1 => out_conv_out_reg_8_reg_8_32_64,
    in2 => out_conv_out_reg_14_reg_14_32_64);
  \MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => \out_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\,
    sel => \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\,
    in1 => out_reg_6_reg_6,
    in2 => out_reg_0_reg_0);
  MUX_44_vb_assign_conn_obj_0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_44_vb_assign_conn_obj_0_0_0_0,
    sel => selector_MUX_44_vb_assign_conn_obj_0_0_0_0,
    in1 => out_reg_13_reg_13,
    in2 => out_UUdata_converter_FU_7_i0_fu_acc_0_31017_32904);
  \__float_mule8m23b_127nih_21_i0\ : \__float_mule8m23b_127nih\ port map (done_port => \s_done___float_mule8m23b_127nih_21_i0\,
    return_port => \out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0\,
    clock => clock,
    reset => reset,
    start_port => \s___float_mule8m23b_127nih_21_i01\,
    a => unsigned(\out_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\),
    b => unsigned(\out_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\));
  \__int32_to_float32e8m23b_127nih_22_i0\ : \__int32_to_float32e8m23b_127nih\ port map (done_port => \s_done___int32_to_float32e8m23b_127nih_22_i0\,
    return_port => \out___int32_to_float32e8m23b_127nih_22_i0___int32_to_float32e8m23b_127nih_22_i0\,
    clock => clock,
    reset => reset,
    start_port => \s___int32_to_float32e8m23b_127nih_22_i02\,
    a => signed(\out_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\));
  \bus_mergerMout_Wdata_ram0_\ : bus_merger generic map(BITSIZE_in1=>32, PORTSIZE_in1=>1,
    BITSIZE_out1=>32) port map (out1 => \sig_out_bus_mergerMout_Wdata_ram0_\,
      in1(31 downto 0) => sig_in_bus_mergerMout_Wdata_ram0_0);
  \bus_mergerMout_addr_ram1_\ : bus_merger generic map(BITSIZE_in1=>32, PORTSIZE_in1=>1,
    BITSIZE_out1=>32) port map (out1 => \sig_out_bus_mergerMout_addr_ram1_\,
      in1(31 downto 0) => sig_in_bus_mergerMout_addr_ram1_0);
  \bus_mergerMout_data_ram_size2_\ : bus_merger generic map(BITSIZE_in1=>6, PORTSIZE_in1=>1,
    BITSIZE_out1=>6) port map (out1 => \sig_out_bus_mergerMout_data_ram_size2_\,
      in1(5 downto 0) => sig_in_bus_mergerMout_data_ram_size2_0);
  \bus_mergerMout_oe_ram3_\ : bus_merger generic map(BITSIZE_in1=>1, PORTSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \sig_out_bus_mergerMout_oe_ram3_\,
      in1(0) => sig_in_bus_mergerMout_oe_ram3_0);
  \bus_mergerMout_we_ram4_\ : bus_merger generic map(BITSIZE_in1=>1, PORTSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => \sig_out_bus_mergerMout_we_ram4_\,
      in1(0) => sig_in_bus_mergerMout_we_ram4_0);
  const_0 : constant_value generic map(BITSIZE_out1=>7,
    value=>"0100000") port map (out1 => out_const_0);
  const_1 : constant_value generic map(BITSIZE_out1=>1,
    value=>"1") port map (out1 => out_const_1);
  const_2 : constant_value generic map(BITSIZE_out1=>3,
    value=>"100") port map (out1 => out_const_2);
  const_3 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1000") port map (out1 => out_const_3);
  conv_out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907_32_64 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>64) port map (out1 => out_conv_out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907_32_64,
    in1 => out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907);
  \conv_out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0_64_32\ : UUdata_converter_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>32) port map (out1 => \out_conv_out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0_64_32\,
    in1 => std_logic_vector(\out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0\));
  conv_out_const_0_7_6 : UUdata_converter_FU generic map(BITSIZE_in1=>7,
    BITSIZE_out1=>6) port map (out1 => out_conv_out_const_0_7_6,
    in1 => out_const_0);
  conv_out_reg_11_reg_11_32_64 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>64) port map (out1 => out_conv_out_reg_11_reg_11_32_64,
    in1 => out_reg_11_reg_11);
  conv_out_reg_14_reg_14_32_64 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>64) port map (out1 => out_conv_out_reg_14_reg_14_32_64,
    in1 => out_reg_14_reg_14);
  conv_out_reg_8_reg_8_32_64 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>64) port map (out1 => out_conv_out_reg_8_reg_8_32_64,
    in1 => out_reg_8_reg_8);
  conv_out_reg_9_reg_9_32_64 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>64) port map (out1 => out_conv_out_reg_9_reg_9_32_64,
    in1 => out_reg_9_reg_9);
  fu_acc_0_31017_31243 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_3_i0_fu_acc_0_31017_31243,
    in1 => out_UUdata_converter_FU_2_i0_fu_acc_0_31017_31310);
  fu_acc_0_31017_31269 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_9_i0_fu_acc_0_31017_31269,
    in1 => out_UUdata_converter_FU_8_i0_fu_acc_0_31017_31335);
  fu_acc_0_31017_31283 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_11_i0_fu_acc_0_31017_31283,
    in1 => out_UUdata_converter_FU_10_i0_fu_acc_0_31017_31349);
  fu_acc_0_31017_31292 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3,
    BITSIZE_out1=>32,
    LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_32_0_32_19_i0_fu_acc_0_31017_31292,
    in1 => unsigned(out_UUdata_converter_FU_11_i0_fu_acc_0_31017_31283),
    in2 => unsigned(out_const_2));
  fu_acc_0_31017_31296 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_16_i0_fu_acc_0_31017_31296,
    in1 => out_UUdata_converter_FU_15_i0_fu_acc_0_31017_31361);
  fu_acc_0_31017_31305 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>3,
    BITSIZE_out1=>32,
    LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_32_0_32_19_i1_fu_acc_0_31017_31305,
    in1 => unsigned(out_UUdata_converter_FU_16_i0_fu_acc_0_31017_31296),
    in2 => unsigned(out_const_2));
  fu_acc_0_31017_31310 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_2_i0_fu_acc_0_31017_31310,
    in1 => in_port_param);
  fu_acc_0_31017_31326 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_4_i0_fu_acc_0_31017_31326,
    in1 => in_port_param);
  fu_acc_0_31017_31330 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>4,
    BITSIZE_out1=>32,
    LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_32_0_32_20_i0_fu_acc_0_31017_31330,
    in1 => unsigned(out_UUdata_converter_FU_4_i0_fu_acc_0_31017_31326),
    in2 => unsigned(out_const_3));
  fu_acc_0_31017_31335 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_8_i0_fu_acc_0_31017_31335,
    in1 => in_port_result);
  fu_acc_0_31017_31349 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_10_i0_fu_acc_0_31017_31349,
    in1 => in_port_param);
  fu_acc_0_31017_31361 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_15_i0_fu_acc_0_31017_31361,
    in1 => in_port_result);
  fu_acc_0_31017_32904 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_7_i0_fu_acc_0_31017_32904,
    in1 => out_reg_12_reg_12);
  fu_acc_0_31017_32907 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907,
    in1 => out_reg_10_reg_10);
  fu_acc_0_31017_32910 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_6_i0_fu_acc_0_31017_32910,
    in1 => out_reg_7_reg_7);
  fu_acc_0_31017_32944 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_14_i0_fu_acc_0_31017_32944,
    in1 => \out_conv_out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0_64_32\);
  fu_acc_0_31017_32947 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_12_i0_fu_acc_0_31017_32947,
    in1 => out_reg_7_reg_7);
  fu_acc_0_31017_32950 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_13_i0_fu_acc_0_31017_32950,
    in1 => out_reg_10_reg_10);
  s_MEMORY_CTRL_D21_18_i00 <= selector_IN_UNBOUNDED_acc_0_31017_31048 or selector_IN_UNBOUNDED_acc_0_31017_31050 or selector_IN_UNBOUNDED_acc_0_31017_31052 or selector_IN_UNBOUNDED_acc_0_31017_31053 or selector_IN_UNBOUNDED_acc_0_31017_31056;
  \s___float_mule8m23b_127nih_21_i01\ <= selector_IN_UNBOUNDED_acc_0_31017_31051 or selector_IN_UNBOUNDED_acc_0_31017_31055;
  \s___int32_to_float32e8m23b_127nih_22_i02\ <= selector_IN_UNBOUNDED_acc_0_31017_31049 or selector_IN_UNBOUNDED_acc_0_31017_31054;
  reg_0 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_0_reg_0,
    clock => clock,
    reset => reset,
    in1 => out_MEMORY_CTRL_D21_18_i0_MEMORY_CTRL_D21_18_i0,
    wenable => wrenable_reg_0);
  reg_1 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_1_reg_1,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_3_i0_fu_acc_0_31017_31243,
    wenable => wrenable_reg_1);
  reg_10 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_10_reg_10,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(\out___int32_to_float32e8m23b_127nih_22_i0___int32_to_float32e8m23b_127nih_22_i0\),
    wenable => wrenable_reg_10);
  reg_11 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_11_reg_11,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_5_i0_fu_acc_0_31017_32907,
    wenable => wrenable_reg_11);
  reg_12 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_12_reg_12,
    clock => clock,
    reset => reset,
    in1 => \out_conv_out___float_mule8m23b_127nih_21_i0___float_mule8m23b_127nih_21_i0_64_32\,
    wenable => wrenable_reg_12);
  reg_13 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_13_reg_13,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_7_i0_fu_acc_0_31017_32904,
    wenable => wrenable_reg_13);
  reg_14 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_14_reg_14,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_13_i0_fu_acc_0_31017_32950,
    wenable => wrenable_reg_14);
  reg_15 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_15_reg_15,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_14_i0_fu_acc_0_31017_32944,
    wenable => wrenable_reg_15);
  reg_2 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_2_reg_2,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_9_i0_fu_acc_0_31017_31269,
    wenable => wrenable_reg_2);
  reg_3 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_3_reg_3,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_32_0_32_19_i0_fu_acc_0_31017_31292),
    wenable => wrenable_reg_3);
  reg_4 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_4_reg_4,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_32_0_32_19_i1_fu_acc_0_31017_31305),
    wenable => wrenable_reg_4);
  reg_5 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_5_reg_5,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_32_0_32_20_i0_fu_acc_0_31017_31330),
    wenable => wrenable_reg_5);
  reg_6 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_6_reg_6,
    clock => clock,
    reset => reset,
    in1 => out_MEMORY_CTRL_D21_18_i0_MEMORY_CTRL_D21_18_i0,
    wenable => wrenable_reg_6);
  reg_7 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_7_reg_7,
    clock => clock,
    reset => reset,
    in1 => out_MEMORY_CTRL_D21_18_i0_MEMORY_CTRL_D21_18_i0,
    wenable => wrenable_reg_7);
  reg_8 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_8_reg_8,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_6_i0_fu_acc_0_31017_32910,
    wenable => wrenable_reg_8);
  reg_9 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_9_reg_9,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_12_i0_fu_acc_0_31017_32947,
    wenable => wrenable_reg_9);
  -- io-signal post fix
  Mout_oe_ram <= \sig_out_bus_mergerMout_oe_ram3_\(0);
  Mout_we_ram <= \sig_out_bus_mergerMout_we_ram4_\(0);
  Mout_addr_ram <= \sig_out_bus_mergerMout_addr_ram1_\;
  Mout_Wdata_ram <= \sig_out_bus_mergerMout_Wdata_ram0_\;
  Mout_data_ram_size <= \sig_out_bus_mergerMout_data_ram_size2_\;
  OUT_UNBOUNDED_acc_0_31017_31048 <= s_done_MEMORY_CTRL_D21_18_i0;
  OUT_UNBOUNDED_acc_0_31017_31049 <= \s_done___int32_to_float32e8m23b_127nih_22_i0\;
  OUT_UNBOUNDED_acc_0_31017_31050 <= s_done_MEMORY_CTRL_D21_18_i0;
  OUT_UNBOUNDED_acc_0_31017_31051 <= \s_done___float_mule8m23b_127nih_21_i0\;
  OUT_UNBOUNDED_acc_0_31017_31052 <= s_done_MEMORY_CTRL_D21_18_i0;
  OUT_UNBOUNDED_acc_0_31017_31053 <= s_done_MEMORY_CTRL_D21_18_i0;
  OUT_UNBOUNDED_acc_0_31017_31054 <= \s_done___int32_to_float32e8m23b_127nih_22_i0\;
  OUT_UNBOUNDED_acc_0_31017_31055 <= \s_done___float_mule8m23b_127nih_21_i0\;
  OUT_UNBOUNDED_acc_0_31017_31056 <= s_done_MEMORY_CTRL_D21_18_i0;

end datapath_acc_0_arch;

-- FSM based controller description for acc_0
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity controller_acc_0 is 
port (
  -- IN
  OUT_UNBOUNDED_acc_0_31017_31048 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31049 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31050 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31051 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31052 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31053 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31054 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31055 : in std_logic;
  OUT_UNBOUNDED_acc_0_31017_31056 : in std_logic;
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31048 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31049 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31050 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31051 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31052 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31053 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31054 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31055 : out std_logic;
  selector_IN_UNBOUNDED_acc_0_31017_31056 : out std_logic;
  fuselector_MEMORY_CTRL_D21_18_i0_LOAD : out std_logic;
  fuselector_MEMORY_CTRL_D21_18_i0_STORE : out std_logic;
  selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 : out std_logic;
  \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ : out std_logic;
  \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 : out std_logic;
  \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ : out std_logic;
  \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ : out std_logic;
  selector_MUX_44_vb_assign_conn_obj_0_0_0_0 : out std_logic;
  wrenable_reg_0 : out std_logic;
  wrenable_reg_1 : out std_logic;
  wrenable_reg_10 : out std_logic;
  wrenable_reg_11 : out std_logic;
  wrenable_reg_12 : out std_logic;
  wrenable_reg_13 : out std_logic;
  wrenable_reg_14 : out std_logic;
  wrenable_reg_15 : out std_logic;
  wrenable_reg_2 : out std_logic;
  wrenable_reg_3 : out std_logic;
  wrenable_reg_4 : out std_logic;
  wrenable_reg_5 : out std_logic;
  wrenable_reg_6 : out std_logic;
  wrenable_reg_7 : out std_logic;
  wrenable_reg_8 : out std_logic;
  wrenable_reg_9 : out std_logic

);
end controller_acc_0;

architecture controller_acc_0_arch of controller_acc_0 is
  -- define the states of FSM model
  constant S_0: std_logic_vector(19 downto 0) := "00000000000000000001";
  constant S_1: std_logic_vector(19 downto 0) := "00000000000000000010";
  constant S_2: std_logic_vector(19 downto 0) := "00000000000000000100";
  constant S_3: std_logic_vector(19 downto 0) := "00000000000000001000";
  constant S_4: std_logic_vector(19 downto 0) := "00000000000000010000";
  constant S_5: std_logic_vector(19 downto 0) := "00000000000000100000";
  constant S_6: std_logic_vector(19 downto 0) := "00000000000001000000";
  constant S_7: std_logic_vector(19 downto 0) := "00000000000010000000";
  constant S_8: std_logic_vector(19 downto 0) := "00000000000100000000";
  constant S_9: std_logic_vector(19 downto 0) := "00000000001000000000";
  constant S_10: std_logic_vector(19 downto 0) := "00000000010000000000";
  constant S_11: std_logic_vector(19 downto 0) := "00000000100000000000";
  constant S_12: std_logic_vector(19 downto 0) := "00000001000000000000";
  constant S_13: std_logic_vector(19 downto 0) := "00000010000000000000";
  constant S_14: std_logic_vector(19 downto 0) := "00000100000000000000";
  constant S_15: std_logic_vector(19 downto 0) := "00001000000000000000";
  constant S_16: std_logic_vector(19 downto 0) := "00010000000000000000";
  constant S_17: std_logic_vector(19 downto 0) := "00100000000000000000";
  constant S_18: std_logic_vector(19 downto 0) := "01000000000000000000";
  constant S_19: std_logic_vector(19 downto 0) := "10000000000000000000";
  signal present_state : std_logic_vector(19 downto 0) := S_0;
  signal next_state : std_logic_vector(19 downto 0);
begin
  -- concurrent process#1: state registers
  state_reg: process(clock)
  begin
    if (clock'event and clock='1') then
      if (reset='0') then
        present_state <= S_0;
      else
        present_state <= next_state;
      end if;
    end if;
  end process;
  -- concurrent process#0: combinational logic
  comb_logic0: process(present_state, OUT_UNBOUNDED_acc_0_31017_31048, OUT_UNBOUNDED_acc_0_31017_31049, OUT_UNBOUNDED_acc_0_31017_31050, OUT_UNBOUNDED_acc_0_31017_31051, OUT_UNBOUNDED_acc_0_31017_31052, OUT_UNBOUNDED_acc_0_31017_31053, OUT_UNBOUNDED_acc_0_31017_31054, OUT_UNBOUNDED_acc_0_31017_31055, OUT_UNBOUNDED_acc_0_31017_31056, start_port)
  begin
    done_port <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31048 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31049 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31050 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31051 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31052 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31053 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31054 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31055 <= '0';
    selector_IN_UNBOUNDED_acc_0_31017_31056 <= '0';
    fuselector_MEMORY_CTRL_D21_18_i0_LOAD <= '0';
    fuselector_MEMORY_CTRL_D21_18_i0_STORE <= '0';
    selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 <= '0';
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ <= '0';
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 <= '0';
    \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ <= '0';
    \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ <= '0';
    selector_MUX_44_vb_assign_conn_obj_0_0_0_0 <= '0';
    wrenable_reg_0 <= '0';
    wrenable_reg_1 <= '0';
    wrenable_reg_10 <= '0';
    wrenable_reg_11 <= '0';
    wrenable_reg_12 <= '0';
    wrenable_reg_13 <= '0';
    wrenable_reg_14 <= '0';
    wrenable_reg_15 <= '0';
    wrenable_reg_2 <= '0';
    wrenable_reg_3 <= '0';
    wrenable_reg_4 <= '0';
    wrenable_reg_5 <= '0';
    wrenable_reg_6 <= '0';
    wrenable_reg_7 <= '0';
    wrenable_reg_8 <= '0';
    wrenable_reg_9 <= '0';
    next_state <= S_0;
    case present_state is
      when S_0 =>
        if(start_port /= '1') then
          selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 <= 'X';
          \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ <= 'X';
          \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ <= 'X';
          selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 <= 'X';
          selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 <= 'X';
          selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 <= 'X';
          selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 <= 'X';
          selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 <= 'X';
          \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ <= 'X';
          \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ <= 'X';
          selector_MUX_44_vb_assign_conn_obj_0_0_0_0 <= 'X';
          wrenable_reg_0 <= 'X';
          wrenable_reg_1 <= 'X';
          wrenable_reg_10 <= 'X';
          wrenable_reg_11 <= 'X';
          wrenable_reg_12 <= 'X';
          wrenable_reg_13 <= 'X';
          wrenable_reg_14 <= 'X';
          wrenable_reg_15 <= 'X';
          wrenable_reg_2 <= 'X';
          wrenable_reg_3 <= 'X';
          wrenable_reg_4 <= 'X';
          wrenable_reg_5 <= 'X';
          wrenable_reg_6 <= 'X';
          wrenable_reg_7 <= 'X';
          wrenable_reg_8 <= 'X';
          wrenable_reg_9 <= 'X';
          next_state <= S_0;
        else
          selector_IN_UNBOUNDED_acc_0_31017_31048 <= '1';
          fuselector_MEMORY_CTRL_D21_18_i0_LOAD <= '1';
          selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 <= '1';
          wrenable_reg_0 <= OUT_UNBOUNDED_acc_0_31017_31048;
          wrenable_reg_1 <= '1';
          wrenable_reg_2 <= '1';
          wrenable_reg_3 <= '1';
          wrenable_reg_4 <= '1';
          wrenable_reg_5 <= '1';
          if (OUT_UNBOUNDED_acc_0_31017_31048 = '0') then
            next_state <= S_1;
          else
            next_state <= S_2;
          end if;
        end if;
      when S_1 =>
        fuselector_MEMORY_CTRL_D21_18_i0_LOAD <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 <= '1';
        wrenable_reg_0 <= OUT_UNBOUNDED_acc_0_31017_31048;
        if (OUT_UNBOUNDED_acc_0_31017_31048 = '0') then
          next_state <= S_1;
        else
          next_state <= S_2;
        end if;
      when S_2 =>
        selector_IN_UNBOUNDED_acc_0_31017_31053 <= '1';
        fuselector_MEMORY_CTRL_D21_18_i0_LOAD <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 <= '1';
        wrenable_reg_6 <= OUT_UNBOUNDED_acc_0_31017_31053;
        if (OUT_UNBOUNDED_acc_0_31017_31053 = '0') then
          next_state <= S_3;
        else
          next_state <= S_4;
        end if;
      when S_3 =>
        fuselector_MEMORY_CTRL_D21_18_i0_LOAD <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 <= '1';
        wrenable_reg_6 <= OUT_UNBOUNDED_acc_0_31017_31053;
        if (OUT_UNBOUNDED_acc_0_31017_31053 = '0') then
          next_state <= S_3;
        else
          next_state <= S_4;
        end if;
      when S_4 =>
        selector_IN_UNBOUNDED_acc_0_31017_31050 <= '1';
        fuselector_MEMORY_CTRL_D21_18_i0_LOAD <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 <= '1';
        wrenable_reg_7 <= OUT_UNBOUNDED_acc_0_31017_31050;
        if (OUT_UNBOUNDED_acc_0_31017_31050 = '0') then
          next_state <= S_5;
        else
          next_state <= S_6;
        end if;
      when S_5 =>
        fuselector_MEMORY_CTRL_D21_18_i0_LOAD <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 <= '1';
        wrenable_reg_7 <= OUT_UNBOUNDED_acc_0_31017_31050;
        if (OUT_UNBOUNDED_acc_0_31017_31050 = '0') then
          next_state <= S_5;
        else
          next_state <= S_6;
        end if;
      when S_6 =>
        selector_IN_UNBOUNDED_acc_0_31017_31049 <= '1';
        wrenable_reg_8 <= '1';
        wrenable_reg_9 <= '1';
        next_state <= S_7;
      when S_7 =>
        next_state <= S_8;
      when S_8 =>
        wrenable_reg_10 <= '1';
        next_state <= S_9;
      when S_9 =>
        selector_IN_UNBOUNDED_acc_0_31017_31051 <= '1';
        selector_IN_UNBOUNDED_acc_0_31017_31054 <= '1';
        \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ <= '1';
        \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ <= '1';
        \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ <= '1';
        wrenable_reg_11 <= '1';
        next_state <= S_10;
      when S_10 =>
        \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ <= '1';
        \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ <= '1';
        next_state <= S_11;
      when S_11 =>
        \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ <= '1';
        \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ <= '1';
        wrenable_reg_10 <= '1';
        wrenable_reg_12 <= '1';
        next_state <= S_12;
      when S_12 =>
        selector_IN_UNBOUNDED_acc_0_31017_31052 <= '1';
        fuselector_MEMORY_CTRL_D21_18_i0_STORE <= '1';
        selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 <= '1';
        wrenable_reg_13 <= '1';
        wrenable_reg_14 <= '1';
        if (OUT_UNBOUNDED_acc_0_31017_31052 = '0') then
          next_state <= S_13;
        else
          next_state <= S_14;
        end if;
      when S_13 =>
        fuselector_MEMORY_CTRL_D21_18_i0_STORE <= '1';
        selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 <= '1';
        selector_MUX_44_vb_assign_conn_obj_0_0_0_0 <= '1';
        if (OUT_UNBOUNDED_acc_0_31017_31052 = '0') then
          next_state <= S_13;
        else
          next_state <= S_14;
        end if;
      when S_14 =>
        selector_IN_UNBOUNDED_acc_0_31017_31055 <= '1';
        \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ <= '1';
        next_state <= S_15;
      when S_15 =>
        \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ <= '1';
        next_state <= S_16;
      when S_16 =>
        \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ <= '1';
        wrenable_reg_15 <= '1';
        next_state <= S_17;
      when S_17 =>
        selector_IN_UNBOUNDED_acc_0_31017_31056 <= '1';
        fuselector_MEMORY_CTRL_D21_18_i0_STORE <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 <= '1';
        if (OUT_UNBOUNDED_acc_0_31017_31056 = '0') then
          next_state <= S_18;
        else
          next_state <= S_19;
          done_port <= '1';
        end if;
      when S_18 =>
        fuselector_MEMORY_CTRL_D21_18_i0_STORE <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 <= '1';
        if (OUT_UNBOUNDED_acc_0_31017_31056 = '0') then
          next_state <= S_18;
        else
          next_state <= S_19;
          done_port <= '1';
        end if;
      when S_19 =>
        next_state <= S_0;
      when others =>
        selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 <= 'X';
        \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ <= 'X';
        \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ <= 'X';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 <= 'X';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 <= 'X';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 <= 'X';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 <= 'X';
        selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 <= 'X';
        \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ <= 'X';
        \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ <= 'X';
        selector_MUX_44_vb_assign_conn_obj_0_0_0_0 <= 'X';
        wrenable_reg_0 <= 'X';
        wrenable_reg_1 <= 'X';
        wrenable_reg_10 <= 'X';
        wrenable_reg_11 <= 'X';
        wrenable_reg_12 <= 'X';
        wrenable_reg_13 <= 'X';
        wrenable_reg_14 <= 'X';
        wrenable_reg_15 <= 'X';
        wrenable_reg_2 <= 'X';
        wrenable_reg_3 <= 'X';
        wrenable_reg_4 <= 'X';
        wrenable_reg_5 <= 'X';
        wrenable_reg_6 <= 'X';
        wrenable_reg_7 <= 'X';
        wrenable_reg_8 <= 'X';
        wrenable_reg_9 <= 'X';
    end case;
  end process;

end controller_acc_0_arch;

-- Top component for acc_0
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity acc_0b is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  param : in std_logic_vector(31 downto 0) ;
  result : in std_logic_vector(31 downto 0) ;
  M_Rdata_ram : in std_logic_vector(31 downto 0) ;
  M_DataRdy : in std_logic;
  Min_oe_ram : in std_logic;
  Min_we_ram : in std_logic;
  Min_addr_ram : in std_logic_vector(31 downto 0) ;
  Min_Wdata_ram : in std_logic_vector(31 downto 0) ;
  Min_data_ram_size : in std_logic_vector(5 downto 0) ;
  -- OUT
  done_port : out std_logic;
  Mout_oe_ram : out std_logic;
  Mout_we_ram : out std_logic;
  Mout_addr_ram : out std_logic_vector(31 downto 0) ;
  Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
  Mout_data_ram_size : out std_logic_vector(5 downto 0) 

);
end acc_0b;

architecture acc_0_archb of acc_0b is
  -- Component and signal declarations
  
  component datapath_acc_0
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in_port_param : in std_logic_vector(31 downto 0) ;
    in_port_result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    Min_oe_ram : in std_logic;
    Min_we_ram : in std_logic;
    Min_addr_ram : in std_logic_vector(31 downto 0) ;
    Min_Wdata_ram : in std_logic_vector(31 downto 0) ;
    Min_data_ram_size : in std_logic_vector(5 downto 0) ;
    selector_IN_UNBOUNDED_acc_0_31017_31048 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31049 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31050 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31051 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31052 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31053 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31054 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31055 : in std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31056 : in std_logic;
    fuselector_MEMORY_CTRL_D21_18_i0_LOAD : in std_logic;
    fuselector_MEMORY_CTRL_D21_18_i0_STORE : in std_logic;
    selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 : in std_logic;
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ : in std_logic;
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 : in std_logic;
    \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ : in std_logic;
    \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ : in std_logic;
    selector_MUX_44_vb_assign_conn_obj_0_0_0_0 : in std_logic;
    wrenable_reg_0 : in std_logic;
    wrenable_reg_1 : in std_logic;
    wrenable_reg_10 : in std_logic;
    wrenable_reg_11 : in std_logic;
    wrenable_reg_12 : in std_logic;
    wrenable_reg_13 : in std_logic;
    wrenable_reg_14 : in std_logic;
    wrenable_reg_15 : in std_logic;
    wrenable_reg_2 : in std_logic;
    wrenable_reg_3 : in std_logic;
    wrenable_reg_4 : in std_logic;
    wrenable_reg_5 : in std_logic;
    wrenable_reg_6 : in std_logic;
    wrenable_reg_7 : in std_logic;
    wrenable_reg_8 : in std_logic;
    wrenable_reg_9 : in std_logic;
    -- OUT
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) ;
    OUT_UNBOUNDED_acc_0_31017_31048 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31049 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31050 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31051 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31052 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31053 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31054 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31055 : out std_logic;
    OUT_UNBOUNDED_acc_0_31017_31056 : out std_logic
  
  );
  end component;
  
  component controller_acc_0
  port (
    -- IN
    OUT_UNBOUNDED_acc_0_31017_31048 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31049 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31050 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31051 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31052 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31053 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31054 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31055 : in std_logic;
    OUT_UNBOUNDED_acc_0_31017_31056 : in std_logic;
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31048 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31049 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31050 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31051 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31052 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31053 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31054 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31055 : out std_logic;
    selector_IN_UNBOUNDED_acc_0_31017_31056 : out std_logic;
    fuselector_MEMORY_CTRL_D21_18_i0_LOAD : out std_logic;
    fuselector_MEMORY_CTRL_D21_18_i0_STORE : out std_logic;
    selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 : out std_logic;
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ : out std_logic;
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 : out std_logic;
    \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ : out std_logic;
    \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ : out std_logic;
    selector_MUX_44_vb_assign_conn_obj_0_0_0_0 : out std_logic;
    wrenable_reg_0 : out std_logic;
    wrenable_reg_1 : out std_logic;
    wrenable_reg_10 : out std_logic;
    wrenable_reg_11 : out std_logic;
    wrenable_reg_12 : out std_logic;
    wrenable_reg_13 : out std_logic;
    wrenable_reg_14 : out std_logic;
    wrenable_reg_15 : out std_logic;
    wrenable_reg_2 : out std_logic;
    wrenable_reg_3 : out std_logic;
    wrenable_reg_4 : out std_logic;
    wrenable_reg_5 : out std_logic;
    wrenable_reg_6 : out std_logic;
    wrenable_reg_7 : out std_logic;
    wrenable_reg_8 : out std_logic;
    wrenable_reg_9 : out std_logic
  
  );
  end component;
  
  component flipflop_AR
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  signal OUT_UNBOUNDED_acc_0_31017_31048 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31049 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31050 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31051 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31052 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31053 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31054 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31055 : std_logic;
  signal OUT_UNBOUNDED_acc_0_31017_31056 : std_logic;
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal fuselector_MEMORY_CTRL_D21_18_i0_LOAD : std_logic;
  signal fuselector_MEMORY_CTRL_D21_18_i0_STORE : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31048 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31049 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31050 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31051 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31052 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31053 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31054 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31055 : std_logic;
  signal selector_IN_UNBOUNDED_acc_0_31017_31056 : std_logic;
  signal selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 : std_logic;
  signal \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ : std_logic;
  signal \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 : std_logic;
  signal \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ : std_logic;
  signal \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ : std_logic;
  signal selector_MUX_44_vb_assign_conn_obj_0_0_0_0 : std_logic;
  signal wrenable_reg_0 : std_logic;
  signal wrenable_reg_1 : std_logic;
  signal wrenable_reg_10 : std_logic;
  signal wrenable_reg_11 : std_logic;
  signal wrenable_reg_12 : std_logic;
  signal wrenable_reg_13 : std_logic;
  signal wrenable_reg_14 : std_logic;
  signal wrenable_reg_15 : std_logic;
  signal wrenable_reg_2 : std_logic;
  signal wrenable_reg_3 : std_logic;
  signal wrenable_reg_4 : std_logic;
  signal wrenable_reg_5 : std_logic;
  signal wrenable_reg_6 : std_logic;
  signal wrenable_reg_7 : std_logic;
  signal wrenable_reg_8 : std_logic;
  signal wrenable_reg_9 : std_logic;
begin
  Controller_i : controller_acc_0 port map (done_port => done_delayed_REG_signal_in,
    selector_IN_UNBOUNDED_acc_0_31017_31048 => selector_IN_UNBOUNDED_acc_0_31017_31048,
    selector_IN_UNBOUNDED_acc_0_31017_31049 => selector_IN_UNBOUNDED_acc_0_31017_31049,
    selector_IN_UNBOUNDED_acc_0_31017_31050 => selector_IN_UNBOUNDED_acc_0_31017_31050,
    selector_IN_UNBOUNDED_acc_0_31017_31051 => selector_IN_UNBOUNDED_acc_0_31017_31051,
    selector_IN_UNBOUNDED_acc_0_31017_31052 => selector_IN_UNBOUNDED_acc_0_31017_31052,
    selector_IN_UNBOUNDED_acc_0_31017_31053 => selector_IN_UNBOUNDED_acc_0_31017_31053,
    selector_IN_UNBOUNDED_acc_0_31017_31054 => selector_IN_UNBOUNDED_acc_0_31017_31054,
    selector_IN_UNBOUNDED_acc_0_31017_31055 => selector_IN_UNBOUNDED_acc_0_31017_31055,
    selector_IN_UNBOUNDED_acc_0_31017_31056 => selector_IN_UNBOUNDED_acc_0_31017_31056,
    fuselector_MEMORY_CTRL_D21_18_i0_LOAD => fuselector_MEMORY_CTRL_D21_18_i0_LOAD,
    fuselector_MEMORY_CTRL_D21_18_i0_STORE => fuselector_MEMORY_CTRL_D21_18_i0_STORE,
    selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 => selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0,
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ => \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\,
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ => \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1,
    \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ => \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\,
    \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ => \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\,
    selector_MUX_44_vb_assign_conn_obj_0_0_0_0 => selector_MUX_44_vb_assign_conn_obj_0_0_0_0,
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_10 => wrenable_reg_10,
    wrenable_reg_11 => wrenable_reg_11,
    wrenable_reg_12 => wrenable_reg_12,
    wrenable_reg_13 => wrenable_reg_13,
    wrenable_reg_14 => wrenable_reg_14,
    wrenable_reg_15 => wrenable_reg_15,
    wrenable_reg_2 => wrenable_reg_2,
    wrenable_reg_3 => wrenable_reg_3,
    wrenable_reg_4 => wrenable_reg_4,
    wrenable_reg_5 => wrenable_reg_5,
    wrenable_reg_6 => wrenable_reg_6,
    wrenable_reg_7 => wrenable_reg_7,
    wrenable_reg_8 => wrenable_reg_8,
    wrenable_reg_9 => wrenable_reg_9,
    OUT_UNBOUNDED_acc_0_31017_31048 => OUT_UNBOUNDED_acc_0_31017_31048,
    OUT_UNBOUNDED_acc_0_31017_31049 => OUT_UNBOUNDED_acc_0_31017_31049,
    OUT_UNBOUNDED_acc_0_31017_31050 => OUT_UNBOUNDED_acc_0_31017_31050,
    OUT_UNBOUNDED_acc_0_31017_31051 => OUT_UNBOUNDED_acc_0_31017_31051,
    OUT_UNBOUNDED_acc_0_31017_31052 => OUT_UNBOUNDED_acc_0_31017_31052,
    OUT_UNBOUNDED_acc_0_31017_31053 => OUT_UNBOUNDED_acc_0_31017_31053,
    OUT_UNBOUNDED_acc_0_31017_31054 => OUT_UNBOUNDED_acc_0_31017_31054,
    OUT_UNBOUNDED_acc_0_31017_31055 => OUT_UNBOUNDED_acc_0_31017_31055,
    OUT_UNBOUNDED_acc_0_31017_31056 => OUT_UNBOUNDED_acc_0_31017_31056,
    clock => clock,
    reset => reset,
    start_port => start_port);
  Datapath_i : datapath_acc_0 port map (Mout_oe_ram => Mout_oe_ram,
    Mout_we_ram => Mout_we_ram,
    Mout_addr_ram => Mout_addr_ram,
    Mout_Wdata_ram => Mout_Wdata_ram,
    Mout_data_ram_size => Mout_data_ram_size,
    OUT_UNBOUNDED_acc_0_31017_31048 => OUT_UNBOUNDED_acc_0_31017_31048,
    OUT_UNBOUNDED_acc_0_31017_31049 => OUT_UNBOUNDED_acc_0_31017_31049,
    OUT_UNBOUNDED_acc_0_31017_31050 => OUT_UNBOUNDED_acc_0_31017_31050,
    OUT_UNBOUNDED_acc_0_31017_31051 => OUT_UNBOUNDED_acc_0_31017_31051,
    OUT_UNBOUNDED_acc_0_31017_31052 => OUT_UNBOUNDED_acc_0_31017_31052,
    OUT_UNBOUNDED_acc_0_31017_31053 => OUT_UNBOUNDED_acc_0_31017_31053,
    OUT_UNBOUNDED_acc_0_31017_31054 => OUT_UNBOUNDED_acc_0_31017_31054,
    OUT_UNBOUNDED_acc_0_31017_31055 => OUT_UNBOUNDED_acc_0_31017_31055,
    OUT_UNBOUNDED_acc_0_31017_31056 => OUT_UNBOUNDED_acc_0_31017_31056,
    clock => clock,
    reset => reset,
    in_port_param => param,
    in_port_result => result,
    M_Rdata_ram => M_Rdata_ram,
    M_DataRdy => M_DataRdy,
    Min_oe_ram => Min_oe_ram,
    Min_we_ram => Min_we_ram,
    Min_addr_ram => Min_addr_ram,
    Min_Wdata_ram => Min_Wdata_ram,
    Min_data_ram_size => Min_data_ram_size,
    selector_IN_UNBOUNDED_acc_0_31017_31048 => selector_IN_UNBOUNDED_acc_0_31017_31048,
    selector_IN_UNBOUNDED_acc_0_31017_31049 => selector_IN_UNBOUNDED_acc_0_31017_31049,
    selector_IN_UNBOUNDED_acc_0_31017_31050 => selector_IN_UNBOUNDED_acc_0_31017_31050,
    selector_IN_UNBOUNDED_acc_0_31017_31051 => selector_IN_UNBOUNDED_acc_0_31017_31051,
    selector_IN_UNBOUNDED_acc_0_31017_31052 => selector_IN_UNBOUNDED_acc_0_31017_31052,
    selector_IN_UNBOUNDED_acc_0_31017_31053 => selector_IN_UNBOUNDED_acc_0_31017_31053,
    selector_IN_UNBOUNDED_acc_0_31017_31054 => selector_IN_UNBOUNDED_acc_0_31017_31054,
    selector_IN_UNBOUNDED_acc_0_31017_31055 => selector_IN_UNBOUNDED_acc_0_31017_31055,
    selector_IN_UNBOUNDED_acc_0_31017_31056 => selector_IN_UNBOUNDED_acc_0_31017_31056,
    fuselector_MEMORY_CTRL_D21_18_i0_LOAD => fuselector_MEMORY_CTRL_D21_18_i0_LOAD,
    fuselector_MEMORY_CTRL_D21_18_i0_STORE => fuselector_MEMORY_CTRL_D21_18_i0_STORE,
    selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0 => selector_MUX_0_MEMORY_CTRL_D21_18_i0_0_0_0,
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\ => \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_0\,
    \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\ => \selector_MUX_19___float_mule8m23b_127nih_21_i0_0_0_1\,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_0,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_1,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_0_2,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_0,
    selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1 => selector_MUX_1_MEMORY_CTRL_D21_18_i0_1_1_1,
    \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\ => \selector_MUX_20___float_mule8m23b_127nih_21_i0_1_0_0\,
    \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\ => \selector_MUX_21___int32_to_float32e8m23b_127nih_22_i0_0_0_0\,
    selector_MUX_44_vb_assign_conn_obj_0_0_0_0 => selector_MUX_44_vb_assign_conn_obj_0_0_0_0,
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_10 => wrenable_reg_10,
    wrenable_reg_11 => wrenable_reg_11,
    wrenable_reg_12 => wrenable_reg_12,
    wrenable_reg_13 => wrenable_reg_13,
    wrenable_reg_14 => wrenable_reg_14,
    wrenable_reg_15 => wrenable_reg_15,
    wrenable_reg_2 => wrenable_reg_2,
    wrenable_reg_3 => wrenable_reg_3,
    wrenable_reg_4 => wrenable_reg_4,
    wrenable_reg_5 => wrenable_reg_5,
    wrenable_reg_6 => wrenable_reg_6,
    wrenable_reg_7 => wrenable_reg_7,
    wrenable_reg_8 => wrenable_reg_8,
    wrenable_reg_9 => wrenable_reg_9);
  done_delayed_REG : flipflop_AR generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => done_delayed_REG_signal_out,
    clock => clock,
    reset => reset,
    in1 => done_delayed_REG_signal_in);
  -- io-signal post fix
  done_port <= done_delayed_REG_signal_out;

end acc_0_archb;

-- Minimal interface for function: acc_0
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity acc_0 is 
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  param : in std_logic_vector(31 downto 0) ;
  result : in std_logic_vector(31 downto 0) ;
  M_Rdata_ram : in std_logic_vector(31 downto 0) ;
  M_DataRdy : in std_logic;
  -- OUT
  done_port : out std_logic;
  Mout_oe_ram : out std_logic;
  Mout_we_ram : out std_logic;
  Mout_addr_ram : out std_logic_vector(31 downto 0) ;
  Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
  Mout_data_ram_size : out std_logic_vector(5 downto 0) 

);
end acc_0;

architecture acc_0_arch of acc_0 is
  -- Component and signal declarations
  
  component acc_0b
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    param : in std_logic_vector(31 downto 0) ;
    result : in std_logic_vector(31 downto 0) ;
    M_Rdata_ram : in std_logic_vector(31 downto 0) ;
    M_DataRdy : in std_logic;
    Min_oe_ram : in std_logic;
    Min_we_ram : in std_logic;
    Min_addr_ram : in std_logic_vector(31 downto 0) ;
    Min_Wdata_ram : in std_logic_vector(31 downto 0) ;
    Min_data_ram_size : in std_logic_vector(5 downto 0) ;
    -- OUT
    done_port : out std_logic;
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) 
  
  );
  end component;
begin
  \_acc_0_i0\ : acc_0b port map (done_port => done_port,
    Mout_oe_ram => Mout_oe_ram,
    Mout_we_ram => Mout_we_ram,
    Mout_addr_ram => Mout_addr_ram,
    Mout_Wdata_ram => Mout_Wdata_ram,
    Mout_data_ram_size => Mout_data_ram_size,
    clock => clock,
    reset => reset,
    start_port => start_port,
    param => param,
    result => result,
    M_Rdata_ram => M_Rdata_ram,
    M_DataRdy => M_DataRdy,
    Min_oe_ram => '0',
    Min_we_ram => '0',
    Min_addr_ram => "00000000000000000000000000000000",
    Min_Wdata_ram => "00000000000000000000000000000000",
    Min_data_ram_size => "000000");

end acc_0_arch;


