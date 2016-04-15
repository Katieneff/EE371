/*
Author:  Katie Neff
Title: 	 counter
Summary: 4-bit ripple down counter with active low reset
		 that uses gate model logic.
*/

module counter(out, clk, rst);
	output [3:0] out;
	input clk, rst;
	wire [3:0] qbar;
	
	// D flip-flops connected in such a way that emulates the
	// 4-bit ripple down counter
	DFlipFlop dff0(out[0], qbar[0], qbar[0], clk, rst);
	DFlipFlop dff1(out[1], qbar[1], qbar[1], out[0], rst);
	DFlipFlop dff2(out[2], qbar[2], qbar[2], out[1], rst);
	DFlipFlop dff3(out[3], qbar[3], qbar[3], out[2], rst);
	
endmodule