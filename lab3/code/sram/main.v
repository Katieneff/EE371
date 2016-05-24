module main(CLOCK_50, LEDR, KEY);

	input CLOCK_50;
	input [0:0] KEY;
	output [8:0] LEDR;
	
	wire [7:0] data;
	
	wire[7:0] data_in;
	wire[7:0] data_out;
	wire [10:0] address;
	wire we, oe;
	

	wire clk;
	clockdiv clockdiv(clk, CLOCK_50);


	 microprocessor m(
		 .address_export(address), // address.export
		 .clk_clk(CLOCK_50),        //     clk.clk
		 .data_in_port(data_in),   //    data.in_port
		 .data_out_port(data_out),  //        .out_port
		.leds_export(LEDR),    //    leds.export
		.oe_export(oe),      //      oe.export
		.reset_reset_n(KEY),  //   reset.reset_n
		.we_export(we)       //      we.export
	);
	
	
	assign data = (we) ? 8'bz : data_out;
	assign data_in = (oe) ? 8'bz : data;
	
	sram sram(.data(data), .addrs(address), .we(we), .oe(oe), .clk(CLOCK_50), .rst(KEY));
	


endmodule
