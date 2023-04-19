-- 
-- Politecnico di Milano
-- Code created using PandA - Version: PandA 0.9.8 - Revision eda4c22d5adaec44fd8489ae49b854b244d2cf70-HEAD - Date 2023-04-19T13:17:02
-- bambu executed with: bambu --writer=H --generate-interface=MINIMAL --memory-allocation-policy=NO_BRAM --channels-type=MEM_ACC_11 --memory-ctrl-type=D21 --top-fname=acc_1 --top-rtldesign-name=acc_1 ../src/main.c 
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

-- Datapath RTL description for acc_1
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
entity datapath_acc_1 is 
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
  selector_IN_UNBOUNDED_acc_1_31022_31116 : in std_logic;
  selector_IN_UNBOUNDED_acc_1_31022_31118 : in std_logic;
  fuselector_MEMORY_CTRL_D21_63_i0_LOAD : in std_logic;
  fuselector_MEMORY_CTRL_D21_63_i0_STORE : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 : in std_logic;
  selector_MUX_262_vb_assign_conn_obj_0_0_0_0 : in std_logic;
  wrenable_reg_0 : in std_logic;
  wrenable_reg_1 : in std_logic;
  wrenable_reg_10 : in std_logic;
  wrenable_reg_11 : in std_logic;
  wrenable_reg_12 : in std_logic;
  wrenable_reg_13 : in std_logic;
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
  OUT_UNBOUNDED_acc_1_31022_31116 : out std_logic;
  OUT_UNBOUNDED_acc_1_31022_31118 : out std_logic

);
end datapath_acc_1;

