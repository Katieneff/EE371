module bsc(out, en, minorClk, rst);
	output [3:0] out;
	input en, minorClk, rst;
	wire clockRst;
	
	wire [3:0] clockCounterOut; 
	
	up_counter clockCounter(clockCounterOut, minorClk, clockRst);
	
	assign out = clockCounterOut;
	assign clockRst = (en) ? rst : 1'b0;
	
endmodule
