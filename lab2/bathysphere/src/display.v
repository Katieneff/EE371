/* This is the display module where all the outputs on HEX 0 and HEX 1 are produced
   this takes values from the main which acts as a signal for this module to know which
   case to activate. */

module display (letter , num , clk , drainVal , fillVal , draining , filling , waiting , waitVal);

	output reg [6:0] letter , num;
	input clk , draining , filling , waiting;
	input [3:0] drainVal , fillVal , waitVal;
	
	
	always @(posedge clk)
	//The following case keeps hex off if the interlock module 
	//is neither in the waiting, pressurization nor depressurization state
	begin
		if(!draining && !filling && !waiting)
			begin
				letter <= ~7'b0000000;
				num <= ~7'b0000000;
			end
		else
		begin
		
			/* The following if statement activates if the interlock module is in the 
			   depressurization state and it sends the draining signal as true 
			   it starts to display from number 8. These numbers are send by the timer module 
			   and they decrease by 1 every clock cycle as long as the user is holding down 
			   key 2 */
			if(draining)
				begin
				letter <= ~7'b1011110;
				case(drainVal)
				
					// Light: 6543210 
					0: num <= ~7'b0111111; 
					1: num <= ~7'b0000110; 
					2: num <= ~7'b1011011; 
					3: num <= ~7'b1001111; 
					4: num <= ~7'b1100110; 
					5: num <= ~7'b1101101; 
					6: num <= ~7'b1111101; 
					7: num <= ~7'b0000111; 
					8: num <= ~7'b1111111; 
					default: num <= 7'bX;
				endcase 
				end
				
			/* The following else if statement activates if the interlock module is in the 
			   pressurization state and it sends the filling signal as true 
			   it starts to display from number 7. These numbers are send by the timer module 
			   and they decrease by 1 every clock cycle as long as the user is holding down 
			   key 1 */	
			else if(filling)
				begin
				letter <= ~7'b1110011;
				case(fillVal)
					// Light: 6543210 
					0: num <= ~7'b0111111; 
					1: num <= ~7'b0000110; 
					2: num <= ~7'b1011011; 
					3: num <= ~7'b1001111; 
					4: num <= ~7'b1100110; 
					5: num <= ~7'b1101101; 
					6: num <= ~7'b1111101; 
					7: num <= ~7'b0000111; 
					8: num <= ~7'b1111111; 
					default: num <= 7'bX; 
				endcase
				end 
			else
				begin
				letter <= ~7'b1000000;
				
			/* The following case activates if the interlock module is in the 
			   waiting state which is activated by the arrival or departure signal it 
			   stays in this case statement until it reaches the 0 number from 5 and sends 
			   a signal back to timer to stop and this case also ends .*/
				case(waitVal)
					// Light: 6543210 
					0: num <= ~7'b0111111; 
					1: num <= ~7'b0000110; 
					2: num <= ~7'b1011011; 
					3: num <= ~7'b1001111; 
					4: num <= ~7'b1100110; 
					5: num <= ~7'b1101101; 
					6: num <= ~7'b1111101; 
					7: num <= ~7'b0000111; 
					8: num <= ~7'b1111111; 
					default: num <= 7'bX; 
				endcase
				end
			end
		end

	
endmodule

