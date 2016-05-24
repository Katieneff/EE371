module main(CLOCK_50, LEDR, SW);
	input CLOCK_50;
	input [9:9] SW;
	output[7:0] LEDR;

	microprocessor m(CLOCK_50, LEDR, SW);

endmodule
