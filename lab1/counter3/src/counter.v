`include "dflipflop.v"

module counter(out, clk, rst);
	output reg [3:0] out;
	input clk, rst;

	
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