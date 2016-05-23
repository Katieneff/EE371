module bsc(out, bitNum, en, clk, rst);
	output [3:0] out;
	output reg [3:0] bitNum;
	input en, clk, rst;
	
	reg [3:0] counter; 
	reg state;

	parameter OP_RESET = 1'b0;
	parameter OP_COUNTING = 1'b1; 
	

	assign out = counter;
	
	always @(posedge clk) begin
		if (!rst) begin
			counter = 0;
			bitNum = 0;
			state = 0;
		end else begin
			case (state) 
				OP_RESET: begin
					counter = 0;
					bitNum = 0;
					if (en)
						state = OP_COUNTING; 
				end 
		
				OP_COUNTING: begin
					if (bitNum == 10)
						state = OP_RESET;

					counter = counter + 1;
					if (counter == 15)
						bitNum = bitNum + 1;
				end
			endcase
		end
	end
endmodule