architecture datapath_acc_1_arch of datapath_acc_1 is
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
  signal out_MEMORY_CTRL_D21_63_i0_MEMORY_CTRL_D21_63_i0 : std_logic_vector(31 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 : std_logic_vector(31 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 : std_logic_vector(31 downto 0) ;
  signal out_MUX_262_vb_assign_conn_obj_0_0_0_0 : std_logic_vector(31 downto 0) ;
  signal out_UIdata_converter_FU_30_i0_fu_acc_1_31022_34016 : signed (1 downto 0);
  signal out_UUdata_converter_FU_25_i0_fu_acc_1_31022_33998 : std_logic_vector(0 downto 0);
  signal out_UUdata_converter_FU_26_i0_fu_acc_1_31022_34001 : std_logic_vector(0 downto 0);
  signal out_UUdata_converter_FU_29_i0_fu_acc_1_31022_34013 : std_logic_vector(0 downto 0);
  signal out_UUdata_converter_FU_2_i0_fu_acc_1_31022_32236 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_31_i0_fu_acc_1_31022_34028 : std_logic_vector(9 downto 0) ;
  signal out_UUdata_converter_FU_36_i0_fu_acc_1_31022_34073 : std_logic_vector(0 downto 0);
  signal out_UUdata_converter_FU_3_i0_fu_acc_1_31022_32233 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_4_i0_fu_acc_1_31022_32243 : std_logic_vector(30 downto 0) ;
  signal out_UUdata_converter_FU_5_i0_fu_acc_1_31022_33899 : std_logic_vector(7 downto 0) ;
  signal out_UUdata_converter_FU_61_i0_fu_acc_1_31022_32240 : std_logic_vector(31 downto 0) ;
  signal out_UUdata_converter_FU_7_i0_fu_acc_1_31022_33905 : std_logic_vector(0 downto 0);
  signal out_const_0 : std_logic_vector(0 downto 0);
  signal out_const_1 : std_logic_vector(1 downto 0) ;
  signal out_const_10 : std_logic_vector(13 downto 0) ;
  signal out_const_11 : std_logic_vector(23 downto 0) ;
  signal out_const_12 : std_logic_vector(63 downto 0) ;
  signal out_const_13 : std_logic_vector(3 downto 0) ;
  signal out_const_14 : std_logic_vector(4 downto 0) ;
  signal out_const_15 : std_logic_vector(4 downto 0) ;
  signal out_const_16 : std_logic_vector(1 downto 0) ;
  signal out_const_17 : std_logic_vector(4 downto 0) ;
  signal out_const_18 : std_logic_vector(4 downto 0) ;
  signal out_const_19 : std_logic_vector(3 downto 0) ;
  signal out_const_2 : std_logic_vector(6 downto 0) ;
  signal out_const_20 : std_logic_vector(4 downto 0) ;
  signal out_const_21 : std_logic_vector(4 downto 0) ;
  signal out_const_22 : std_logic_vector(2 downto 0) ;
  signal out_const_23 : std_logic_vector(4 downto 0) ;
  signal out_const_24 : std_logic_vector(7 downto 0) ;
  signal out_const_25 : std_logic_vector(55 downto 0) ;
  signal out_const_26 : std_logic_vector(10 downto 0) ;
  signal out_const_27 : std_logic_vector(4 downto 0) ;
  signal out_const_28 : std_logic_vector(4 downto 0) ;
  signal out_const_29 : std_logic_vector(59 downto 0) ;
  signal out_const_3 : std_logic_vector(5 downto 0) ;
  signal out_const_30 : std_logic_vector(4 downto 0) ;
  signal out_const_31 : std_logic_vector(6 downto 0) ;
  signal out_const_32 : std_logic_vector(7 downto 0) ;
  signal out_const_33 : std_logic_vector(30 downto 0) ;
  signal out_const_34 : std_logic_vector(9 downto 0) ;
  signal out_const_35 : std_logic_vector(22 downto 0) ;
  signal out_const_36 : std_logic_vector(31 downto 0) ;
  signal out_const_37 : std_logic_vector(30 downto 0) ;
  signal out_const_38 : std_logic_vector(31 downto 0) ;
  signal out_const_39 : std_logic_vector(32 downto 0) ;
  signal out_const_4 : std_logic_vector(5 downto 0) ;
  signal out_const_40 : std_logic_vector(46 downto 0) ;
  signal out_const_5 : std_logic_vector(5 downto 0) ;
  signal out_const_6 : std_logic_vector(0 downto 0);
  signal out_const_7 : std_logic_vector(5 downto 0) ;
  signal out_const_8 : std_logic_vector(7 downto 0) ;
  signal out_const_9 : std_logic_vector(9 downto 0) ;
  signal out_conv_out_const_2_7_6 : std_logic_vector(5 downto 0) ;
  signal out_lut_expr_FU_28_i0_fu_acc_1_31022_34010 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_35_i0_fu_acc_1_31022_34070 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_39_i0_fu_acc_1_31022_34265 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_40_i0_fu_acc_1_31022_34268 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_41_i0_fu_acc_1_31022_34271 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_42_i0_fu_acc_1_31022_34275 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_43_i0_fu_acc_1_31022_34278 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_44_i0_fu_acc_1_31022_34100 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_54_i0_fu_acc_1_31022_34136 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_55_i0_fu_acc_1_31022_34283 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_56_i0_fu_acc_1_31022_34286 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_57_i0_fu_acc_1_31022_34289 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_58_i0_fu_acc_1_31022_34148 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_59_i0_fu_acc_1_31022_34151 : std_logic_vector(0 downto 0);
  signal out_lut_expr_FU_60_i0_fu_acc_1_31022_34169 : std_logic_vector(0 downto 0);
  signal out_reg_0_reg_0 : std_logic_vector(31 downto 0) ;
  signal out_reg_10_reg_10 : std_logic_vector(31 downto 0) ;
  signal out_reg_11_reg_11 : std_logic_vector(0 downto 0);
  signal out_reg_12_reg_12 : std_logic_vector(0 downto 0);
  signal out_reg_13_reg_13 : std_logic_vector(31 downto 0) ;
  signal out_reg_1_reg_1 : std_logic_vector(31 downto 0) ;
  signal out_reg_2_reg_2 : std_logic_vector(31 downto 0) ;
  signal out_reg_3_reg_3 : std_logic_vector(31 downto 0) ;
  signal out_reg_4_reg_4 : std_logic_vector(8 downto 0) ;
  signal out_reg_5_reg_5 : std_logic_vector(31 downto 0) ;
  signal out_reg_6_reg_6 : std_logic_vector(47 downto 0) ;
  signal out_reg_7_reg_7 : std_logic_vector(0 downto 0);
  signal out_reg_8_reg_8 : std_logic_vector(1 downto 0) ;
  signal out_reg_9_reg_9 : std_logic_vector(0 downto 0);
  signal out_ui_bit_and_expr_FU_0_32_32_64_i0_fu_acc_1_31022_34130 : unsigned (30 downto 0);
  signal out_ui_bit_and_expr_FU_0_64_64_65_i0_fu_acc_1_31022_34022 : unsigned (46 downto 0);
  signal out_ui_bit_and_expr_FU_0_64_64_66_i0_fu_acc_1_31022_34043 : unsigned (32 downto 0);
  signal out_ui_bit_and_expr_FU_32_0_32_67_i0_fu_acc_1_31022_33888 : unsigned (22 downto 0);
  signal out_ui_bit_and_expr_FU_32_0_32_67_i1_fu_acc_1_31022_34037 : unsigned (22 downto 0);
  signal out_ui_bit_and_expr_FU_32_0_32_67_i2_fu_acc_1_31022_34052 : unsigned (22 downto 0);
  signal out_ui_bit_and_expr_FU_32_0_32_68_i0_fu_acc_1_31022_33959 : unsigned (23 downto 0);
  signal out_ui_bit_and_expr_FU_8_0_8_69_i0_fu_acc_1_31022_33896 : unsigned (7 downto 0);
  signal out_ui_bit_and_expr_FU_8_0_8_70_i0_fu_acc_1_31022_33950 : unsigned (6 downto 0);
  signal out_ui_bit_ior_concat_expr_FU_71_i0_fu_acc_1_31022_33953 : unsigned (8 downto 0);
  signal out_ui_bit_ior_expr_FU_0_32_32_72_i0_fu_acc_1_31022_33956 : unsigned (23 downto 0);
  signal out_ui_bit_ior_expr_FU_0_32_32_73_i0_fu_acc_1_31022_33962 : unsigned (31 downto 0);
  signal out_ui_bit_ior_expr_FU_0_32_32_74_i0_fu_acc_1_31022_34133 : unsigned (31 downto 0);
  signal out_ui_bit_ior_expr_FU_0_64_64_75_i0_fu_acc_1_31022_34040 : unsigned (32 downto 0);
  signal out_ui_cond_expr_FU_16_16_16_16_76_i0_fu_acc_1_31022_34163 : unsigned (9 downto 0);
  signal out_ui_cond_expr_FU_16_16_16_16_76_i1_fu_acc_1_31022_34178 : unsigned (9 downto 0);
  signal out_ui_cond_expr_FU_32_32_32_32_77_i0_fu_acc_1_31022_34154 : unsigned (31 downto 0);
  signal out_ui_cond_expr_FU_32_32_32_32_77_i1_fu_acc_1_31022_34157 : unsigned (31 downto 0);
  signal out_ui_cond_expr_FU_32_32_32_32_77_i2_fu_acc_1_31022_34184 : unsigned (31 downto 0);
  signal out_ui_eq_expr_FU_32_0_32_78_i0_fu_acc_1_31022_33911 : std_logic_vector(0 downto 0);
  signal out_ui_extract_bit_expr_FU_10_i0_fu_acc_1_31022_34206 : std_logic;
  signal out_ui_extract_bit_expr_FU_11_i0_fu_acc_1_31022_34210 : std_logic;
  signal out_ui_extract_bit_expr_FU_12_i0_fu_acc_1_31022_34214 : std_logic;
  signal out_ui_extract_bit_expr_FU_13_i0_fu_acc_1_31022_34218 : std_logic;
  signal out_ui_extract_bit_expr_FU_14_i0_fu_acc_1_31022_34222 : std_logic;
  signal out_ui_extract_bit_expr_FU_15_i0_fu_acc_1_31022_34226 : std_logic;
  signal out_ui_extract_bit_expr_FU_16_i0_fu_acc_1_31022_34230 : std_logic;
  signal out_ui_extract_bit_expr_FU_17_i0_fu_acc_1_31022_34234 : std_logic;
  signal out_ui_extract_bit_expr_FU_18_i0_fu_acc_1_31022_34238 : std_logic;
  signal out_ui_extract_bit_expr_FU_19_i0_fu_acc_1_31022_34242 : std_logic;
  signal out_ui_extract_bit_expr_FU_20_i0_fu_acc_1_31022_34246 : std_logic;
  signal out_ui_extract_bit_expr_FU_21_i0_fu_acc_1_31022_34250 : std_logic;
  signal out_ui_extract_bit_expr_FU_22_i0_fu_acc_1_31022_34254 : std_logic;
  signal out_ui_extract_bit_expr_FU_23_i0_fu_acc_1_31022_34258 : std_logic;
  signal out_ui_extract_bit_expr_FU_24_i0_fu_acc_1_31022_33995 : std_logic;
  signal out_ui_extract_bit_expr_FU_27_i0_fu_acc_1_31022_34007 : std_logic;
  signal out_ui_extract_bit_expr_FU_32_i0_fu_acc_1_31022_34046 : std_logic;
  signal out_ui_extract_bit_expr_FU_33_i0_fu_acc_1_31022_34064 : std_logic;
  signal out_ui_extract_bit_expr_FU_34_i0_fu_acc_1_31022_34067 : std_logic;
  signal out_ui_extract_bit_expr_FU_37_i0_fu_acc_1_31022_34079 : std_logic;
  signal out_ui_extract_bit_expr_FU_38_i0_fu_acc_1_31022_34082 : std_logic;
  signal out_ui_extract_bit_expr_FU_45_i0_fu_acc_1_31022_34103 : std_logic;
  signal out_ui_extract_bit_expr_FU_46_i0_fu_acc_1_31022_34106 : std_logic;
  signal out_ui_extract_bit_expr_FU_47_i0_fu_acc_1_31022_34109 : std_logic;
  signal out_ui_extract_bit_expr_FU_48_i0_fu_acc_1_31022_34112 : std_logic;
  signal out_ui_extract_bit_expr_FU_49_i0_fu_acc_1_31022_34115 : std_logic;
  signal out_ui_extract_bit_expr_FU_50_i0_fu_acc_1_31022_34118 : std_logic;
  signal out_ui_extract_bit_expr_FU_51_i0_fu_acc_1_31022_34121 : std_logic;
  signal out_ui_extract_bit_expr_FU_52_i0_fu_acc_1_31022_34124 : std_logic;
  signal out_ui_extract_bit_expr_FU_53_i0_fu_acc_1_31022_34127 : std_logic;
  signal out_ui_extract_bit_expr_FU_6_i0_fu_acc_1_31022_34194 : std_logic;
  signal out_ui_extract_bit_expr_FU_8_i0_fu_acc_1_31022_34198 : std_logic;
  signal out_ui_extract_bit_expr_FU_9_i0_fu_acc_1_31022_34202 : std_logic;
  signal out_ui_lshift_expr_FU_16_0_16_79_i0_fu_acc_1_31022_33947 : unsigned (8 downto 0);
  signal out_ui_lshift_expr_FU_32_0_32_80_i0_fu_acc_1_31022_33908 : unsigned (31 downto 0);
  signal out_ui_lshift_expr_FU_32_0_32_81_i0_fu_acc_1_31022_34055 : unsigned (23 downto 0);
  signal out_ui_lshift_expr_FU_32_0_32_82_i0_fu_acc_1_31022_34166 : unsigned (31 downto 0);
  signal out_ui_lshift_expr_FU_32_0_32_82_i1_fu_acc_1_31022_34181 : unsigned (31 downto 0);
  signal out_ui_lshift_expr_FU_64_0_64_83_i0_fu_acc_1_31022_33992 : unsigned (47 downto 0);
  signal out_ui_lshift_expr_FU_64_0_64_84_i0_fu_acc_1_31022_34025 : unsigned (47 downto 0);
  signal out_ui_lshift_expr_FU_64_0_64_85_i0_fu_acc_1_31022_34031 : unsigned (32 downto 0);
  signal out_ui_lshift_expr_FU_64_64_64_86_i0_fu_acc_1_31022_34019 : unsigned (46 downto 0);
  signal out_ui_mult_expr_FU_18_25_32_0_87_i0_fu_acc_1_31022_33989 : unsigned (25 downto 0);
  signal out_ui_ne_expr_FU_32_0_32_88_i0_fu_acc_1_31022_33938 : std_logic_vector(0 downto 0);
  signal out_ui_ne_expr_FU_32_0_32_89_i0_fu_acc_1_31022_34061 : std_logic_vector(0 downto 0);
  signal out_ui_plus_expr_FU_1_0_1_90_i0_fu_acc_1_31022_33944 : unsigned (1 downto 0);
  signal out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076 : unsigned (32 downto 0);
  signal out_ui_rshift_expr_FU_32_0_32_92_i0_fu_acc_1_31022_33893 : unsigned (7 downto 0);
  signal out_ui_rshift_expr_FU_32_0_32_93_i0_fu_acc_1_31022_34058 : unsigned (22 downto 0);
  signal out_ui_rshift_expr_FU_32_0_32_94_i0_fu_acc_1_31022_34160 : unsigned (9 downto 0);
  signal out_ui_rshift_expr_FU_32_0_32_94_i1_fu_acc_1_31022_34175 : unsigned (9 downto 0);
  signal out_ui_rshift_expr_FU_32_0_32_95_i0_fu_acc_1_31022_34172 : unsigned (9 downto 0);
  signal out_ui_rshift_expr_FU_64_0_64_96_i0_fu_acc_1_31022_34034 : unsigned (22 downto 0);
  signal out_ui_rshift_expr_FU_64_0_64_97_i0_fu_acc_1_31022_34049 : unsigned (22 downto 0);
  signal out_ui_rshift_expr_FU_8_0_8_98_i0_fu_acc_1_31022_33941 : unsigned (0 downto 0);
  signal out_ui_ternary_plus_expr_FU_16_0_16_16_99_i0_fu_acc_1_31022_34004 : unsigned (9 downto 0);
  signal out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0 : std_logic_vector(31 downto 0) ;
  signal s_MEMORY_CTRL_D21_63_i00 : std_logic;
  signal s_done_MEMORY_CTRL_D21_63_i0 : std_logic;
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
    in1 => out_MUX_262_vb_assign_conn_obj_0_0_0_0);
  MEMORY_CTRL_D21_63_i0 : MEMORY_CTRL_D21 generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_in3=>6,
    BITSIZE_out1=>32,
    BITSIZE_Min_addr_ram=>32,
    BITSIZE_Mout_addr_ram=>32,
    BITSIZE_M_Rdata_ram=>32,
    BITSIZE_Min_Wdata_ram=>32,
    BITSIZE_Mout_Wdata_ram=>32,
    BITSIZE_Min_data_ram_size=>6,
    BITSIZE_Mout_data_ram_size=>6) port map (done_port => s_done_MEMORY_CTRL_D21_63_i0,
    out1 => out_MEMORY_CTRL_D21_63_i0_MEMORY_CTRL_D21_63_i0,
    Mout_oe_ram => sig_in_bus_mergerMout_oe_ram3_0,
    Mout_we_ram => sig_in_bus_mergerMout_we_ram4_0,
    Mout_addr_ram => sig_in_bus_mergerMout_addr_ram1_0,
    Mout_Wdata_ram => sig_in_bus_mergerMout_Wdata_ram0_0,
    Mout_data_ram_size => sig_in_bus_mergerMout_data_ram_size2_0,
    clock => clock,
    start_port => s_MEMORY_CTRL_D21_63_i00,
    in1 => out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0,
    in2 => out_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1,
    in3 => out_conv_out_const_2_7_6,
    in4 => out_const_6(0),
    sel_LOAD => fuselector_MEMORY_CTRL_D21_63_i0_LOAD,
    sel_STORE => fuselector_MEMORY_CTRL_D21_63_i0_STORE,
    Min_oe_ram => Min_oe_ram,
    Min_we_ram => Min_we_ram,
    Min_addr_ram => Min_addr_ram,
    M_Rdata_ram => M_Rdata_ram,
    Min_Wdata_ram => Min_Wdata_ram,
    Min_data_ram_size => Min_data_ram_size,
    M_DataRdy => M_DataRdy);
  MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0,
    sel => selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0,
    in1 => out_reg_2_reg_2,
    in2 => out_reg_1_reg_1);
  MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1,
    sel => selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1,
    in1 => out_UUdata_converter_FU_3_i0_fu_acc_1_31022_32233,
    in2 => out_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0);
  MUX_262_vb_assign_conn_obj_0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_262_vb_assign_conn_obj_0_0_0_0,
    sel => selector_MUX_262_vb_assign_conn_obj_0_0_0_0,
    in1 => out_reg_13_reg_13,
    in2 => out_UUdata_converter_FU_61_i0_fu_acc_1_31022_32240);
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
  const_0 : constant_value generic map(BITSIZE_out1=>1,
    value=>"0") port map (out1 => out_const_0);
  const_1 : constant_value generic map(BITSIZE_out1=>2,
    value=>"01") port map (out1 => out_const_1);
  const_10 : constant_value generic map(BITSIZE_out1=>14,
    value=>"10000000000000") port map (out1 => out_const_10);
  const_11 : constant_value generic map(BITSIZE_out1=>24,
    value=>"100000000000000000000000") port map (out1 => out_const_11);
  const_12 : constant_value generic map(BITSIZE_out1=>64,
    value=>"1000000000000000000000000000000000000000000000000000000000000000") port map (out1 => out_const_12);
  const_13 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1001") port map (out1 => out_const_13);
  const_14 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10110") port map (out1 => out_const_14);
  const_15 : constant_value generic map(BITSIZE_out1=>5,
    value=>"10111") port map (out1 => out_const_15);
  const_16 : constant_value generic map(BITSIZE_out1=>2,
    value=>"11") port map (out1 => out_const_16);
  const_17 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11000") port map (out1 => out_const_17);
  const_18 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11001") port map (out1 => out_const_18);
  const_19 : constant_value generic map(BITSIZE_out1=>4,
    value=>"1101") port map (out1 => out_const_19);
  const_2 : constant_value generic map(BITSIZE_out1=>7,
    value=>"0100000") port map (out1 => out_const_2);
  const_20 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11010") port map (out1 => out_const_20);
  const_21 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11011") port map (out1 => out_const_21);
  const_22 : constant_value generic map(BITSIZE_out1=>3,
    value=>"111") port map (out1 => out_const_22);
  const_23 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11100") port map (out1 => out_const_23);
  const_24 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11100000") port map (out1 => out_const_24);
  const_25 : constant_value generic map(BITSIZE_out1=>56,
    value=>"11100000000000000000000011111111000111111111111111111111") port map (out1 => out_const_25);
  const_26 : constant_value generic map(BITSIZE_out1=>11,
    value=>"11100001111") port map (out1 => out_const_26);
  const_27 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11101") port map (out1 => out_const_27);
  const_28 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11110") port map (out1 => out_const_28);
  const_29 : constant_value generic map(BITSIZE_out1=>60,
    value=>"111100000000000011110000000011101110111011101111111111111111") port map (out1 => out_const_29);
  const_3 : constant_value generic map(BITSIZE_out1=>6,
    value=>"010111") port map (out1 => out_const_3);
  const_30 : constant_value generic map(BITSIZE_out1=>5,
    value=>"11111") port map (out1 => out_const_30);
  const_31 : constant_value generic map(BITSIZE_out1=>7,
    value=>"1111111") port map (out1 => out_const_31);
  const_32 : constant_value generic map(BITSIZE_out1=>8,
    value=>"11111111") port map (out1 => out_const_32);
  const_33 : constant_value generic map(BITSIZE_out1=>31,
    value=>"1111111100000000000000000000000") port map (out1 => out_const_33);
  const_34 : constant_value generic map(BITSIZE_out1=>10,
    value=>"1111111111") port map (out1 => out_const_34);
  const_35 : constant_value generic map(BITSIZE_out1=>23,
    value=>"11111111111111111111111") port map (out1 => out_const_35);
  const_36 : constant_value generic map(BITSIZE_out1=>32,
    value=>"11111111111111111111111110000001") port map (out1 => out_const_36);
  const_37 : constant_value generic map(BITSIZE_out1=>31,
    value=>"1111111111111111111111111111111") port map (out1 => out_const_37);
  const_38 : constant_value generic map(BITSIZE_out1=>32,
    value=>"11111111111111111111111111111111") port map (out1 => out_const_38);
  const_39 : constant_value generic map(BITSIZE_out1=>33,
    value=>"111111111111111111111111111111111") port map (out1 => out_const_39);
  const_4 : constant_value generic map(BITSIZE_out1=>6,
    value=>"011001") port map (out1 => out_const_4);
  const_40 : constant_value generic map(BITSIZE_out1=>47,
    value=>"11111111111111111111111111111111111111111111111") port map (out1 => out_const_40);
  const_5 : constant_value generic map(BITSIZE_out1=>6,
    value=>"011111") port map (out1 => out_const_5);
  const_6 : constant_value generic map(BITSIZE_out1=>1,
    value=>"1") port map (out1 => out_const_6);
  const_7 : constant_value generic map(BITSIZE_out1=>6,
    value=>"100000") port map (out1 => out_const_7);
  const_8 : constant_value generic map(BITSIZE_out1=>8,
    value=>"10000000") port map (out1 => out_const_8);
  const_9 : constant_value generic map(BITSIZE_out1=>10,
    value=>"1000000000") port map (out1 => out_const_9);
  conv_out_const_2_7_6 : UUdata_converter_FU generic map(BITSIZE_in1=>7,
    BITSIZE_out1=>6) port map (out1 => out_conv_out_const_2_7_6,
    in1 => out_const_2);
  fu_acc_1_31022_32233 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_3_i0_fu_acc_1_31022_32233,
    in1 => in_port_param);
  fu_acc_1_31022_32236 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_2_i0_fu_acc_1_31022_32236,
    in1 => in_port_result);
  fu_acc_1_31022_32240 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_61_i0_fu_acc_1_31022_32240,
    in1 => std_logic_vector(out_ui_cond_expr_FU_32_32_32_32_77_i2_fu_acc_1_31022_34184));
  fu_acc_1_31022_32243 : UUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>31) port map (out1 => out_UUdata_converter_FU_4_i0_fu_acc_1_31022_32243,
    in1 => out_reg_0_reg_0);
  fu_acc_1_31022_33888 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => out_ui_bit_and_expr_FU_32_0_32_67_i0_fu_acc_1_31022_33888,
    in1 => unsigned(out_UUdata_converter_FU_4_i0_fu_acc_1_31022_32243),
    in2 => unsigned(out_const_35));
  fu_acc_1_31022_33893 : ui_rshift_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>6,
    BITSIZE_out1=>8,
    PRECISION=>64) port map (out1 => out_ui_rshift_expr_FU_32_0_32_92_i0_fu_acc_1_31022_33893,
    in1 => unsigned(out_UUdata_converter_FU_4_i0_fu_acc_1_31022_32243),
    in2 => out_const_3);
  fu_acc_1_31022_33896 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>8,
    BITSIZE_out1=>8) port map (out1 => out_ui_bit_and_expr_FU_8_0_8_69_i0_fu_acc_1_31022_33896,
    in1 => out_ui_rshift_expr_FU_32_0_32_92_i0_fu_acc_1_31022_33893,
    in2 => unsigned(out_const_32));
  fu_acc_1_31022_33899 : UUdata_converter_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>8) port map (out1 => out_UUdata_converter_FU_5_i0_fu_acc_1_31022_33899,
    in1 => std_logic_vector(out_ui_bit_and_expr_FU_8_0_8_69_i0_fu_acc_1_31022_33896));
  fu_acc_1_31022_33905 : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_7_i0_fu_acc_1_31022_33905,
    in1(0) => out_ui_extract_bit_expr_FU_6_i0_fu_acc_1_31022_34194);
  fu_acc_1_31022_33908 : ui_lshift_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>6,
    BITSIZE_out1=>32,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_32_0_32_80_i0_fu_acc_1_31022_33908,
    in1 => unsigned(out_UUdata_converter_FU_7_i0_fu_acc_1_31022_33905),
    in2 => out_const_5);
  fu_acc_1_31022_33911 : ui_eq_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => out_ui_eq_expr_FU_32_0_32_78_i0_fu_acc_1_31022_33911,
    in1 => out_ui_bit_and_expr_FU_32_0_32_67_i0_fu_acc_1_31022_33888,
    in2 => unsigned(out_const_0));
  fu_acc_1_31022_33938 : ui_ne_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => out_ui_ne_expr_FU_32_0_32_88_i0_fu_acc_1_31022_33938,
    in1 => out_ui_bit_and_expr_FU_32_0_32_67_i0_fu_acc_1_31022_33888,
    in2 => unsigned(out_const_0));
  fu_acc_1_31022_33941 : ui_rshift_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>3,
    BITSIZE_out1=>1,
    PRECISION=>32) port map (out1 => out_ui_rshift_expr_FU_8_0_8_98_i0_fu_acc_1_31022_33941,
    in1 => unsigned(out_UUdata_converter_FU_5_i0_fu_acc_1_31022_33899),
    in2 => out_const_22);
  fu_acc_1_31022_33944 : ui_plus_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>1,
    BITSIZE_out1=>2) port map (out1 => out_ui_plus_expr_FU_1_0_1_90_i0_fu_acc_1_31022_33944,
    in1 => out_ui_rshift_expr_FU_8_0_8_98_i0_fu_acc_1_31022_33941,
    in2 => unsigned(out_const_6));
  fu_acc_1_31022_33947 : ui_lshift_expr_FU generic map(BITSIZE_in1=>2,
    BITSIZE_in2=>3,
    BITSIZE_out1=>9,
    PRECISION=>32) port map (out1 => out_ui_lshift_expr_FU_16_0_16_79_i0_fu_acc_1_31022_33947,
    in1 => out_ui_plus_expr_FU_1_0_1_90_i0_fu_acc_1_31022_33944,
    in2 => out_const_22);
  fu_acc_1_31022_33950 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_in2=>7,
    BITSIZE_out1=>7) port map (out1 => out_ui_bit_and_expr_FU_8_0_8_70_i0_fu_acc_1_31022_33950,
    in1 => unsigned(out_UUdata_converter_FU_5_i0_fu_acc_1_31022_33899),
    in2 => unsigned(out_const_31));
  fu_acc_1_31022_33953 : ui_bit_ior_concat_expr_FU generic map(BITSIZE_in1=>9,
    BITSIZE_in2=>7,
    BITSIZE_in3=>3,
    BITSIZE_out1=>9,
    OFFSET_PARAMETER=>7) port map (out1 => out_ui_bit_ior_concat_expr_FU_71_i0_fu_acc_1_31022_33953,
    in1 => out_ui_lshift_expr_FU_16_0_16_79_i0_fu_acc_1_31022_33947,
    in2 => out_ui_bit_and_expr_FU_8_0_8_70_i0_fu_acc_1_31022_33950,
    in3 => unsigned(out_const_22));
  fu_acc_1_31022_33956 : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>23,
    BITSIZE_out1=>24) port map (out1 => out_ui_bit_ior_expr_FU_0_32_32_72_i0_fu_acc_1_31022_33956,
    in1 => unsigned(out_const_11),
    in2 => out_ui_bit_and_expr_FU_32_0_32_67_i0_fu_acc_1_31022_33888);
  fu_acc_1_31022_33959 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>32,
    BITSIZE_out1=>24) port map (out1 => out_ui_bit_and_expr_FU_32_0_32_68_i0_fu_acc_1_31022_33959,
    in1 => out_ui_bit_ior_expr_FU_0_32_32_72_i0_fu_acc_1_31022_33956,
    in2 => unsigned(out_const_38));
  fu_acc_1_31022_33962 : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_ui_bit_ior_expr_FU_0_32_32_73_i0_fu_acc_1_31022_33962,
    in1 => unsigned(out_const_33),
    in2 => out_ui_lshift_expr_FU_32_0_32_80_i0_fu_acc_1_31022_33908);
  fu_acc_1_31022_33989 : ui_mult_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>2,
    BITSIZE_out1=>26,
    PIPE_PARAMETER=>0) port map (out1 => out_ui_mult_expr_FU_18_25_32_0_87_i0_fu_acc_1_31022_33989,
    clock => clock,
    in1 => out_ui_bit_and_expr_FU_32_0_32_68_i0_fu_acc_1_31022_33959,
    in2 => unsigned(out_const_16));
  fu_acc_1_31022_33992 : ui_lshift_expr_FU generic map(BITSIZE_in1=>26,
    BITSIZE_in2=>5,
    BITSIZE_out1=>48,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_64_0_64_83_i0_fu_acc_1_31022_33992,
    in1 => out_ui_mult_expr_FU_18_25_32_0_87_i0_fu_acc_1_31022_33989,
    in2 => out_const_14);
  fu_acc_1_31022_33995 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>26,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_24_i0_fu_acc_1_31022_33995,
    in1 => out_ui_mult_expr_FU_18_25_32_0_87_i0_fu_acc_1_31022_33989,
    in2 => out_const_18);
  fu_acc_1_31022_33998 : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_25_i0_fu_acc_1_31022_33998,
    in1(0) => out_ui_extract_bit_expr_FU_24_i0_fu_acc_1_31022_33995);
  fu_acc_1_31022_34001 : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_26_i0_fu_acc_1_31022_34001,
    in1 => out_UUdata_converter_FU_25_i0_fu_acc_1_31022_33998);
  fu_acc_1_31022_34004 : ui_ternary_plus_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>9,
    BITSIZE_out1=>10) port map (out1 => out_ui_ternary_plus_expr_FU_16_0_16_16_99_i0_fu_acc_1_31022_34004,
    in1 => unsigned(out_reg_7_reg_7),
    in2 => unsigned(out_const_36),
    in3 => unsigned(out_reg_4_reg_4));
  fu_acc_1_31022_34007 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>26,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_27_i0_fu_acc_1_31022_34007,
    in1 => out_ui_mult_expr_FU_18_25_32_0_87_i0_fu_acc_1_31022_33989,
    in2 => out_const_18);
  fu_acc_1_31022_34010 : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_28_i0_fu_acc_1_31022_34010,
    in1 => out_const_6,
    in2 => out_ui_extract_bit_expr_FU_27_i0_fu_acc_1_31022_34007,
    in3 => '0',
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34013 : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_29_i0_fu_acc_1_31022_34013,
    in1 => out_lut_expr_FU_28_i0_fu_acc_1_31022_34010);
  fu_acc_1_31022_34016 : UIdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>2) port map (out1 => out_UIdata_converter_FU_30_i0_fu_acc_1_31022_34016,
    in1 => unsigned(out_UUdata_converter_FU_29_i0_fu_acc_1_31022_34013));
  fu_acc_1_31022_34019 : ui_lshift_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>2,
    BITSIZE_out1=>47,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_64_64_64_86_i0_fu_acc_1_31022_34019,
    in1 => unsigned(out_reg_6_reg_6),
    in2 => out_reg_8_reg_8);
  fu_acc_1_31022_34022 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>47,
    BITSIZE_out1=>47) port map (out1 => out_ui_bit_and_expr_FU_0_64_64_65_i0_fu_acc_1_31022_34022,
    in1 => unsigned(out_const_40),
    in2 => out_ui_lshift_expr_FU_64_64_64_86_i0_fu_acc_1_31022_34019);
  fu_acc_1_31022_34025 : ui_lshift_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>2,
    BITSIZE_out1=>48,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_64_0_64_84_i0_fu_acc_1_31022_34025,
    in1 => out_ui_bit_and_expr_FU_0_64_64_65_i0_fu_acc_1_31022_34022,
    in2 => out_const_1);
  fu_acc_1_31022_34028 : UUdata_converter_FU generic map(BITSIZE_in1=>10,
    BITSIZE_out1=>10) port map (out1 => out_UUdata_converter_FU_31_i0_fu_acc_1_31022_34028,
    in1 => std_logic_vector(out_ui_ternary_plus_expr_FU_16_0_16_16_99_i0_fu_acc_1_31022_34004));
  fu_acc_1_31022_34031 : ui_lshift_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>6,
    BITSIZE_out1=>33,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_64_0_64_85_i0_fu_acc_1_31022_34031,
    in1 => unsigned(out_UUdata_converter_FU_31_i0_fu_acc_1_31022_34028),
    in2 => out_const_3);
  fu_acc_1_31022_34034 : ui_rshift_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>6,
    BITSIZE_out1=>23,
    PRECISION=>64) port map (out1 => out_ui_rshift_expr_FU_64_0_64_96_i0_fu_acc_1_31022_34034,
    in1 => out_ui_lshift_expr_FU_64_0_64_84_i0_fu_acc_1_31022_34025,
    in2 => out_const_4);
  fu_acc_1_31022_34037 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => out_ui_bit_and_expr_FU_32_0_32_67_i1_fu_acc_1_31022_34037,
    in1 => out_ui_rshift_expr_FU_64_0_64_96_i0_fu_acc_1_31022_34034,
    in2 => unsigned(out_const_35));
  fu_acc_1_31022_34040 : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>23,
    BITSIZE_out1=>33) port map (out1 => out_ui_bit_ior_expr_FU_0_64_64_75_i0_fu_acc_1_31022_34040,
    in1 => out_ui_lshift_expr_FU_64_0_64_85_i0_fu_acc_1_31022_34031,
    in2 => out_ui_bit_and_expr_FU_32_0_32_67_i1_fu_acc_1_31022_34037);
  fu_acc_1_31022_34043 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>33,
    BITSIZE_out1=>33) port map (out1 => out_ui_bit_and_expr_FU_0_64_64_66_i0_fu_acc_1_31022_34043,
    in1 => unsigned(out_const_39),
    in2 => out_ui_bit_ior_expr_FU_0_64_64_75_i0_fu_acc_1_31022_34040);
  fu_acc_1_31022_34046 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>4) port map (out1 => out_ui_extract_bit_expr_FU_32_i0_fu_acc_1_31022_34046,
    in1 => out_ui_ternary_plus_expr_FU_16_0_16_16_99_i0_fu_acc_1_31022_34004,
    in2 => out_const_13);
  fu_acc_1_31022_34049 : ui_rshift_expr_FU generic map(BITSIZE_in1=>48,
    BITSIZE_in2=>1,
    BITSIZE_out1=>23,
    PRECISION=>64) port map (out1 => out_ui_rshift_expr_FU_64_0_64_97_i0_fu_acc_1_31022_34049,
    in1 => out_ui_lshift_expr_FU_64_0_64_84_i0_fu_acc_1_31022_34025,
    in2 => out_const_6);
  fu_acc_1_31022_34052 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>23,
    BITSIZE_out1=>23) port map (out1 => out_ui_bit_and_expr_FU_32_0_32_67_i2_fu_acc_1_31022_34052,
    in1 => out_ui_rshift_expr_FU_64_0_64_97_i0_fu_acc_1_31022_34049,
    in2 => unsigned(out_const_35));
  fu_acc_1_31022_34055 : ui_lshift_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>24,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_32_0_32_81_i0_fu_acc_1_31022_34055,
    in1 => out_ui_bit_and_expr_FU_32_0_32_67_i2_fu_acc_1_31022_34052,
    in2 => out_const_6);
  fu_acc_1_31022_34058 : ui_rshift_expr_FU generic map(BITSIZE_in1=>24,
    BITSIZE_in2=>1,
    BITSIZE_out1=>23,
    PRECISION=>64) port map (out1 => out_ui_rshift_expr_FU_32_0_32_93_i0_fu_acc_1_31022_34058,
    in1 => out_ui_lshift_expr_FU_32_0_32_81_i0_fu_acc_1_31022_34055,
    in2 => out_const_6);
  fu_acc_1_31022_34061 : ui_ne_expr_FU generic map(BITSIZE_in1=>23,
    BITSIZE_in2=>1,
    BITSIZE_out1=>1) port map (out1 => out_ui_ne_expr_FU_32_0_32_89_i0_fu_acc_1_31022_34061,
    in1 => out_ui_rshift_expr_FU_32_0_32_93_i0_fu_acc_1_31022_34058,
    in2 => unsigned(out_const_0));
  fu_acc_1_31022_34064 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_33_i0_fu_acc_1_31022_34064,
    in1 => out_ui_lshift_expr_FU_64_64_64_86_i0_fu_acc_1_31022_34019,
    in2 => out_const_17);
  fu_acc_1_31022_34067 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>47,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_34_i0_fu_acc_1_31022_34067,
    in1 => out_ui_lshift_expr_FU_64_64_64_86_i0_fu_acc_1_31022_34019,
    in2 => out_const_15);
  fu_acc_1_31022_34070 : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_35_i0_fu_acc_1_31022_34070,
    in1 => out_const_24,
    in2 => out_ui_ne_expr_FU_32_0_32_89_i0_fu_acc_1_31022_34061(0),
    in3 => out_ui_extract_bit_expr_FU_33_i0_fu_acc_1_31022_34064,
    in4 => out_ui_extract_bit_expr_FU_34_i0_fu_acc_1_31022_34067,
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34073 : UUdata_converter_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_36_i0_fu_acc_1_31022_34073,
    in1 => out_lut_expr_FU_35_i0_fu_acc_1_31022_34070);
  fu_acc_1_31022_34076 : ui_plus_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>1,
    BITSIZE_out1=>33) port map (out1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in1 => out_ui_bit_and_expr_FU_0_64_64_66_i0_fu_acc_1_31022_34043,
    in2 => unsigned(out_UUdata_converter_FU_36_i0_fu_acc_1_31022_34073));
  fu_acc_1_31022_34079 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>4) port map (out1 => out_ui_extract_bit_expr_FU_37_i0_fu_acc_1_31022_34079,
    in1 => out_ui_ternary_plus_expr_FU_16_0_16_16_99_i0_fu_acc_1_31022_34004,
    in2 => out_const_13);
  fu_acc_1_31022_34082 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>6) port map (out1 => out_ui_extract_bit_expr_FU_38_i0_fu_acc_1_31022_34082,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_7);
  fu_acc_1_31022_34100 : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_44_i0_fu_acc_1_31022_34100,
    in1 => out_const_6,
    in2 => out_lut_expr_FU_42_i0_fu_acc_1_31022_34275(0),
    in3 => out_lut_expr_FU_43_i0_fu_acc_1_31022_34278(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34103 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_45_i0_fu_acc_1_31022_34103,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_15);
  fu_acc_1_31022_34106 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_46_i0_fu_acc_1_31022_34106,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_17);
  fu_acc_1_31022_34109 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_47_i0_fu_acc_1_31022_34109,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_18);
  fu_acc_1_31022_34112 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_48_i0_fu_acc_1_31022_34112,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_20);
  fu_acc_1_31022_34115 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_49_i0_fu_acc_1_31022_34115,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_21);
  fu_acc_1_31022_34118 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_50_i0_fu_acc_1_31022_34118,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_23);
  fu_acc_1_31022_34121 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_51_i0_fu_acc_1_31022_34121,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_27);
  fu_acc_1_31022_34124 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_52_i0_fu_acc_1_31022_34124,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_28);
  fu_acc_1_31022_34127 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>33,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_53_i0_fu_acc_1_31022_34127,
    in1 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076,
    in2 => out_const_30);
  fu_acc_1_31022_34130 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>33,
    BITSIZE_out1=>31) port map (out1 => out_ui_bit_and_expr_FU_0_32_32_64_i0_fu_acc_1_31022_34130,
    in1 => unsigned(out_const_37),
    in2 => out_ui_plus_expr_FU_32_32_32_91_i0_fu_acc_1_31022_34076);
  fu_acc_1_31022_34133 : ui_bit_ior_expr_FU generic map(BITSIZE_in1=>31,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_ui_bit_ior_expr_FU_0_32_32_74_i0_fu_acc_1_31022_34133,
    in1 => out_ui_bit_and_expr_FU_0_32_32_64_i0_fu_acc_1_31022_34130,
    in2 => unsigned(out_reg_3_reg_3));
  fu_acc_1_31022_34136 : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_54_i0_fu_acc_1_31022_34136,
    in1 => out_const_19,
    in2 => out_lut_expr_FU_42_i0_fu_acc_1_31022_34275(0),
    in3 => out_lut_expr_FU_43_i0_fu_acc_1_31022_34278(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34148 : lut_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_58_i0_fu_acc_1_31022_34148,
    in1 => out_const_9,
    in2 => out_reg_11_reg_11(0),
    in3 => out_reg_12_reg_12(0),
    in4 => out_lut_expr_FU_56_i0_fu_acc_1_31022_34286(0),
    in5 => out_lut_expr_FU_57_i0_fu_acc_1_31022_34289(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34151 : lut_expr_FU generic map(BITSIZE_in1=>14,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_59_i0_fu_acc_1_31022_34151,
    in1 => out_const_10,
    in2 => out_reg_11_reg_11(0),
    in3 => out_reg_12_reg_12(0),
    in4 => out_lut_expr_FU_56_i0_fu_acc_1_31022_34286(0),
    in5 => out_lut_expr_FU_57_i0_fu_acc_1_31022_34289(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34154 : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>32,
    BITSIZE_out1=>32) port map (out1 => out_ui_cond_expr_FU_32_32_32_32_77_i0_fu_acc_1_31022_34154,
    in1 => out_lut_expr_FU_59_i0_fu_acc_1_31022_34151,
    in2 => out_ui_bit_ior_expr_FU_0_32_32_74_i0_fu_acc_1_31022_34133,
    in3 => unsigned(out_reg_3_reg_3));
  fu_acc_1_31022_34157 : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>32,
    BITSIZE_out1=>32) port map (out1 => out_ui_cond_expr_FU_32_32_32_32_77_i1_fu_acc_1_31022_34157,
    in1 => out_lut_expr_FU_58_i0_fu_acc_1_31022_34148,
    in2 => unsigned(out_reg_5_reg_5),
    in3 => out_ui_cond_expr_FU_32_32_32_32_77_i0_fu_acc_1_31022_34154);
  fu_acc_1_31022_34160 : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>10,
    PRECISION=>64) port map (out1 => out_ui_rshift_expr_FU_32_0_32_94_i0_fu_acc_1_31022_34160,
    in1 => out_ui_lshift_expr_FU_32_0_32_80_i0_fu_acc_1_31022_33908,
    in2 => out_const_14);
  fu_acc_1_31022_34163 : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>10,
    BITSIZE_in3=>10,
    BITSIZE_out1=>10) port map (out1 => out_ui_cond_expr_FU_16_16_16_16_76_i0_fu_acc_1_31022_34163,
    in1 => out_lut_expr_FU_44_i0_fu_acc_1_31022_34100,
    in2 => out_ui_rshift_expr_FU_32_0_32_94_i0_fu_acc_1_31022_34160,
    in3 => unsigned(out_const_34));
  fu_acc_1_31022_34166 : ui_lshift_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>5,
    BITSIZE_out1=>32,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_32_0_32_82_i0_fu_acc_1_31022_34166,
    in1 => out_ui_cond_expr_FU_16_16_16_16_76_i0_fu_acc_1_31022_34163,
    in2 => out_const_14);
  fu_acc_1_31022_34169 : lut_expr_FU generic map(BITSIZE_in1=>4,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_60_i0_fu_acc_1_31022_34169,
    in1 => out_const_13,
    in2 => out_lut_expr_FU_42_i0_fu_acc_1_31022_34275(0),
    in3 => out_lut_expr_FU_43_i0_fu_acc_1_31022_34278(0),
    in4 => '0',
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34172 : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>10,
    PRECISION=>64) port map (out1 => out_ui_rshift_expr_FU_32_0_32_95_i0_fu_acc_1_31022_34172,
    in1 => out_ui_lshift_expr_FU_32_0_32_82_i0_fu_acc_1_31022_34166,
    in2 => out_const_14);
  fu_acc_1_31022_34175 : ui_rshift_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5,
    BITSIZE_out1=>10,
    PRECISION=>64) port map (out1 => out_ui_rshift_expr_FU_32_0_32_94_i1_fu_acc_1_31022_34175,
    in1 => out_ui_bit_ior_expr_FU_0_32_32_73_i0_fu_acc_1_31022_33962,
    in2 => out_const_14);
  fu_acc_1_31022_34178 : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>10,
    BITSIZE_in3=>10,
    BITSIZE_out1=>10) port map (out1 => out_ui_cond_expr_FU_16_16_16_16_76_i1_fu_acc_1_31022_34178,
    in1 => out_lut_expr_FU_60_i0_fu_acc_1_31022_34169,
    in2 => out_ui_rshift_expr_FU_32_0_32_95_i0_fu_acc_1_31022_34172,
    in3 => out_ui_rshift_expr_FU_32_0_32_94_i1_fu_acc_1_31022_34175);
  fu_acc_1_31022_34181 : ui_lshift_expr_FU generic map(BITSIZE_in1=>10,
    BITSIZE_in2=>5,
    BITSIZE_out1=>32,
    PRECISION=>64) port map (out1 => out_ui_lshift_expr_FU_32_0_32_82_i1_fu_acc_1_31022_34181,
    in1 => out_ui_cond_expr_FU_16_16_16_16_76_i1_fu_acc_1_31022_34178,
    in2 => out_const_14);
  fu_acc_1_31022_34184 : ui_cond_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_in2=>32,
    BITSIZE_in3=>32,
    BITSIZE_out1=>32) port map (out1 => out_ui_cond_expr_FU_32_32_32_32_77_i2_fu_acc_1_31022_34184,
    in1 => out_reg_9_reg_9,
    in2 => unsigned(out_reg_10_reg_10),
    in3 => out_ui_cond_expr_FU_32_32_32_32_77_i1_fu_acc_1_31022_34157);
  fu_acc_1_31022_34194 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_6_i0_fu_acc_1_31022_34194,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_30);
  fu_acc_1_31022_34198 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_8_i0_fu_acc_1_31022_34198,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_15);
  fu_acc_1_31022_34202 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_9_i0_fu_acc_1_31022_34202,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_17);
  fu_acc_1_31022_34206 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_10_i0_fu_acc_1_31022_34206,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_18);
  fu_acc_1_31022_34210 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_11_i0_fu_acc_1_31022_34210,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_20);
  fu_acc_1_31022_34214 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_12_i0_fu_acc_1_31022_34214,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_21);
  fu_acc_1_31022_34218 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_13_i0_fu_acc_1_31022_34218,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_23);
  fu_acc_1_31022_34222 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_14_i0_fu_acc_1_31022_34222,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_27);
  fu_acc_1_31022_34226 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_15_i0_fu_acc_1_31022_34226,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_28);
  fu_acc_1_31022_34230 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_16_i0_fu_acc_1_31022_34230,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_21);
  fu_acc_1_31022_34234 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_17_i0_fu_acc_1_31022_34234,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_23);
  fu_acc_1_31022_34238 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_18_i0_fu_acc_1_31022_34238,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_27);
  fu_acc_1_31022_34242 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_19_i0_fu_acc_1_31022_34242,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_28);
  fu_acc_1_31022_34246 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_20_i0_fu_acc_1_31022_34246,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_15);
  fu_acc_1_31022_34250 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_21_i0_fu_acc_1_31022_34250,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_17);
  fu_acc_1_31022_34254 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_22_i0_fu_acc_1_31022_34254,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_18);
  fu_acc_1_31022_34258 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>5) port map (out1 => out_ui_extract_bit_expr_FU_23_i0_fu_acc_1_31022_34258,
    in1 => unsigned(out_reg_0_reg_0),
    in2 => out_const_20);
  fu_acc_1_31022_34265 : lut_expr_FU generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_39_i0_fu_acc_1_31022_34265,
    in1 => out_const_6,
    in2 => out_ui_extract_bit_expr_FU_16_i0_fu_acc_1_31022_34230,
    in3 => out_ui_extract_bit_expr_FU_17_i0_fu_acc_1_31022_34234,
    in4 => out_ui_extract_bit_expr_FU_18_i0_fu_acc_1_31022_34238,
    in5 => out_ui_extract_bit_expr_FU_19_i0_fu_acc_1_31022_34242,
    in6 => out_ui_extract_bit_expr_FU_22_i0_fu_acc_1_31022_34254,
    in7 => out_ui_extract_bit_expr_FU_23_i0_fu_acc_1_31022_34258,
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34268 : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_40_i0_fu_acc_1_31022_34268,
    in1 => out_const_12,
    in2 => out_ui_extract_bit_expr_FU_8_i0_fu_acc_1_31022_34198,
    in3 => out_ui_extract_bit_expr_FU_9_i0_fu_acc_1_31022_34202,
    in4 => out_ui_extract_bit_expr_FU_10_i0_fu_acc_1_31022_34206,
    in5 => out_ui_extract_bit_expr_FU_11_i0_fu_acc_1_31022_34210,
    in6 => out_ui_extract_bit_expr_FU_14_i0_fu_acc_1_31022_34222,
    in7 => out_ui_extract_bit_expr_FU_15_i0_fu_acc_1_31022_34226,
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34271 : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_41_i0_fu_acc_1_31022_34271,
    in1 => out_const_8,
    in2 => out_ui_extract_bit_expr_FU_12_i0_fu_acc_1_31022_34214,
    in3 => out_ui_extract_bit_expr_FU_13_i0_fu_acc_1_31022_34218,
    in4 => out_lut_expr_FU_40_i0_fu_acc_1_31022_34268(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34275 : lut_expr_FU generic map(BITSIZE_in1=>60,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_42_i0_fu_acc_1_31022_34275,
    in1 => out_const_29,
    in2 => out_ui_extract_bit_expr_FU_20_i0_fu_acc_1_31022_34246,
    in3 => out_ui_extract_bit_expr_FU_21_i0_fu_acc_1_31022_34250,
    in4 => out_ui_eq_expr_FU_32_0_32_78_i0_fu_acc_1_31022_33911(0),
    in5 => out_ui_ne_expr_FU_32_0_32_88_i0_fu_acc_1_31022_33938(0),
    in6 => out_lut_expr_FU_39_i0_fu_acc_1_31022_34265(0),
    in7 => out_lut_expr_FU_41_i0_fu_acc_1_31022_34271(0),
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34278 : lut_expr_FU generic map(BITSIZE_in1=>8,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_43_i0_fu_acc_1_31022_34278,
    in1 => out_const_24,
    in2 => out_ui_eq_expr_FU_32_0_32_78_i0_fu_acc_1_31022_33911(0),
    in3 => out_ui_ne_expr_FU_32_0_32_88_i0_fu_acc_1_31022_33938(0),
    in4 => out_lut_expr_FU_41_i0_fu_acc_1_31022_34271(0),
    in5 => '0',
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34283 : lut_expr_FU generic map(BITSIZE_in1=>64,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_55_i0_fu_acc_1_31022_34283,
    in1 => out_const_12,
    in2 => out_ui_extract_bit_expr_FU_45_i0_fu_acc_1_31022_34103,
    in3 => out_ui_extract_bit_expr_FU_46_i0_fu_acc_1_31022_34106,
    in4 => out_ui_extract_bit_expr_FU_47_i0_fu_acc_1_31022_34109,
    in5 => out_ui_extract_bit_expr_FU_48_i0_fu_acc_1_31022_34112,
    in6 => out_ui_extract_bit_expr_FU_51_i0_fu_acc_1_31022_34121,
    in7 => out_ui_extract_bit_expr_FU_52_i0_fu_acc_1_31022_34124,
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34286 : lut_expr_FU generic map(BITSIZE_in1=>11,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_56_i0_fu_acc_1_31022_34286,
    in1 => out_const_26,
    in2 => out_ui_extract_bit_expr_FU_49_i0_fu_acc_1_31022_34115,
    in3 => out_ui_extract_bit_expr_FU_50_i0_fu_acc_1_31022_34118,
    in4 => out_ui_extract_bit_expr_FU_53_i0_fu_acc_1_31022_34127,
    in5 => out_lut_expr_FU_55_i0_fu_acc_1_31022_34283(0),
    in6 => '0',
    in7 => '0',
    in8 => '0',
    in9 => '0');
  fu_acc_1_31022_34289 : lut_expr_FU generic map(BITSIZE_in1=>56,
    BITSIZE_out1=>1) port map (out1 => out_lut_expr_FU_57_i0_fu_acc_1_31022_34289,
    in1 => out_const_25,
    in2 => out_ui_ne_expr_FU_32_0_32_89_i0_fu_acc_1_31022_34061(0),
    in3 => out_ui_extract_bit_expr_FU_33_i0_fu_acc_1_31022_34064,
    in4 => out_ui_extract_bit_expr_FU_34_i0_fu_acc_1_31022_34067,
    in5 => out_ui_extract_bit_expr_FU_37_i0_fu_acc_1_31022_34079,
    in6 => out_ui_extract_bit_expr_FU_38_i0_fu_acc_1_31022_34082,
    in7 => out_ui_extract_bit_expr_FU_32_i0_fu_acc_1_31022_34046,
    in8 => '0',
    in9 => '0');
  s_MEMORY_CTRL_D21_63_i00 <= selector_IN_UNBOUNDED_acc_1_31022_31116 or selector_IN_UNBOUNDED_acc_1_31022_31118;
  reg_0 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_0_reg_0,
    clock => clock,
    reset => reset,
    in1 => out_MEMORY_CTRL_D21_63_i0_MEMORY_CTRL_D21_63_i0,
    wenable => wrenable_reg_0);
  reg_1 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_1_reg_1,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_3_i0_fu_acc_1_31022_32233,
    wenable => wrenable_reg_1);
  reg_10 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_10_reg_10,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_lshift_expr_FU_32_0_32_82_i1_fu_acc_1_31022_34181),
    wenable => wrenable_reg_10);
  reg_11 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_11_reg_11,
    clock => clock,
    reset => reset,
    in1 => out_lut_expr_FU_42_i0_fu_acc_1_31022_34275,
    wenable => wrenable_reg_11);
  reg_12 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_12_reg_12,
    clock => clock,
    reset => reset,
    in1 => out_lut_expr_FU_43_i0_fu_acc_1_31022_34278,
    wenable => wrenable_reg_12);
  reg_13 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_13_reg_13,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_61_i0_fu_acc_1_31022_32240,
    wenable => wrenable_reg_13);
  reg_2 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_2_reg_2,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_2_i0_fu_acc_1_31022_32236,
    wenable => wrenable_reg_2);
  reg_3 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_3_reg_3,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_lshift_expr_FU_32_0_32_80_i0_fu_acc_1_31022_33908),
    wenable => wrenable_reg_3);
  reg_4 : register_STD generic map(BITSIZE_in1=>9,
    BITSIZE_out1=>9) port map (out1 => out_reg_4_reg_4,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_bit_ior_concat_expr_FU_71_i0_fu_acc_1_31022_33953),
    wenable => wrenable_reg_4);
  reg_5 : register_STD generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_5_reg_5,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_bit_ior_expr_FU_0_32_32_73_i0_fu_acc_1_31022_33962),
    wenable => wrenable_reg_5);
  reg_6 : register_STD generic map(BITSIZE_in1=>48,
    BITSIZE_out1=>48) port map (out1 => out_reg_6_reg_6,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_ui_lshift_expr_FU_64_0_64_83_i0_fu_acc_1_31022_33992),
    wenable => wrenable_reg_6);
  reg_7 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_7_reg_7,
    clock => clock,
    reset => reset,
    in1 => out_UUdata_converter_FU_26_i0_fu_acc_1_31022_34001,
    wenable => wrenable_reg_7);
  reg_8 : register_STD generic map(BITSIZE_in1=>2,
    BITSIZE_out1=>2) port map (out1 => out_reg_8_reg_8,
    clock => clock,
    reset => reset,
    in1 => std_logic_vector(out_UIdata_converter_FU_30_i0_fu_acc_1_31022_34016),
    wenable => wrenable_reg_8);
  reg_9 : register_STD generic map(BITSIZE_in1=>1,
    BITSIZE_out1=>1) port map (out1 => out_reg_9_reg_9,
    clock => clock,
    reset => reset,
    in1 => out_lut_expr_FU_54_i0_fu_acc_1_31022_34136,
    wenable => wrenable_reg_9);
  -- io-signal post fix
  Mout_oe_ram <= \sig_out_bus_mergerMout_oe_ram3_\(0);
  Mout_we_ram <= \sig_out_bus_mergerMout_we_ram4_\(0);
  Mout_addr_ram <= \sig_out_bus_mergerMout_addr_ram1_\;
  Mout_Wdata_ram <= \sig_out_bus_mergerMout_Wdata_ram0_\;
  Mout_data_ram_size <= \sig_out_bus_mergerMout_data_ram_size2_\;
  OUT_UNBOUNDED_acc_1_31022_31116 <= s_done_MEMORY_CTRL_D21_63_i0;
  OUT_UNBOUNDED_acc_1_31022_31118 <= s_done_MEMORY_CTRL_D21_63_i0;

