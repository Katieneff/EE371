module main(CLOCK_50, LEDR, KEY);

	input CLOCK_50;
	input [0:0] KEY;
	output [7:0] LEDR;
	
	wire [7:0] data;
	wire [10:0] address;
	wire we, oe;
	
	 microprocessor m(
		 .address_export(address), // address.export
		 .clk_clk(CLOCK_50),        //     clk.clk
		 .data_in_port(data),   //    data.in_port
		 .data_out_port(data),  //        .out_port
		.leds_export(LEDR),    //    leds.export
		.oe_export(oe),      //      oe.export
		.reset_reset_n(KEY),  //   reset.reset_n
		.we_export(we)       //      we.export
	);
	
	
	sram sram(.data(data), .addrs(address), .we(we), .oe(oe), .clk(CLOCK_50), .rst(KEY));
	


endmodule
