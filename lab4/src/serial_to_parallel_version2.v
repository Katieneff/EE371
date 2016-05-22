module serial_to_parallel(clk, 
						  rst,
						  data,
						  out,
						  en);
                          
	output [7:0] out;
	reg [3:0] temp;
	input data, clk, rst; 
	
	assign out = temp; 
	always @(posedge clk) begin
		if (rst)
			temp <= 0;
			
		else if(en)begin
			temp[7] <= data; 
			temp <= temp >> 1; 
			end 
endmodule
	
	
	
	