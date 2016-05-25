`include "serial_to_parallel.v"
`include "bic.v"
`include "bsc.v"
`include "start_bit_detect.v"
`include "dflipflop.v"
`include "up_counter.v"
`include "receiver.v"

module testbench;
	wire [7:0] data_out;
	wire character_received;
	wire data_in;
	wire minorClk, majorClk, rst;

	receiver receiver(data_out, character_received, data_in, minorClk, majorClk, rst);
	tester tester(data_out, character_received, data_in, minorClk, majorClk, rst);
	
	initial begin 
		$dumpfile("receiver.vcd"); 
		$dumpvars; 
	end  

endmodule



module tester(data_out, character_received, data_in, minorClk, majorClk, rst);
	input [7:0] data_out;
	input character_received;
	output reg data_in;
	output reg minorClk, majorClk, rst;
	
	parameter stimDelay = 20;
	
	reg [39:0] serialData = 40'b000000010111010000000000101100101000000;
	
	integer i, j;
	initial begin
	
		#stimDelay; 
		// Test reset (4 clock cycles)
		#stimDelay; minorClk = 1; rst = 0;
		#stimDelay; minorClk = 0; 
		#stimDelay; minorClk = 1;
		#stimDelay; minorClk = 0; 
		#stimDelay; minorClk = 1; 
		#stimDelay; minorClk = 0; 
		#stimDelay; minorClk = 1; 
		#stimDelay; minorClk = 0; 
		#(8 * stimDelay); majorClk = 1;
		#(8 * stimDelay); majorClk = 0;
		rst = 1;
		
		
		for (i = 0; i < 40; i = i + 1) begin
			majorClk = 1; data_in = serialData[39];
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay;
			end
			majorClk = 0;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay; 
			end
			serialData = serialData << 1; 
		end
	end
endmodule
