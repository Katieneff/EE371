module main(LEDR, CLOCK_50, SW);
	input [9:9] SW;
	input CLOCK_50;
	output wire[3:0] LEDR;
	
	wire [31:0] clk_out;
	
	clock_divider clockdiv(CLOCK_50, clk_out);
	counter4 cnt(clk_out[24], SW, LEDR[0], LEDR[1], LEDR[2], LEDR[3]);
	
endmodule