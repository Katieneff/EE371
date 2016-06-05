// Memory Address Register (MAR)
// Functions as a buffer for addresses to insure that addresses
// only reach the sram on the negative edge of the clock.
// Changes output on the negative edge of the clock.
// Active low reset to 11-bit 0 address.

module mar(addrsOut, addrsIn, clk, rst);
	output reg[7:0] addrsOut;
	input[7:0] addrsIn;
	input clk, rst;

	always @(negedge clk) begin
		if (!rst) begin
			addrsOut[7:0] = 8'b0;
		end else begin
			addrsOut[7:0] = addrsIn[7:0];
		end
	end
endmodule