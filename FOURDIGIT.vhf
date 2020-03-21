--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : FOURDIGIT.vhf
-- /___/   /\     Timestamp : 08/20/2019 16:26:07
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl /home/btech/cs1180355/Desktop/seven/FOURDIGIT.vhf -w /home/btech/cs1180355/Desktop/seven/FOURDIGIT.sch
--Design Name: FOURDIGIT
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL CB16CE_HXILINX_FOURDIGIT -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16CE_HXILINX_FOURDIGIT is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB16CE_HXILINX_FOURDIGIT;

architecture Behavioral of CB16CE_HXILINX_FOURDIGIT is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
Q   <= COUNT;

end Behavioral;

----- CELL M4_1E_HXILINX_FOURDIGIT -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_FOURDIGIT is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_FOURDIGIT;

architecture M4_1E_HXILINX_FOURDIGIT_V of M4_1E_HXILINX_FOURDIGIT is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_FOURDIGIT_V;
----- CELL D2_4E_HXILINX_FOURDIGIT -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_FOURDIGIT is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_FOURDIGIT;

architecture D2_4E_HXILINX_FOURDIGIT_V of D2_4E_HXILINX_FOURDIGIT is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_FOURDIGIT_V;
----- CELL CB2CE_HXILINX_FOURDIGIT -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2CE_HXILINX_FOURDIGIT is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB2CE_HXILINX_FOURDIGIT;

architecture Behavioral of CB2CE_HXILINX_FOURDIGIT is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SEVEN_MUSER_FOURDIGIT is
   port ( B0 : in    std_logic; 
          B1 : in    std_logic; 
          B2 : in    std_logic; 
          B3 : in    std_logic; 
          A  : out   std_logic; 
          B  : out   std_logic; 
          C  : out   std_logic; 
          D  : out   std_logic; 
          E  : out   std_logic; 
          F  : out   std_logic; 
          G  : out   std_logic);
end SEVEN_MUSER_FOURDIGIT;

