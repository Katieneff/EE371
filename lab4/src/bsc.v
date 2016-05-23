module bsc(out, en, clk, rst);
	output reg [3:0] out;
	input en, clk, rst;
	
	reg [4:0] counter; 
	reg [4:0] bitNum;
	reg countingFlag;
	
	
	always @(posedge clk) begin
		if (!rst) begin
			counter = 0;
			bitNum = 0;
			countingFlag = 0;
		end else 
		if (countingFlag) begin
			counter = counter + 1;
			
			if (counter == 16) begin
				bitNum = bitNum + 1;
				counter = 0;
			end	
			
			
			if (bitNum == 10) begin
				countingFlag = 0;
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
				countingFlag = 1;
				bitNum = 0;
				counter = 0;
				out = 4'b0000;
			end
		end
	end
endmodule