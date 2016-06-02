`include "serial_to_parallel.v"



module testbench;


	wire [7:0] out;
	wire [3:0] sample;
	wire data;
	wire clk;

	serial_to_parallel stp(out, sample, data, clk);
	tester tester(out, sample, data, clk);

	initial begin
		$dumpfile("serial_to_parallel.vcd");
		$dumpvars;
	end
endmodule



module tester(out, sample, data, clk);
	output reg [3:0] sample;
	output reg data, clk;
	input [7:0] out;

	parameter stimDelay = 20;

	initial begin
	
		#stimDelay;
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;


		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
		
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;

		#stimDelay; clk = 1; sample = 4'b0111; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 1;
		#stimDelay clk = 0;



		#stimDelay; clk = 1; sample = 0; data = 1;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 1;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 1;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 1;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 4'b0111; data = 1;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 4'b0111; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 4'b0111; data = 1;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 4'b0111; data = 0;
		#stimDelay clk = 0;
		#stimDelay; clk = 1; sample = 4'b0111; data = 1;
		#stimDelay clk = 0;


		#stimDelay; clk = 1; sample = 0; data = 0;
		#stimDelay clk = 0;
	end

endmodule
