-- megafunction wizard: %Virtual JTAG%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: sld_virtual_jtag 

-- ============================================================
-- File Name: megawizard_vjtag.vhd
-- Megafunction Name(s):
-- 			sld_virtual_jtag
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 10.1 Build 153 11/29/2010 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2010 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY megawizard_vjtag IS
	PORT
	(
		ir_out		: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		tdo		: IN STD_LOGIC ;
		ir_in		: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		tck		: OUT STD_LOGIC ;
		tdi		: OUT STD_LOGIC ;
		virtual_state_cdr		: OUT STD_LOGIC ;
		virtual_state_cir		: OUT STD_LOGIC ;
		virtual_state_e1dr		: OUT STD_LOGIC ;
		virtual_state_e2dr		: OUT STD_LOGIC ;
		virtual_state_pdr		: OUT STD_LOGIC ;
		virtual_state_sdr		: OUT STD_LOGIC ;
		virtual_state_udr		: OUT STD_LOGIC ;
		virtual_state_uir		: OUT STD_LOGIC 
	);
END megawizard_vjtag;


ARCHITECTURE SYN OF megawizard_vjtag IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC ;
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC ;
	SIGNAL sub_wire4	: STD_LOGIC ;
	SIGNAL sub_wire5	: STD_LOGIC ;
	SIGNAL sub_wire6	: STD_LOGIC ;
	SIGNAL sub_wire7	: STD_LOGIC ;
	SIGNAL sub_wire8	: STD_LOGIC ;
	SIGNAL sub_wire9	: STD_LOGIC ;
	SIGNAL sub_wire10	: STD_LOGIC ;



	COMPONENT sld_virtual_jtag
	GENERIC (
		sld_auto_instance_index		: STRING;
		sld_instance_index		: NATURAL;
		sld_ir_width		: NATURAL;
		sld_sim_action		: STRING;
		sld_sim_n_scan		: NATURAL;
		sld_sim_total_length		: NATURAL;
		lpm_type		: STRING
	);
	PORT (
			virtual_state_cir	: OUT STD_LOGIC ;
			virtual_state_pdr	: OUT STD_LOGIC ;
			ir_in	: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			tdi	: OUT STD_LOGIC ;
			virtual_state_udr	: OUT STD_LOGIC ;
			ir_out	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			tck	: OUT STD_LOGIC ;
			virtual_state_e1dr	: OUT STD_LOGIC ;
			virtual_state_uir	: OUT STD_LOGIC ;
			tdo	: IN STD_LOGIC ;
			virtual_state_cdr	: OUT STD_LOGIC ;
			virtual_state_e2dr	: OUT STD_LOGIC ;
			virtual_state_sdr	: OUT STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	virtual_state_cir    <= sub_wire0;
	virtual_state_pdr    <= sub_wire1;
	ir_in    <= sub_wire2(1 DOWNTO 0);
	tdi    <= sub_wire3;
	virtual_state_udr    <= sub_wire4;
	tck    <= sub_wire5;
	virtual_state_e1dr    <= sub_wire6;
	virtual_state_uir    <= sub_wire7;
	virtual_state_cdr    <= sub_wire8;
	virtual_state_e2dr    <= sub_wire9;
	virtual_state_sdr    <= sub_wire10;

	sld_virtual_jtag_component : sld_virtual_jtag
	GENERIC MAP (
		sld_auto_instance_index => "YES",
		sld_instance_index => 0,
		sld_ir_width => 2,
		sld_sim_action => "",
		sld_sim_n_scan => 0,
		sld_sim_total_length => 0,
		lpm_type => "sld_virtual_jtag"
	)
	PORT MAP (
		ir_out => ir_out,
		tdo => tdo,
		virtual_state_cir => sub_wire0,
		virtual_state_pdr => sub_wire1,
		ir_in => sub_wire2,
		tdi => sub_wire3,
		virtual_state_udr => sub_wire4,
		tck => sub_wire5,
		virtual_state_e1dr => sub_wire6,
		virtual_state_uir => sub_wire7,
		virtual_state_cdr => sub_wire8,
		virtual_state_e2dr => sub_wire9,
		virtual_state_sdr => sub_wire10
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
-- Retrieval info: PRIVATE: show_jtag_state STRING "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: SLD_AUTO_INSTANCE_INDEX STRING "YES"
-- Retrieval info: CONSTANT: SLD_INSTANCE_INDEX NUMERIC "0"
-- Retrieval info: CONSTANT: SLD_IR_WIDTH NUMERIC "2"
-- Retrieval info: CONSTANT: SLD_SIM_ACTION STRING ""
-- Retrieval info: CONSTANT: SLD_SIM_N_SCAN NUMERIC "0"
-- Retrieval info: CONSTANT: SLD_SIM_TOTAL_LENGTH NUMERIC "0"
-- Retrieval info: USED_PORT: ir_in 0 0 2 0 OUTPUT NODEFVAL "ir_in[1..0]"
-- Retrieval info: USED_PORT: ir_out 0 0 2 0 INPUT NODEFVAL "ir_out[1..0]"
-- Retrieval info: USED_PORT: tck 0 0 0 0 OUTPUT NODEFVAL "tck"
-- Retrieval info: USED_PORT: tdi 0 0 0 0 OUTPUT NODEFVAL "tdi"
-- Retrieval info: USED_PORT: tdo 0 0 0 0 INPUT NODEFVAL "tdo"
-- Retrieval info: USED_PORT: virtual_state_cdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_cdr"
-- Retrieval info: USED_PORT: virtual_state_cir 0 0 0 0 OUTPUT NODEFVAL "virtual_state_cir"
-- Retrieval info: USED_PORT: virtual_state_e1dr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_e1dr"
-- Retrieval info: USED_PORT: virtual_state_e2dr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_e2dr"
-- Retrieval info: USED_PORT: virtual_state_pdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_pdr"
-- Retrieval info: USED_PORT: virtual_state_sdr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_sdr"
-- Retrieval info: USED_PORT: virtual_state_udr 0 0 0 0 OUTPUT NODEFVAL "virtual_state_udr"
-- Retrieval info: USED_PORT: virtual_state_uir 0 0 0 0 OUTPUT NODEFVAL "virtual_state_uir"
-- Retrieval info: CONNECT: @ir_out 0 0 2 0 ir_out 0 0 2 0
-- Retrieval info: CONNECT: @tdo 0 0 0 0 tdo 0 0 0 0
-- Retrieval info: CONNECT: ir_in 0 0 2 0 @ir_in 0 0 2 0
-- Retrieval info: CONNECT: tck 0 0 0 0 @tck 0 0 0 0
-- Retrieval info: CONNECT: tdi 0 0 0 0 @tdi 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_cdr 0 0 0 0 @virtual_state_cdr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_cir 0 0 0 0 @virtual_state_cir 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_e1dr 0 0 0 0 @virtual_state_e1dr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_e2dr 0 0 0 0 @virtual_state_e2dr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_pdr 0 0 0 0 @virtual_state_pdr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_sdr 0 0 0 0 @virtual_state_sdr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_udr 0 0 0 0 @virtual_state_udr 0 0 0 0
-- Retrieval info: CONNECT: virtual_state_uir 0 0 0 0 @virtual_state_uir 0 0 0 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL megawizard_vjtag.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL megawizard_vjtag.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL megawizard_vjtag.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL megawizard_vjtag.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL megawizard_vjtag_inst.vhd TRUE
-- Retrieval info: LIB_FILE: altera_mf
