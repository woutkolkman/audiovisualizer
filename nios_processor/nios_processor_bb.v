
module nios_processor (
	audio_ADCDAT,
	audio_ADCLRCK,
	audio_BCLK,
	audio_DACDAT,
	audio_DACLRCK,
	audio_video_SDAT,
	audio_video_SCLK,
	clk_clk,
	reset_reset_n);	

	input		audio_ADCDAT;
	input		audio_ADCLRCK;
	input		audio_BCLK;
	output		audio_DACDAT;
	input		audio_DACLRCK;
	inout		audio_video_SDAT;
	output		audio_video_SCLK;
	input		clk_clk;
	input		reset_reset_n;
endmodule
