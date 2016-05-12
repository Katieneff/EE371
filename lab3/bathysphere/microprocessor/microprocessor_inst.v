	microprocessor u0 (
		.batharriving_export  (<connected-to-batharriving_export>),  //  batharriving.export
		.bathleaving_export   (<connected-to-bathleaving_export>),   //   bathleaving.export
		.clk_clk              (<connected-to-clk_clk>),              //           clk.clk
		.drain_export         (<connected-to-drain_export>),         //         drain.export
		.drainfinished_export (<connected-to-drainfinished_export>), // drainfinished.export
		.fill_export          (<connected-to-fill_export>),          //          fill.export
		.fillfinished_export  (<connected-to-fillfinished_export>),  //  fillfinished.export
		.innerdooropen_export (<connected-to-innerdooropen_export>), // innerdooropen.export
		.outerdooropen_export (<connected-to-outerdooropen_export>), // outerdooropen.export
		.personinside_export  (<connected-to-personinside_export>),  //  personinside.export
		.chamberfull_export   (<connected-to-chamberfull_export>),   //   chamberfull.export
		.reset_reset_n        (<connected-to-reset_reset_n>)         //         reset.reset_n
	);

