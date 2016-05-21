module transmit_enable(en, data);
	output en;
	input [3:0] data;
	
	
	assign en = (!data) ? 1'b1 : 1'b0;


endmodule