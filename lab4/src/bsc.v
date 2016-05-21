module bsc(out, en, clk);
	output reg [3:0] out;
	input en, clk;
	
	reg [4:0] counter; 
	reg [4:0] bitNum;
	reg counteringFlag;
	
	
	initial begin
		counter = 0;
		bitNum = 0;
		counteringFlag = 0;
	end
	
	always @(posedge clk) begin
		if (counteringFlag) begin
			counter = counter + 1;
			
			if (counter == 16) begin
				bitNum = bitNum + 1;
				counter = 0;
			end	
			
			
			if (bitNum == 10) begin
				counteringFlag = 0;
			end
			
			if (counter < 7) begin
				out = 4'b0000;
			end else if (counter == 7) begin
				out = 4'b0111;
			end else if (counter > 7) begin
				out = 4'b1111;
			end
		end else begin
			if (en) begin
				counteringFlag = 1;
				bitNum = 0;
				counter = 0;
				out = 4'b0000;
			end
		end
	end
endmodule