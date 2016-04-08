-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Full Version"

-- DATE "04/07/2016 18:41:25"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	main IS
    PORT (
	LEDR : OUT std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(9 DOWNTO 9);
	CLOCK_50 : IN std_logic
	);
END main;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 9);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \div|ticks[0]~0_combout\ : std_logic;
SIGNAL \div|Add0~93_sumout\ : std_logic;
SIGNAL \div|Add0~94\ : std_logic;
SIGNAL \div|Add0~89_sumout\ : std_logic;
SIGNAL \div|ticks[2]~feeder_combout\ : std_logic;
SIGNAL \div|Add0~90\ : std_logic;
SIGNAL \div|Add0~85_sumout\ : std_logic;
SIGNAL \div|Add0~86\ : std_logic;
SIGNAL \div|Add0~81_sumout\ : std_logic;
SIGNAL \div|ticks[4]~feeder_combout\ : std_logic;
SIGNAL \div|Add0~82\ : std_logic;
SIGNAL \div|Add0~77_sumout\ : std_logic;
SIGNAL \div|ticks[5]~feeder_combout\ : std_logic;
SIGNAL \div|Add0~78\ : std_logic;
SIGNAL \div|Add0~73_sumout\ : std_logic;
SIGNAL \div|Add0~74\ : std_logic;
SIGNAL \div|Add0~69_sumout\ : std_logic;
SIGNAL \div|Add0~70\ : std_logic;
SIGNAL \div|Add0~65_sumout\ : std_logic;
SIGNAL \div|ticks[8]~feeder_combout\ : std_logic;
SIGNAL \div|Add0~66\ : std_logic;
SIGNAL \div|Add0~61_sumout\ : std_logic;
SIGNAL \div|Add0~62\ : std_logic;
SIGNAL \div|Add0~57_sumout\ : std_logic;
SIGNAL \div|Add0~58\ : std_logic;
SIGNAL \div|Add0~53_sumout\ : std_logic;
SIGNAL \div|Add0~54\ : std_logic;
SIGNAL \div|Add0~49_sumout\ : std_logic;
SIGNAL \div|Add0~50\ : std_logic;
SIGNAL \div|Add0~45_sumout\ : std_logic;
SIGNAL \div|Add0~46\ : std_logic;
SIGNAL \div|Add0~41_sumout\ : std_logic;
SIGNAL \div|Add0~42\ : std_logic;
SIGNAL \div|Add0~37_sumout\ : std_logic;
SIGNAL \div|Add0~38\ : std_logic;
SIGNAL \div|Add0~33_sumout\ : std_logic;
SIGNAL \div|Add0~34\ : std_logic;
SIGNAL \div|Add0~29_sumout\ : std_logic;
SIGNAL \div|Add0~30\ : std_logic;
SIGNAL \div|Add0~25_sumout\ : std_logic;
SIGNAL \div|Add0~26\ : std_logic;
SIGNAL \div|Add0~21_sumout\ : std_logic;
SIGNAL \div|Add0~22\ : std_logic;
SIGNAL \div|Add0~17_sumout\ : std_logic;
SIGNAL \div|Add0~18\ : std_logic;
SIGNAL \div|Add0~13_sumout\ : std_logic;
SIGNAL \div|Add0~14\ : std_logic;
SIGNAL \div|Add0~9_sumout\ : std_logic;
SIGNAL \div|Add0~10\ : std_logic;
SIGNAL \div|Add0~5_sumout\ : std_logic;
SIGNAL \div|Add0~6\ : std_logic;
SIGNAL \div|Add0~1_sumout\ : std_logic;
SIGNAL \cnt|dff0|q~0_combout\ : std_logic;
SIGNAL \cnt|dff0|q~feeder_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \resetBuff|buffered~q\ : std_logic;
SIGNAL \cnt|dff0|q~q\ : std_logic;
SIGNAL \cnt|dff1|q~0_combout\ : std_logic;
SIGNAL \cnt|dff1|q~feeder_combout\ : std_logic;
SIGNAL \cnt|dff1|q~q\ : std_logic;
SIGNAL \cnt|dff2|q~0_combout\ : std_logic;
SIGNAL \cnt|dff2|q~feeder_combout\ : std_logic;
SIGNAL \cnt|dff2|q~q\ : std_logic;
SIGNAL \cnt|dff3|q~DUPLICATE_q\ : std_logic;
SIGNAL \cnt|dff3|q~0_combout\ : std_logic;
SIGNAL \cnt|dff3|q~feeder_combout\ : std_logic;
SIGNAL \cnt|dff3|q~q\ : std_logic;
SIGNAL \div|ticks\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \cnt|dff3|ALT_INV_q~DUPLICATE_q\ : std_logic;
SIGNAL \cnt|dff3|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \cnt|dff2|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \cnt|dff1|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \cnt|dff0|ALT_INV_q~0_combout\ : std_logic;
SIGNAL \div|ALT_INV_ticks\ : std_logic_vector(24 DOWNTO 0);
SIGNAL \cnt|dff2|ALT_INV_q~q\ : std_logic;
SIGNAL \cnt|dff1|ALT_INV_q~q\ : std_logic;
SIGNAL \cnt|dff0|ALT_INV_q~q\ : std_logic;
SIGNAL \div|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add0~81_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add0~65_sumout\ : std_logic;

