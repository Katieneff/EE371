module main(LEDR, CLOCK_50, KEY);
	output [7:0] LEDR;
	input CLOCK_50;
	input [0:0] KEY;
	
	parameter majorClock = 31;
	parameter minorClock = 3;
	
	wire [31:0] clk
	clockdiv clockdiv(clk, CLOCK_50);
	
	
	receiver receiver(.data_out, .character_received, .data_in, .clk(clk[minorClock]), .rst);
	transmitter transmitter();	
	
endmodule