	component microprocessor is
		port (
			clk_clk                   : in  std_logic                    := 'X';             -- clk
			reset_reset_n             : in  std_logic                    := 'X';             -- reset_n
			data_bus_in_port          : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
			data_bus_out_port         : out std_logic_vector(7 downto 0);                    -- out_port
			transmit_enable_export    : out std_logic;                                       -- export
			character_sent_export     : in  std_logic                    := 'X';             -- export
			character_received_export : in  std_logic                    := 'X';             -- export
			load_export               : out std_logic                                        -- export
		);
	end component microprocessor;

	u0 : component microprocessor
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --                clk.clk
			reset_reset_n             => CONNECTED_TO_reset_reset_n,             --              reset.reset_n
			data_bus_in_port          => CONNECTED_TO_data_bus_in_port,          --           data_bus.in_port
			data_bus_out_port         => CONNECTED_TO_data_bus_out_port,         --                   .out_port
			transmit_enable_export    => CONNECTED_TO_transmit_enable_export,    --    transmit_enable.export
			character_sent_export     => CONNECTED_TO_character_sent_export,     --     character_sent.export
			character_received_export => CONNECTED_TO_character_received_export, -- character_received.export
			load_export               => CONNECTED_TO_load_export                --               load.export
		);

