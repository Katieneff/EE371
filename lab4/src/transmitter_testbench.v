`include "transmitter.v"
`include "parallel_to_serial.v"
`include "bsc.v"
`include "bic.v"



module testbench;

	wire data_out;
	wire character_sent;
	wire [7:0] data_in;
	wire load;
	wire transmit_enable;
	wire clk, rst;

	transmitter transmitter(data_out, character_sent, data_in, load, transmit_enable, clk, rst);
	tester tester(data_out, character_sent, data_in, load, transmit_enable, clk, rst);

	initial begin
		$dumpfile("transmitter.vcd");
		$dumpvars;
	end
endmodule

module tester(data_out, character_sent, data_in, load, transmit_enable, clk, rst);
	input data_out;
	input character_sent;
	output reg [7:0] data_in;
	output reg load, transmit_enable, clk, rst;

	parameter stimDelay = 20;

	integer i, j;

	initial begin

		#stimDelay;
		#stimDelay; clk = 1; rst = 0;
		#stimDelay; clk = 0;
		#stimDelay; clk = 1; rst = 1;
		#stimDelay; clk = 0;

		#stimDelay; clk = 1; transmit_enable = 1; data_in = 8'b10011011;
		#stimDelay; clk = 0;

		
		#stimDelay; clk = 1; load = 1;
		#stimDelay; clk = 0;

		#stimDelay; clk = 1; load = 0;
		#stimDelay; clk = 0;


		for (i = 0; i < 300; i = i + 1) begin
			load = 1; transmit_enable = 1;
			#stimDelay; load = 0; transmit_enable = 0;
			for (j = 0; j < 16; j = j + 1) begin
				#stimDelay; clk = 1;
				#stimDelay; clk = 0;

			end	
		end

	end


endmodule
