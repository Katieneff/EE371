module clockdiv(outclk, inclk);
    output outclk;
	 input inclk;
	 reg [25:0] ticks;
	 always @(posedge inclk)
	     ticks = ticks + 1'b1;
    assign outclk = ticks[24];
endmodule