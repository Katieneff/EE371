// Memory Data Register (MDR)
// Functions as a buffer for data between the SRAM and
// external data lines.
// Changes output on the positive edge of the clock.
// Output enable (oe) determines direction of buffer.
// oe = 0 causes buffer to push data into the SRAM.
// oe = 1 causes buffer to push data to external data line.
// Active low reset causes buffer to push 16-bit 0 onto output line
// defined by state of oe.

module mdr(dataExt, dataInt, oe, clk, rst);
	inout[7:0] dataExt, dataInt;
	input oe, clk, rst;

	reg[7:0] state;

	assign dataExt[7:0] = oe ? 8'bz : state[7:0];
	assign dataInt[7:0] = oe ? state[7:0] : 8'bz;

	always @(posedge clk) begin
		if (!rst) begin
			state[7:0] = 8'b0;
		end else begin
			state[7:0] = state[7:0];
			if (oe) begin
				state[7:0] = dataExt[7:0];
			end else begin
				state[7:0] = dataInt[7:0];
			end
		end
	end
endmodule