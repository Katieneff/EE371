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

#define keepScore (int) 0xc8
#define counter (int) 0xc9

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

	while (sramRead(keepScore) < 11) {

		switch (playerNum) {
		case '1':
			playerOnePlay();
			break;
		case '2':
			playerTwoPlay();
			break;
		}
	}

	alt_putstr("You win!");

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
			sramWrite(i * 10 + j, '~');
		}
	}

	for (i = 0; i < 4; i++) {
		sramWrite(i * 10 + 30 + 7, 'd');
	}

	for (i = 0; i < 2; i++) {
		sramWrite(90 + i + 8, 'd');
	}

	for (i = 0; i < 5; i++) {
		sramWrite(i * 10 + 11, 'd');
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
	sendMissle();
	receiveHitResult();
	alt_putstr("Player 2's turn... ");
	receiveMissle();

}

void playerTwoPlay() {
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

	switch (sramRead(h * 10 + k)) {
	// when its a miss
	case '~':
	case 'x':
		alt_putstr("Miss!\n");
		send('m');
		break;
	case 'd':
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
	int score = sramRead(keepScore);
	unsigned int status = receiveChar();
	switch (status) {
	case 'm':
		alt_putstr("You missed!\n");
		break;
	case 'x':
		alt_putstr("You hit!\n");
		score = score + 1;
		break;
	default:
		alt_putstr("Error\n");
		break;
	}
	sramWrite(keepScore, score);
	alt_printf("Your score: %x\n", score);
}
