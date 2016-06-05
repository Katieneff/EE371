	microprocessor u0 (
		.character_received_export (<connected-to-character_received_export>), // character_received.export
		.character_sent_export     (<connected-to-character_sent_export>),     //     character_sent.export
		.clk_clk                   (<connected-to-clk_clk>),                   //                clk.clk
		.data_bus_in_export        (<connected-to-data_bus_in_export>),        //        data_bus_in.export
		.data_bus_out_export       (<connected-to-data_bus_out_export>),       //       data_bus_out.export
		.load_export               (<connected-to-load_export>),               //               load.export
		.reset_reset_n             (<connected-to-reset_reset_n>),             //              reset.reset_n
		.sram_address_sel_export   (<connected-to-sram_address_sel_export>),   //   sram_address_sel.export
		.sram_oe_export            (<connected-to-sram_oe_export>),            //            sram_oe.export
		.sram_data_in_port         (<connected-to-sram_data_in_port>),         //          sram_data.in_port
		.sram_data_out_port        (<connected-to-sram_data_out_port>),        //                   .out_port
		.sram_we_export            (<connected-to-sram_we_export>),            //            sram_we.export
		.transmit_enable_export    (<connected-to-transmit_enable_export>)     //    transmit_enable.export
	);

