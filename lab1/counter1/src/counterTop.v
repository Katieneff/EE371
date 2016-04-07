`include "counter.v"

module testBench;
	
	wire [3:0] out;
	wire clk, rst;
	
	counter myCounter(out[3:0], clk, rst);
	Tester aTester();


	initial 
	begin
		$dumpfile("counter.vcd");
		$dumpvars(1, myCounter);
	end
	
	
endmodule



module Tester(out, clk, rst);
	input [3:0] out;
	output reg clk, rst;
	
	parameter stimDelay = 20;
	
	initial
	begin	
		$display("\t\t bits \t clk \t rst");
		$monitor("\t\t %b\t %b\t %b", out, reset, clk)

endmodule
