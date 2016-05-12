
module microprocessor (
	batharriving_export,
	bathleaving_export,
	clk_clk,
	drain_export,
	drainfinished_export,
	fill_export,
	fillfinished_export,
	innerdooropen_export,
	outerdooropen_export,
	personinside_export,
	chamberfull_export,
	reset_reset_n);	

	output		batharriving_export;
	output		bathleaving_export;
	input		clk_clk;
	output		drain_export;
	output		drainfinished_export;
	output		fill_export;
	output		fillfinished_export;
	output		innerdooropen_export;
	output		outerdooropen_export;
	output		personinside_export;
	output		chamberfull_export;
	input		reset_reset_n;
endmodule
