/*Authors : Adolfo Pineda
				Katelyn Elizabeth Neff 
				Sharyar Khalid 
				
  This is the main module which calls all other module
  this module calls the interlock module that does all the 
  main features of this lab, then it calls the timer module and 
  sends it the approriate inputs depending on which state the 
  interlock module is. It also calls the display module that outputs 
  on the HEX display allowing the user to see what he/she is currently 
  doing*/
  
module main(CLOCK_50, LEDR, SW, HEX0, HEX1, KEY, HEX5, HEX4);
	
	input [3:0] KEY;
	input [9:0] SW;
	input CLOCK_50;
	
	output [6:0] HEX0 , HEX1, HEX5, HEX4;
	output [9:0] LEDR;
	
	wire filling , draining, fillFinished, drainFinished, waiting, waitFinished;
	wire [3:0] drainVal, fillVal, waitVal;
	wire [6:0] letter, number;
	
	assign HEX1 = letter;
	assign HEX0 = number; 

	assign LEDR[9] = SW[9];
	assign LEDR[8] = SW[8];	
	assign LEDR[1:0] = SW[1:0];
	
	reg [25:0] tBase;
	always@(posedge CLOCK_50) begin
		tBase <= tBase + 1'b1;
	end
	
	// The following module does most of the main functions of this lab 
	interlock inter(
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
							.reset(KEY[0]), 
							.drain(KEY[2]), 
							.fill(KEY[1]),
							.fillFinished(fillFinished), 
							.drainFinished(drainFinished),
							.waiting(waiting), 
							.waitFinished(waitFinished)
						);
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
							.clk(tBase[22]), 
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
								.clk(tBase[22]), 
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
								.clk(tBase[22]), 
								.startingVal(4'b0101), 
								.change(1'b1), 
								.start(waiting)
							);

endmodule


