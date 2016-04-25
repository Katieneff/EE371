module display (pressure, val, num, letter , enable); 
 input pressure , enable; 
 input[3:0] val;
 output reg [6:0] num, letter; 
 
 always @(*) 
	if(!enable)
	begin
		num = ~7'b0000000;
	end
	else
	begin
		case (val) 
			// Light: 6543210 
			0: num = ~7'b0111111; 
			1: num = ~7'b0000110; 
			2: num = ~7'b1011011; 
			3: num = ~7'b1001111; 
			4: num = ~7'b1100110; 
			5: num = ~7'b1101101; 
			6: num = ~7'b1111101; 
			7: num = ~7'b0000111; 
			8: num = ~7'b1111111; 
			default: num = 7'bX; 
		endcase 
	end
 always @(*)
	if(!enable)
	begin
		num = ~7'b0000000;
	end
	else
	begin 
		case (pressure)
			0: letter = ~7'b0111111;
			1: letter = ~7'b1110001; 
			default: letter = 7'bX;
		endcase
	end
endmodule 

module depressureTimer(clk, letter1, num1 , drainStarting , drainFinish);
	input clk , drainFinish , drainStarting;
	output reg [6:0] letter1, num1;
	reg[3:0] val;
	
	
	wire nFin;
	assign nFin = !drainFinish;
	
	display disp(.pressure(1'b1), .val(val) , .num(num1), .letter(letter1) , .enable(nFin));

	always@(posedge clk) 
	begin
		if(!drainFinish && drainStarting) 
		begin		
			val <= 4'b1000;
			//drainStarting <= 0;
		end
		else if(val == 3'b000)
		begin
			//drainFinish <= 1'b1;
		end
		else if (!drainFinish)
		begin
			val <= val - 1;
		end

	end
	
	/*
	initial val = 8;
	initial out = 0;
	
	
	always @(posedge  clk) begin: disable_counter
		if (val == 0) begin
			out <= 1;
			disable disable_counter;
		end
		else begin
			val <= val - 1;
		end
	end
	*/
	
	
endmodule

module pressureTimer(clk, letter, num , fillFinish , fillStarting);
	input clk , fillFinish , fillStarting;
	output reg [6:0] letter, num;
	reg[3:0] val;
	
	wire nFin;
	assign nFin = !fillFinish;
	
	
	display disp(.pressure(1'b1), .val(val), .num(val), .letter(letter) , .enable(nFin));
	
	always@(posedge clk) 
	begin
		if(fillFinish && fillStarting) 
		begin		
			val <= 4'b0111;
			//starting <= 0;
		end
		else if(val == 3'b000)
		begin
			//fillFinish <= 1'b1;
		end
		else if (!fillFinish)
		begin
			val <= val -1;
		end


	end
	
	/*
	initial val = 7;
	initial out = 0;
	
	
	always @(posedge  clk) begin: disable_counter
		if (val == 0) begin
			out <= 1;
			disable disable_counter;
		end
		else begin
			val <= val - 1;
		end
	end
	*/
	
endmodule

//module segInput (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY); 
// output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
// output [9:0] LEDR; 
// input [3:0] KEY; 
// module display (pressure, val, num, letter); 
// display asdf ();
// display qwer ();
// 
//endmodule


module Part1_Testbench(); 
  
   parameter ClockDelay = 5000;
	reg clk;
	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end
	
	wire out;
	wire[6:0] letter, num;
	
	//depressureTimer dut(.clk, .out, .letter, .num);
	initial begin
		#(15*ClockDelay);
	$stop;
	end

endmodule 