	nios_processor u0 (
		.audio_ADCDAT     (<connected-to-audio_ADCDAT>),     //       audio.ADCDAT
		.audio_ADCLRCK    (<connected-to-audio_ADCLRCK>),    //            .ADCLRCK
		.audio_BCLK       (<connected-to-audio_BCLK>),       //            .BCLK
		.audio_DACDAT     (<connected-to-audio_DACDAT>),     //            .DACDAT
		.audio_DACLRCK    (<connected-to-audio_DACLRCK>),    //            .DACLRCK
		.audio_video_SDAT (<connected-to-audio_video_SDAT>), // audio_video.SDAT
		.audio_video_SCLK (<connected-to-audio_video_SCLK>), //            .SCLK
		.clk_clk          (<connected-to-clk_clk>),          //         clk.clk
		.reset_reset_n    (<connected-to-reset_reset_n>)     //       reset.reset_n
	);

