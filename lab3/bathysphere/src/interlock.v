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

	parameter [3:0] everythingClosedLow = 4'b0100, 
						 everythingClosedHigh = 4'b0101;
	parameter [3:0] openOuterDoor = 4'b0110, 
						 openInnerDoor = 4'b0111;
	parameter [3:0] outerDoorOpen = 4'b1000, 
						 outerDoorClose = 4'b1001;
	parameter [3:0] innerDoorOpen = 4'b1010, 
						 innerDoorClose = 4'b1011;
	parameter [3:0] pressurizationState = 4'b1100, 
						 depressurizationState = 4'b1101;
	parameter [3:0] checkingPressureAndPerson = 4'b0000, 	
						 wait5Minutes = 4'b0011;
						 
	parameter [3:0] innerDooClosedLow = 4'b1110;

	parameter [3:0] bufferState = 4'b1111;
	
	
	
	
	always@(posedge clk) begin
	// Following if statement checks to see if the user has 
	// pressed the reset key, which is key 0. 
		if (nReset) begin 
				ps <= everythingClosedLow;
				resetLeds [3:0] <= everythingClosedLow;
				innerDoor <= 1'b0;
				outerDoor <= 1'b0;
				draining <= 0;
				filling <= 0;
		end else begin
			case (ps)
			   // The following state makes sure if the interlock is empty or not 
				// It checks if the pressure is already high in the chamber
				// or if there is already a person in there 
				checkingPressureAndPerson: begin
					if (!personCheck && !pressureCheck && !bathLeaving) begin
						ps <= pressurizationState;
						innerDoor <= 1'b0;
						outerDoor <= 1'b0;
						resetLeds <= pressurizationState;
					end
					else if (bathLeaving && !pressureCheck && !personCheck)
					begin 
					       ps <=innerDoorOpen ;
							 resetLeds <= innerDoorOpen; 
							 innerDoor <= 1'b1; 
					end 
					else if (pressureCheck && bathLeaving) 
					begin
					      ps <= depressurizationState ;
							resetLeds <= depressurizationState; 
							draining <= 1 ; 
							
					end 
					else if(!personCheck && pressureCheck)
					begin 
					     ps <= outerDoorOpen;
						  resetLeds <= outerDoorOpen;
						  outerDoor <= 1'b1; 
				   end 
					else if ( personCheck && !pressureCheck) 
					begin
				         ps <= innerDoorOpen;
						   resetLeds <= innerDoorOpen;
						   innerDoor <= 1'b1; 	
					end 
				end
				
				// The following state is the initial state that the interlock module 
				// goes into and then wait for either the arrival signal or departure signal
				// when either of those are activated the interlock module goes into the 
				// wait5 module where the 5 minute countdown begins. 
				everythingClosedLow: begin
					if (bathArriving) begin
							ps <= wait5Minutes;
							waiting <= 1'b1;
							resetLeds <= wait5Minutes;
					end else 
					if(bathLeaving) begin
							ps <= wait5Minutes;
							innerDoor <= 1'b0;
							outerDoor <=1'b0;
							waiting <= 1'b1;
							resetLeds <= wait5Minutes;
					end else 
					if (innerDoorSwitch) begin
						ps <= everythingClosedLow;
						innerDoor <= 1'b1;
						resetLeds <= everythingClosedLow;
					end	
				end
				
				// This is the state when the interlock is depressurizzed and the inner 
				// door is closed 
				innerDooClosedLow: begin 
					if (!innerDoorSwitch) begin
						innerDoor <=1'b1; 
						ps <= innerDooClosedLow;
						resetLeds <= innerDooClosedLow;
					end else 
					if (innerDoorSwitch) begin 
						innerDoor <= 1'b1;
						ps <= innerDoorOpen;
						resetLeds <= innerDoorOpen;
					end 
					end  
				
				// The interlock module arrives in this state when the chamber is pressurized
				// and the outer door is closed, as well as the inner door. 
				everythingClosedHigh: begin
					if (bathArriving && !outerDoor) begin
						ps <= outerDoorOpen;
						outerDoor <= 1'b1;
						resetLeds <= outerDoorOpen;
					end 
					else if (bathLeaving) begin
						ps <= outerDoorOpen;
						outerDoor <= 1'b1;
						resetLeds <= outerDoorOpen;
					end
				end
				
				// The onterlock module arrives in this state when the interlock is 
				// pressurized and the outer door is open 
				openOuterDoor: begin
					if (outerDoorSwitch) begin
						ps <= openOuterDoor;
						outerDoor <= 1'b1;
						resetLeds <= openOuterDoor;
					end else if (!outerDoorSwitch) begin 
						outerDoor <= 1'b0;
						ps <= outerDoorClose;
						resetLeds <= outerDoorClose;
					end
				end
				
				// The inter lock comes to this module if the innerDoor is opened 
				openInnerDoor: begin
					if (!bathLeaving) begin
						ps <= innerDoorClose;
						innerDoor <= 1'b0;
						resetLeds <= innerDoorClose;
					end
				end
				
				//The interlock goes to this state if the bathysphere is arriving and 
				// the outer door is not open or if the bathysphere is about to depart.
				outerDoorOpen: begin
					if (outerDoorSwitch && !personCheck) begin
						ps <= openOuterDoor;
						resetLeds <= openOuterDoor;
					end
				end
				
				// The interlock arrives to this module after the outer door is open and 
				// stays in here until the outer door is closed then it goes to depressurization
				// state 
				outerDoorClose: begin
					if (!outerDoorSwitch && !personCheck) begin
						ps <= depressurizationState;
						draining <= 1'b1;
						resetLeds <= depressurizationState;
					end
				end
				
				// The interlock arrives in this state after the inner door is open 
				// and stays in here until the inner door is closed. 
				innerDoorOpen: begin
					if (!innerDoorSwitch) begin
						ps <= innerDoorOpen;
						innerDoor = 1'b1;
						resetLeds = innerDoorOpen;
					end 
					else if (innerDoorSwitch)
					begin
					     ps<= innerDoorClose;
						  innerDoor <= 1'b1; 
						  resetLeds <= innerDoorClose;
					end 
				end
				
				// Arrives in this state after the inner door is open and then closed 
				innerDoorClose: begin
				        if (!innerDoorSwitch && bathLeaving && !bathArriving) 
						  begin
						        ps <= pressurizationState;
								  resetLeds <= pressurizationState;
								  innerDoor <= 1'b0;  
						  end 
						  else if (!innerDoorSwitch && bathArriving && !bathLeaving)
						  begin
									ps <= pressurizationState;
									resetLeds <= pressurizationState; 
								   innerDoor <= 1'b0;
						  end
					else if (!innerDoorSwitch && !personCheck) begin
						ps <= bufferState;
						innerDoor <= 1'b0;
						resetLeds <= bufferState;
					end
				end
				// this is the state where depressurization is activated 
				depressurizationState: begin
					if (drainFinished) begin
						ps <= innerDooClosedLow;
						draining <= 1'b0;
						resetLeds <= innerDooClosedLow;
					end
				end
				
				// This is the state where pressurization is activated 
				pressurizationState: begin	
					filling<=1'b1;
					if (fillFinished) begin
						ps <= everythingClosedHigh;
						filling <= 1'b0;
						resetLeds <= everythingClosedHigh;
					end
				end
				
				// This is the state where the timer for waiting 5 mminutes is activated 
				wait5Minutes: begin
					if (waitFinished) begin
					   if (bathArriving || bathLeaving) 
						begin
					        ps <= checkingPressureAndPerson;
							  resetLeds<= checkingPressureAndPerson;  
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
						ps <= everythingClosedLow;
						resetLeds <= everythingClosedLow;
					end 
				end 
				
				default: resetLeds [3:0] <= 4'b0001;
				
			endcase
		end
	end

endmodule