architecture BEHAVIORAL of SEVEN_MUSER_FOURDIGIT is
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_9   : std_logic;
   signal XLXN_10  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_20  : std_logic;
   signal XLXN_23  : std_logic;
   signal XLXN_24  : std_logic;
   signal XLXN_25  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_43  : std_logic;
   signal XLXN_44  : std_logic;
   signal XLXN_50  : std_logic;
   signal XLXN_51  : std_logic;
   signal XLXN_54  : std_logic;
   signal XLXN_55  : std_logic;
   signal XLXN_106 : std_logic;
   signal XLXN_107 : std_logic;
   signal XLXN_110 : std_logic;
   signal XLXN_111 : std_logic;
   signal XLXN_112 : std_logic;
   signal XLXN_119 : std_logic;
   signal XLXN_122 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_124 : std_logic;
   signal XLXN_125 : std_logic;
   signal XLXN_126 : std_logic;
   signal XLXN_190 : std_logic;
   signal XLXN_191 : std_logic;
   signal XLXN_192 : std_logic;
   signal XLXN_193 : std_logic;
   signal XLXN_194 : std_logic;
   signal XLXN_195 : std_logic;
   signal XLXN_196 : std_logic;
   signal XLXN_216 : std_logic;
   signal XLXN_218 : std_logic;
   signal XLXN_221 : std_logic;
   signal XLXN_222 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>B3,
                O=>XLXN_1);
   
   XLXI_2 : INV
      port map (I=>B1,
                O=>XLXN_2);
   
   XLXI_3 : AND2
      port map (I0=>XLXN_2,
                I1=>XLXN_1,
                O=>XLXN_9);
   
   XLXI_4 : AND2
      port map (I0=>B3,
                I1=>B1,
                O=>XLXN_10);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_10,
                I1=>B0,
                I2=>B2,
                I3=>XLXN_9,
                O=>XLXN_192);
   
   XLXI_6 : INV
      port map (I=>B3,
                O=>XLXN_19);
   
   XLXI_7 : INV
      port map (I=>B2,
                O=>XLXN_20);
   
   XLXI_8 : INV
      port map (I=>B1,
                O=>XLXN_24);
   
   XLXI_10 : AND2
      port map (I0=>B2,
                I1=>B3,
                O=>XLXN_25);
   
   XLXI_11 : AND2
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                O=>XLXN_23);
   
   XLXI_12 : OR3
      port map (I0=>XLXN_25,
                I1=>XLXN_24,
                I2=>XLXN_23,
                O=>XLXN_196);
   
   XLXI_13 : OR3
      port map (I0=>B1,
                I1=>B3,
                I2=>XLXN_27,
                O=>XLXN_195);
   
   XLXI_14 : INV
      port map (I=>B2,
                O=>XLXN_27);
   
   XLXI_15 : INV
      port map (I=>B3,
                O=>XLXN_35);
   
   XLXI_17 : INV
      port map (I=>B1,
                O=>XLXN_218);
   
   XLXI_18 : AND2
      port map (I0=>B2,
                I1=>XLXN_35,
                O=>XLXN_43);
   
   XLXI_19 : AND2
      port map (I0=>B2,
                I1=>XLXN_218,
                O=>XLXN_44);
   
   XLXI_20 : AND2
      port map (I0=>XLXN_218,
                I1=>XLXN_35,
                O=>XLXN_221);
   
   XLXI_23 : INV
      port map (I=>B1,
                O=>XLXN_50);
   
   XLXI_24 : INV
      port map (I=>B3,
                O=>XLXN_51);
   
   XLXI_25 : AND2
      port map (I0=>XLXN_51,
                I1=>XLXN_50,
                O=>XLXN_54);
   
   XLXI_26 : AND2
      port map (I0=>B2,
                I1=>XLXN_51,
                O=>XLXN_55);
   
   XLXI_27 : OR2
      port map (I0=>XLXN_55,
                I1=>XLXN_54,
                O=>XLXN_193);
   
   XLXI_28 : INV
      port map (I=>B3,
                O=>XLXN_106);
   
   XLXI_29 : INV
      port map (I=>B2,
                O=>XLXN_107);
   
   XLXI_30 : AND2
      port map (I0=>XLXN_107,
                I1=>XLXN_106,
                O=>XLXN_110);
   
   XLXI_31 : AND2
      port map (I0=>B1,
                I1=>XLXN_107,
                O=>XLXN_111);
   
   XLXI_32 : AND2
      port map (I0=>B1,
                I1=>XLXN_106,
                O=>XLXN_112);
   
   XLXI_33 : OR4
      port map (I0=>B0,
                I1=>XLXN_112,
                I2=>XLXN_111,
                I3=>XLXN_110,
                O=>XLXN_190);
   
   XLXI_34 : INV
      port map (I=>B3,
                O=>XLXN_123);
   
   XLXI_35 : INV
      port map (I=>B2,
                O=>XLXN_122);
   
   XLXI_36 : INV
      port map (I=>B1,
                O=>XLXN_119);
   
   XLXI_37 : AND2
      port map (I0=>B1,
                I1=>XLXN_123,
                O=>XLXN_124);
   
   XLXI_38 : AND2
      port map (I0=>B1,
                I1=>XLXN_122,
                O=>XLXN_125);
   
   XLXI_39 : AND2
      port map (I0=>XLXN_119,
                I1=>B2,
                O=>XLXN_126);
   
   XLXI_40 : OR4
      port map (I0=>B0,
                I1=>XLXN_126,
                I2=>XLXN_125,
                I3=>XLXN_124,
                O=>XLXN_191);
   
   XLXI_45 : INV
      port map (I=>XLXN_190,
                O=>F);
   
   XLXI_46 : INV
      port map (I=>XLXN_191,
                O=>G);
   
   XLXI_47 : INV
      port map (I=>XLXN_192,
                O=>A);
   
   XLXI_48 : INV
      port map (I=>XLXN_196,
                O=>B);
   
   XLXI_49 : INV
      port map (I=>XLXN_195,
                O=>C);
   
   XLXI_50 : INV
      port map (I=>XLXN_194,
                O=>D);
   
   XLXI_51 : INV
      port map (I=>XLXN_193,
                O=>E);
   
   XLXI_52 : INV
      port map (I=>B2,
                O=>XLXN_216);
   
   XLXI_53 : AND3
      port map (I0=>B3,
                I1=>XLXN_216,
                I2=>B1,
                O=>XLXN_222);
   
   XLXI_54 : OR5
      port map (I0=>B0,
                I1=>XLXN_222,
                I2=>XLXN_221,
                I3=>XLXN_44,
                I4=>XLXN_43,
                O=>XLXN_194);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FOURDIGIT is
   port ( clock : in    std_logic; 
          sw0   : in    std_logic; 
          sw1   : in    std_logic; 
          sw2   : in    std_logic; 
          sw3   : in    std_logic; 
          sw4   : in    std_logic; 
          sw5   : in    std_logic; 
          sw6   : in    std_logic; 
          sw7   : in    std_logic; 
          sw8   : in    std_logic; 
          sw9   : in    std_logic; 
          sw10  : in    std_logic; 
          sw11  : in    std_logic; 
          sw12  : in    std_logic; 
          sw13  : in    std_logic; 
          sw14  : in    std_logic; 
          sw15  : in    std_logic; 
          A     : out   std_logic; 
          AN0   : out   std_logic; 
          AN1   : out   std_logic; 
          AN2   : out   std_logic; 
          AN3   : out   std_logic; 
          B     : out   std_logic; 
          C     : out   std_logic; 
          D     : out   std_logic; 
          E     : out   std_logic; 
          F     : out   std_logic; 
          G     : out   std_logic);
end FOURDIGIT;