end datapath_acc_1_arch;

-- FSM based controller description for acc_1
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
entity controller_acc_1 is 
port (
  -- IN
  OUT_UNBOUNDED_acc_1_31022_31116 : in std_logic;
  OUT_UNBOUNDED_acc_1_31022_31118 : in std_logic;
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  selector_IN_UNBOUNDED_acc_1_31022_31116 : out std_logic;
  selector_IN_UNBOUNDED_acc_1_31022_31118 : out std_logic;
  fuselector_MEMORY_CTRL_D21_63_i0_LOAD : out std_logic;
  fuselector_MEMORY_CTRL_D21_63_i0_STORE : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 : out std_logic;
  selector_MUX_262_vb_assign_conn_obj_0_0_0_0 : out std_logic;
  wrenable_reg_0 : out std_logic;
  wrenable_reg_1 : out std_logic;
  wrenable_reg_10 : out std_logic;
  wrenable_reg_11 : out std_logic;
  wrenable_reg_12 : out std_logic;
  wrenable_reg_13 : out std_logic;
  wrenable_reg_2 : out std_logic;
  wrenable_reg_3 : out std_logic;
  wrenable_reg_4 : out std_logic;
  wrenable_reg_5 : out std_logic;
  wrenable_reg_6 : out std_logic;
  wrenable_reg_7 : out std_logic;
  wrenable_reg_8 : out std_logic;
  wrenable_reg_9 : out std_logic

);
end controller_acc_1;

