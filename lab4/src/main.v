module main(LEDR, CLOCK_50, KEY);
	output [7:0] LEDR;
	input CLOCK_50;
	input [0:0] KEY;
	
	parameter majorClock = 31;
	parameter minorClock = 3;
	
	wire [31:0] clk
	clockdiv clockdiv(clk, CLOCK_50);


	wire character_received;
	wire character_sent;
	wire [7:0] received_data;
	wire [7:0] transmitted_data
	
	wire transmit_enable;
	

	microprocessor microprocessor(
					.character_received_export(character_received),
					.character_sent_export(character_sent),
					.clk_clk(clk[majorClock]),
					.data_bus_in_port(received_data),
					.data_bus_out_port(transmitted_data),
					.load_export(),
					.reset_reset_n(KEY),
					.transmit_enable_export()

	);
	
	receiver receiver(.data_out(, .character_received, .data_in, .clk(clk[minorClock]), .rst(KEY));
	//transmitter transmitter();	
	
endmodule
