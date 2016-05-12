module main(LEDR, CLOCK_50, SW, KEY);
	input CLOCK_50;
	input [9:0] SW;
	input [3:0] KEY;
	output [7:0] LEDR;
	
	
	microprocessor m(
		.batharriving_export(bathArriving),    //    batharriving.export
		.bathleaving_export(bathLeaving),     //     bathleaving.export
		.clk_clk(CLOCK_50),                //             clk.clk
		.drain_export(drain),           //           drain.export
		.drainfinished_export(),   //   drainfinished.export
		.fill_export(fill),            //            fill.export
		.fillfinished_export(),    //    fillfinished.export
		.innerdooropen_export(LEDR[3]), // innerdoorswitch.export
		.outerdooropen_export(LEDR[2]),       //       outerdoor.export
		.personinside_export(),   //   pressurecheck.export
		.reset_reset_n(KEY[0]),    //	reset.reset_n
	);
	
	
	wire innerDoorOpen;
	wire outerDoorOpen;
	wire reset;
	wire drain;
	wire fill;
	wire bathArriving;
	wire bathLeaving;
	
	
	// The following module does most of the main functions of this lab 
	interlock inter(
							.draining(draining), //output
							.filling(filling),//output
							.innerDoor(), //output
							.outerDoor(), //output
							.resetLeds(LEDR[7:4]), //output
							.bathLeaving(bathLeaving), //input
							.bathArriving(bathArriving), //input
							.personCheck(SW[8]), //input
							.pressureCheck(SW[9]), //input
							.innerDoorSwitch(innerDoorOpen), //input
							.outerDoorSwitch(outerDoorOpen), //input
							.clk(CLOCK_50), //input
							.reset(KEY[0]), //input
							.drain(drain), //input
							.fill(fill), //input
							.fillFinished(fillFinished), //input
							.drainFinished(drainFinished), //input
							.waiting(waiting), //output
							.waitFinished(waitFinished) //input
						);
						
	reg [25:0] tBase;
	always@(posedge CLOCK_50) begin
		tBase <= tBase + 1'b1;
	end					
						
	// The following displays the output of either pressurizing, waiting or depressurizing 
	// onto HEX0 and HEX 1 
	display disp(
						.letter(letter), 
						.num(number), 
						.clk(CLOCK_50), 
						.drainVal(drainVal), 
						.fillVal(fillVal),
						.draining(draining), 
						.filling(filling),
						.waiting(waiting), 
						.waitVal(waitVal)
					);
	/* The following module initiates when the interlock module 
	   is in the pressurization state and allows the user to press and 
		hold key 1 to immitate the pressurization of the interlock chamber*/
	timer pressurize(
							.val(fillVal),
							.finished(fillFinished), 
							.clk(CLOCK_50), 
							.startingVal(4'b0111), 
							.change(!KEY[1]), 
							.start(filling)
						);
						
	/*This module initiates when the interlock module is in the depressurize 
	  state and allows the user to press and hold key 2 to immitate the depressurization 
	  of the interlock chamber*/
	timer depressurize(
								.val(drainVal), 
								.finished(drainFinished), 
								.clk(CLOCK_50), 
								.startingVal(4'b1000), 
								.change(!KEY[2]), 
								.start(draining)
							);
	/*This module initiate when the bathysphere signals either arriving or departing and the 
	  interlock module goes into the waiting state then a signal to this module activates it 
	  and a countdown goes from 5 to 0 immitating the 5 minute waiting times for both departure 
	  and arrival of the bathysphere */
	timer waiting5Sec(
								.val(waitVal), 
								.finished(waitFinished), 
								.clk(CLOCK_50), 
								.startingVal(4'b0101), 
								.change(1'b1), 
								.start(waiting)
							);


endmodule
