	component microprocessor is
		port (
			character_received_export : in  std_logic                    := 'X';             -- export
			character_sent_export     : in  std_logic                    := 'X';             -- export
			clk_clk                   : in  std_logic                    := 'X';             -- clk
			data_bus_in_export        : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			load_export               : out std_logic;                                       -- export
			data_bus_out_export       : out std_logic_vector(7 downto 0);                    -- export
			reset_reset_n             : in  std_logic                    := 'X';             -- reset_n
			transmit_enable_export    : out std_logic                                        -- export
		);
	end component microprocessor;

	u0 : component microprocessor
		port map (
			character_received_export => CONNECTED_TO_character_received_export, -- character_received.export
			character_sent_export     => CONNECTED_TO_character_sent_export,     --     character_sent.export
			clk_clk                   => CONNECTED_TO_clk_clk,                   --                clk.clk
			data_bus_in_export        => CONNECTED_TO_data_bus_in_export,        --        data_bus_in.export
			load_export               => CONNECTED_TO_load_export,               --               load.export
			data_bus_out_export       => CONNECTED_TO_data_bus_out_export,       --       data_bus_out.export
			reset_reset_n             => CONNECTED_TO_reset_reset_n,             --              reset.reset_n
			transmit_enable_export    => CONNECTED_TO_transmit_enable_export     --    transmit_enable.export
		);

