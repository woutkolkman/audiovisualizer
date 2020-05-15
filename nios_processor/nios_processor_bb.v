
module nios_processor (
	audio_ADCDAT,
	audio_ADCLRCK,
	audio_BCLK,
	audio_DACDAT,
	audio_DACLRCK,
	clk_clk,
	leds_export,
	reset_reset_n);	

	input		audio_ADCDAT;
	input		audio_ADCLRCK;
	input		audio_BCLK;
	output		audio_DACDAT;
	input		audio_DACLRCK;
	input		clk_clk;
	output	[7:0]	leds_export;
	input		reset_reset_n;
endmodule
