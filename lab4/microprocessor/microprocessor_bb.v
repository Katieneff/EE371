
module microprocessor (
	clk_clk,
	reset_reset_n,
	data_bus_in_port,
	data_bus_out_port,
	transmit_enable_export,
	character_sent_export,
	character_received_export,
	load_export);	

	input		clk_clk;
	input		reset_reset_n;
	input	[7:0]	data_bus_in_port;
	output	[7:0]	data_bus_out_port;
	output		transmit_enable_export;
	input		character_sent_export;
	input		character_received_export;
	output		load_export;
endmodule
