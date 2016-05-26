module parallel_to_serial(data_out, data_in, counter, load, clk, rst); 
	output reg data_out;
	input clk, rst, load; 
	input [7:0] data_in; 
	input [3:0] counter;
	
	reg [9:0] temp;
	
	 parameter OP_NOP = 1'b0;
	parameter OP_COUNTING = 1'b1;
	
	reg state;
	wire [9:0] temp_wire;
	
	
	assign temp_wire = temp;
	always @(*) begin
		if (!rst) begin
			data_out <= 0;
			state <= 0;
			temp <= 10'b0;
		end else begin
			case (state)
				OP_NOP: begin
					if (load == 1) begin
					
						temp <= {1'b1, data_in, 1'b0};
						state <= OP_COUNTING;
					end
				
				end
				
				OP_COUNTING: begin
					
					if (counter == 4'b1000) begin
						data_out <= temp[9];
						temp <= temp << 1;
					end
					
					//if (load) temp <= {1'b1, data_in, 1'b0};
					
				end
				
			endcase
		end
	end
	
	
	// reg [3:0] count;
	
	// parameter OP_NOP = 2'b00;
	// parameter OP_COUNTING = 2'b01;

	
	// always @(posedge clk) begin
		// if (!rst) begin 
	  		// temp <= 10'b1000000000; 
			// data_out <= 0;
			// state <= 0;
			// count <= 0;
		// end else begin
			// case (state)
			
				// OP_NOP : begin
					// if (load) begin 
						// temp[8:1] <= data_in;
						// state <= OP_COUNTING;
					// end
				// end
				
				// OP_COUNTING: begin
					// data_out <= temp[9];
					// temp <= temp << 1;
					// count <= count + 1;
					// if (count == 9) begin
						// state <= OP_NOP;
						// count <= 0;
					
					// end 
				// end
			// endcase
		// end
	// end		
endmodule 
