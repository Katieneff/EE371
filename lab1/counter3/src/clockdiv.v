/*
Author:  Katie Neff
Title: 	 clockdiv
Summary: This divides the clock to slow it down. divided_clocks[0] = 25MHz, 
		 [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ... 
*/

module clock_divider (clk, divided_clocks);
	input clk; // Clock that is passed in
	output reg [31:0] divided_clocks; // Outputs a slower clock

	initial
	divided_clocks = 0;
 
	// Division logic
	always @(posedge clk)
		divided_clocks = divided_clocks + 1;
		
endmodule 


