module receiver(data_out, character_received, data_in, clk, rst);
	output [7:0] data_out;
	output character_received;
	input data_in;
	input clk, rst;
	
	wire [3:0] sample;
	wire [3:0] bitNum;
	wire start_bit_detected;
	
	
	serial_to_parallel stp(
							.data_out(data_out), 
							.data_in(data_in), 
							.sample(sample), 
							.clk(clk), 
							.rst(rst)
						);
	
	start_bit_detect sbd(.en(start_bit_detected), .data(data_in));
	bsc bsc(.out(sample), .bitNum(bitNum), .en(start_bit_detected), .clk(clk), .rst(rst));
	bic bic(.out(character_received), .en(start_bit_detected), .in(bitNum), .clk(clk), .rst(rst));
	

endmodule
