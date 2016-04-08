// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.1.0 Build 186 12/03/2014 SJ Full Version"
// CREATED		"Fri Apr 08 15:51:10 2016"

module counter4(
	clk,
	rst,
	out0,
	out1,
	out2,
	out3
);


input wire	clk;
input wire	rst;
output wire	out0;
output wire	out1;
output wire	out2;
output wire	out3;

wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_23;
reg	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
reg	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_17;
reg	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;

assign	out0 = SYNTHESIZED_WIRE_22;
assign	out1 = SYNTHESIZED_WIRE_1;
assign	out2 = SYNTHESIZED_WIRE_2;
assign	out3 = SYNTHESIZED_WIRE_3;




always@(posedge clk or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_23 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_23 <= SYNTHESIZED_WIRE_22;
	end
end


always@(posedge clk or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_24 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_24 <= SYNTHESIZED_WIRE_1;
	end
end


always@(posedge clk or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_25 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_25 <= SYNTHESIZED_WIRE_2;
	end
end


always@(posedge clk or negedge rst)
begin
if (!rst)
	begin
	SYNTHESIZED_WIRE_28 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_28 <= SYNTHESIZED_WIRE_3;
	end
end

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_23 & SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_23 & SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_24 & SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_22 & SYNTHESIZED_WIRE_26 & SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_22 & SYNTHESIZED_WIRE_26 & SYNTHESIZED_WIRE_27 & SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_23 & SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_24 & SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_25 & SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_22 =  ~SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_26 =  ~SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_27 =  ~SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_17 =  ~SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_22 & SYNTHESIZED_WIRE_26;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21;


endmodule
