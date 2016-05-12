module bathysphere(CLOCK_50, LEDR, KEY, SW, HEX0, HEX1, HEX5, HEX4);
	
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	
	output [6:0] HEX0 , HEX1, HEX5, HEX4;
	output [9:0] LEDR;

	microprocessor process(
									.batharriving_export(bathArriving),    //   batharriving.export output
									.bathleaving_export(bathLeaving),     //   bathleaving.export output
									.clk_clk(CLOCK_50),        //   clk.clk
									.drainfinished_export(drainFinished),   //   drainfinished.export output
									.draining_export(draining),        //        draining.export input
									.fillfinished_export(fillFinished),    //    fillfinished.export output
								   .filling_export(filling),         //         filling.export input
									.innerdoor_export(innerDoor),       //       innerdoor.export input
								   .innerdoorswitch_export(innerDoorSwitch), // innerdoorswitch.export output
									.outerdoor_export(outerDoor),       //       outerdoor.export input
									.outerdoorswitch_export(outerDoorSwitch), // outerdoorswitch.export output
									.personcheck_export(personCheck),     //     personcheck.export output
									.pressurecheck_export(pressureCheck),   //   pressurecheck.export output
									.reset_reset_n(KEY[0]),          //           reset.reset_n
									.resetleds_export(resetLeds),       //       resetleds.export input
									.waitfinished_export(waitFinished),    //    waitfinished.export output
									.waiting_export(waiting)          //         waiting.export input
								);
	
	wire drainFinished, draining, fillFinished, innerDoorSwitch, outerDoorSwitch, personCheck, pressureCheck, waitFinished; // output wires
	wire filling, innerDoor, outerDoor, waiting; // input wires
	wire [3:0] resetLeds; // input led states
	wire bathArriving, bathLeaving;
	
	assign LEDR[0] = bathArriving;
	
	/*interlock lock (
							.filling(filling) , // Output (For the pressurize timer and display)
							.draining(draining), // Output (For the depressurize timer and display; 1 bit value and it indicates that it's still draining)
							.innerDoor(innerDoor), // Output (lights up LED 3)
							.outerDoor(outerDoor), // Output (lights up LED 2)
							.resetLeds(resetLeds), // Output (Shows the state on the led)
							.bathLeaving(bathLeaving), // Input  (Is the bathysphere leaving? let me know)
							.bathArriving(bathArriving), // Input (Is the bathysphere arriving? let me know)
							.personCheck(personCheck), // Input (Bathysphere is not empty: Is there a person inside?)
							.pressureCheck(pressureCheck), // Input (Bathysphere is not empty: Is the bathysphere full of water?)
							.innerDoorSwitch(innerDoorSwitch), // Input (Opens or Closes Inner Port)
							.outerDoorSwitch(outerDoorSwitch), // Input (Opens or Closes Outer Port)
							.clk(CLOCK_50), // Input (clock to control everything)
							.reset(KEY[0]), // Input (resets this bitch)
							.drainFinished(drainFinished), // Input (timer uses this; it is an indicator that draining is finished)
							.fillFinished(fillFinished), // Input (timer uses this; it is an indicator that filling is finished)
							.waitFinished(waitFinished), // Input (timer 5min uses this; it is an indicator that the 5 min signal is over)
							.waiting(waiting) // Output (display and 5min timer uses this; indicates that 5 mins are either up or still going)
						);*/
					 
					 // The following module does most of the main functions of this lab 
	/*interlock inter(
							.draining(draining), 
							.filling(filling), 
							.innerDoor(LEDR[3]),
							.outerDoor(LEDR[2]), 
							.resetLeds(LEDR[7:4]),
							.bathLeaving(SW[1]), 
							.bathArriving(SW[0]), 
							.personCheck(SW[8]),
							.pressureCheck(SW[9]), 
							.innerDoorSwitch(SW[3]), 
							.outerDoorSwitch(SW[2]), 
							.clk(tBase[22]),  
							.fill(KEY[1]),
							.fillFinished(fillFinished), 
							.drainFinished(drainFinished),
							.waiting(waiting), 
							.waitFinished(waitFinished)
						);*/
//	/*input bathLeaving, 
//			bathArriving, 
//			personCheck, 
//			pressureCheck, 
//			drain, 
//			fill,
//			innerDoorSwitch, 
//			outerDoorSwitch, 
//			clk,
//			reset,
//			waitFinished, 
//			drainFinished, 
//			fillFinished;*/
//
//			
//// The following displays the output of either pressurizing, waiting or depressurizing 
//	// onto HEX0 and HEX 1 
//	display disp(
//						.letter(letter), 
//						.num(number), 
//						.clk(CLOCK_50), 
//						.drainVal(drainVal), 
//						.fillVal(fillVal),
//						.draining(draining), 
//						.filling(filling),
//						.waiting(waiting), 
//						.waitVal(waitVal)
//					);
//	/* The following module initiates when the interlock module 
//	   is in the pressurization state and allows the user to press and 
//		hold key 1 to immitate the pressurization of the interlock chamber*/
//	timer pressurize(
//							.val(fillVal),
//							.finished(fillFinished), 
//							.clk(tBase[22]), 
//							.startingVal(4'b0111), 
//							.change(!KEY[1]), 
//							.start(filling)
//						);
//						
//	/*This module initiates when the interlock module is in the depressurize 
//	  state and allows the user to press and hold key 2 to immitate the depressurization 
//	  of the interlock chamber*/
//	timer depressurize(
//								.val(drainVal), 
//								.finished(drainFinished), 
//								.clk(tBase[22]), 
//								.startingVal(4'b1000), 
//								.change(!KEY[2]), 
//								.start(draining)
//							);
//	/*This module initiate when the bathysphere signals either arriving or departing and the 
//	  interlock module goes into the waiting state then a signal to this module activates it 
//	  and a countdown goes from 5 to 0 immitating the 5 minute waiting times for both departure 
//	  and arrival of the bathysphere */
//	timer waiting5Sec(
//								.val(waitVal), 
//								.finished(waitFinished), 
//								.clk(tBase[22]), 
//								.startingVal(4'b0101), 
//								.change(1'b1), 
//								.start(waiting)
//							);			
			
endmodule
