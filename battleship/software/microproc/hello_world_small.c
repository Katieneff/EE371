/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

#include "sys/alt_stdio.h"
#include <time.h>

#define data_bus_in (volatile char *) 0x3040
#define data_bus_out (volatile char *) 0x0000
#define load (volatile char *) 0x3000
#define transmit_enable (volatile char *) 0x3030
#define character_received (volatile char *) 0x3010
#define character_sent (volatile char *) 0x3020


int send (int* str);

int getPlayerNum();
int receive();
int playerOnePlay();


int main()
{ 
  alt_putstr("Hello from Nios II!\n");
  alt_putstr("Welcome to Battleship!\n");
  /* Event loop never exits. */

  int character;
  int data;


  *transmit_enable = 1;
  int playerNum = getPlayerNum();


  switch (playerNum) {
  	  case '1':
  		alt_putstr("Player 1 rules\n");
  		playerOnePlay();
  		break;
  	  case '2':
  		alt_putstr("Player 2!\n");
  		break;
  }
/*
  while (1) {
	  if (*transmit_enable) {

			if (*character_received) {
			  usleep(100);
			  data = *data_bus_in;


			  if (data & 128) {
				  data = (data / 2) & 127;
				  alt_putstr("fix\n");
			  }
			  alt_putchar(data);
			}

	  } else {
		  character = alt_getchar();
		  send(character);
	  }

  }*/

  return 0;
}


int send(int * str) {
	alt_putstr("send!\n");
	*data_bus_out = str;
	*transmit_enable = 0;
	*load = 1;
	usleep(100);
	*load = 0;
	while (1) {
		if (*character_sent) {
			usleep(1000);
			return 0;
		}
	}

	return 0;

}

int receive() {
	alt_putstr("Receive!\n");
	int data;
	if (*character_received) {
	  usleep(100);
	  data = *data_bus_in;


	  if (data & 128) {
		  data = (data / 2) & 127;
		  alt_putstr("fix\n");
	  }
	  if (data == 'w') {
		  alt_putstr("You missed loser\n");
	  } else if (data == 'x') {
		  alt_putstr("Hit!\n");
	  } else if (data == 'y') {
		  alt_putstr("You win!\n");
	  } else if (data == 'z') {
		  alt_putstr("You loze!\n");
	  } else {
		  alt_putchar(data);
		  alt_putstr("\n");
	  }

	}
}


int getPlayerNum() {
	alt_putstr("Are you player 1 or player 2? \n");
	int num = alt_getchar();
	return num;


}


int playerOnePlay(){
	while(1)	{
		*transmit_enable = 0;
		int character = alt_getchar();
		send(character);
		*transmit_enable = 1;
		receive();
	}
	return 0;

}


int playerTwoPlay(){
	while (1) {
		*transmit_enable = 1;
		receive();

		*transmit_enable = 0;
		int character = alt_getchar();
		send(character);
	}
	return 0;
}
