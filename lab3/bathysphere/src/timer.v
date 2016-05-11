/*This module is activated when either the departure or the arrival signal is activated 
  in which case it will count down from 5 to 0. In the case of depressurization it will countdown 
  from 8 to 0, and in the case of pressurization it will count down from 7 to 0 */
module timer(val , finished , clk , startingVal , change , start);

	output reg [3:0] val;
	output reg finished;
	input clk , change , start;
	input [3:0] startingVal;
	

	always@(posedge clk) 
	begin
		if(!start)
		begin
			val <= startingVal;
			finished <= 0;
		end
		/* when the module has counted down to 0 it sends a true finish signal back 
		   which allows the interlock module to exit either the wait5, timer fill or 
			timer drain module */
		else if(val == 4'b0000)
			finished <= 1;
			
		/*The following module keeps subtracting 1 from the value that was sent by the main module 
		  in the case of wait its 5 in the case of pressurize its 7 and in the case of depressurize its 8*/
		else if(change)
			val <= val - 4'b0001;
	end
endmodule
