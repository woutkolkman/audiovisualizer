
module nios_processor (
	adc_sclk,
	adc_cs_n,
	adc_dout,
	adc_din,
	clk_clk,
	leds_export,
	reset_reset_n,
	audio_ADCDAT,
	audio_ADCLRCK,
	audio_BCLK,
	audio_DACDAT,
	audio_DACLRCK);	

	output		adc_sclk;
	output		adc_cs_n;
	input		adc_dout;
	output		adc_din;
	input		clk_clk;
	output	[7:0]	leds_export;
	input		reset_reset_n;
	input		audio_ADCDAT;
	input		audio_ADCLRCK;
	input		audio_BCLK;
	output		audio_DACDAT;
	input		audio_DACLRCK;
endmodule
