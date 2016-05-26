	microprocessor u0 (
		.character_received_export    (<connected-to-character_received_export>),    //    character_received.export
		.character_sent_export        (<connected-to-character_sent_export>),        //        character_sent.export
		.clk_clk                      (<connected-to-clk_clk>),                      //                   clk.clk
		.data_bus_in_export           (<connected-to-data_bus_in_export>),           //           data_bus_in.export
		.load_export                  (<connected-to-load_export>),                  //                  load.export
		.reset_reset_n                (<connected-to-reset_reset_n>),                //                 reset.reset_n
		.transmit_enable_export       (<connected-to-transmit_enable_export>),       //       transmit_enable.export
		.parallel_data_bus_out_export (<connected-to-parallel_data_bus_out_export>)  // parallel_data_bus_out.export
	);

