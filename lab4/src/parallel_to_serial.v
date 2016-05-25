module parallel_to_serial(data_out, data_in, counter, load, clk, rst); 
	output reg data_out;
	input clk, rst, load; 
	input [7:0] data_in; 
	input [3:0] counter;
	
	reg [9:0] temp;
	reg [1:0] state;

	parameter OP_NOP = 2'b00;
	parameter OP_LOAD = 2'b01;
	parameter OP_COUNTING = 2'b10;
	parameter OP_OUTPUT = 2'b11;

	
	always @(posedge clk) begin
		if (!rst) begin 
	  		temp <= 10'b1000000000; 
			data_out <= 0;
			state <= 0;
		end else begin
			case (state) 
				OP_NOP: begin
					if (load) state <= OP_LOAD;
				end

				OP_LOAD: begin
					temp[8:1] <= data_in;
					state <= OP_OUTPUT;
				end
				
				OP_OUTPUT: begin
					if (load) state = OP_LOAD;
					data_out <= temp[9];
					temp <= temp << 1;
					
				end
			endcase
		end
	end		
endmodule 
