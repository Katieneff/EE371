	component microprocessor is
		port (
			clk_clk        : in  std_logic                    := 'X';             -- clk
			reset_reset_n  : in  std_logic                    := 'X';             -- reset_n
			leds_export    : out std_logic_vector(7 downto 0);                    -- export
			address_export : out std_logic_vector(7 downto 0);                    -- export
			data_in_port   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
			data_out_port  : out std_logic_vector(7 downto 0);                    -- out_port
			oe_export      : out std_logic;                                       -- export
			we_export      : out std_logic                                        -- export
		);
	end component microprocessor;

	u0 : component microprocessor
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --     clk.clk
			reset_reset_n  => CONNECTED_TO_reset_reset_n,  --   reset.reset_n
			leds_export    => CONNECTED_TO_leds_export,    --    leds.export
			address_export => CONNECTED_TO_address_export, -- address.export
			data_in_port   => CONNECTED_TO_data_in_port,   --    data.in_port
			data_out_port  => CONNECTED_TO_data_out_port,  --        .out_port
			oe_export      => CONNECTED_TO_oe_export,      --      oe.export
			we_export      => CONNECTED_TO_we_export       --      we.export
		);

