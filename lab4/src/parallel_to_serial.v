module parallel_to_serial(clk,
						rst
						data,
						out,
						load,
						en); 

	input clk, rst, en, load;
	input [7:0] data; 
	output out ;
	reg [7:0] temp;
	
	always @(posedge clk)begin
	if (rst) 
	  temp <= 0; 
	else if (load)
		temp <= data; 
    else if (en)begin
	    out <= temp [7];
		temp <= temp <<1;end
	end
		
	endmodule 