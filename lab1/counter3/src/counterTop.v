module testBench;
	
	wire [3:0] out;
	wire clk, rst;
	
	counter myCounter(out[3:0], clk, rst);
	Tester aTester(out[3:0], clk, rst);


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
