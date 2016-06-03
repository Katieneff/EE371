
module microprocessor (
	character_received_export,
	character_sent_export,
	clk_clk,
	data_bus_in_port,
	data_bus_out_port,
	load_export,
	reset_reset_n,
	transmit_enable_export);	

	input		character_received_export;
	input		character_sent_export;
	input		clk_clk;
	input	[7:0]	data_bus_in_port;
	output	[7:0]	data_bus_out_port;
	output		load_export;
	input		reset_reset_n;
	output		transmit_enable_export;
endmodule
