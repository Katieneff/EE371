	component microprocessor is
		port (
			batharriving_export  : out std_logic;        -- export
			bathleaving_export   : out std_logic;        -- export
			clk_clk              : in  std_logic := 'X'; -- clk
			drain_export         : out std_logic;        -- export
			drainfinished_export : out std_logic;        -- export
			fill_export          : out std_logic;        -- export
			fillfinished_export  : out std_logic;        -- export
			innerdooropen_export : out std_logic;        -- export
			outerdooropen_export : out std_logic;        -- export
			personinside_export  : out std_logic;        -- export
			chamberfull_export   : out std_logic;        -- export
			reset_reset_n        : in  std_logic := 'X'  -- reset_n
		);
	end component microprocessor;

	u0 : component microprocessor
		port map (
			batharriving_export  => CONNECTED_TO_batharriving_export,  --  batharriving.export
			bathleaving_export   => CONNECTED_TO_bathleaving_export,   --   bathleaving.export
			clk_clk              => CONNECTED_TO_clk_clk,              --           clk.clk
			drain_export         => CONNECTED_TO_drain_export,         --         drain.export
			drainfinished_export => CONNECTED_TO_drainfinished_export, -- drainfinished.export
			fill_export          => CONNECTED_TO_fill_export,          --          fill.export
			fillfinished_export  => CONNECTED_TO_fillfinished_export,  --  fillfinished.export
			innerdooropen_export => CONNECTED_TO_innerdooropen_export, -- innerdooropen.export
			outerdooropen_export => CONNECTED_TO_outerdooropen_export, -- outerdooropen.export
			personinside_export  => CONNECTED_TO_personinside_export,  --  personinside.export
			chamberfull_export   => CONNECTED_TO_chamberfull_export,   --   chamberfull.export
			reset_reset_n        => CONNECTED_TO_reset_reset_n         --         reset.reset_n
		);

