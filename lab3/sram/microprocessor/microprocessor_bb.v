
module microprocessor (
	address_export,
	clk_clk,
	data_in_port,
	data_out_port,
	leds_export,
	oe_export,
	reset_reset_n,
	we_export);	

	output	[7:0]	address_export;
	input		clk_clk;
	input	[7:0]	data_in_port;
	output	[7:0]	data_out_port;
	output	[7:0]	leds_export;
	output		oe_export;
	input		reset_reset_n;
	output		we_export;
endmodule
