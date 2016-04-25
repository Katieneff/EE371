
module interlock(filling , draining , innerDoor , outerDoor , resetLeds , 
					bathLeaving , bathArriving , personCheck , pressureCheck , drain , 
					fill , innerDoorSwitch , outerDoorSwitch , clk , reset , drainFinished , 
					fillFinished , waitFinished , waiting);
	
	input bathLeaving, bathArriving , personCheck , pressureCheck , drain , fill;
	input innerDoorSwitch , outerDoorSwitch  , clk , reset;
	input waitFinished , drainFinished , fillFinished;
	output reg innerDoor , outerDoor;
	output reg [3:0] resetLeds;
	output reg filling , draining , waiting;
	
	reg [3:0] ps;

	wire nReset;

	parameter [3:0] closedLow = 4'b0100 , closedHigh = 4'b0101;
	parameter [3:0] outerOpen = 4'b0110 , innerOpen = 4'b0111;
	parameter [3:0] swChkOutOpen = 4'b1000, swChkOutClose = 4'b1001;
	parameter [3:0] swChkInOpen = 4'b1010 , swChkInClose = 4'b1011;
	parameter [3:0] timerFill = 4'b1100 , timerDrain = 4'b1101;
	parameter [3:0] resetting = 4'b0000 , pressureStatus = 4'b0001;
	parameter [3:0] doorStatus = 4'b0010 , waiting5 = 4'b0011;
	
	
	not resetNot (nReset , reset);
	
	always@(posedge clk)
		if(nReset)
			begin
				ps <= resetting;
				resetLeds [3:0] <= 4'b1111;
				innerDoor <= 1'b1;
				outerDoor <= 1'b1;
				draining <= 0;
				filling <= 0;
			end
		else
		begin
	
			case(ps)
				resetting:
				begin
					if(!personCheck)
					begin
						ps <= doorStatus;
						innerDoor <= 1'b0;
						outerDoor <= 1'b0;
						//resetLeds [3:0] <= 4'b0000;
						resetLeds <= ~doorStatus;
					end
				end
				
				doorStatus:
				begin
					if(!outerDoorSwitch && !innerDoorSwitch)
					begin
						ps <= pressureStatus;
						resetLeds <= ~pressureStatus;
					end
				
				end
				
				pressureStatus:
				begin
					if(!pressureCheck)
					begin
						ps <= closedLow;
						resetLeds <= ~closedLow;
					end
					else
					begin
						ps <= timerDrain;
						draining <= 1;
						resetLeds <= ~timerDrain;
					end
				
				end
				
				closedLow:
				begin
				if(bathArriving)	
					begin
						ps <= timerFill;
						filling <= 1'b1;
						resetLeds <= ~timerFill;
					end
					else if(bathLeaving)
					begin
						ps <= waiting5;
						waiting <= 1'b1;
						//innerDoor <= 1'b1;
						resetLeds <= ~waiting5;
					end
				end
				
				closedHigh:
				begin
					if(bathArriving)
					begin
						ps <= swChkOutOpen;
						outerDoor <= 1'b1;
						resetLeds <= ~swChkOutOpen;
					end
					else if(!bathArriving)
					begin
						ps <= timerDrain;
						draining <= 1'b1;
						resetLeds <= ~timerDrain;
					end
				end
				
				outerOpen:
				begin
					if(!bathArriving)
					begin
						ps <= swChkOutClose;
						outerDoor <= 1'b0;
						resetLeds <= ~swChkOutClose;
					end
				end
				
				innerOpen:
				begin
					if(!bathLeaving)
					begin
						ps <= swChkInClose;
						innerDoor <= 1'b0;
						resetLeds <= ~swChkInClose;
					end
				end
				
				swChkOutOpen:
				begin
					if(outerDoorSwitch && !personCheck)
					begin
						ps <= outerOpen;
						resetLeds <= ~outerOpen;
					end
				end
				
				swChkOutClose:
				begin
					if(!outerDoorSwitch && !personCheck)
					begin
						ps <= closedHigh;
						resetLeds <= ~closedHigh;
					end
				
				end
				
				swChkInOpen:
				begin
					if(innerDoorSwitch && !personCheck)
					begin
						ps <= innerOpen;
						resetLeds <= ~innerOpen;
					end
				
				end
				
				swChkInClose:
				begin
					if(!innerDoorSwitch && !personCheck)
					begin
						ps <= closedLow;
						resetLeds <= ~closedLow;
					end
				end
				
				timerDrain:
				begin
					if(drainFinished)
					begin
						ps <= closedLow;
						draining <= 1'b0;
						resetLeds <= ~closedLow;
					end
				end
				
				timerFill:
				begin
					if(fillFinished)
					begin
						ps <= closedHigh;
						filling <= 1'b0;
						resetLeds <= ~closedHigh;
					end
				end
				
				waiting5:
				begin
					if(waitFinished)
					begin
						ps <= swChkInOpen;
						resetLeds <= ~swChkInOpen;
						innerDoor <= 1'b1;
						waiting <= 1'b0;
					end
				end
				
				default:
				begin
					resetLeds [3:0] <= 4'b0001;
				end
			endcase
		end

endmodule

