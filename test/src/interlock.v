module interlock(doorCommand, timer, arrivalSignals, doors, pressurize, depressurize, clk, rst);


	input clk, rst;
	input [1:0] doors;
	input [1:0] arrivalSignals;
	input pressurize, depressurize;

	
	
	output reg [3:0] timer;
	output reg [2:0] doorCommand;
	parameter DOOR_COMMAND_IDLE = 3'b000;
	parameter CLOSE_INNER_DOOR = 3'b001;
	parameter OPEN_INNER_DOOR = 3'b010;
	parameter CLOSE_OUTER_DOOR = 3'b011;
	parameter OPEN_OUTER_DOOR = 3'b100;
	parameter DEPRESSURIZE = 3'b101;
	parameter PRESSURIZE = 3'b110;

	
	parameter OP_NOP = 2'b00;
	parameter OP_BATH_ARRIVING = 2'b01;
	parameter OP_BATH_LEAVING = 2'b10;
	
	
	
	parameter DOORS_CLOSED = 2'b00;
	parameter DOORS_OPENED = 2'b00;
	parameter INNER_DOOR_OPENED = 2'b01;
	parameter OUTER_DOOR_OPENED = 2'b10;
	
	
	
	reg [2:0] state;
	parameter OP_INIT = 3'b000;
	parameter OP_WAITING = 3'b001;
	parameter OP_PRESSURIZE = 3'b010;
	parameter OP_DEPRESSURIZE = 3'b011;
	parameter OP_OPEN_OUTER_DOOR = 3'b100;
	parameter OP_OPEN_INNER_DOOR = 3'b101;
	parameter OP_CLOSE_DOORS = 3'b110;
	
	
	reg [24:0] ticks;
	
	
	always @(posedge clk) begin
		if (!rst) begin
			state = OP_INIT;
			timer = 4'b0000;
			ticks = 25'b0;
		end else begin
			case (arrivalSignals) 
				OP_NOP: begin
				
				end
				
				
				OP_BATH_ARRIVING: begin

					case (state) 
						
						OP_INIT : begin
							timer = 5;
							ticks = 25'b0;
							state = OP_WAITING;
						end
					
						OP_WAITING : begin
							if (timer) begin
								ticks = ticks + 1;
								
								if (ticks == 25'b0) begin
									timer = timer - 4'b0001;
								end
							end else 
							if (doors == DOORS_CLOSED) begin
								timer = 7;
								doorCommand = CLOSE_INNER_DOOR;
								state = OP_PRESSURIZE;
							end
						end
						
						OP_PRESSURIZE : begin
							if (doors == INNER_DOOR_OPENED) begin
								timer = 7;
								doorCommand = CLOSE_INNER_DOOR;
							end else if (!depressurize && (doors == DOORS_CLOSED)) begin
								doorCommand = DEPRESSURIZE;
								ticks = ticks + 1;
								
								if (ticks == 25'b0) begin
									timer = timer - 4'b0001;
								end
							end
							
							if (timer == 0) begin
								doorCommand = OPEN_OUTER_DOOR;
								state = OP_OPEN_OUTER_DOOR;
							end
						end
						
						
						OP_OPEN_OUTER_DOOR : begin
							if (doors == OUTER_DOOR_OPENED) begin
								timer = 8;
								doorCommand = CLOSE_OUTER_DOOR;
								state = OP_DEPRESSURIZE;
							end
						end
						
						OP_DEPRESSURIZE : begin
							if (doors == OUTER_DOOR_OPENED) begin
								timer = 8;
								doorCommand = CLOSE_OUTER_DOOR;
							end 
							else if (!pressurize && (doors == DOORS_CLOSED)) begin
								doorCommand = PRESSURIZE;
								ticks = ticks + 1;
								
								if (ticks == 25'b0) begin
									timer = timer - 4'b0001;
								end
							end
							
							if (timer == 0) begin
								state = OP_OPEN_INNER_DOOR;
							end
						end
						
						OP_OPEN_INNER_DOOR : begin   // Done CHECK THIS
							if (doors == INNER_DOOR_OPENED) begin
								state = OP_WAITING;
							end
						end
						
						
					
					endcase
				end
					
					
				OP_BATH_LEAVING : begin
						
					case (state) 
					
						OP_INIT : begin
							timer = 5;
							state = OP_WAITING;
						end

						OP_WAITING : begin
							if (timer) begin
								timer = timer  - 4'b0001;
							end else 
							if (doors == INNER_DOOR_OPENED) begin
								state = OP_CLOSE_DOORS;
							end
						end
						
					
						OP_PRESSURIZE : begin
							timer = 8;
							
							while (timer && (doors == DOORS_CLOSED)) begin
								timer = timer  - 4'b0001;
							end
							
							if (timer == 0) begin
								state = OPEN_OUTER_DOOR;
							end
						end
						
						OP_OPEN_OUTER_DOOR : begin
							if (doors == OUTER_DOOR_OPENED) begin
								state = OP_DEPRESSURIZE;
							end
						
						end
					
						OP_DEPRESSURIZE : begin
							timer = 8;
							
							while (timer && (doors == DOORS_CLOSED)) begin
								timer = timer  - 4'b0001;
							end
							
							if (timer == 0) begin
								state = OP_OPEN_INNER_DOOR;
							end
						
						end
						
						OP_OPEN_INNER_DOOR : begin
							if (doors == INNER_DOOR_OPENED) begin
								state = OP_WAITING;
							end
						end
					
					endcase
				end

			endcase
		end
	end
	
	
endmodule
