
module interlock(innerDoor , outerDoor , resetLeds , fillStarting , fillFinish , drainStarting , drainFinish ,
					bathLeaving , bathArriving , personCheck , pressureCheck , drain , 
					fill , innerDoorSwitch , outerDoorSwitch , clk , reset);
	input bathLeaving, bathArriving , personCheck , pressureCheck , drain , fill;
	input innerDoorSwitch , outerDoorSwitch  , clk , reset;
	output reg innerDoor , outerDoor;
	output reg [3:0] resetLeds;
	output reg fillStarting , fillFinish , drainStarting , drainFinish;
	
	
	reg [3:0] ps;

	wire nReset;

	parameter [3:0] closedLow = 4'b0100 , closedHigh = 4'b0101;
	parameter [3:0] outerOpen = 4'b0110 , innerOpen = 4'b0111;
	parameter [3:0] swChkOutOpen = 4'b1000, swChkOutClose = 4'b1001;
	parameter [3:0] swChkInOpen = 4'b1010 , swChkInClose = 4'b1011;
	parameter [3:0] timerFill = 4'b1100 , timerDrain = 4'b1101;
	parameter [3:0] resetting = 4'b0000 , pressureStatus = 4'b0001;
	parameter [3:0] doorStatus = 4'b0010;
	
	
	not resetNot (nReset , reset);
	
	always@(posedge clk)
		if(nReset)
			begin
				ps <= resetting;
				resetLeds [3:0] <= 4'b1111;
				innerDoor <= 1'b1;
				outerDoor <= 1'b1;
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
						resetLeds [3:0] <= 4'b0000;
					end
				end
				
				doorStatus:
				begin
					if(!outerDoorSwitch && !innerDoorSwitch)
					begin
						ps <= pressureCheck;
					end
				
				end
				
				pressureStatus:
				begin
					if(!pressureCheck)
					begin
						ps <= closedLow;
					end
					else
					begin
						ps <= timerDrain;
						
					end
				
				end
				
				closedLow:
				begin
				if(bathArriving)	
					begin
						ps <= timerFill;
					end
					else if(bathLeaving)
					begin
						ps <= swChkInOpen;
						innerDoor <= 1'b1;
					end
				end
				
				closedHigh:
				begin
					if(bathArriving)
					begin
						ps <= swChkOutOpen;
						outerDoor <= 1'b1;
					end
					else if(!bathArriving)
					begin
						ps <= timerDrain;
						drainFinish <= 1'b0;
					end
				end
				
				outerOpen:
				begin
					if(!bathArriving)
					begin
						ps <= swChkOutClose;
						outerDoor <= 1'b0;
					end
				end
				
				innerOpen:
				begin
					if(!bathLeaving)
					begin
						ps <= swChkInClose;
						innerDoor <= 1'b0;
					end
				end
				
				swChkOutOpen:
				begin
					if(outerDoorSwitch)
					begin
						ps <= outerOpen;
					end
				end
				
				swChkOutClose:
				begin
					if(!outerDoorSwitch)
					begin
						ps <= closedHigh;
					end
				
				end
				
				swChkInOpen:
				begin
					if(innerDoorSwitch)
					begin
						ps <= innerOpen;
					end
				
				end
				
				swChkInClose:
				begin
					if(!innerDoorSwitch)
					begin
						ps <= closedLow;
					end
				end
				
				default:
				begin
				
				end
			endcase
		end

endmodule

