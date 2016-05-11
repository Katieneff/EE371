	microprocessor u0 (
		.clk_clk                (<connected-to-clk_clk>),                //             clk.clk
		.filling_export         (<connected-to-filling_export>),         //         filling.export
		.innerdoor_export       (<connected-to-innerdoor_export>),       //       innerdoor.export
		.reset_reset_n          (<connected-to-reset_reset_n>),          //           reset.reset_n
		.draining_export        (<connected-to-draining_export>),        //        draining.export
		.outerdoor_export       (<connected-to-outerdoor_export>),       //       outerdoor.export
		.resetleds_export       (<connected-to-resetleds_export>),       //       resetleds.export
		.bathleaving_export     (<connected-to-bathleaving_export>),     //     bathleaving.export
		.batharriving_export    (<connected-to-batharriving_export>),    //    batharriving.export
		.personcheck_export     (<connected-to-personcheck_export>),     //     personcheck.export
		.pressurecheck_export   (<connected-to-pressurecheck_export>),   //   pressurecheck.export
		.innerdoorswitch_export (<connected-to-innerdoorswitch_export>), // innerdoorswitch.export
		.outerdoorswitch_export (<connected-to-outerdoorswitch_export>), // outerdoorswitch.export
		.drain_export           (<connected-to-drain_export>),           //           drain.export
		.fill_export            (<connected-to-fill_export>),            //            fill.export
		.fillfinished_export    (<connected-to-fillfinished_export>),    //    fillfinished.export
		.drainfinished_export   (<connected-to-drainfinished_export>),   //   drainfinished.export
		.waiting_export         (<connected-to-waiting_export>),         //         waiting.export
		.waitfinished_export    (<connected-to-waitfinished_export>)     //    waitfinished.export
	);

