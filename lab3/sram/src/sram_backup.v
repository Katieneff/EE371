// 2048x16 SRAM;
// 16-bit bi-directional data line
// 11-bit address
// we = Write Enable (active low)
// oe = Output Enable (active low)
//
// Example usage:
// Read operation (need some delay between each step):
//   1. pull `we` high to enable read operation
//   2. pull `oe` active-low to enable output
//   3. place address on `addrs`
//   4. read output placed on `data`
//
// Write operation (need some delay between each step):
//   1. ensure we is high to avoid writes to incidental addresses
//   2. pull oe high to acquire write access to `data` input
//   3. place data to be written on `data`
//   4. place address to be written on `addrs`
//   5. pull we active low to execute the write.

module sram(data, clk, rst, oe, we, addrs);
	inout[15:0] data;
	input clk, rst, oe, we;
	input[10:0] addrs;

	integer i;
	reg[15:0] state[2047:0];

	// place data from the appropriate byte onto data
	// only if oe = 0.
	assign data[15:0] = oe ? 16'bz : state[addrs[10:0]][15:0];

	// whenever data or addrs changes, or we becomes active,
	// we may need to perform another write operation.
	always @(*) begin
		for (i=0; i<2048; i=i+1) begin
			state[i][15:0] = state[i][15:0];
		end

		if (!we) begin
			state[addrs[10:0]][15:0] = data[15:0];
		end
	end
endmodule