module parallel_to_serial(data_out, data_in, counter, load, clk, rst); 
	output reg data_out;
	input clk, rst, load; // What is the purpose of load?
	input [7:0] data_in; 
	input [3:0] counter;
	
	reg [7:0] temp;
	reg [1:0] state;

	parameter OP_NOP = 2'b00;
	parameter OP_LOAD = 2'b01;
	parameter OP_COUNTING = 2'b10;
	parameter OP_OUTPUT = 2'b11;
	
	always @(posedge clk) begin
		if (!rst) begin 
	  		temp = 0; 
			data_out = 0;
			state = 0;
		end else begin
			case (state) 
				OP_NOP: begin
					if (load) state = OP_LOAD;
				end

				OP_LOAD: begin
					temp = data_in;
					state = OP_COUNTING;
				end
					
				OP_COUNTING: begin
					if (counter == 4'b0000) state = OP_OUTPUT; // THIS ONLY WORKS IF COUNTER == 0 NOT COUNTER == 7 IDFK WHY
					if (load) state = OP_LOAD;
				end
				
				OP_OUTPUT: begin
					data_out = temp[7];
					temp = temp << 1;
					state = OP_COUNTING;
				end
			endcase
		end
	end		
endmodule 
