`include "bsc.v"
`include "transmit_enable.v"


module testbench;
	wire [3:0] out;
	wire en, clk;


	bsc bsc(out, en, clk);
	
	tester tester(out, en, clk);
	
	initial begin 
		$dumpfile("bsc.vcd"); 
		$dumpvars; 
	end  
	
endmodule



module tester(out, en, clk);
	output reg clk;
	output reg en;
	input [3:0] out;
	
	
	parameter stimDelay = 20;
	
	
	integer i;
	initial begin
	
		#stimDelay;
		#stimDelay; clk = 0; en = 0;
		#stimDelay; clk = 1;
		
		#stimDelay; clk = 0; 
		#stimDelay; clk = 1;
		
		
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