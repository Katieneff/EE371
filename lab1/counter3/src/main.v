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
	
	clock_divider clockdiv(CLOCK_50, clk_out); // Divides the 50 MHz clock for slower clocks
	counter cnt(LEDR, clk_out[24], SW); // Starts the counting using the divided clock
	
endmodule