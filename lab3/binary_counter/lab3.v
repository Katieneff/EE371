module lab3(CLOCK_50, SW, LEDR);

input CLOCK_50;
input [9:0] SW;
output [9:0] LEDR;


 first_nios2_system first (
									.clk_clk(CLOCK_50),
								   .led_pio_external_connection_export(LEDR[7:0]), 
									.reset_reset_n(SW[9])                       
								  );

endmodule
