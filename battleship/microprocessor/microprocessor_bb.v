
module microprocessor (
	character_received_export,
	character_sent_export,
	clk_clk,
	data_bus_in_export,
	data_bus_out_export,
	load_export,
	reset_reset_n,
	sram_address_sel_export,
	sram_oe_export,
	sram_data_in_port,
	sram_data_out_port,
	sram_we_export,
	transmit_enable_export);	

	input		character_received_export;
	input		character_sent_export;
	input		clk_clk;
	input	[7:0]	data_bus_in_export;
	output	[7:0]	data_bus_out_export;
	output		load_export;
	input		reset_reset_n;
	output	[7:0]	sram_address_sel_export;
	output		sram_oe_export;
	input	[31:0]	sram_data_in_port;
	output	[31:0]	sram_data_out_port;
	output		sram_we_export;
	output		transmit_enable_export;
endmodule
