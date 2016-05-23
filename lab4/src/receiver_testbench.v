`include "serial_to_parallel.v"
`include "bic.v"
`include "bsc.v"
`include "start_bit_detect.v"
`include "receiver.v"

module testbench;

	wire [7:0] data_out;
	wire character_received;
	wire data_in;
	wire clk, rst;

	
	receiver receiver(data_out, character_received, data_in, clk, rst);
	tester tester(data_out, character_received, data_in, clk, rst);
	
	
	initial begin 
		$dumpfile("receiver.vcd"); 
		$dumpvars; 
	end  

endmodule



module tester(data_out, character_received, data_in, clk, rst);
	input [7:0] data_out;
	input character_received;
	output reg data_in;
	output reg clk, rst;
	
	parameter stimDelay = 20;
	
	reg [31:0] serialData = 32'b01110100011001010111001101110100;
	
	integer i, j;
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
			data_in = serialData[0];
			
			for (j = 0; j < 16; j = j + 1) begin
				#stimDelay; clk = 1; 
				#stimDelay; clk = 0; 
			end
			
			serialData = serialData >> 1;

		end
		
	
	end

endmodule
