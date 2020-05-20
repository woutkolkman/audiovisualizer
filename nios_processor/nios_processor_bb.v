
module nios_processor (
	adc_0_external_interface_sclk,
	adc_0_external_interface_cs_n,
	adc_0_external_interface_dout,
	adc_0_external_interface_din,
	clk_clk,
	freqsep_1_export,
	freqsep_2_export,
	reset_reset_n);	

	output		adc_0_external_interface_sclk;
	output		adc_0_external_interface_cs_n;
	input		adc_0_external_interface_dout;
	output		adc_0_external_interface_din;
	input		clk_clk;
	output	[23:0]	freqsep_1_export;
	output	[23:0]	freqsep_2_export;
	input		reset_reset_n;
endmodule
