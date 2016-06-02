
module microprocessor (
	character_received_export,
	character_sent_export,
	clk_clk,
	data_bus_in_export,
	load_export,
	data_bus_out_export,
	reset_reset_n,
	transmit_enable_export);	

	input		character_received_export;
	input		character_sent_export;
	input		clk_clk;
	input	[7:0]	data_bus_in_export;
	output		load_export;
	output	[7:0]	data_bus_out_export;
	input		reset_reset_n;
	output		transmit_enable_export;
endmodule
