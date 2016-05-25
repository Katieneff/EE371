module bic(out, en, in, rst);
	output out;
	input [3:0] in;
	input en, rst;
	
	
	wire [3:0] bitCounterOut;
	wire bitRst;
	wire bitClk;

	up_counter bitCounter(bitCounterOut, bitClk, bitRst);
	
	assign bitClk = (in == 4'b0111) ? 1'b1 : 1'b0; 
	assign out = ((bitCounterOut == 4'b0111) && (in == 4'b1111)) ? 1'b1 : 1'b0;
	
	assign bitRst = (bitCounterOut == 9 || !en) ? 1'b0 : rst;
	
endmodule
