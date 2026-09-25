library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for Full Adder
entity FULL_ADDER is
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           Cin  : in  STD_LOGIC;
           Sum  : out STD_LOGIC;
           Cout : out STD_LOGIC);
end FULL_ADDER;

architecture Structural of FULL_ADDER is

    -- Component Declaration for HALF_ADDER
    component HALF_ADDER is
        Port ( A     : in  STD_LOGIC;
               B     : in  STD_LOGIC;
               Sum   : out STD_LOGIC;
               Carry : out STD_LOGIC);
    end component;

    -- Component Declaration for OR_GATE
    component OR_GATE is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- Internal signals to connect the modules
    signal S1 : STD_LOGIC; -- Intermediate Sum from HA1
    signal C1 : STD_LOGIC; -- Intermediate Carry from HA1
    signal C2 : STD_LOGIC; -- Intermediate Carry from HA2

begin

    -- Instance 1: First Half Adder (adds A and B)
    HA_1: HALF_ADDER port map (
        A     => A,
        B     => B,
        Sum   => S1,
        Carry => C1
    );

    -- Instance 2: Second Half Adder (adds S1 and Cin)
    HA_2: HALF_ADDER port map (
        A     => S1,
        B     => Cin,
        Sum   => Sum,
        Carry => C2
    );

    -- Instance 3: OR Gate (combines intermediate carry signals)
    OR_1: OR_GATE port map (
        A => C1,
        B => C2,
        Y => Cout
    );

end Structural;