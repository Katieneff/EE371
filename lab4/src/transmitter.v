module transmitter(data_out, character_sent, data_in, load, transmit_enable, clk, rst);
	output data_out;
	output character_sent;
	input [7:0] data_in;
	input load;
	input transmit_enable;
	input clk, rst;
	
	wire [3:0] counter;
	wire [3:0] bitNum;

	parallel_to_serial pts(
				.out(data_out),
				.data(data_in),
				.counter(counter),
				.load(load),
				.clk(clk),
				.rst(rst)
	);
	

	bsc bsc(
		.out(counter), 
		.bitNum(bitNum), 
		.en(transmit_enable), 
		.clk(clk), 
		.rst(rst)
	);

	bic bic(
		.out(character_sent), 
		.en(transmit_enable), 
		.in(bitNum), 
		.clk(clk), 
		.rst(rst)
	);


endmodule
