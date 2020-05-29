	nios_processor u0 (
		.audio_ADCDAT     (<connected-to-audio_ADCDAT>),     //     audio.ADCDAT
		.audio_ADCLRCK    (<connected-to-audio_ADCLRCK>),    //          .ADCLRCK
		.audio_BCLK       (<connected-to-audio_BCLK>),       //          .BCLK
		.audio_DACDAT     (<connected-to-audio_DACDAT>),     //          .DACDAT
		.audio_DACLRCK    (<connected-to-audio_DACLRCK>),    //          .DACLRCK
		.clk_clk          (<connected-to-clk_clk>),          //       clk.clk
		.freqsep_1_export (<connected-to-freqsep_1_export>), // freqsep_1.export
		.freqsep_2_export (<connected-to-freqsep_2_export>), // freqsep_2.export
		.i2c_SDAT         (<connected-to-i2c_SDAT>),         //       i2c.SDAT
		.i2c_SCLK         (<connected-to-i2c_SCLK>),         //          .SCLK
		.reset_reset_n    (<connected-to-reset_reset_n>)     //     reset.reset_n
	);

