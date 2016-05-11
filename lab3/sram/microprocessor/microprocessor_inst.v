	microprocessor u0 (
		.clk_clk        (<connected-to-clk_clk>),        //     clk.clk
		.reset_reset_n  (<connected-to-reset_reset_n>),  //   reset.reset_n
		.leds_export    (<connected-to-leds_export>),    //    leds.export
		.address_export (<connected-to-address_export>), // address.export
		.data_in_port   (<connected-to-data_in_port>),   //    data.in_port
		.data_out_port  (<connected-to-data_out_port>),  //        .out_port
		.oe_export      (<connected-to-oe_export>),      //      oe.export
		.we_export      (<connected-to-we_export>)       //      we.export
	);

