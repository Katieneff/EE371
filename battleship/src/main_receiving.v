module main_receiving(LEDR, CLOCK_50, KEY, GPIO_0);
	output [9:0] LEDR;
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
					.clk_clk(CLOCK_50),
					.data_bus_in_export(data_out),
					.parallel_data_bus_out_export(),
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
	
	/*assign LEDR[7:0] = data_out;

	
	reg [39:0] data;
	reg data_in;
	reg [7:0] i;
	always @(posedge clk[majorClock]) begin
		if (!KEY[0]) begin
			i = 0;
			data = 40'b1011101000101100101010111001101011101000;
		end else begin 
			data_in = data[39 - i];
			i = i + 1;
			if (i == 40) i = 0;
		end
	end*/
	
endmodule
