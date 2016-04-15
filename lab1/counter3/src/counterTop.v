/*
Author:  Katie Neff
Title: 	 testBench
Summary: Test bench module that drives the tests for a counter 
*/

module testBench;
	
	wire [3:0] out;
	wire clk, rst;
	
	// Declare an instance of the counter module
	counter myCounter(out[3:0], clk, rst);
	
	// Declare an instance of the Tester module
	Tester aTester(out[3:0], clk, rst);

	// File for gtkwave
	initial 
	begin
		$dumpfile("counter.vcd");
		$dumpvars(1, myCounter);
	end
	
	
endmodule


/*
Author:  Katie Neff
Title: 	 Tester
Summary: Testing module for the counter to show what it is counting.
*/

module Tester(out, clk, rst);
	input [3:0] out; // 4-bit data of the counter as input
	output reg clk, rst; // Clock and Reset for the counters
	
	parameter stimDelay = 20;
	
	initial
	begin	
		// Displays the data and labels for the counter
		$display("\t\t bits \t rst \t clk");
		$monitor("\t\t %b\t %b\t %b", out, rst, clk);
	end
	
	integer i;
	initial
	begin
		#stimDelay;
		rst = 'b0; clk = 'b0;
		#stimDelay clk = 'b1;
		#stimDelay clk = 'b0; rst = 'b1;
		
		// 4 iterations to test reset
		for (i = 0; i < 4; i = i + 1) begin
			#stimDelay clk = 'b1;
			#stimDelay clk = 'b0;
		end
		rst = 'b0;
		#stimDelay clk = 'b1;
		#stimDelay clk = 'b0;  rst = 'b1;
		
		// 16 iterations to test counter
		for (i=0; i < 16; i = i + 1) begin
			#stimDelay clk = 'b1;
			#stimDelay clk = 'b0;
		end
		
		#stimDelay clk = 'b1;
		#stimDelay clk = 'b0;
		
		#(2*stimDelay);
		$finish;
	end

endmodule
