library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for Half Adder
entity HALF_ADDER is
    Port ( A     : in  STD_LOGIC;
           B     : in  STD_LOGIC;
           Sum   : out STD_LOGIC;
           Carry : out STD_LOGIC);
end HALF_ADDER;

architecture Structural of HALF_ADDER is

    -- Declare the NAND_GATE component to instantiate
    component NAND_GATE is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- Internal signals to route values between NAND gates
    signal N1, N2, N3 : STD_LOGIC;

begin

    -- Stage 1: Initial NAND of inputs A and B
    NAND_1: NAND_GATE port map (
        A => A,
        B => B,
        Y => N1
    );

    -- Stage 2: Cross-coupling with original inputs
    NAND_2: NAND_GATE port map (
        A => A,
        B => N1,
        Y => N2
    );

    NAND_3: NAND_GATE port map (
        A => B,
        B => N1,
        Y => N3
    );

    -- Stage 3: Output stages for Sum and Carry
    NAND_4: NAND_GATE port map (
        A => N2,
        B => N3,
        Y => Sum
    );

    NAND_5: NAND_GATE port map (
        A => N1,
        B => N1,
        Y => Carry
    );

end Structural;