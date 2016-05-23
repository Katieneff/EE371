module bic(out, en, in, clk, rst);
	output reg out;
	input [3:0] in;
	input en, clk, rst;


	reg state;
	
	parameter OP_NOP = 1'b0;
	parameter OP_COUNTING = 1'b1;
	
	always @(posedge clk) begin
		if (!rst) begin
			out = 0;
			state = 0;
		end else begin
			case (state)
				OP_NOP: begin
					out = 0;
					if (en)
						state = OP_COUNTING;
				end

				OP_COUNTING: begin
					if (in == 10) begin
						state = OP_NOP;
						out = 1;
					end
				end
			endcase
		end
	end
	
endmodule
