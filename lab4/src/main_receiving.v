module main_receiving(LEDR, CLOCK_50, KEY, GPIO_0);
	output [7:0] LEDR;
	input [35:0] GPIO_0;
	input CLOCK_50;
	input [0:0] KEY;
	
	parameter majorClock = 11;
	parameter minorClock = 7;
	
	wire [31:0] clk;
	clockdiv clockdiv(clk, CLOCK_50);

	wire character_received;
	wire [7:0] data_out;

	microprocessor microprocessor(
					.character_received_export(character_received),
					.character_sent_export(),
					.clk_clk(clk[majorClock]),
					.data_bus_in_port(data_out),
					.data_bus_out_port(),
					.load_export(),
					.reset_reset_n(KEY),
					.transmit_enable_export()

	);
	
	receiver receiver(
						.data_out(data_out), 
						.character_received(character_received), 
						.data_in(data_in), 
						.minorClk(clk[minorClock]), 
						.majorClk(clk[majorClock]), 
						.rst(KEY)
	);
	
	assign LEDR = data_out;
	
	reg [9:0] data = 10'b1001010110;
	reg data_in;
	
	always @(posedge clk[majorClock]) begin
		data_in = data[9];
		data = data << 1;
	end
	
endmodule
