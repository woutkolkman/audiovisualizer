	nios_processor u0 (
		.adc_sclk              (<connected-to-adc_sclk>),              //            adc.sclk
		.adc_cs_n              (<connected-to-adc_cs_n>),              //               .cs_n
		.adc_dout              (<connected-to-adc_dout>),              //               .dout
		.adc_din               (<connected-to-adc_din>),               //               .din
		.adc_data_pio_in_port  (<connected-to-adc_data_pio_in_port>),  //   adc_data_pio.in_port
		.adc_data_pio_out_port (<connected-to-adc_data_pio_out_port>), //               .out_port
		.adc_links_pio_export  (<connected-to-adc_links_pio_export>),  //  adc_links_pio.export
		.adc_rechts_pio_export (<connected-to-adc_rechts_pio_export>), // adc_rechts_pio.export
		.clk_clk               (<connected-to-clk_clk>),               //            clk.clk
		.reset_reset_n         (<connected-to-reset_reset_n>)          //          reset.reset_n
	);

