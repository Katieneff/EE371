module main(CLOCK_50, SW, LEDR, KEY, HEX0, HEX2, HEX3, HEX4,  HEX5);
	input CLOCK_50;
	input [3:0] SW;
	input [3:0] KEY;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX2, HEX3, HEX4, HEX5;	
	
	
	wire [2:0] doorCommand;
	wire [3:0] timer;
	
	
	parameter whichClock = 24;
	wire [31:0] clk;
	clockdiv clockdiv(clk, CLOCK_50);
	
	
	wire [1:0] arrivalSignals, doors;
	wire depressurize, pressurize;
	
	microprocessor (
		.arrivalsignals_export(arrivalSignals), // arrivalsignals.export
		.clk_clk(CLOCK_50),               //            clk.clk
		.depressurize_export(depressurize),   //   depressurize.export
		.doors_export(doors),          //          doors.export
		. pressurize_export(pressurize),     //     pressurize.export
		.reset_reset_n(KEY[0])          //          reset.reset_n
	);
	
	
	interlock interlock(.doorCommand(doorCommand), .timer(timer), .arrivalSignals(arrivalSignals), .doors(doors), .pressurize(pressurize), .depressurize(depressurize), .clk(CLOCK_50), .rst(KEY[0]));
	
	doorCommandDecoder doorCommandDecoder(HEX5, HEX4, HEX3, HEX2, doorCommand);
	timerDecoder timerDecoder(HEX0, timer);
	

endmodule