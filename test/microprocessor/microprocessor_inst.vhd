	component microprocessor is
		port (
			clk_clk               : in  std_logic                    := 'X'; -- clk
			reset_reset_n         : in  std_logic                    := 'X'; -- reset_n
			depressurize_export   : out std_logic;                           -- export
			pressurize_export     : out std_logic;                           -- export
			doors_export          : out std_logic_vector(1 downto 0);        -- export
			arrivalsignals_export : out std_logic_vector(1 downto 0)         -- export
		);
	end component microprocessor;

	u0 : component microprocessor
		port map (
			clk_clk               => CONNECTED_TO_clk_clk,               --            clk.clk
			reset_reset_n         => CONNECTED_TO_reset_reset_n,         --          reset.reset_n
			depressurize_export   => CONNECTED_TO_depressurize_export,   --   depressurize.export
			pressurize_export     => CONNECTED_TO_pressurize_export,     --     pressurize.export
			doors_export          => CONNECTED_TO_doors_export,          --          doors.export
			arrivalsignals_export => CONNECTED_TO_arrivalsignals_export  -- arrivalsignals.export
		);

