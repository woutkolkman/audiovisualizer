	nios_processor u0 (
		.adc_links_pio_export  (<connected-to-adc_links_pio_export>),  //  adc_links_pio.export
		.adc_rechts_pio_export (<connected-to-adc_rechts_pio_export>), // adc_rechts_pio.export
		.clk_clk               (<connected-to-clk_clk>),               //            clk.clk
		.reset_reset_n         (<connected-to-reset_reset_n>),         //          reset.reset_n
		.adc_data_pio_in_port  (<connected-to-adc_data_pio_in_port>),  //   adc_data_pio.in_port
		.adc_data_pio_out_port (<connected-to-adc_data_pio_out_port>)  //               .out_port
	);

