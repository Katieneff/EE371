`include "up_counter.v"
`include "dflipflop.v"


module testbench;

	wire [3:0] out;
	wire clk, rst;

	
	up_counter up(out, clk, rst);
	tester tester(out, clk, rst);
	
	
	initial begin 
		$dumpfile("up_counter.vcd"); 
		$dumpvars; 
	end  

endmodule



module tester(out, clk, rst);
	input [3:0] out;
	output reg clk, rst;
	
	parameter stimDelay = 20;
	
	
	integer i;
	initial begin
	
		#stimDelay; 
		
		// Test reset (4 clock cycles)
		#stimDelay; clk = 1; rst = 0;
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1;
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1; 
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1;
		#stimDelay; clk = 0; 
		
		
		#stimDelay; clk = 1; rst = 1;
		#stimDelay; clk = 0;
		
		for (i = 0; i < 32; i = i + 1) begin
			#stimDelay; clk = 1; 
			#stimDelay; clk = 0; 
		end
		
		#stimDelay; clk = 1; rst = 0;
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1; rst = 1;
		#stimDelay; clk = 0; 
		
		for (i = 0; i < 32; i = i + 1) begin
			#stimDelay; clk = 1; 
			#stimDelay; clk = 0; 
		end
		
		
	end

endmodule
