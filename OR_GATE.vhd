library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for 2-input OR gate
entity OR_GATE is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out STD_LOGIC);
end OR_GATE;

architecture Structural of OR_GATE is

    -- Declare the NAND_GATE component to instantiate
    component NAND_GATE is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- Internal signals to connect intermediate inverter outputs
    signal A_NOT : STD_LOGIC;
    signal B_NOT : STD_LOGIC;

begin

    -- Instance 1: Invert A (A NAND A)
    NAND_1: NAND_GATE port map (
        A => A,
        B => A,
        Y => A_NOT
    );

    -- Instance 2: Invert B (B NAND B)
    NAND_2: NAND_GATE port map (
        A => B,
        B => B,
        Y => B_NOT
    );

    -- Instance 3: Combine ~A and ~B to form OR output
    NAND_3: NAND_GATE port map (
        A => A_NOT,
        B => B_NOT,
        Y => Y
    );

end Structural;