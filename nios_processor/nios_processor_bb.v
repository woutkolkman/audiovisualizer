
module nios_processor (
	audio_ADCDAT,
	audio_ADCLRCK,
	audio_BCLK,
	audio_DACDAT,
	audio_DACLRCK,
	clk_clk,
	freqsep_1_export,
	freqsep_2_export,
	i2c_SDAT,
	i2c_SCLK,
	reset_reset_n);	

	input		audio_ADCDAT;
	input		audio_ADCLRCK;
	input		audio_BCLK;
	output		audio_DACDAT;
	input		audio_DACLRCK;
	input		clk_clk;
	output	[23:0]	freqsep_1_export;
	output	[23:0]	freqsep_2_export;
	inout		i2c_SDAT;
	output		i2c_SCLK;
	input		reset_reset_n;
endmodule
