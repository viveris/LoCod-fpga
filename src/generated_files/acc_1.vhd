-- 
-- Politecnico di Milano
-- Code created using PandA - Version: PandA 0.9.8 - Revision eda4c22d5adaec44fd8489ae49b854b244d2cf70-HEAD - Date 2023-03-02T09:23:24
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
  selector_IN_UNBOUNDED_acc_1_31024_31144 : in std_logic;
  selector_IN_UNBOUNDED_acc_1_31024_31145 : in std_logic;
  fuselector_MEMORY_CTRL_D21_3_i0_LOAD : in std_logic;
  fuselector_MEMORY_CTRL_D21_3_i0_STORE : in std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 : in std_logic;
  wrenable_reg_0 : in std_logic;
  -- OUT
  Mout_oe_ram : out std_logic;
  Mout_we_ram : out std_logic;
  Mout_addr_ram : out std_logic_vector(31 downto 0) ;
  Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
  Mout_data_ram_size : out std_logic_vector(5 downto 0) ;
  OUT_UNBOUNDED_acc_1_31024_31144 : out std_logic;
  OUT_UNBOUNDED_acc_1_31024_31145 : out std_logic

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
  signal out_MEMORY_CTRL_D21_3_i0_MEMORY_CTRL_D21_3_i0 : std_logic_vector(31 downto 0) ;
  signal out_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 : std_logic_vector(31 downto 0) ;
  signal out_const_0 : std_logic_vector(6 downto 0) ;
  signal out_const_1 : std_logic_vector(0 downto 0);
  signal out_conv_out_const_0_7_6 : std_logic_vector(5 downto 0) ;
  signal out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0 : unsigned (31 downto 0);
  signal out_reg_0_reg_0 : std_logic_vector(31 downto 0) ;
  signal s_MEMORY_CTRL_D21_3_i00 : std_logic;
  signal s_done_MEMORY_CTRL_D21_3_i0 : std_logic;
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
  IUdata_converter_FU_iu_conv_0 : IUdata_converter_FU generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0,
    in1 => signed(out_reg_0_reg_0));
  MEMORY_CTRL_D21_3_i0 : MEMORY_CTRL_D21 generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_in3=>6,
    BITSIZE_out1=>32,
    BITSIZE_Min_addr_ram=>32,
    BITSIZE_Mout_addr_ram=>32,
    BITSIZE_M_Rdata_ram=>32,
    BITSIZE_Min_Wdata_ram=>32,
    BITSIZE_Mout_Wdata_ram=>32,
    BITSIZE_Min_data_ram_size=>6,
    BITSIZE_Mout_data_ram_size=>6) port map (done_port => s_done_MEMORY_CTRL_D21_3_i0,
    out1 => out_MEMORY_CTRL_D21_3_i0_MEMORY_CTRL_D21_3_i0,
    Mout_oe_ram => sig_in_bus_mergerMout_oe_ram3_0,
    Mout_we_ram => sig_in_bus_mergerMout_we_ram4_0,
    Mout_addr_ram => sig_in_bus_mergerMout_addr_ram1_0,
    Mout_Wdata_ram => sig_in_bus_mergerMout_Wdata_ram0_0,
    Mout_data_ram_size => sig_in_bus_mergerMout_data_ram_size2_0,
    clock => clock,
    start_port => s_MEMORY_CTRL_D21_3_i00,
    in1 => std_logic_vector(out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0),
    in2 => out_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0,
    in3 => out_conv_out_const_0_7_6,
    in4 => out_const_1(0),
    sel_LOAD => fuselector_MEMORY_CTRL_D21_3_i0_LOAD,
    sel_STORE => fuselector_MEMORY_CTRL_D21_3_i0_STORE,
    Min_oe_ram => Min_oe_ram,
    Min_we_ram => Min_we_ram,
    Min_addr_ram => Min_addr_ram,
    M_Rdata_ram => M_Rdata_ram,
    Min_Wdata_ram => Min_Wdata_ram,
    Min_data_ram_size => Min_data_ram_size,
    M_DataRdy => M_DataRdy);
  MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>32,
    BITSIZE_in2=>32,
    BITSIZE_out1=>32) port map (out1 => out_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0,
    sel => selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0,
    in1 => in_port_param,
    in2 => in_port_result);
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
  conv_out_const_0_7_6 : UUdata_converter_FU generic map(BITSIZE_in1=>7,
    BITSIZE_out1=>6) port map (out1 => out_conv_out_const_0_7_6,
    in1 => out_const_0);
  s_MEMORY_CTRL_D21_3_i00 <= selector_IN_UNBOUNDED_acc_1_31024_31144 or selector_IN_UNBOUNDED_acc_1_31024_31145;
  reg_0 : register_SE generic map(BITSIZE_in1=>32,
    BITSIZE_out1=>32) port map (out1 => out_reg_0_reg_0,
    clock => clock,
    reset => reset,
    in1 => out_MEMORY_CTRL_D21_3_i0_MEMORY_CTRL_D21_3_i0,
    wenable => wrenable_reg_0);
  -- io-signal post fix
  Mout_oe_ram <= \sig_out_bus_mergerMout_oe_ram3_\(0);
  Mout_we_ram <= \sig_out_bus_mergerMout_we_ram4_\(0);
  Mout_addr_ram <= \sig_out_bus_mergerMout_addr_ram1_\;
  Mout_Wdata_ram <= \sig_out_bus_mergerMout_Wdata_ram0_\;
  Mout_data_ram_size <= \sig_out_bus_mergerMout_data_ram_size2_\;
  OUT_UNBOUNDED_acc_1_31024_31144 <= s_done_MEMORY_CTRL_D21_3_i0;
  OUT_UNBOUNDED_acc_1_31024_31145 <= s_done_MEMORY_CTRL_D21_3_i0;

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
  OUT_UNBOUNDED_acc_1_31024_31144 : in std_logic;
  OUT_UNBOUNDED_acc_1_31024_31145 : in std_logic;
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  selector_IN_UNBOUNDED_acc_1_31024_31144 : out std_logic;
  selector_IN_UNBOUNDED_acc_1_31024_31145 : out std_logic;
  fuselector_MEMORY_CTRL_D21_3_i0_LOAD : out std_logic;
  fuselector_MEMORY_CTRL_D21_3_i0_STORE : out std_logic;
  selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 : out std_logic;
  wrenable_reg_0 : out std_logic

);
end controller_acc_1;

