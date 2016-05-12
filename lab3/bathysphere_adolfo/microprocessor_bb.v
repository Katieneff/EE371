
module microprocessor (
	clk_clk,
	reset_reset_n,
	filling_export,
	draining_export,
	outerdoor_export,
	innerdoor_export,
	resetleds_export,
	bathleaving_export,
	batharriving_export,
	personcheck_export,
	pressurecheck_export,
	innerdoorswitch_export,
	outerdoorswitch_export,
	drainfinished_export,
	fillfinished_export,
	waitfinished_export,
	waiting_export);	

	input		clk_clk;
	input		reset_reset_n;
	input		filling_export;
	input		draining_export;
	input		outerdoor_export;
	input		innerdoor_export;
	input	[3:0]	resetleds_export;
	output		bathleaving_export;
	output		batharriving_export;
	output		personcheck_export;
	output		pressurecheck_export;
	output		innerdoorswitch_export;
	output		outerdoorswitch_export;
	output		drainfinished_export;
	output		fillfinished_export;
	output		waitfinished_export;
	input		waiting_export;
endmodule
