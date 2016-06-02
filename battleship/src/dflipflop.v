/*
Author:  Lab-provided code
Title: 	 D flip-flop
Summary: Behavioral model of a d flip-flop
*/

module dflipflop(q, qBar, D, clk, rst);
	input D, clk, rst; 	// DFF input, clock, reset
	output q, qBar;		// DFF output, DFF negated output
	reg q;
	not n1 (qBar, q);	// negate q
	
	// flip-flop storage logic
	always@ (negedge rst or posedge clk)
	begin
		if(!rst)
			q = 0;
		else
			q = D;
	end
endmodule