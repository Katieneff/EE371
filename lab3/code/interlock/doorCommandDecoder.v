module doorCommandDecoder(out0, out1, out2, out3, in);
	output reg [6:0] out0, out1, out2, out3;
	input [2:0] in;
	
	parameter DOOR_COMMAND_IDLE = 3'b000;
	parameter CLOSE_INNER_DOOR = 3'b001;
	parameter OPEN_INNER_DOOR = 3'b010;
	parameter CLOSE_OUTER_DOOR = 3'b011;
	parameter OPEN_OUTER_DOOR = 3'b100;
	parameter DEPRESSURIZE = 3'b101;
	parameter PRESSURIZE = 3'b110;
	
	always @(*) begin
		case (in)
			DOOR_COMMAND_IDLE : begin
				out0 = ~7'b0000000;
				out1 = ~7'b0000000;
				out2 = ~7'b0000000;
				out3 = ~7'b0000000;
			end
			CLOSE_INNER_DOOR : begin
				out0 = ~7'b0111001;
				out1 = ~7'b0111000;
				out2 = ~7'b0000110;
				out3 = ~7'b1010100;
			end
			OPEN_INNER_DOOR : begin
				out0 = ~7'b0111111;
				out1 = ~7'b1110011;
				out2 = ~7'b0000110;
				out3 = ~7'b1010100;
			end
			CLOSE_OUTER_DOOR : begin
				out0 = ~7'b0111001;
				out1 = ~7'b0111000;
				out2 = ~7'b1011100;
				out3 = ~7'b1111000;
			end
			OPEN_OUTER_DOOR : begin
				out0 = ~7'b0111111;
				out1 = ~7'b1110011;
				out2 = ~7'b1011100;
				out3 = ~7'b1111000;
			end
			DEPRESSURIZE : begin
				out0 = ~7'b1011110;
				out1 = ~7'b1110011;
				out2 = ~7'b0000000;
				out3 = ~7'b0000000;
			end
			
			PRESSURIZE : begin
				out0 = ~7'b1110011;
				out1 = ~7'b1010000;
				out2 = ~7'b0000000;
				out3 = ~7'b0000000;
			end
			
			
			
			default : begin
				out0 = ~7'b0000000;
				out1 = ~7'b0000000;
				out2 = ~7'b0000000;
				out3 = ~7'b0000000;
			end
		endcase
		
	end
	
endmodule

		