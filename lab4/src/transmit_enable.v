module transmit_enable(en, data);
	output en;
	input data;
	
	
	assign en = (!data) ? 1'b1 : 1'b0;


endmodule