
module microprocessor (
	clk_clk,
	reset_reset_n,
	leds_export,
	address_export,
	data_in_port,
	data_out_port,
	oe_export,
	we_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	leds_export;
	output	[7:0]	address_export;
	input	[7:0]	data_in_port;
	output	[7:0]	data_out_port;
	output		oe_export;
	output		we_export;
endmodule
