

module DE1_SoC (CLOCK_50 , LEDR , SW , HEX0 , HEX1 , HEX2 , HEX3, KEY);
	input [3:0] KEY;
	input [9:0] SW;
	input CLOCK_50;
	
	output [6:0] HEX0 , HEX1 , HEX2 , HEX3;
	output [9:0] LEDR;
	
	wire fillFinish , fillStarting , drainFinish , drainStarting;
	wire [6:0] letter , num , letter1 , num1;
	
	
	/*assign HEX1 = letter;
	assign HEX0 = num;
	assign HEX3 = letter1;
	assign HEX2 = num1;*/
	
	assign LEDR[1:0] = SW[1:0];
	
	reg [25:0] tBase;
	always@(posedge CLOCK_50) begin
		tBase <= tBase + 1'b1;
	end

	interlock inter (.fillFinish(fillFinish) , .fillStarting(fillStarting) , .drainFinish(drainFinish) , 
							.drainStarting(drainStarting) , .innerDoor(LEDR[3]) , .outerDoor(LEDR[2]) , .resetLeds(LEDR[7:4]) , 
							.bathLeaving(SW[1]) , .bathArriving(SW[0]) , .personCheck(SW[9]) , .pressureCheck(SW[8]) , 
							.innerDoorSwitch(SW[3]) , .outerDoorSwitch(SW[2]) , .clk(tBase[25]) , .reset(KEY[0]) ,
							.drain(KEY[2]) , .fill(KEY[1]));


	//depressureTimer drainTime(.letter , .num ,.clk(tBase[25]) , .drainFinish , .drainStarting);
	
	
	//pressureTimer fillTime(.letter1 , .num1 ,.clk(tBase[25]) , .fillFinish , .fillStarting);


endmodule


