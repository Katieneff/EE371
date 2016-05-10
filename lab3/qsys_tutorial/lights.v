module lights(CLOCK_50, SW, LEDR, KEY);
	input CLOCK_50;
	input [9:0] SW;
	input [3:0] KEY;
	output [9:0] LEDR;
	
	nios_system sys (
						  .clk_clk(CLOCK_50),         //      clk.clk
						  .leds_export(LEDR[7:0]),     //     leds.export
						  .reset_reset_n(SW[9]),   //    reset.reset_n
						  .switches_export(SW[7:0])  // switches.export
						  );

endmodule
