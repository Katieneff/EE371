	microprocessor u0 (
		.character_received_export (<connected-to-character_received_export>), // character_received.export
		.character_sent_export     (<connected-to-character_sent_export>),     //     character_sent.export
		.clk_clk                   (<connected-to-clk_clk>),                   //                clk.clk
		.data_bus_in_port          (<connected-to-data_bus_in_port>),          //           data_bus.in_port
		.data_bus_out_port         (<connected-to-data_bus_out_port>),         //                   .out_port
		.load_export               (<connected-to-load_export>),               //               load.export
		.reset_reset_n             (<connected-to-reset_reset_n>),             //              reset.reset_n
		.transmit_enable_export    (<connected-to-transmit_enable_export>)     //    transmit_enable.export
	);