architecture controller_acc_1_arch of controller_acc_1 is
  -- define the states of FSM model
  constant S_0: std_logic_vector(5 downto 0) := "000001";
  constant S_1: std_logic_vector(5 downto 0) := "000010";
  constant S_2: std_logic_vector(5 downto 0) := "000100";
  constant S_3: std_logic_vector(5 downto 0) := "001000";
  constant S_4: std_logic_vector(5 downto 0) := "010000";
  constant S_5: std_logic_vector(5 downto 0) := "100000";
  signal present_state : std_logic_vector(5 downto 0) := S_0;
  signal next_state : std_logic_vector(5 downto 0);
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
  comb_logic0: process(present_state, OUT_UNBOUNDED_acc_1_31022_31116, OUT_UNBOUNDED_acc_1_31022_31118, start_port)
  begin
    done_port <= '0';
    selector_IN_UNBOUNDED_acc_1_31022_31116 <= '0';
    selector_IN_UNBOUNDED_acc_1_31022_31118 <= '0';
    fuselector_MEMORY_CTRL_D21_63_i0_LOAD <= '0';
    fuselector_MEMORY_CTRL_D21_63_i0_STORE <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 <= '0';
    selector_MUX_262_vb_assign_conn_obj_0_0_0_0 <= '0';
    wrenable_reg_0 <= '0';
    wrenable_reg_1 <= '0';
    wrenable_reg_10 <= '0';
    wrenable_reg_11 <= '0';
    wrenable_reg_12 <= '0';
    wrenable_reg_13 <= '0';
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
          selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 <= 'X';
          selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 <= 'X';
          selector_MUX_262_vb_assign_conn_obj_0_0_0_0 <= 'X';
          wrenable_reg_0 <= 'X';
          wrenable_reg_1 <= 'X';
          wrenable_reg_10 <= 'X';
          wrenable_reg_11 <= 'X';
          wrenable_reg_12 <= 'X';
          wrenable_reg_13 <= 'X';
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
          selector_IN_UNBOUNDED_acc_1_31022_31116 <= '1';
          fuselector_MEMORY_CTRL_D21_63_i0_LOAD <= '1';
          selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 <= '1';
          wrenable_reg_0 <= OUT_UNBOUNDED_acc_1_31022_31116;
          wrenable_reg_1 <= '1';
          wrenable_reg_2 <= '1';
          if (OUT_UNBOUNDED_acc_1_31022_31116 = '0') then
            next_state <= S_1;
          else
            next_state <= S_2;
          end if;
        end if;
      when S_1 =>
        fuselector_MEMORY_CTRL_D21_63_i0_LOAD <= '1';
        wrenable_reg_0 <= OUT_UNBOUNDED_acc_1_31022_31116;
        if (OUT_UNBOUNDED_acc_1_31022_31116 = '0') then
          next_state <= S_1;
        else
          next_state <= S_2;
        end if;
      when S_2 =>
        wrenable_reg_10 <= '1';
        wrenable_reg_11 <= '1';
        wrenable_reg_12 <= '1';
        wrenable_reg_3 <= '1';
        wrenable_reg_4 <= '1';
        wrenable_reg_5 <= '1';
        wrenable_reg_6 <= '1';
        wrenable_reg_7 <= '1';
        wrenable_reg_8 <= '1';
        wrenable_reg_9 <= '1';
        next_state <= S_3;
      when S_3 =>
        selector_IN_UNBOUNDED_acc_1_31022_31118 <= '1';
        fuselector_MEMORY_CTRL_D21_63_i0_STORE <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 <= '1';
        wrenable_reg_13 <= '1';
        if (OUT_UNBOUNDED_acc_1_31022_31118 = '0') then
          next_state <= S_4;
        else
          next_state <= S_5;
          done_port <= '1';
        end if;
      when S_4 =>
        fuselector_MEMORY_CTRL_D21_63_i0_STORE <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 <= '1';
        selector_MUX_262_vb_assign_conn_obj_0_0_0_0 <= '1';
        if (OUT_UNBOUNDED_acc_1_31022_31118 = '0') then
          next_state <= S_4;
        else
          next_state <= S_5;
          done_port <= '1';
        end if;
      when S_5 =>
        next_state <= S_0;
      when others =>
        selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 <= 'X';
        selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 <= 'X';
        selector_MUX_262_vb_assign_conn_obj_0_0_0_0 <= 'X';
        wrenable_reg_0 <= 'X';
        wrenable_reg_1 <= 'X';
        wrenable_reg_10 <= 'X';
        wrenable_reg_11 <= 'X';
        wrenable_reg_12 <= 'X';
        wrenable_reg_13 <= 'X';
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

