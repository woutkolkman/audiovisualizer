	nios_processor u0 (
		.audio_ADCDAT  (<connected-to-audio_ADCDAT>),  // audio.ADCDAT
		.audio_ADCLRCK (<connected-to-audio_ADCLRCK>), //      .ADCLRCK
		.audio_BCLK    (<connected-to-audio_BCLK>),    //      .BCLK
		.audio_DACDAT  (<connected-to-audio_DACDAT>),  //      .DACDAT
		.audio_DACLRCK (<connected-to-audio_DACLRCK>), //      .DACLRCK
		.clk_clk       (<connected-to-clk_clk>),       //   clk.clk
		.leds_export   (<connected-to-leds_export>),   //  leds.export
		.reset_reset_n (<connected-to-reset_reset_n>)  // reset.reset_n
	);

