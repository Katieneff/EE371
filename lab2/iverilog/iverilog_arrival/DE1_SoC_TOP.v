`include "main.v"
`include "timer.v"
`include "display.v"
`include "interlock.v"

module DE1_Top;

	wire [9:0] SW , LEDR;
	wire [3:0] KEY;
	wire [6:0] HEX0 , HEX1, HEX4, HEX5;
	wire CLOCK_50, wait_var, finished_var;
	
	main DE1board (.CLOCK_50(CLOCK_50),
				   .LEDR(LEDR),
				   .SW(SW),
				   .KEY(KEY),
				   .HEX0(HEX0),
				   .HEX1(HEX1),
				   .HEX4(HEX4),
				   .HEX5(HEX5),
				   .wait_var(wait_var),
				   .finished_var(finished_var)
				   );
	
	tester DE1Test (.clk(CLOCK_50),
					.key(KEY),
					.sw(SW),
					.led(LEDR),
					.wait_var(wait_var),
					.finished_var(finished_var)
					);

	initial begin 
		$dumpfile("de1_top.vcd"); 
		$dumpvars(1, DE1board); 
	end   
	endmodule
	



module tester(clk, key, sw, led, wait_var, finished_var);

	output reg clk;
	output reg [3:0] key;
	output reg [9:0] sw;
	input [9:0] led;
	//input [6:0] HEX0;
	input wait_var, finished_var;
	
		parameter stimDelay = 10;
	
	initial // Response
	begin
		$display("\t clk \t key \t sw \t\t led \t\t Time");
		$monitor("\t %b \t %b \t %b \t %b \t %g" , clk, key, sw, led, $time);
		
	end
	
	initial //Stimulus
	
	begin
		//#stimDelay;
		//#stimDelay;
		sw = 9'b0; key[3:0] = 4'b1111; clk = 1'b0;
		#stimDelay;
		#stimDelay clk = 1'b1; key[0] = 0;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1; key[0] = 1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1; sw[0] = 1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay;
		#stimDelay clk = 1'b1;
		//#stimDelay key[0] = 1'b0 ; sw[0] = 0;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		//#stimDelay key[0] = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		//#stimDelay sw[1] = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1; key[1] = 0;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1; key[1] = 1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1; sw[2] = 1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1; sw[2] = 0;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1; key[2] = 0;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay clk = 1'b1;
		#stimDelay clk = 1'b0;
		
	$finish;
	
	end


endmodule
