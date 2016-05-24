// 2048x16 SRAM memory
// 16-bit bi-directional data line
// 11-bit address
// we = Write Enable (active low)
// oe = Output Enable (active low)
//
// Example usage:
// Read operation (need some delay between each step):
//   1. pull `we` high to enable read operation
//   2. pull `oe` low to enable output
//   3. place address on `addrs`
//   4. read output placed on `data`
//
// Write operation (need some delay between each step):
//   1. ensure we is high to avoid writes to incidental addresses
//   2. pull oe high to acquire write access to `data` input
//   3. place data to be written on `data`
//   4. place address to be written on `addrs`
//   5. pull we active low to execute the write

module memory(data, addrs, we, oe);
	inout[7:0] data;
	input[10:0] addrs;
	input we, oe;

	reg[7:0] state[2047:0];

	// Place data from the appropriate byte onto data
	// only if oe = 0.
	assign data[7:0] = oe ? 8'bz : state[addrs[10:0]][7:0];

	// Whenever data or addrs changes, or we becomes active,
	// we may need to perform another write operation.
	always @(*) begin
		if (!we) begin
			state[addrs[10:0]][7:0] = data[7:0];
		end
	end
endmodule