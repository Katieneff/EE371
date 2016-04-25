

module DE1_SoC (CLK, LEDR , SW , HEX0 , HEX1 , KEY);
	
	input [3:0] KEY;
	input [9:0] SW;
	input CLK;
	
	output [6:0] HEX0 , HEX1;
	output [9:0] LEDR;
	
	wire filling , draining , fillFinished , drainFinished , waiting , waitFinished;
	wire [3:0] drainVal , fillVal , waitVal;
	wire [6:0] letter , number;
	
	assign HEX1 = letter;
	assign HEX0 = number;

	assign LEDR[9] = SW[9];
	assign LEDR[8] = SW[8];	
	assign LEDR[1:0] = SW[1:0];
	
	

	interlock inter (.draining(draining) , .filling(filling) , .innerDoor(LEDR[3]) , .outerDoor(LEDR[2]) , 
							.resetLeds(LEDR[7:4]) , .bathLeaving(SW[1]) , .bathArriving(SW[0]) , .personCheck(SW[9]) ,
							.pressureCheck(SW[8]) , .innerDoorSwitch(SW[3]) , .outerDoorSwitch(SW[2]) , 
							.clk(CLK) , .reset(KEY[0]) , .drain(KEY[2]) , .fill(KEY[1]) ,
							.fillFinished(fillFinished) , .drainFinished(drainFinished) ,
							.waiting(waiting) , .waitFinished(waitFinished));

	display disp (.letter(letter) , .num(number) , .clk(CLK) , .drainVal(drainVal) , .fillVal(fillVal) ,
						.draining(draining) , .filling(filling) , .waiting(waiting) , .waitVal(waitVal));
	
	timer pressureize(.val(fillVal) , .finished(fillFinished) , .clk(CLK) , .startingVal(4'b0111) , .change(!KEY[1]) , .start(filling));
	
	timer depressurize(.val(drainVal) , .finished(drainFinished) , .clk(CLK) , .startingVal(4'b1000) , .change(!KEY[2]) , .start(draining));

	timer waiting5Sec(.val(waitVal) , .finished(waitFinished) , .clk(CLK) , .startingVal(4'b0101) , .change(1'b1) , .start(waiting));

endmodule