BEGIN

LEDR <= ww_LEDR;
ww_SW <= SW;
ww_CLOCK_50 <= CLOCK_50;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\cnt|dff3|ALT_INV_q~DUPLICATE_q\ <= NOT \cnt|dff3|q~DUPLICATE_q\;
\cnt|dff3|ALT_INV_q~0_combout\ <= NOT \cnt|dff3|q~0_combout\;
\cnt|dff2|ALT_INV_q~0_combout\ <= NOT \cnt|dff2|q~0_combout\;
\cnt|dff1|ALT_INV_q~0_combout\ <= NOT \cnt|dff1|q~0_combout\;
\cnt|dff0|ALT_INV_q~0_combout\ <= NOT \cnt|dff0|q~0_combout\;
\div|ALT_INV_ticks\(0) <= NOT \div|ticks\(0);
\div|ALT_INV_ticks\(1) <= NOT \div|ticks\(1);
\div|ALT_INV_ticks\(2) <= NOT \div|ticks\(2);
\div|ALT_INV_ticks\(3) <= NOT \div|ticks\(3);
\div|ALT_INV_ticks\(4) <= NOT \div|ticks\(4);
\div|ALT_INV_ticks\(5) <= NOT \div|ticks\(5);
\div|ALT_INV_ticks\(6) <= NOT \div|ticks\(6);
\div|ALT_INV_ticks\(7) <= NOT \div|ticks\(7);
\div|ALT_INV_ticks\(8) <= NOT \div|ticks\(8);
\div|ALT_INV_ticks\(9) <= NOT \div|ticks\(9);
\div|ALT_INV_ticks\(10) <= NOT \div|ticks\(10);
\div|ALT_INV_ticks\(11) <= NOT \div|ticks\(11);
\div|ALT_INV_ticks\(12) <= NOT \div|ticks\(12);
\div|ALT_INV_ticks\(13) <= NOT \div|ticks\(13);
\div|ALT_INV_ticks\(14) <= NOT \div|ticks\(14);
\div|ALT_INV_ticks\(15) <= NOT \div|ticks\(15);
\div|ALT_INV_ticks\(16) <= NOT \div|ticks\(16);
\div|ALT_INV_ticks\(17) <= NOT \div|ticks\(17);
\div|ALT_INV_ticks\(18) <= NOT \div|ticks\(18);
\div|ALT_INV_ticks\(19) <= NOT \div|ticks\(19);
\div|ALT_INV_ticks\(20) <= NOT \div|ticks\(20);
\div|ALT_INV_ticks\(21) <= NOT \div|ticks\(21);
\div|ALT_INV_ticks\(22) <= NOT \div|ticks\(22);
\div|ALT_INV_ticks\(23) <= NOT \div|ticks\(23);
\div|ALT_INV_ticks\(24) <= NOT \div|ticks\(24);
\cnt|dff2|ALT_INV_q~q\ <= NOT \cnt|dff2|q~q\;
\cnt|dff1|ALT_INV_q~q\ <= NOT \cnt|dff1|q~q\;
\cnt|dff0|ALT_INV_q~q\ <= NOT \cnt|dff0|q~q\;
\div|ALT_INV_Add0~89_sumout\ <= NOT \div|Add0~89_sumout\;
\div|ALT_INV_Add0~81_sumout\ <= NOT \div|Add0~81_sumout\;
\div|ALT_INV_Add0~77_sumout\ <= NOT \div|Add0~77_sumout\;
\div|ALT_INV_Add0~65_sumout\ <= NOT \div|Add0~65_sumout\;

