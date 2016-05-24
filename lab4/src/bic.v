module bic(out, en, in, clk, rst);
	output out;
	input [3:0] in;
	input en, clk, rst;

	assign out = (in == 4'b1001 && en) ? 1'b1 : 1'b0;
	
endmodule
