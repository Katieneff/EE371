/*
Author:  Katie Neff
Title: 	 counter
Summary: 4-bit synchronous Johnson down counter with active low reset
		 that uses behavioural model logic.
*/

module counter(out, clk, rst);
	output reg [3:0] out;
	input clk, rst;

	// Counter logic that emulates a Johnson down counter
	always @(posedge clk) begin
		if (!rst) begin
			out = 4'b0000;
		end else begin
			out[0] <= ~out[3];
			out[1] <= out[0];
			out[2] <= out[1];
			out[3] <= out[2];
		end
	end
endmodule