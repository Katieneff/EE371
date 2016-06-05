// Main SRAM module that links MAR -> Memory <-> MDR.

module sram(data, addrs, we, oe, clk, rst);
	inout[31:0] data;
	input[7:0] addrs;
	input we, oe, clk, rst;

	wire[31:0] dataInt;
	wire[7:0] addrsInt;

	mar mar(addrsInt, addrs, clk, rst);
	memory memory(dataInt, addrsInt, we, oe);
	mdr mdr(data, dataInt, oe, clk, rst);
endmodule