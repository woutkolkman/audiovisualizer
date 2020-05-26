	nios_processor u0 (
		.adc_sclk      (<connected-to-adc_sclk>),      //   adc.sclk
		.adc_cs_n      (<connected-to-adc_cs_n>),      //      .cs_n
		.adc_dout      (<connected-to-adc_dout>),      //      .dout
		.adc_din       (<connected-to-adc_din>),       //      .din
		.clk_clk       (<connected-to-clk_clk>),       //   clk.clk
		.leds_export   (<connected-to-leds_export>),   //  leds.export
		.reset_reset_n (<connected-to-reset_reset_n>), // reset.reset_n
		.audio_ADCDAT  (<connected-to-audio_ADCDAT>),  // audio.ADCDAT
		.audio_ADCLRCK (<connected-to-audio_ADCLRCK>), //      .ADCLRCK
		.audio_BCLK    (<connected-to-audio_BCLK>),    //      .BCLK
		.audio_DACDAT  (<connected-to-audio_DACDAT>),  //      .DACDAT
		.audio_DACLRCK (<connected-to-audio_DACLRCK>)  //      .DACLRCK
	);

