module timerDecoder(out, in);
	output reg [6:0] out;
	input [3:0] in;


	parameter HEX_0 = ~7'b0111111;
	parameter HEX_1 = ~7'b0000110;
	parameter HEX_2 = ~7'b1011011;
	parameter HEX_3 = ~7'b1001111;
	parameter HEX_4 = ~7'b1100110;
	parameter HEX_5 = ~7'b1101101;
	parameter HEX_6 = ~7'b1111101;
	parameter HEX_7 = ~7'b0000111;
	parameter HEX_8 = ~7'b1111111;
	parameter HEX_9 = ~7'b1101111;
	parameter HEX_A = ~7'b1110111;
	parameter HEX_B = ~7'b1111100;
	parameter HEX_C = ~7'b0111001;
	parameter HEX_D = ~7'b1011110;
	parameter HEX_E = ~7'b1111001;
	parameter HEX_F = ~7'b1110001;

	always @(*) begin
		case (in)
			'h0: out = HEX_0;
			'h1: out = HEX_1;
			'h2: out = HEX_2;
			'h3: out = HEX_3;
			'h4: out = HEX_4;
			'h5: out = HEX_5;
			'h6: out = HEX_6;
			'h7: out = HEX_7;
			'h8: out = HEX_8;
			'h9: out = HEX_9;
			'ha: out = HEX_A;
			'hb: out = HEX_B;
			'hc: out = HEX_C;
			'hd: out = HEX_D;
			'he: out = HEX_E;
			'hf: out = HEX_F;
		endcase
	end
endmodule
