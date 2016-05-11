module main(LEDR, CLOCK_50, SW, KEY);
	input CLOCK_50;
	input [9:0] SW;
	input [3:0] KEY;
	output [7:0] LEDR;
	
	
	microprocessor m(
		.clk_clk(CLOCK_50),         //      clk.clk
		.keys_export(KEY[3:1],     //     keys.export
		.leds_export(LEDS[7:0]),     //     leds.export
		.reset_reset_n(KEY[0:0]),   //    reset.reset_n
		.switches_export(SW[8:0])  // switches.export
	);
	
	filling;
	draining;
	innerDoor;
	outerDoor;
	resetLeds;
	bathLeaving;
	bathArriving;
	personCheck;
	pressureCheck;
	drain;
	fill;
	innerDoorSwitch;
	outerDoorSwitch;
	clk;
	reset;
	drainFinished;
	fillFinished;
	waitFinished;
	waiting;	
	wire innerDoor;
	wire outerDoor;
	
	
	

	wire reset;
	wire drain;
	wire fill;
	
	assign fill = KEY[1];
	assign drain = KEY[2];
	
	
		// The following module does most of the main functions of this lab 
	interlock inter(
							.draining(draining), //output
							.filling(filling),//output
							.innerDoor(LEDR[3]), //output
							.outerDoor(LEDR[2]), //output
							.resetLeds(LEDR[7:4]), //output
							.bathLeaving(SW[1]), //input
							.bathArriving(SW[0]), //input
							.personCheck(SW[8]), //input
							.pressureCheck(SW[9]), //input
							.innerDoorSwitch(SW[3]), //input
							.outerDoorSwitch(SW[2]), //input
							.clk(CLOCK_50), //input
							.reset(KEY[0]), //input
							.drain(drain), //input
							.fill(KEY[1]), //input
							.fillFinished(fillFinished), //input
							.drainFinished(drainFinished), //input
							.waiting(waiting), //output
							.waitFinished(waitFinished) //input
						);



endmodule
