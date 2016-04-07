`include "dflipflop.v"

module counter(out, clk, rst)
	output [3:0] out;
	input clk, reset;
	wire [3:0] qbar;
	
	DFlipFlop dff0(out[0], qbar[0], qbar[0], clk, rst);
	DFlipFlop dff1(out[1], qbar[1], qbar[1], out[0], rst);
	DFlipFlop dff1(out[2], qbar[1], qbar[1], out[1], rst);
	DFlipFlop dff1(out[3], qbar[1], qbar[1], out[2], rst);
	
endmodule;