-- Location: IOOBUF_X89_Y37_N39
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt|dff0|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X89_Y38_N39
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt|dff1|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X89_Y37_N5
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt|dff2|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X89_Y37_N22
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt|dff3|q~q\,
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOIBUF_X89_Y35_N61
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G10
\CLOCK_50~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~input_o\,
	outclk => \CLOCK_50~inputCLKENA0_outclk\);

-- Location: LABCELL_X88_Y36_N21
\div|ticks[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|ticks[0]~0_combout\ = ( !\div|ticks\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \div|ALT_INV_ticks\(0),
	combout => \div|ticks[0]~0_combout\);

-- Location: FF_X88_Y36_N23
\div|ticks[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|ticks[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(0));

-- Location: LABCELL_X88_Y36_N30
\div|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~93_sumout\ = SUM(( \div|ticks\(1) ) + ( \div|ticks\(0) ) + ( !VCC ))
-- \div|Add0~94\ = CARRY(( \div|ticks\(1) ) + ( \div|ticks\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_ticks\(0),
	datad => \div|ALT_INV_ticks\(1),
	cin => GND,
	sumout => \div|Add0~93_sumout\,
	cout => \div|Add0~94\);

-- Location: FF_X88_Y36_N2
\div|ticks[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \div|Add0~93_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(1));

-- Location: LABCELL_X88_Y36_N33
\div|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~89_sumout\ = SUM(( \div|ticks\(2) ) + ( GND ) + ( \div|Add0~94\ ))
-- \div|Add0~90\ = CARRY(( \div|ticks\(2) ) + ( GND ) + ( \div|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_ticks\(2),
	cin => \div|Add0~94\,
	sumout => \div|Add0~89_sumout\,
	cout => \div|Add0~90\);

-- Location: LABCELL_X88_Y36_N12
\div|ticks[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|ticks[2]~feeder_combout\ = ( \div|Add0~89_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \div|ALT_INV_Add0~89_sumout\,
	combout => \div|ticks[2]~feeder_combout\);

-- Location: FF_X88_Y36_N14
\div|ticks[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|ticks[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(2));

-- Location: LABCELL_X88_Y36_N36
\div|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~85_sumout\ = SUM(( \div|ticks\(3) ) + ( GND ) + ( \div|Add0~90\ ))
-- \div|Add0~86\ = CARRY(( \div|ticks\(3) ) + ( GND ) + ( \div|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_ticks\(3),
	cin => \div|Add0~90\,
	sumout => \div|Add0~85_sumout\,
	cout => \div|Add0~86\);

-- Location: FF_X88_Y36_N26
\div|ticks[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \div|Add0~85_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(3));

-- Location: LABCELL_X88_Y36_N39
\div|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~81_sumout\ = SUM(( \div|ticks\(4) ) + ( GND ) + ( \div|Add0~86\ ))
-- \div|Add0~82\ = CARRY(( \div|ticks\(4) ) + ( GND ) + ( \div|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_ticks\(4),
	cin => \div|Add0~86\,
	sumout => \div|Add0~81_sumout\,
	cout => \div|Add0~82\);

-- Location: LABCELL_X88_Y36_N6
\div|ticks[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|ticks[4]~feeder_combout\ = ( \div|Add0~81_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \div|ALT_INV_Add0~81_sumout\,
	combout => \div|ticks[4]~feeder_combout\);

-- Location: FF_X88_Y36_N8
\div|ticks[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|ticks[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(4));

-- Location: LABCELL_X88_Y36_N42
\div|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~77_sumout\ = SUM(( \div|ticks\(5) ) + ( GND ) + ( \div|Add0~82\ ))
-- \div|Add0~78\ = CARRY(( \div|ticks\(5) ) + ( GND ) + ( \div|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(5),
	cin => \div|Add0~82\,
	sumout => \div|Add0~77_sumout\,
	cout => \div|Add0~78\);

-- Location: LABCELL_X88_Y36_N27
\div|ticks[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|ticks[5]~feeder_combout\ = ( \div|Add0~77_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \div|ALT_INV_Add0~77_sumout\,
	combout => \div|ticks[5]~feeder_combout\);

-- Location: FF_X88_Y36_N29
\div|ticks[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|ticks[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(5));

-- Location: LABCELL_X88_Y36_N45
\div|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~73_sumout\ = SUM(( \div|ticks\(6) ) + ( GND ) + ( \div|Add0~78\ ))
-- \div|Add0~74\ = CARRY(( \div|ticks\(6) ) + ( GND ) + ( \div|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_ticks\(6),
	cin => \div|Add0~78\,
	sumout => \div|Add0~73_sumout\,
	cout => \div|Add0~74\);

-- Location: FF_X88_Y36_N11
\div|ticks[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \div|Add0~73_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(6));

-- Location: LABCELL_X88_Y36_N48
\div|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~69_sumout\ = SUM(( \div|ticks\(7) ) + ( GND ) + ( \div|Add0~74\ ))
-- \div|Add0~70\ = CARRY(( \div|ticks\(7) ) + ( GND ) + ( \div|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_ticks\(7),
	cin => \div|Add0~74\,
	sumout => \div|Add0~69_sumout\,
	cout => \div|Add0~70\);

-- Location: FF_X88_Y36_N20
\div|ticks[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \div|Add0~69_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(7));

-- Location: LABCELL_X88_Y36_N51
\div|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~65_sumout\ = SUM(( \div|ticks\(8) ) + ( GND ) + ( \div|Add0~70\ ))
-- \div|Add0~66\ = CARRY(( \div|ticks\(8) ) + ( GND ) + ( \div|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_ticks\(8),
	cin => \div|Add0~70\,
	sumout => \div|Add0~65_sumout\,
	cout => \div|Add0~66\);

-- Location: LABCELL_X88_Y36_N15
\div|ticks[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|ticks[8]~feeder_combout\ = ( \div|Add0~65_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \div|ALT_INV_Add0~65_sumout\,
	combout => \div|ticks[8]~feeder_combout\);

-- Location: FF_X88_Y36_N17
\div|ticks[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|ticks[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(8));

-- Location: LABCELL_X88_Y36_N54
\div|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~61_sumout\ = SUM(( \div|ticks\(9) ) + ( GND ) + ( \div|Add0~66\ ))
-- \div|Add0~62\ = CARRY(( \div|ticks\(9) ) + ( GND ) + ( \div|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(9),
	cin => \div|Add0~66\,
	sumout => \div|Add0~61_sumout\,
	cout => \div|Add0~62\);

-- Location: FF_X88_Y36_N5
\div|ticks[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \div|Add0~61_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(9));

-- Location: LABCELL_X88_Y36_N57
\div|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~57_sumout\ = SUM(( \div|ticks\(10) ) + ( GND ) + ( \div|Add0~62\ ))
-- \div|Add0~58\ = CARRY(( \div|ticks\(10) ) + ( GND ) + ( \div|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(10),
	cin => \div|Add0~62\,
	sumout => \div|Add0~57_sumout\,
	cout => \div|Add0~58\);

-- Location: FF_X88_Y36_N59
\div|ticks[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~57_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(10));

-- Location: LABCELL_X88_Y35_N0
\div|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~53_sumout\ = SUM(( \div|ticks\(11) ) + ( GND ) + ( \div|Add0~58\ ))
-- \div|Add0~54\ = CARRY(( \div|ticks\(11) ) + ( GND ) + ( \div|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(11),
	cin => \div|Add0~58\,
	sumout => \div|Add0~53_sumout\,
	cout => \div|Add0~54\);

-- Location: FF_X88_Y35_N2
\div|ticks[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~53_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(11));

-- Location: LABCELL_X88_Y35_N3
\div|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~49_sumout\ = SUM(( \div|ticks\(12) ) + ( GND ) + ( \div|Add0~54\ ))
-- \div|Add0~50\ = CARRY(( \div|ticks\(12) ) + ( GND ) + ( \div|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(12),
	cin => \div|Add0~54\,
	sumout => \div|Add0~49_sumout\,
	cout => \div|Add0~50\);

-- Location: FF_X88_Y35_N5
\div|ticks[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~49_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(12));

-- Location: LABCELL_X88_Y35_N6
\div|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~45_sumout\ = SUM(( \div|ticks\(13) ) + ( GND ) + ( \div|Add0~50\ ))
-- \div|Add0~46\ = CARRY(( \div|ticks\(13) ) + ( GND ) + ( \div|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(13),
	cin => \div|Add0~50\,
	sumout => \div|Add0~45_sumout\,
	cout => \div|Add0~46\);

-- Location: FF_X88_Y35_N8
\div|ticks[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~45_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(13));

-- Location: LABCELL_X88_Y35_N9
\div|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~41_sumout\ = SUM(( \div|ticks\(14) ) + ( GND ) + ( \div|Add0~46\ ))
-- \div|Add0~42\ = CARRY(( \div|ticks\(14) ) + ( GND ) + ( \div|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(14),
	cin => \div|Add0~46\,
	sumout => \div|Add0~41_sumout\,
	cout => \div|Add0~42\);

-- Location: FF_X88_Y35_N11
\div|ticks[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~41_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(14));

-- Location: LABCELL_X88_Y35_N12
\div|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~37_sumout\ = SUM(( \div|ticks\(15) ) + ( GND ) + ( \div|Add0~42\ ))
-- \div|Add0~38\ = CARRY(( \div|ticks\(15) ) + ( GND ) + ( \div|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(15),
	cin => \div|Add0~42\,
	sumout => \div|Add0~37_sumout\,
	cout => \div|Add0~38\);

-- Location: FF_X88_Y35_N14
\div|ticks[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~37_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(15));

-- Location: LABCELL_X88_Y35_N15
\div|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~33_sumout\ = SUM(( \div|ticks\(16) ) + ( GND ) + ( \div|Add0~38\ ))
-- \div|Add0~34\ = CARRY(( \div|ticks\(16) ) + ( GND ) + ( \div|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(16),
	cin => \div|Add0~38\,
	sumout => \div|Add0~33_sumout\,
	cout => \div|Add0~34\);

-- Location: FF_X88_Y35_N17
\div|ticks[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~33_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(16));

-- Location: LABCELL_X88_Y35_N18
\div|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~29_sumout\ = SUM(( \div|ticks\(17) ) + ( GND ) + ( \div|Add0~34\ ))
-- \div|Add0~30\ = CARRY(( \div|ticks\(17) ) + ( GND ) + ( \div|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(17),
	cin => \div|Add0~34\,
	sumout => \div|Add0~29_sumout\,
	cout => \div|Add0~30\);

-- Location: FF_X88_Y35_N20
\div|ticks[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(17));

-- Location: LABCELL_X88_Y35_N21
\div|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~25_sumout\ = SUM(( \div|ticks\(18) ) + ( GND ) + ( \div|Add0~30\ ))
-- \div|Add0~26\ = CARRY(( \div|ticks\(18) ) + ( GND ) + ( \div|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(18),
	cin => \div|Add0~30\,
	sumout => \div|Add0~25_sumout\,
	cout => \div|Add0~26\);

-- Location: FF_X88_Y35_N23
\div|ticks[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(18));

-- Location: LABCELL_X88_Y35_N24
\div|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~21_sumout\ = SUM(( \div|ticks\(19) ) + ( GND ) + ( \div|Add0~26\ ))
-- \div|Add0~22\ = CARRY(( \div|ticks\(19) ) + ( GND ) + ( \div|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(19),
	cin => \div|Add0~26\,
	sumout => \div|Add0~21_sumout\,
	cout => \div|Add0~22\);

-- Location: FF_X88_Y35_N26
\div|ticks[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(19));

-- Location: LABCELL_X88_Y35_N27
\div|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~17_sumout\ = SUM(( \div|ticks\(20) ) + ( GND ) + ( \div|Add0~22\ ))
-- \div|Add0~18\ = CARRY(( \div|ticks\(20) ) + ( GND ) + ( \div|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(20),
	cin => \div|Add0~22\,
	sumout => \div|Add0~17_sumout\,
	cout => \div|Add0~18\);

-- Location: FF_X88_Y35_N29
\div|ticks[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(20));

-- Location: LABCELL_X88_Y35_N30
\div|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~13_sumout\ = SUM(( \div|ticks\(21) ) + ( GND ) + ( \div|Add0~18\ ))
-- \div|Add0~14\ = CARRY(( \div|ticks\(21) ) + ( GND ) + ( \div|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(21),
	cin => \div|Add0~18\,
	sumout => \div|Add0~13_sumout\,
	cout => \div|Add0~14\);

-- Location: FF_X88_Y35_N32
\div|ticks[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(21));

-- Location: LABCELL_X88_Y35_N33
\div|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~9_sumout\ = SUM(( \div|ticks\(22) ) + ( GND ) + ( \div|Add0~14\ ))
-- \div|Add0~10\ = CARRY(( \div|ticks\(22) ) + ( GND ) + ( \div|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(22),
	cin => \div|Add0~14\,
	sumout => \div|Add0~9_sumout\,
	cout => \div|Add0~10\);

-- Location: FF_X88_Y35_N35
\div|ticks[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(22));

-- Location: LABCELL_X88_Y35_N36
\div|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~5_sumout\ = SUM(( \div|ticks\(23) ) + ( GND ) + ( \div|Add0~10\ ))
-- \div|Add0~6\ = CARRY(( \div|ticks\(23) ) + ( GND ) + ( \div|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(23),
	cin => \div|Add0~10\,
	sumout => \div|Add0~5_sumout\,
	cout => \div|Add0~6\);

-- Location: FF_X88_Y35_N38
\div|ticks[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \div|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(23));

-- Location: LABCELL_X88_Y35_N39
\div|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add0~1_sumout\ = SUM(( \div|ticks\(24) ) + ( GND ) + ( \div|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_ticks\(24),
	cin => \div|Add0~6\,
	sumout => \div|Add0~1_sumout\);

-- Location: FF_X88_Y35_N56
\div|ticks[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	asdata => \div|Add0~1_sumout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|ticks\(24));

-- Location: LABCELL_X88_Y37_N15
\cnt|dff0|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff0|q~0_combout\ = !\cnt|dff0|q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cnt|dff0|ALT_INV_q~q\,
	combout => \cnt|dff0|q~0_combout\);

-- Location: LABCELL_X88_Y37_N54
\cnt|dff0|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff0|q~feeder_combout\ = \cnt|dff0|q~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \cnt|dff0|ALT_INV_q~0_combout\,
	combout => \cnt|dff0|q~feeder_combout\);

-- Location: IOIBUF_X89_Y37_N55
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: FF_X88_Y37_N26
\resetBuff|buffered\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \div|ticks\(24),
	asdata => \SW[9]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \resetBuff|buffered~q\);

-- Location: FF_X88_Y37_N56
\cnt|dff0|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \div|ticks\(24),
	d => \cnt|dff0|q~feeder_combout\,
	clrn => \resetBuff|buffered~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt|dff0|q~q\);

-- Location: MLABCELL_X87_Y37_N51
\cnt|dff1|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff1|q~0_combout\ = !\cnt|dff1|q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \cnt|dff1|ALT_INV_q~q\,
	combout => \cnt|dff1|q~0_combout\);

-- Location: MLABCELL_X87_Y37_N18
\cnt|dff1|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff1|q~feeder_combout\ = \cnt|dff1|q~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \cnt|dff1|ALT_INV_q~0_combout\,
	combout => \cnt|dff1|q~feeder_combout\);

-- Location: FF_X87_Y37_N20
\cnt|dff1|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cnt|dff0|q~q\,
	d => \cnt|dff1|q~feeder_combout\,
	clrn => \resetBuff|buffered~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt|dff1|q~q\);

-- Location: MLABCELL_X87_Y37_N54
\cnt|dff2|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff2|q~0_combout\ = !\cnt|dff2|q~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \cnt|dff2|ALT_INV_q~q\,
	combout => \cnt|dff2|q~0_combout\);

-- Location: MLABCELL_X87_Y37_N36
\cnt|dff2|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff2|q~feeder_combout\ = \cnt|dff2|q~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \cnt|dff2|ALT_INV_q~0_combout\,
	combout => \cnt|dff2|q~feeder_combout\);

-- Location: FF_X87_Y37_N38
\cnt|dff2|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cnt|dff1|q~q\,
	d => \cnt|dff2|q~feeder_combout\,
	clrn => \resetBuff|buffered~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt|dff2|q~q\);

-- Location: FF_X88_Y37_N44
\cnt|dff3|q~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cnt|dff2|q~q\,
	d => \cnt|dff3|q~feeder_combout\,
	clrn => \resetBuff|buffered~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt|dff3|q~DUPLICATE_q\);

-- Location: LABCELL_X88_Y37_N51
\cnt|dff3|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff3|q~0_combout\ = ( !\cnt|dff3|q~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \cnt|dff3|ALT_INV_q~DUPLICATE_q\,
	combout => \cnt|dff3|q~0_combout\);

-- Location: LABCELL_X88_Y37_N42
\cnt|dff3|q~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \cnt|dff3|q~feeder_combout\ = ( \cnt|dff3|q~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \cnt|dff3|ALT_INV_q~0_combout\,
	combout => \cnt|dff3|q~feeder_combout\);

-- Location: FF_X88_Y37_N43
\cnt|dff3|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \cnt|dff2|q~q\,
	d => \cnt|dff3|q~feeder_combout\,
	clrn => \resetBuff|buffered~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt|dff3|q~q\);

-- Location: MLABCELL_X3_Y77_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


