module bic(out, en, sample, clk, rst);
	output reg out;
	input [3:0] sample;
	input en, clk, rst;
	
	reg [3:0] bitCounter;
	reg counterFlag;
	
	always @(posedge clk) begin
		if (!rst) begin
			out = 0;
			bitCounter = 0;
			counterFlag = 0;
		end else begin
			// if (en && !counterFlag) begin
				// counterFlag = 1;
			// end
			
			// if (counterFlag && (sample == 4'b0111)) begin
				// bitCounter = bitCounter + 1;
				 // if (bitCounter == 10) begin
					// counterFlag = 0;
					// bitCounter = 0;
				// //	out = 1;
				// end else begin
				// //	out = 0;
				// end
			// end
			
			if (sample == 4'b0111) begin
			
			out <= 1;
			end else begin
				out <= 0;
			end
		end
	end
	
endmodule