architecture BEHAVIORAL of FOURDIGIT is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal clk      : std_logic_vector (15 downto 0);
   signal XLXN_54  : std_logic;
   signal XLXN_61  : std_logic;
   signal XLXN_80  : std_logic;
   signal XLXN_91  : std_logic;
   signal XLXN_92  : std_logic;
   signal XLXN_93  : std_logic;
   signal XLXN_97  : std_logic;
   signal XLXN_99  : std_logic;
   signal XLXN_100 : std_logic;
   signal XLXN_104 : std_logic;
   signal XLXN_105 : std_logic;
   signal XLXN_106 : std_logic;
   signal XLXN_117 : std_logic;
   signal XLXN_118 : std_logic;
   signal XLXN_122 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_124 : std_logic;
   signal XLXN_129 : std_logic;
   signal XLXN_130 : std_logic;
   component SEVEN_MUSER_FOURDIGIT
      port ( B3 : in    std_logic; 
             B1 : in    std_logic; 
             B0 : in    std_logic; 
             B2 : in    std_logic; 
             A  : out   std_logic; 
             B  : out   std_logic; 
             C  : out   std_logic; 
             D  : out   std_logic; 
             E  : out   std_logic; 
             G  : out   std_logic; 
             F  : out   std_logic);
   end component;
   
   component CB16CE_HXILINX_FOURDIGIT
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (15 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component CB2CE_HXILINX_FOURDIGIT
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component M4_1E_HXILINX_FOURDIGIT
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component D2_4E_HXILINX_FOURDIGIT
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_7 : label is "XLXI_7_0";
   attribute HU_SET of XLXI_9 : label is "XLXI_9_1";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_2";
   attribute HU_SET of XLXI_12 : label is "XLXI_12_3";
   attribute HU_SET of XLXI_13 : label is "XLXI_13_4";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_5";
   attribute HU_SET of XLXI_21 : label is "XLXI_21_6";
begin
   XLXN_54 <= '1';
   XLXN_61 <= '1';
   XLXN_100 <= '1';
   XLXN_104 <= '1';
   XLXN_105 <= '1';
   XLXN_106 <= '1';
   XLXN_117 <= '1';
   XLXN_118 <= '1';
   XLXN_129 <= '1';
   XLXI_6 : SEVEN_MUSER_FOURDIGIT
      port map (B0=>XLXN_92,
                B1=>XLXN_80,
                B2=>XLXN_93,
                B3=>XLXN_91,
                A=>A,
                B=>B,
                C=>C,
                D=>D,
                E=>E,
                F=>G,
                G=>F);
   
   XLXI_7 : CB16CE_HXILINX_FOURDIGIT
      port map (C=>clock,
                CE=>XLXN_118,
                CLR=>XLXN_54,
                CEO=>open,
                Q(15 downto 0)=>clk(15 downto 0),
                TC=>open);
   
   XLXI_9 : CB2CE_HXILINX_FOURDIGIT
      port map (C=>clk(15),
                CE=>XLXN_117,
                CLR=>XLXN_61,
                CEO=>open,
                Q0=>XLXN_97,
                Q1=>XLXN_99,
                TC=>open);
   
   XLXI_11 : M4_1E_HXILINX_FOURDIGIT
      port map (D0=>sw0,
                D1=>sw1,
                D2=>sw2,
                D3=>sw3,
                E=>XLXN_100,
                S0=>XLXN_97,
                S1=>XLXN_99,
                O=>XLXN_91);
   
   XLXI_12 : M4_1E_HXILINX_FOURDIGIT
      port map (D0=>sw4,
                D1=>sw5,
                D2=>sw6,
                D3=>sw7,
                E=>XLXN_104,
                S0=>XLXN_97,
                S1=>XLXN_99,
                O=>XLXN_80);
   
   XLXI_13 : M4_1E_HXILINX_FOURDIGIT
      port map (D0=>sw8,
                D1=>sw9,
                D2=>sw10,
                D3=>sw11,
                E=>XLXN_105,
                S0=>XLXN_97,
                S1=>XLXN_99,
                O=>XLXN_92);
   
   XLXI_14 : M4_1E_HXILINX_FOURDIGIT
      port map (D0=>sw12,
                D1=>sw13,
                D2=>sw14,
                D3=>sw15,
                E=>XLXN_106,
                S0=>XLXN_97,
                S1=>XLXN_99,
                O=>XLXN_93);
   
   XLXI_21 : D2_4E_HXILINX_FOURDIGIT
      port map (A0=>XLXN_97,
                A1=>XLXN_99,
                E=>XLXN_129,
                D0=>XLXN_130,
                D1=>XLXN_122,
                D2=>XLXN_123,
                D3=>XLXN_124);
   
   XLXI_23 : INV
      port map (I=>XLXN_122,
                O=>AN1);
   
   XLXI_24 : INV
      port map (I=>XLXN_123,
                O=>AN2);
   
   XLXI_25 : INV
      port map (I=>XLXN_124,
                O=>AN3);
   
   XLXI_27 : INV
      port map (I=>XLXN_130,
                O=>AN0);
   
end BEHAVIORAL;


