/*
Author:  Katie Neff
Title: 	 main
Summary: Main code for DEC-So1 board implementation
		 that shows the counter in action
*/

module main(LEDR, CLOCK_50, SW);
	input [9:9] SW; // Switch for reset
	input CLOCK_50; // 50 MHz clock
	output wire[3:0] LEDR; // LEDs for displaying the counter
	
	wire [31:0] clk_out; // For clock division
	
	// Divides the 50 MHz clock for slower clocks
	clock_divider clockdiv(CLOCK_50, clk_out);
	
	// Starts the counting using the divided clock
	counter4 cnt(clk_out[24], SW, LEDR[0], LEDR[1], LEDR[2], LEDR[3]);
	
endmodule