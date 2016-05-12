	component microprocessor is
		port (
			clk_clk                : in  std_logic                    := 'X';             -- clk
			reset_reset_n          : in  std_logic                    := 'X';             -- reset_n
			filling_export         : in  std_logic                    := 'X';             -- export
			draining_export        : in  std_logic                    := 'X';             -- export
			outerdoor_export       : in  std_logic                    := 'X';             -- export
			innerdoor_export       : in  std_logic                    := 'X';             -- export
			resetleds_export       : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			bathleaving_export     : out std_logic;                                       -- export
			batharriving_export    : out std_logic;                                       -- export
			personcheck_export     : out std_logic;                                       -- export
			pressurecheck_export   : out std_logic;                                       -- export
			innerdoorswitch_export : out std_logic;                                       -- export
			outerdoorswitch_export : out std_logic;                                       -- export
			drainfinished_export   : out std_logic;                                       -- export
			fillfinished_export    : out std_logic;                                       -- export
			waitfinished_export    : out std_logic;                                       -- export
			waiting_export         : in  std_logic                    := 'X'              -- export
		);
	end component microprocessor;

	u0 : component microprocessor
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			filling_export         => CONNECTED_TO_filling_export,         --         filling.export
			draining_export        => CONNECTED_TO_draining_export,        --        draining.export
			outerdoor_export       => CONNECTED_TO_outerdoor_export,       --       outerdoor.export
			innerdoor_export       => CONNECTED_TO_innerdoor_export,       --       innerdoor.export
			resetleds_export       => CONNECTED_TO_resetleds_export,       --       resetleds.export
			bathleaving_export     => CONNECTED_TO_bathleaving_export,     --     bathleaving.export
			batharriving_export    => CONNECTED_TO_batharriving_export,    --    batharriving.export
			personcheck_export     => CONNECTED_TO_personcheck_export,     --     personcheck.export
			pressurecheck_export   => CONNECTED_TO_pressurecheck_export,   --   pressurecheck.export
			innerdoorswitch_export => CONNECTED_TO_innerdoorswitch_export, -- innerdoorswitch.export
			outerdoorswitch_export => CONNECTED_TO_outerdoorswitch_export, -- outerdoorswitch.export
			drainfinished_export   => CONNECTED_TO_drainfinished_export,   --   drainfinished.export
			fillfinished_export    => CONNECTED_TO_fillfinished_export,    --    fillfinished.export
			waitfinished_export    => CONNECTED_TO_waitfinished_export,    --    waitfinished.export
			waiting_export         => CONNECTED_TO_waiting_export          --         waiting.export
		);

