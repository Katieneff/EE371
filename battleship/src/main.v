module main(LEDR, CLOCK_50, KEY, GPIO_0);
	output [7:0] LEDR;
	inout [35:0] GPIO_0;
	input [0:0] KEY;
	input CLOCK_50;
	
	
	wire transmit_enable;
	wire load;
	wire character_sent;
	wire character_received;
	wire [7:0] data_bus_received, data_bus_transmitted;
	
	wire serial_data_received, serial_data_transmitted;
	
	parameter minorClk = 7;
	parameter majorClk = 11;
	
	wire [31:0] clk;
	clockdiv clockdiv(clk, CLOCK_50);
	
	assign GPIO_0[0] = (transmit_enable) ? 1'bz : serial_data_transmitted;
	
	assign serial_data_received = GPIO_0[0];
	
	
	wire sramOe;
	wire sramWe;
	wire [31:0] sramDataIn;
	wire [31:0] sramDataOut;
	wire [7:0] sramAddress;
	
	wire [31:0] sramData;

	
	microprocessor microprocessor(
							.character_received_export(character_received), 
							.character_sent_export(character_sent),     
							.clk_clk(CLOCK_50),               
							.data_bus_in_export(data_bus_received),     
							.data_bus_out_export(data_bus_transmitted),     
							.load_export(load),          
							.reset_reset_n(KEY),           
							.transmit_enable_export(transmit_enable),
							.sram_address_sel_export(sramAddress),
							.sram_oe_export(sramOe),  
							.sram_data_in_port(sramDataOut),
							.sram_we_export(sramWe),
							.sram_data_out_port(sramDataIn)
	);
	
	assign sramData = (sramWe) ? 32'bz : sramDataIn;
	assign sramDataOut = (sramOe) ? 32'bz : sramData;
	
	sram sram(
				.data(sramData),
				.addrs(sramAddress), 
				.we(sramWe), 
				.oe(sramOe), 
				.clk(CLOCK_50),
				.rst(KEY)
	);
	
	
	
	transmitter transmitter(
							.data_out(serial_data_transmitted),
							.character_sent(character_sent),
							.data_in(data_bus_transmitted),
							.load(load),
							.transmit_enable(transmit_enable),
							.minorClk(clk[minorClk]),
							.majorClk(clk[majorClk]),
							.rst(KEY)
	);
	
	
	receiver receiver(
								.data_out(data_bus_received), 
								.character_received(character_received), 
								.data_in(serial_data_received), 
								.minorClk(clk[minorClk]), 
								.majorClk(clk[majorClk]), 
								.rst(KEY)
	);
	
	

	
	
	
	
endmodule

