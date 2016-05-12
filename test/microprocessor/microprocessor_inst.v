	microprocessor u0 (
		.clk_clk               (<connected-to-clk_clk>),               //            clk.clk
		.reset_reset_n         (<connected-to-reset_reset_n>),         //          reset.reset_n
		.depressurize_export   (<connected-to-depressurize_export>),   //   depressurize.export
		.pressurize_export     (<connected-to-pressurize_export>),     //     pressurize.export
		.doors_export          (<connected-to-doors_export>),          //          doors.export
		.arrivalsignals_export (<connected-to-arrivalsignals_export>)  // arrivalsignals.export
	);

