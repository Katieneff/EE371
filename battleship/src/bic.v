module bic(out, en, in, rst);
	output out;
	input [3:0] in;
	input en, rst;
	
	
	wire [3:0] bitCounterOut;
	wire bitRst;
	wire bitClk;

	up_counter bitCounter(bitCounterOut, bitClk, bitRst);
	
	assign bitClk = (in == 4'b0111) ? 1'b1 : 1'b0; 
	assign out = ((bitCounterOut == 4'b0111) && (in == 4'b1111)) ? 1'b1 : 1'b0;
	
	assign bitRst = (bitCounterOut == 9 || !en) ? 1'b0 : rst;
	
endmodule



module bic_tr(out, en, clk, rst);
	output reg out;
	input en, clk, rst;
	
	reg [3:0] counter;

	
	wire state;
	assign state = en;
	
	parameter OP_NOP = 1;
	parameter OP_COUNTING = 0;
	
	// wire [3:0] bitCounterOut;
	// wire bitRst;

	// up_counter bitCounter(bitCounterOut, clk, bitRst);
	
	// assign bitClk = (in == 4'b0) ? 1'b1 : 1'b0; 
	// assign out = ((bitCounterOut == 4'b1010) && (in == 4'b1111)) ? 1'b1 : 1'b0;
	
	// assign bitRst = (bitCounterOut == 10 || !en) ? 1'b0 : rst;
	
	
	always @(posedge clk) begin
		if (!rst) begin
			counter <= 0;
			out <= 0;
		end else begin
			out <= 0;
			case (state)
			
				OP_NOP: begin
					counter <= 0;
				end
				
				OP_COUNTING: begin
					counter <= counter + 1;
					if (counter == 10) begin
						out <= 1;
						counter <= 0;
					end
				end
			endcase
		end
	
	end
	
endmodule