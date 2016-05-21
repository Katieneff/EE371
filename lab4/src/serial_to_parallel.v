module serial_to_parallel(out, sample, data, clk);
	output [7:0] out;
	input [3:0] sample;
	input data;
	
	
	reg [2:0] bitCounter;
	
	always @(posedge clk) begin
		if (sample == 4'b0111) begin
			out[bitCounter] = data;
			bitCounter = bitCounter + 1;
		end
	end
	
	
endmodule
	
	
	
	