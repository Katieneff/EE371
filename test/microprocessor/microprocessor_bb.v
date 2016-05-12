
module microprocessor (
	clk_clk,
	reset_reset_n,
	depressurize_export,
	pressurize_export,
	doors_export,
	arrivalsignals_export);	

	input		clk_clk;
	input		reset_reset_n;
	output		depressurize_export;
	output		pressurize_export;
	output	[1:0]	doors_export;
	output	[1:0]	arrivalsignals_export;
endmodule
