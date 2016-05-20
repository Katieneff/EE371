module bsc(out, en);
	output [3:0] out;
	intput en;
	
	
	reg [3:0] counter; 
	reg [3:0] bitNum;
	
	initial begin
		counter = 0;
		bitNum = 0;
	end
	
	always @(*) begin
		if (en) begin
			counter = 0;
			bitNum = 0;
			out = 4'b0000;
		end else begin
			counter = counter + 1;
			
			if (counter < 8) begin
				out = 4'b0000;
			end
			else if (counter == 8) begin
				out = 4'b0111;
			end
			else if (counter > 8) begin
				out = 4'b1111;
			end
			
			if (counter == 16) begin
				bitNum = bitNum + 1;
			end
			
			
		
		
		
		end
	
	
	
	
	
	end
	
	




endmodule