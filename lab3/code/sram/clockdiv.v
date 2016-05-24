/*
Author:  Katie Neff
Title: 	 clockdiv
Summary: This divides the clock to slow it down. divided_clocks[0] = 25MHz, 
		 [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ... 
*/

module clockdiv(outclk, inclk);
    output outclk;
	 input inclk;
	 reg [25:0] ticks;
	 always @(posedge inclk)
	     ticks = ticks + 1'b1;
    assign outclk = ticks[24];
endmodule
