module parallel_to_serial(out, data, counter, load, clk, rst); 
	output out ;
	input clk, rst, load; // What is the purpose of load?
	input [7:0] data; 
	input [3:0] counter;
	
	reg [7:0] temp;
	
	always @(posedge clk) begin
		if (!rst) begin 
	  		temp = 0; 
		end else if (load) begin
			temp = data; 
    		end else if (counter == 7) begin
	    		out = temp[7];
			temp = temp << 1;
		end
	end		
endmodule 
