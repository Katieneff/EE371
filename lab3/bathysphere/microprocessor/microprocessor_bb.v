
module microprocessor (
	clk_clk,
	filling_export,
	innerdoor_export,
	reset_reset_n,
	draining_export,
	outerdoor_export,
	resetleds_export,
	bathleaving_export,
	batharriving_export,
	personcheck_export,
	pressurecheck_export,
	innerdoorswitch_export,
	outerdoorswitch_export,
	drain_export,
	fill_export,
	fillfinished_export,
	drainfinished_export,
	waiting_export,
	waitfinished_export);	

	input		clk_clk;
	input		filling_export;
	input		innerdoor_export;
	input		reset_reset_n;
	input		draining_export;
	input		outerdoor_export;
	input	[3:0]	resetleds_export;
	output		bathleaving_export;
	output		batharriving_export;
	output		personcheck_export;
	output		pressurecheck_export;
	output		innerdoorswitch_export;
	output		outerdoorswitch_export;
	output		drain_export;
	output		fill_export;
	output		fillfinished_export;
	output		drainfinished_export;
	input		waiting_export;
	output		waitfinished_export;
endmodule