end controller_acc_1_arch;

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

-- Top component for acc_1
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
entity acc_1b is 
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
end acc_1b;

architecture acc_1_archb of acc_1b is
  -- Component and signal declarations
  
  component datapath_acc_1
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
    selector_IN_UNBOUNDED_acc_1_31022_31116 : in std_logic;
    selector_IN_UNBOUNDED_acc_1_31022_31118 : in std_logic;
    fuselector_MEMORY_CTRL_D21_63_i0_LOAD : in std_logic;
    fuselector_MEMORY_CTRL_D21_63_i0_STORE : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 : in std_logic;
    selector_MUX_262_vb_assign_conn_obj_0_0_0_0 : in std_logic;
    wrenable_reg_0 : in std_logic;
    wrenable_reg_1 : in std_logic;
    wrenable_reg_10 : in std_logic;
    wrenable_reg_11 : in std_logic;
    wrenable_reg_12 : in std_logic;
    wrenable_reg_13 : in std_logic;
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
    OUT_UNBOUNDED_acc_1_31022_31116 : out std_logic;
    OUT_UNBOUNDED_acc_1_31022_31118 : out std_logic
  
  );
  end component;
  
  component controller_acc_1
  port (
    -- IN
    OUT_UNBOUNDED_acc_1_31022_31116 : in std_logic;
    OUT_UNBOUNDED_acc_1_31022_31118 : in std_logic;
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    selector_IN_UNBOUNDED_acc_1_31022_31116 : out std_logic;
    selector_IN_UNBOUNDED_acc_1_31022_31118 : out std_logic;
    fuselector_MEMORY_CTRL_D21_63_i0_LOAD : out std_logic;
    fuselector_MEMORY_CTRL_D21_63_i0_STORE : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 : out std_logic;
    selector_MUX_262_vb_assign_conn_obj_0_0_0_0 : out std_logic;
    wrenable_reg_0 : out std_logic;
    wrenable_reg_1 : out std_logic;
    wrenable_reg_10 : out std_logic;
    wrenable_reg_11 : out std_logic;
    wrenable_reg_12 : out std_logic;
    wrenable_reg_13 : out std_logic;
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
  signal OUT_UNBOUNDED_acc_1_31022_31116 : std_logic;
  signal OUT_UNBOUNDED_acc_1_31022_31118 : std_logic;
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal fuselector_MEMORY_CTRL_D21_63_i0_LOAD : std_logic;
  signal fuselector_MEMORY_CTRL_D21_63_i0_STORE : std_logic;
  signal selector_IN_UNBOUNDED_acc_1_31022_31116 : std_logic;
  signal selector_IN_UNBOUNDED_acc_1_31022_31118 : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 : std_logic;
  signal selector_MUX_262_vb_assign_conn_obj_0_0_0_0 : std_logic;
  signal wrenable_reg_0 : std_logic;
  signal wrenable_reg_1 : std_logic;
  signal wrenable_reg_10 : std_logic;
  signal wrenable_reg_11 : std_logic;
  signal wrenable_reg_12 : std_logic;
  signal wrenable_reg_13 : std_logic;
  signal wrenable_reg_2 : std_logic;
  signal wrenable_reg_3 : std_logic;
  signal wrenable_reg_4 : std_logic;
  signal wrenable_reg_5 : std_logic;
  signal wrenable_reg_6 : std_logic;
  signal wrenable_reg_7 : std_logic;
  signal wrenable_reg_8 : std_logic;
  signal wrenable_reg_9 : std_logic;
begin
  Controller_i : controller_acc_1 port map (done_port => done_delayed_REG_signal_in,
    selector_IN_UNBOUNDED_acc_1_31022_31116 => selector_IN_UNBOUNDED_acc_1_31022_31116,
    selector_IN_UNBOUNDED_acc_1_31022_31118 => selector_IN_UNBOUNDED_acc_1_31022_31118,
    fuselector_MEMORY_CTRL_D21_63_i0_LOAD => fuselector_MEMORY_CTRL_D21_63_i0_LOAD,
    fuselector_MEMORY_CTRL_D21_63_i0_STORE => fuselector_MEMORY_CTRL_D21_63_i0_STORE,
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 => selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0,
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 => selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1,
    selector_MUX_262_vb_assign_conn_obj_0_0_0_0 => selector_MUX_262_vb_assign_conn_obj_0_0_0_0,
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_10 => wrenable_reg_10,
    wrenable_reg_11 => wrenable_reg_11,
    wrenable_reg_12 => wrenable_reg_12,
    wrenable_reg_13 => wrenable_reg_13,
    wrenable_reg_2 => wrenable_reg_2,
    wrenable_reg_3 => wrenable_reg_3,
    wrenable_reg_4 => wrenable_reg_4,
    wrenable_reg_5 => wrenable_reg_5,
    wrenable_reg_6 => wrenable_reg_6,
    wrenable_reg_7 => wrenable_reg_7,
    wrenable_reg_8 => wrenable_reg_8,
    wrenable_reg_9 => wrenable_reg_9,
    OUT_UNBOUNDED_acc_1_31022_31116 => OUT_UNBOUNDED_acc_1_31022_31116,
    OUT_UNBOUNDED_acc_1_31022_31118 => OUT_UNBOUNDED_acc_1_31022_31118,
    clock => clock,
    reset => reset,
    start_port => start_port);
  Datapath_i : datapath_acc_1 port map (Mout_oe_ram => Mout_oe_ram,
    Mout_we_ram => Mout_we_ram,
    Mout_addr_ram => Mout_addr_ram,
    Mout_Wdata_ram => Mout_Wdata_ram,
    Mout_data_ram_size => Mout_data_ram_size,
    OUT_UNBOUNDED_acc_1_31022_31116 => OUT_UNBOUNDED_acc_1_31022_31116,
    OUT_UNBOUNDED_acc_1_31022_31118 => OUT_UNBOUNDED_acc_1_31022_31118,
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
    selector_IN_UNBOUNDED_acc_1_31022_31116 => selector_IN_UNBOUNDED_acc_1_31022_31116,
    selector_IN_UNBOUNDED_acc_1_31022_31118 => selector_IN_UNBOUNDED_acc_1_31022_31118,
    fuselector_MEMORY_CTRL_D21_63_i0_LOAD => fuselector_MEMORY_CTRL_D21_63_i0_LOAD,
    fuselector_MEMORY_CTRL_D21_63_i0_STORE => fuselector_MEMORY_CTRL_D21_63_i0_STORE,
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0 => selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_0,
    selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1 => selector_MUX_1_MEMORY_CTRL_D21_63_i0_1_0_1,
    selector_MUX_262_vb_assign_conn_obj_0_0_0_0 => selector_MUX_262_vb_assign_conn_obj_0_0_0_0,
    wrenable_reg_0 => wrenable_reg_0,
    wrenable_reg_1 => wrenable_reg_1,
    wrenable_reg_10 => wrenable_reg_10,
    wrenable_reg_11 => wrenable_reg_11,
    wrenable_reg_12 => wrenable_reg_12,
    wrenable_reg_13 => wrenable_reg_13,
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

end acc_1_archb;

-- Minimal interface for function: acc_1
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
entity acc_1 is 
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
end acc_1;

architecture acc_1_arch of acc_1 is
  -- Component and signal declarations
  
  component acc_1b
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
  \_acc_1_i0\ : acc_1b port map (done_port => done_port,
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

end acc_1_arch;


