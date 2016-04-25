`include "DE1_SoC.v"
`include "timer.v"
`include "display.v"
`include "interlock.v"



module DE1_Top;

	wire [9:0] SW , LEDR;
	wire [3:0] KEY;
	wire [6:0] HEX0 , HEX1;
	wire CLK;
	
	DE1_SoC DE1board (.LEDR(LEDR) , .CLK(CLK) , .SW(SW) , .KEY(KEY) , .HEX0(HEX0) , .HEX1(HEX1));
	
	tester DE1Test (.clk(CLK) , .key(KEY) , .sw(SW) , .led(LEDR));

	initial begin 
		$dumpfile("de1_top.vcd"); 
		$dumpvars(1, DE1board); 
	end   
	endmodule
	



module tester(clk , key , sw , led);

	output reg clk;
	output reg [3:0] key;
	output reg [9:0] sw;
	input [9:0] led;

		parameter stimDelay = 20;
	
	initial // Response
	begin
		$display("\t\t clk \t key \t sw \t\t led \t\t\t\t Time");
		$monitor("\t\t %b\t %b\t %b\t %b\t" , clk , key , sw , led , $time);
		
	end
	
	initial //Stimulus
	
	begin
		sw = 9'b0; key[3:0] = 4'b0; clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay 
		#stimDelay clk = 1'b0;
		#stimDelay key[0] = 1'b1;
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay sw[0] = 1;
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay key[0] = 1'b0 ; sw[0] = 0;
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay key[0] = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay 
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay sw[1] = 1'b1;
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay 
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay clk = 1'b1;
		#stimDelay
		#stimDelay clk = 1'b0;
		#stimDelay
		#stimDelay
	$finish;
	
	end


endmodule
