module bic(out, en, sample, clk);
	output [3:0] out;
	input [3:0] sample;
	input en, clk;
	
	
	reg [3:0] bitCounter;
	
	initial begin
		out = 0;
		bitCounter = 0;
	end
	
	always @(posedge clk) begin
	
		if (sample == 4'b1111) begin
			bitCounter = bitCounter + 1;
		
		end
	
	end


endmodule