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

#define data_bus_in (volatile char *) 0x30a0
#define data_bus_out (volatile char *) 0x3050
#define load (volatile char *) 0x3060
#define transmit_enable (volatile char *) 0x3090
#define character_received (volatile char *) 0x3070
#define character_sent (volatile char *) 0x3080
#define sram_address_sel (volatile char *) 0x3040
#define sram_oe (volatile char *) 0x3010
#define sram_we (volatile char *) 0x3000
#define sram_data (volatile char *) 0x3020

#define keepScore ( int) 0xc8
#define counter (int) 0xc9
#define battleshipCounter (int) 0xc8
#define destroyerCounter (int) 0xc9

void sramWrite(int address, int data);
int sramRead(int address);
void makeBoard();
void printBoard();
void gameInit();
void playerOnePlay();
void playerTwoPlay();
void send();
unsigned int receiveNum();
int getPlayerNum();
unsigned int receiveChar();
void sendMissle();
void receiveHitResult();
void receiveMissle();

int main() {
	*transmit_enable = 0;
	*sram_we = 1;
	*sram_oe = 1;
	gameInit();
	int playerNum = getPlayerNum();
	printBoard();

	while (sramRead(counter) < 17) {

		switch (playerNum) {
		case '1':
			playerOnePlay();
			break;
		case '2':
			playerTwoPlay();
			break;
		}
	}

	return 0;
}

void sramWrite(int address, int data) {
	*sram_oe = 1;
	*sram_address_sel = address;
	*sram_we = 0;
	*sram_data = data;
	*sram_we = 1;
}

int sramRead(int address) {
	*sram_we = 1;
	*sram_oe = 0;
	*sram_address_sel = address;
	return *sram_data ;
}

void makeBoard() {
	int i, j;
	for (i = 0; i < 10; i++) {
		for (j = 0; j < 10; j++) {
			sramWrite(i * 10 + j, 'w');
		}
	}

	for (i = 0; i < 4; i++) {
		sramWrite(i * 10 + 30 + 7, 'd');
	}

	for (i = 0; i < 2; i++) {
		sramWrite(90 + i + 8, 'd');
	}

}

void printBoard() {
	int i, j;
	alt_printf("  0 1 2 3 4 5 6 7 8 9\n"); // prints the top row of number
	for (i = 0; i < 10; i++) {
		alt_printf("%x ", i);
		for (j = 0; j < 10; j++) {
			alt_printf("%c ", sramRead(j + i * 10));
		}
		alt_putstr("\n");
	}
}

void gameInit() {
	sramWrite(keepScore, 0);
	sramWrite(counter, 0);
	sramWrite(destroyerCounter, 0);
	sramWrite(battleshipCounter, 0);

	makeBoard();

	alt_putstr("Welcome to Battleship!\n");
}

int getPlayerNum() {
	alt_putstr("Are you player 1 or player 2? \n");
	int num = alt_getchar();
	if (num == '\n') {
		num = alt_getchar();
	}

	return num;
}

void playerOnePlay() {
	/*
	 alt_putstr("Type a number\n");
	 unsigned int h = alt_getchar();
	 if (h == '\n') {
	 h = alt_getchar();
	 }
	 send(h);
	 alt_putstr("Type a character\n");
	 unsigned int k = alt_getchar();
	 if (k == '\n') {
	 k = alt_getchar();
	 }
	 send(k);
	 receiveNum();
	 receiveChar();*/
	sendMissle();
	receiveHitResult();
	alt_putstr("Player 2's turn... ");
	receiveMissle();

}

void playerTwoPlay() {
	/*receiveNum();
	 receiveChar();

	 alt_putstr("Type a number\n");
	 unsigned int h = alt_getchar();
	 if (h == '\n') {
	 h = alt_getchar();
	 }
	 send(h);

	 alt_putstr("Type a character\n");
	 unsigned int k = alt_getchar();
	 if (k == '\n') {
	 k = alt_getchar();
	 }
	 send(k);*/
	alt_putstr("Player 1's turn... ");
	receiveMissle();
	sendMissle();
	receiveHitResult();
}

void send(unsigned int str) {
	*data_bus_out = str;
	*transmit_enable = 0;
	*load = 1;
	usleep(100);
	*load = 0;
	while (1) {
		if (*character_sent) {
			/* DEBUG
			 alt_printf("%c sent!\n", str);
			 */
			usleep(100);
			return;
		}
	}
	return;
}

unsigned int receiveNum() {
	/* DEBUG
	 alt_putstr("Receiving number...\n");
	 */
	unsigned int data;
	*transmit_enable = 1;
	while (1) {
		if (*character_received) {
			usleep(100);
			*transmit_enable = 0;
			data = *data_bus_in;
			/* DEBUG
			 alt_putstr("Number received\n");
			 */

			if (data > 57) {
				data = data >> 1;
				/* DEBUG
				 alt_printf("Data corrupt, hot fix: %c -> %c\n", *data_bus_in,
				 data);
				 */
			}
			/* DEBUG
			 alt_printf("Data as a char: %c\n", data);
			 alt_printf("Data as an int: %x\n", data);
			 */

			return data;
		}
	}
}

unsigned int receiveChar() {
	/* DEBUG
	 alt_putstr("Receiving character...\n");
	 */
	unsigned int data;
	*transmit_enable = 1;
	while (1) {
		if (*character_received) {
			usleep(100);
			*transmit_enable = 0;
			data = *data_bus_in;
			/* DEBUG
			 alt_putstr("Character received\n");
			 */

			if (data > 122) {
				data = (data >> 1) & 127;
				/* DEBUG
				 alt_printf("Data corrupt, hot fix: %c -> %c\n", *data_bus_in,
				 data);
				 */
			}
			/* DEBUG
			 alt_printf("Data as a char: %c\n", data);
			 alt_printf("Data as an int: %x\n", data);
			 */

			return data;
		}
	}

}

void sendMissle() {

	alt_putstr("Enter latitude: ");
	unsigned int lat = alt_getchar();
	if (lat == '\n') {
		lat = alt_getchar();
	}

	send(lat);

	alt_putstr("Enter longitude: ");
	unsigned int lon = alt_getchar();
	if (lon == '\n') {
		lon = alt_getchar();
	}

	send(lon);
}

void receiveMissle() {
	unsigned int h = receiveNum() - 48;
	unsigned int k = receiveNum() - 48;
	//sramWrite(h, lon);
	//sramWrite(k, lat);

	switch (sramRead(h * 10 + k)) {
	// when its a miss
	case 'w':
	case 'x':
		alt_putstr("Miss!\n");
		send('m');
		break;
	case 'd':
	case 'b':
	case 'r':
	case 's':
	case 'c':
		alt_putstr("You were hit! \n");
		sramWrite(h * 10 + k, 'x');
		send('x');
		break;
	default:
		alt_putstr("Error\n");
		send('e');
		break;
	}

	printBoard();

}

void receiveHitResult() {
	unsigned int status = receiveChar();
	switch (status) {
	case 'm':
		alt_putstr("You missed!\n");
		break;
	case 'x':
		alt_putstr("You hit!\n");
		break;
	default:
		alt_putstr("Error\n");
		break;
	}

}
