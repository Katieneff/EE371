	component microprocessor is
		port (
			address_export : out std_logic_vector(7 downto 0);                    -- export
			clk_clk        : in  std_logic                    := 'X';             -- clk
			data_in_port   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
			data_out_port  : out std_logic_vector(7 downto 0);                    -- out_port
			leds_export    : out std_logic_vector(7 downto 0);                    -- export
			oe_export      : out std_logic;                                       -- export
			reset_reset_n  : in  std_logic                    := 'X';             -- reset_n
			we_export      : out std_logic                                        -- export
		);
	end component microprocessor;

	u0 : component microprocessor
		port map (
			address_export => CONNECTED_TO_address_export, -- address.export
			clk_clk        => CONNECTED_TO_clk_clk,        --     clk.clk
			data_in_port   => CONNECTED_TO_data_in_port,   --    data.in_port
			data_out_port  => CONNECTED_TO_data_out_port,  --        .out_port
			leds_export    => CONNECTED_TO_leds_export,    --    leds.export
			oe_export      => CONNECTED_TO_oe_export,      --      oe.export
			reset_reset_n  => CONNECTED_TO_reset_reset_n,  --   reset.reset_n
			we_export      => CONNECTED_TO_we_export       --      we.export
		);

