module bsc(out, bitNum, en, minorClk, majorClk, rst);
	output [3:0] out;
	output [3:0] bitNum;
	input en, minorClk, majorClk, rst;
	
	wire [3:0] clockCounterOut; 
	wire [3:0] bitCounterOut;
	wire bitRst;
	
	up_counter clockCounter(clockCounterOut, minorClk, clockRst);
	
	up_counter bitCounter(bitCounterOut, majorClk, bitRst);
	
	assign out = clockCounterOut;
	assign bitNum = bitCounterOut;
	
	assign bitRst = (bitCounterOut == 10 || !en) ? 1'b0 : rst;
	assign clockRst = (en) ? rst : 1'b0;
	
	
endmodule
