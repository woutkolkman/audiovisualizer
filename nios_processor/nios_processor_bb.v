
module nios_processor (
	adc_links_pio_export,
	adc_rechts_pio_export,
	clk_clk,
	reset_reset_n,
	adc_data_pio_in_port,
	adc_data_pio_out_port);	

	input	[31:0]	adc_links_pio_export;
	input	[31:0]	adc_rechts_pio_export;
	input		clk_clk;
	input		reset_reset_n;
	input	[5:0]	adc_data_pio_in_port;
	output	[5:0]	adc_data_pio_out_port;
endmodule
