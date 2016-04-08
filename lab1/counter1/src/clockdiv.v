module clock_divider (clk, divided_clocks);
 input clk;
 output reg [31:0] divided_clocks;


 initial
 divided_clocks = 0;
 
 always @(posedge clk)
	divided_clocks = divided_clocks + 1;

endmodule 


