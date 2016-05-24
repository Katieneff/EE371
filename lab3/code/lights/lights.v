module lights(CLOCK_50, LEDR, SW, KEY);
	input CLOCK_50;
	input [7:0] SW;
	input [0:0] KEY;
	output [7:0] LEDR;
	
	
	nios_system system(
								.switches_export(SW[7:0]),
								.leds_export(LEDR[7:0]),
								.reset_reset_n(KEY[0:0]),
								.clk_clk(CLOCK_50)
							);
endmodule
							
							
