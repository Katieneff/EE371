module timer(val , finished , clk , startingVal , change , start);

	output reg [3:0] val;
	output reg finished;
	input clk , change , start;
	input [3:0] startingVal;
	
	// EDIT: Changed bits into decimals
	always@(posedge clk) 
	begin
		if(!start)
		begin
			val <= startingVal;
			finished <= 0;
		end
		else if(val == 0) // EXAMPLE EDIT: Changed "4'b0001" to "1"
			finished <= 1; 
		else if(change)
			val <= val - 1; 
	end
endmodule