architecture controller_acc_1_arch of controller_acc_1 is
  -- define the states of FSM model
  constant S_0: std_logic_vector(4 downto 0) := "00001";
  constant S_1: std_logic_vector(4 downto 0) := "00010";
  constant S_2: std_logic_vector(4 downto 0) := "00100";
  constant S_3: std_logic_vector(4 downto 0) := "01000";
  constant S_4: std_logic_vector(4 downto 0) := "10000";
  signal present_state : std_logic_vector(4 downto 0) := S_0;
  signal next_state : std_logic_vector(4 downto 0);
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
  comb_logic0: process(present_state, OUT_UNBOUNDED_acc_1_31024_31144, OUT_UNBOUNDED_acc_1_31024_31145, start_port)
  begin
    done_port <= '0';
    selector_IN_UNBOUNDED_acc_1_31024_31144 <= '0';
    selector_IN_UNBOUNDED_acc_1_31024_31145 <= '0';
    fuselector_MEMORY_CTRL_D21_3_i0_LOAD <= '0';
    fuselector_MEMORY_CTRL_D21_3_i0_STORE <= '0';
    selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 <= '0';
    wrenable_reg_0 <= '0';
    next_state <= S_0;
    case present_state is
      when S_0 =>
        if(start_port /= '1') then
          selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 <= 'X';
          wrenable_reg_0 <= 'X';
          next_state <= S_0;
        else
          selector_IN_UNBOUNDED_acc_1_31024_31144 <= '1';
          fuselector_MEMORY_CTRL_D21_3_i0_LOAD <= '1';
          selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 <= '1';
          wrenable_reg_0 <= OUT_UNBOUNDED_acc_1_31024_31144;
          if (OUT_UNBOUNDED_acc_1_31024_31144 = '0') then
            next_state <= S_1;
          else
            next_state <= S_2;
          end if;
        end if;
      when S_1 =>
        fuselector_MEMORY_CTRL_D21_3_i0_LOAD <= '1';
        selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 <= '1';
        wrenable_reg_0 <= OUT_UNBOUNDED_acc_1_31024_31144;
        if (OUT_UNBOUNDED_acc_1_31024_31144 = '0') then
          next_state <= S_1;
        else
          next_state <= S_2;
        end if;
      when S_2 =>
        selector_IN_UNBOUNDED_acc_1_31024_31145 <= '1';
        fuselector_MEMORY_CTRL_D21_3_i0_STORE <= '1';
        if (OUT_UNBOUNDED_acc_1_31024_31145 = '0') then
          next_state <= S_3;
        else
          next_state <= S_4;
          done_port <= '1';
        end if;
      when S_3 =>
        fuselector_MEMORY_CTRL_D21_3_i0_STORE <= '1';
        if (OUT_UNBOUNDED_acc_1_31024_31145 = '0') then
          next_state <= S_3;
        else
          next_state <= S_4;
          done_port <= '1';
        end if;
      when S_4 =>
        next_state <= S_0;
      when others =>
        selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 <= 'X';
        wrenable_reg_0 <= 'X';
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
    selector_IN_UNBOUNDED_acc_1_31024_31144 : in std_logic;
    selector_IN_UNBOUNDED_acc_1_31024_31145 : in std_logic;
    fuselector_MEMORY_CTRL_D21_3_i0_LOAD : in std_logic;
    fuselector_MEMORY_CTRL_D21_3_i0_STORE : in std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 : in std_logic;
    wrenable_reg_0 : in std_logic;
    -- OUT
    Mout_oe_ram : out std_logic;
    Mout_we_ram : out std_logic;
    Mout_addr_ram : out std_logic_vector(31 downto 0) ;
    Mout_Wdata_ram : out std_logic_vector(31 downto 0) ;
    Mout_data_ram_size : out std_logic_vector(5 downto 0) ;
    OUT_UNBOUNDED_acc_1_31024_31144 : out std_logic;
    OUT_UNBOUNDED_acc_1_31024_31145 : out std_logic
  
  );
  end component;
  
  component controller_acc_1
  port (
    -- IN
    OUT_UNBOUNDED_acc_1_31024_31144 : in std_logic;
    OUT_UNBOUNDED_acc_1_31024_31145 : in std_logic;
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    selector_IN_UNBOUNDED_acc_1_31024_31144 : out std_logic;
    selector_IN_UNBOUNDED_acc_1_31024_31145 : out std_logic;
    fuselector_MEMORY_CTRL_D21_3_i0_LOAD : out std_logic;
    fuselector_MEMORY_CTRL_D21_3_i0_STORE : out std_logic;
    selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 : out std_logic;
    wrenable_reg_0 : out std_logic
  
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
  signal OUT_UNBOUNDED_acc_1_31024_31144 : std_logic;
  signal OUT_UNBOUNDED_acc_1_31024_31145 : std_logic;
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal fuselector_MEMORY_CTRL_D21_3_i0_LOAD : std_logic;
  signal fuselector_MEMORY_CTRL_D21_3_i0_STORE : std_logic;
  signal selector_IN_UNBOUNDED_acc_1_31024_31144 : std_logic;
  signal selector_IN_UNBOUNDED_acc_1_31024_31145 : std_logic;
  signal selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 : std_logic;
  signal wrenable_reg_0 : std_logic;
begin
  Controller_i : controller_acc_1 port map (done_port => done_delayed_REG_signal_in,
    selector_IN_UNBOUNDED_acc_1_31024_31144 => selector_IN_UNBOUNDED_acc_1_31024_31144,
    selector_IN_UNBOUNDED_acc_1_31024_31145 => selector_IN_UNBOUNDED_acc_1_31024_31145,
    fuselector_MEMORY_CTRL_D21_3_i0_LOAD => fuselector_MEMORY_CTRL_D21_3_i0_LOAD,
    fuselector_MEMORY_CTRL_D21_3_i0_STORE => fuselector_MEMORY_CTRL_D21_3_i0_STORE,
    selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 => selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0,
    wrenable_reg_0 => wrenable_reg_0,
    OUT_UNBOUNDED_acc_1_31024_31144 => OUT_UNBOUNDED_acc_1_31024_31144,
    OUT_UNBOUNDED_acc_1_31024_31145 => OUT_UNBOUNDED_acc_1_31024_31145,
    clock => clock,
    reset => reset,
    start_port => start_port);
  Datapath_i : datapath_acc_1 port map (Mout_oe_ram => Mout_oe_ram,
    Mout_we_ram => Mout_we_ram,
    Mout_addr_ram => Mout_addr_ram,
    Mout_Wdata_ram => Mout_Wdata_ram,
    Mout_data_ram_size => Mout_data_ram_size,
    OUT_UNBOUNDED_acc_1_31024_31144 => OUT_UNBOUNDED_acc_1_31024_31144,
    OUT_UNBOUNDED_acc_1_31024_31145 => OUT_UNBOUNDED_acc_1_31024_31145,
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
    selector_IN_UNBOUNDED_acc_1_31024_31144 => selector_IN_UNBOUNDED_acc_1_31024_31144,
    selector_IN_UNBOUNDED_acc_1_31024_31145 => selector_IN_UNBOUNDED_acc_1_31024_31145,
    fuselector_MEMORY_CTRL_D21_3_i0_LOAD => fuselector_MEMORY_CTRL_D21_3_i0_LOAD,
    fuselector_MEMORY_CTRL_D21_3_i0_STORE => fuselector_MEMORY_CTRL_D21_3_i0_STORE,
    selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0 => selector_MUX_1_MEMORY_CTRL_D21_3_i0_1_0_0,
    wrenable_reg_0 => wrenable_reg_0);
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


