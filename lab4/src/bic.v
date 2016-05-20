module bic(out, en, sample);
	output [3:0] out;
	input [3:0] sample;
	input en;
	
	
	assign out = (en) ? 4'b000 : ((sample =0 4'b0111) ? something : something else);


endmodule