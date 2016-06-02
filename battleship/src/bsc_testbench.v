`include "bsc.v"
`include "dflipflop.v"
`include "up_counter.v"


module testbench;
	wire [3:0] out;
	wire [3:0] bitNum;
	wire en, clk, rst;


	bsc bsc(out, bitNum, en, clk, rst);
	
	tester tester(out, bitNum, en, clk, rst);
	
	initial begin 
		$dumpfile("bsc.vcd"); 
		$dumpvars; 
	end  
	
endmodule



module tester(out, bitNum, en, clk, rst);
	output reg clk, rst;
	output reg en;
	input [3:0] out, bitNum;
	
	
	parameter stimDelay = 20;
	
	
	integer i;
	initial begin
	
		#stimDelay;
		#stimDelay; clk = 0; en = 0; rst = 0;
		#stimDelay; clk = 1;
		
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1;	rst = 1;
		
		
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1;
		
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1;
		
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1; en = 1;
		
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1; en = 1;
		
		
		for (i = 0; i < 500; i = i + 1) begin
		
			#stimDelay; clk = 0; 
			#stimDelay; clk = 1;
		
		end
	
	end
	
endmodule
