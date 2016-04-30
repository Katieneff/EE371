/*This is the interlock module where most of the functions of this lab happens
  This module takes care of arriving, departing, checking pressure and checking 
  if there is a person in the interlock. This module also takes care of the 
  pressurization and depressurization of the interlock chamber*/
  
module interlock(
						filling , 
						draining, 
						innerDoor, 
						outerDoor, 
						resetLeds, 
						bathLeaving, 
						bathArriving, 
						personCheck, 
						pressureCheck, 
						drain, 
						fill, 
						innerDoorSwitch, 
						outerDoorSwitch, 
						clk, 
						reset, 
						drainFinished, 
						fillFinished, 
						waitFinished, 
						waiting
					);
	// The following inputs come from the main module 
	input bathLeaving, 
			bathArriving, 
			personCheck, 
			pressureCheck, 
			drain, 
			fill,
			innerDoorSwitch, 
			outerDoorSwitch, 
			clk,
			reset,
			waitFinished, 
			drainFinished, 
			fillFinished;
	// The following outputs are displayed onto LEDR 3 and 2 	
	output reg innerDoor, 
				  outerDoor;
	
	/*The following output displays the state in which the interlock 
	  is currently in, it displays these states on LEDRs 7 to 4 */
	output reg [3:0] resetLeds; 
	
	/* These following outputs go to the timer module. They act as a 
		signal to activate either pressurization, depressurization or 
		the waiting timer. These signals activate depending on which 
		state the interlock module is in*/
	output reg filling, 
				  draining, 
				  waiting;
				  
			  
				  
	reg [3:0] ps;
	
	wire nReset;
	not resetNot (nReset , reset);
	
	// Follow are the states that this module goes through 

	parameter [3:0] closedLow = 4'b0100, 
						 closedHigh = 4'b0101;
	parameter [3:0] outerOpen = 4'b0110, 
						 innerOpen = 4'b0111;
	parameter [3:0] swChkOutOpen = 4'b1000, 
						 swChkOutClose = 4'b1001;
	parameter [3:0] swChkInOpen = 4'b1010, 
						 swChkInClose = 4'b1011;
	parameter [3:0] timerFill = 4'b1100, 
						 timerDrain = 4'b1101;
	parameter [3:0] resetting = 4'b0000, 
						 pressureStatus = 4'b0001;
	parameter [3:0] doorStatus = 4'b0010, 
						 waiting5 = 4'b0011;
	parameter [3:0] closedLowIn = 4'b1110;
	parameter [6:0] i = ~7'b0000110, 
						 n = ~7'b0110111, 
						 off = ~7'b0000000;
	parameter [3:0] bufferState = 4'b1111;
	
	
	
	
	always@(posedge clk) begin
	// Following if statement checks to see if the user has 
	// pressed the reset key, which is key 0. 
		if (nReset) begin 
				ps <= closedLow;
				resetLeds [3:0] <= closedLow;
				innerDoor <= 1'b0;
				outerDoor <= 1'b0;
				draining <= 0;
				filling <= 0;
		end else begin
			case (ps)
			   // The following state makes sure if the interlock is empty or not 
				// It checks if the pressure is already high in the chamber
				// or if there is already a person in there 
				resetting: begin
					if (!personCheck && !pressureCheck && !bathLeaving) begin
						ps <= timerFill;
						innerDoor <= 1'b0;
						outerDoor <= 1'b0;
						resetLeds <= timerFill;
					end
					else if (bathLeaving && !pressureCheck && !personCheck)
					begin 
					       ps <=swChkInOpen ;
							 resetLeds <= swChkInOpen; 
							 innerDoor <= 1'b1; 
					end 
					else if (pressureCheck && bathLeaving) 
					begin
					      ps <= timerDrain ;
							resetLeds <= timerDrain; 
							draining <= 1 ; 
							
					end 
					else if(!personCheck && pressureCheck)
					begin 
					     ps <= swChkOutOpen;
						  resetLeds <= swChkOutOpen;
						  outerDoor <= 1'b1; 
				   end 
					else if ( personCheck && !pressureCheck) 
					begin
				         ps <= swChkInOpen;
						   resetLeds <= swChkInOpen;
						   innerDoor <= 1'b1; 	
					end 
				end
				
				// The following state is the initial state that the interlock module 
				// goes into and then wait for either the arrival signal or departure signal
				// when either of those are activated the interlock module goes into the 
				// wait5 module where the 5 minute countdown begins. 
				closedLow: begin
					if (bathArriving) begin
							ps <= waiting5;
							waiting <= 1'b1;
							resetLeds <= waiting5;
					end else 
					if(bathLeaving) begin
							ps <= waiting5;
							innerDoor <= 1'b0;
							outerDoor <=1'b0;
							waiting <= 1'b1;
							resetLeds <= waiting5;
					end else 
					if (innerDoorSwitch) begin
						ps <= closedLow;
						innerDoor <= 1'b1;
						resetLeds <= closedLow;
					end	
				end
				
				// This is the state when the interlock is depressurizzed and the inner 
				// door is closed 
				closedLowIn: begin 
					if (!innerDoorSwitch) begin
						innerDoor <=1'b1; 
						ps <= closedLowIn;
						resetLeds <= closedLowIn;
					end else 
					if (innerDoorSwitch) begin 
						innerDoor <= 1'b1;
						ps <= swChkInOpen;
						resetLeds <= swChkInOpen;
					end 
					end  
				
				// The interlock module arrives in this state when the chamber is pressurized
				// and the outer door is closed, as well as the inner door. 
				closedHigh: begin
					if (bathArriving && !outerDoor) begin
						ps <= swChkOutOpen;
						outerDoor <= 1'b1;
						resetLeds <= swChkOutOpen;
					end 
					else if (bathLeaving) begin
						ps <= swChkOutOpen;
						outerDoor <= 1'b1;
						resetLeds <= swChkOutOpen;
					end
				end
				
				// The onterlock module arrives in this state when the interlock is 
				// pressurized and the outer door is open 
				outerOpen: begin
					if (outerDoorSwitch) begin
						ps <= outerOpen;
						outerDoor <= 1'b1;
						resetLeds <= outerOpen;
					end else if (!outerDoorSwitch) begin 
						outerDoor <= 1'b0;
						ps <= swChkOutClose;
						resetLeds <= swChkOutClose;
					end
				end
				
				// The inter lock comes to this module if the innerDoor is opened 
				innerOpen: begin
					if (!bathLeaving) begin
						ps <= swChkInClose;
						innerDoor <= 1'b0;
						resetLeds <= swChkInClose;
					end
				end
				
				//The interlock goes to this state if the bathysphere is arriving and 
				// the outer door is not open or if the bathysphere is about to depart.
				swChkOutOpen: begin
					if (outerDoorSwitch && !personCheck) begin
						ps <= outerOpen;
						resetLeds <= outerOpen;
					end
				end
				
				// The interlock arrives to this module after the outer door is open and 
				// stays in here until the outer door is closed then it goes to depressurization
				// state 
				swChkOutClose: begin
					if (!outerDoorSwitch && !personCheck) begin
						ps <= timerDrain;
						draining <= 1'b1;
						resetLeds <= timerDrain;
					end
				end
				
				// The interlock arrives in this state after the inner door is open 
				// and stays in here until the inner door is closed. 
				swChkInOpen: begin
					if (!innerDoorSwitch) begin
						ps <= swChkInOpen;
						innerDoor = 1'b1;
						resetLeds = swChkInOpen;
					end 
					else if (innerDoorSwitch)
					begin
					     ps<= swChkInClose;
						  innerDoor <= 1'b1; 
						  resetLeds <= swChkInClose;
					end 
				end
				
				// Arrives in this state after the inner door is open and then closed 
				swChkInClose: begin
				        if (!innerDoorSwitch && bathLeaving && !bathArriving) 
						  begin
						        ps <= timerFill;
								  resetLeds <= timerFill;
								  innerDoor <= 1'b0;  
						  end 
						  else if (!innerDoorSwitch && bathArriving && !bathLeaving)
						  begin
									ps <= timerFill;
									resetLeds <= timerFill; 
								   innerDoor <= 1'b0;
						  end
					else if (!innerDoorSwitch && !personCheck) begin
						ps <= bufferState;
						innerDoor <= 1'b0;
						resetLeds <= bufferState;
					end
				end
				// this is the state where depressurization is activated 
				timerDrain: begin
					if (drainFinished) begin
						ps <= closedLowIn;
						draining <= 1'b0;
						resetLeds <= closedLowIn;
					end
				end
				
				// This is the state where pressurization is activated 
				timerFill: begin	
					filling<=1'b1;
					if (fillFinished) begin
						ps <= closedHigh;
						filling <= 1'b0;
						resetLeds <= closedHigh;
					end
				end
				
				// This is the state where the timer for waiting 5 mminutes is activated 
				waiting5: begin
					if (waitFinished) begin
					   if (bathArriving || bathLeaving) 
						begin
					        ps <= resetting;
							  resetLeds<= resetting;  
						end 
						waiting <= 1'b0;
					end
				end
				
				bufferState: begin
					if (bathArriving) begin 
						ps <= bufferState;
						resetLeds <= bufferState;
					end else 
					if (bathLeaving) begin
						ps <= bufferState;
						resetLeds <= bufferState;
					end else begin 
						ps <= closedLow;
						resetLeds <= closedLow;
					end 
				end 
				
				default: resetLeds [3:0] <= 4'b0001;
				
			endcase
		end
	end

endmodule

