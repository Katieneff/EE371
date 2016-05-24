// Clocked by major clock

module start_bit_detect(en, data, clk, rst);
	output reg en;
	input data;
	input clk, rst;
	
	reg [3:0] counter;
	
	reg state;
	
	parameter OP_NOP = 1'b0;
	parameter OP_COUNTING = 1'b1;
	
	always @(posedge clk) begin
		if (!rst) begin
			en = 0;
			counter = 0;
			state = 0;
		end else begin
			case (state)
				OP_NOP: begin
					en = 0;
					counter = 0;
					if (data) state = OP_COUNTING;
				end
				
				OP_COUNTING: begin
					en = 1;
					counter = counter + 1;
					if (counter == 10) state = OP_NOP;
				end
			
			
			endcase
		end
		
	
	end

endmodule
