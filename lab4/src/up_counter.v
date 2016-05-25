module up_counter(out, clk, rst);
	output [3:0] out;
	input clk, rst;
	
	dflipflop dff0(out[0], q0_bar, q0_bar, clk, rst);
	dflipflop dff1(out[1], q1_bar, q1_bar, q0_bar, rst);
	dflipflop dff2(out[2], q2_bar, q2_bar, q1_bar, rst);
	dflipflop dff3(out[3], q3_bar, q3_bar, q2_bar, rst);

endmodule