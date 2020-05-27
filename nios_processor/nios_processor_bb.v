
module nios_processor (
	clk_clk,
	freqsep_1_export,
	freqsep_2_export,
	reset_reset_n);	

	input		clk_clk;
	output	[23:0]	freqsep_1_export;
	output	[23:0]	freqsep_2_export;
	input		reset_reset_n;
endmodule
