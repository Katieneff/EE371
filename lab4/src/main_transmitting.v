module main_transmitting(LEDR, CLOCK_50, KEY, GPIO_0);
	output [9:0] LEDR;
	input [35:0] GPIO_0;
	input CLOCK_50;
	input [0:0] KEY;
	
	parameter majorClock = 11;
	parameter minorClock = 7;
	
	wire [31:0] clk;
	clockdiv clockdiv(clk, CLOCK_50);

	wire character_sent;
	reg transmit_enable;
	reg load;
	reg [7:0] data_bus;
	wire serial_data;
/*
	microprocessor microprocessor(
					.character_received_export(),
					.character_sent_export(character_sent),
					.clk_clk(CLOCK_50),
					.data_bus_in_port(),
					.data_bus_out_port(data_bus),
					.load_export(load),
					.reset_reset_n(KEY),
					.transmit_enable_export(transmit_enable)

	);*/
	
	transmitter transmitter(
						.data_out(serial_data), 
						.character_sent(character_sent), 
						.data_in(data_bus), 
						.load(load), 
						.transmit_enable(transmit_enable), 
						.minorClk(clk[minorClock]), 
						.majorClk(clk[majorClock]), 
						.rst(KEY)
	);

	
	reg [7:0] data0;
	reg [7:0] data1;
	reg [7:0] data2;
	reg [7:0] data3;
	
	reg [2:0] state;
	
	parameter OP_LOAD0= 3'b0;
	parameter OP_TRANSMIT0 = 3'b1;
	parameter OP_LOAD1= 3'b10;
	parameter OP_TRANSMIT1 = 3'b11;
	parameter OP_LOAD2= 3'b100;
	parameter OP_TRANSMIT2 = 3'b101;
	parameter OP_LOAD3= 3'b110;
	parameter OP_TRANSMIT3 = 3'b111;
	
	always @(posedge clk[15]) begin
		if (!KEY[0]) begin
			data0 = 8'b01110100;
			data1 = 8'b01100101;
			data2 = 8'b01110011;
			data3 = 8'b01110100;
			state = 3'b0;
			transmit_enable = 0;
			load = 0;
		end else begin
			case (state) 
			
				OP_LOAD0: begin
					transmit_enable <= 1; // changed from 0 to 1 and did this for the rest
					data_bus <= data0;
					load <=1;
					state <= OP_TRANSMIT0;
				end
				
				OP_TRANSMIT0: begin
					transmit_enable <= 0;
					state <= OP_LOAD1;
					load <= 0;
				end
				
				
				OP_LOAD1: begin
					transmit_enable <= 1;
					data_bus <= data1;
					load <= 1;
					state <= OP_TRANSMIT1;
				end
				
				OP_TRANSMIT1: begin
					transmit_enable <= 0;
					state <= OP_LOAD2;
					load <= 0;
				end
				
				OP_LOAD2: begin
					transmit_enable <= 1;
					data_bus <= data2;
					load <=1;
					state <= OP_TRANSMIT2;
				end
				
				OP_TRANSMIT2: begin
					transmit_enable <= 0;
					state <= OP_LOAD3;
					load <= 0;
				end
				
				OP_LOAD3: begin
					transmit_enable <= 1;
					data_bus <= data3;
					load <=1;
					state <= OP_TRANSMIT3;
				end
				
				OP_TRANSMIT3: begin
					transmit_enable <= 0;
					state <= OP_LOAD0;
					load <= 0;
				end
				
			
				
			endcase
			
		end
	end
	
endmodule
