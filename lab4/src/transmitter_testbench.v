`include "transmitter.v"
`include "parallel_to_serial.v"
`include "bsc.v"
`include "bic.v"
`include "up_counter.v"
`include "dflipflop.v"

module testbench;

	wire data_out;
	wire character_sent;
	wire [7:0] data_in;
	wire load;
	wire transmit_enable;
	wire minorClk, majorClk, rst;

	transmitter transmitter(data_out, character_sent, data_in, load, transmit_enable, minorClk, majorClk, rst);
	tester tester(data_out, character_sent, data_in, load, transmit_enable, minorClk, majorClk, rst);

	initial begin
		$dumpfile("transmitter.vcd");
		$dumpvars;
	end
endmodule

module tester(data_out, character_sent, data_in, load, transmit_enable, minorClk, majorClk, rst);
	input data_out;
	input character_sent;
	output reg [7:0] data_in;
	output reg load, transmit_enable, minorClk, majorClk, rst;

	parameter stimDelay = 20;

	reg [7:0] data0 = 10'b01110100;
	reg [7:0] data1 = 10'b01100101;
	reg [7:0] data2 = 10'b01110011;
	reg [7:0] data3 = 10'b01110100;

	
	integer i, j;

	initial begin

		#stimDelay;

		for (i = 0; i < 2; i = i + 1) begin
			majorClk = 1; rst = 0;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay;
			end
			majorClk = 0;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay; 
			end
			rst = 1;
		end
		load = 1; data_in = data0; 
		majorClk = 1;  
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay;
		end
		majorClk = 0;
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay; 
		end
		load = 0;
		
		for (i = 0; i < 10; i = i + 1) begin
			majorClk = 1;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay;
			end
			majorClk = 0;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay; 
			end
		end
		load = 1; data_in = data1; 
		majorClk = 1;  
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay;
		end
		majorClk = 0;
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay; 
		end
		load = 0;
		
		for (i = 0; i < 10; i = i + 1) begin
			majorClk = 1;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay;
			end
			majorClk = 0;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay; 
			end
		end
		
		
		
		load = 1; data_in = data2; 
		majorClk = 1;  
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay;
		end
		majorClk = 0;
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay; 
		end
		load = 0;
		
		for (i = 0; i < 10; i = i + 1) begin
			majorClk = 1;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay;
			end
			majorClk = 0;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay; 
			end
		end
		
		
		load = 1; data_in = data3; 
		majorClk = 1;  
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay;
		end
		majorClk = 0;
		for (j = 0; j < 8; j = j + 1) begin
			minorClk = 1; 
			#stimDelay; minorClk = 0; #stimDelay; 
		end
		load = 0;
		
		for (i = 0; i < 10; i = i + 1) begin
			majorClk = 1;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay;
			end
			majorClk = 0;
			for (j = 0; j < 8; j = j + 1) begin
				minorClk = 1; 
				#stimDelay; minorClk = 0; #stimDelay; 
			end
		end
		
	end


endmodule
