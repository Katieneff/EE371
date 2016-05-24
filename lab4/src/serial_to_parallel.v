module serial_to_parallel(data_out, data_in, sample, clk, rst);
	output reg [7:0] data_out;
	input [3:0] sample;
	input data_in, clk, rst; 
	
	reg state;

	parameter OP_NOP = 1'b0;
	parameter OP_SAMPLING = 1'b1;



	always @(posedge clk) begin
		if (!rst) begin
			data_out = 8'b0;
			state = OP_NOP;
		end else begin

			case (state)

				OP_NOP: begin
					if (sample == 7)
						state = OP_SAMPLING;
				end

				OP_SAMPLING: begin
				    data_out[0] = data_in;
					data_out = data_out << 1;
					state = OP_NOP;

				end

			endcase
		end
	end
endmodule
	
	
	
	
