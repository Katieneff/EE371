module transmitter(data_out, character_sent, data_in, load, transmit_enable, minorClk, majorClk, rst);
	output data_out;
	output character_sent;
	input [7:0] data_in;
	input load;
	input transmit_enable;
	input minorClk, majorClk, rst;
	
	wire [3:0] counter;

	parallel_to_serial pts(
				.data_out(data_out),
				.data_in(data_in),
				.counter(counter),
				.load(load),
				.clk(majorClk),
				.rst(rst)
	);
	

	bsc bsc(
		.out(counter), 
		.en(transmit_enable), 
		.minorClk(minorClk), 
		.rst(rst)
	);

	bic bic(
		.out(character_sent), 
		.en(transmit_enable), 
		.in(counter), 
		.rst(rst)
	);


endmodule
