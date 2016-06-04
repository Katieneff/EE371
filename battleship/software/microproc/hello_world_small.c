#include "sys/alt_stdio.h"
#include <time.h>

#define data_bus_in (volatile char *) 0x3040
#define data_bus_out (volatile char *) 0x0000
#define load (volatile char *) 0x3000
#define transmit_enable (volatile char *) 0x3030
#define character_received (volatile char *) 0x3010
#define character_sent (volatile char *) 0x3020

#define WATER_CHAR (volatile char) 'w'
#define MISS_CHAR (volatile char) 'x'
#define HIT_CHAR (volatile char) 'm'
#define BATTLESHIP_CHAR (volatile char) 'b'
#define CRUISER_CHAR (volatile char) 'r'
#define CARRIER_CHAR (volatile char) 'c'
#define SUBMARINE_CHAR (volatile char) 's'
#define DESTROYER_CHAR (volatile char) 'd'
#define NO_OP_CHAR (volatile char) 'n'


// Globals
int carrierCounter;
int battleshipCounter;
int cruiserCounter;
int submarineCounter;
int destroyerCounter;
int counter;
char gameBoard[10][10];


int getPlayerNum();
void gameInit();
void printBoard();
int playerOnePlay();
int playerTwoPlay();
void attack();
void getCoordinates();
int send(unsigned int str);
unsigned int receive();
int checkShot(char gameBoard[10][10], int i, int j);
void getAttacked();
int send(unsigned int str);

int main() {

	alt_putstr("Welcome to Battleship!\n");

	int playerNum = getPlayerNum();

	gameInit();
	int keepScore = 0;

	do {
		switch (playerNum) {
		case '1':
			playerOnePlay();
			break;
		case '2':
			//playerTwoPlay();
			break;
		}

		keepScore++; // how many turns did the player take to win

	} while (counter < 17);
	return 0;
}


int getPlayerNum() {
	alt_putstr("Are you player 1 or player 2? \n");
	int num = alt_getchar();
	if (num == '\n') {
			num = alt_getchar();
	}

	return num;
}


// Initialized board and globals
void gameInit() {

	counter = 0;

	//makes counter for the number of hits on a certain ship

	carrierCounter = 0;
	battleshipCounter = 0;
	cruiserCounter = 0;
	submarineCounter = 0;
	destroyerCounter = 0;


	int i, j;

	// puts in water in the 2d array
	for (i = 0; i < 10; i++) {
		for (j = 0; j < 10; j++) {
			gameBoard[i][j] = WATER_CHAR;
		}
	}

//	 assigns all the different characters
//	 to different positions in the 2d array
	for (j = 0; j < 5; j++) {
		gameBoard[1][j] = CARRIER_CHAR;
	}

	for (i = 0; i < 4; i++) {
		gameBoard[i + 3][7] = BATTLESHIP_CHAR;
	}

	for (i = 0; i < 3; i++) {
		gameBoard[i + 4][9] = CRUISER_CHAR;
	}

	for (j = 0; j < 3; j++) {
		gameBoard[7][1 + j] = SUBMARINE_CHAR;
	}

	for (j = 0; j < 2; j++) {
		gameBoard[9][8 + j] = DESTROYER_CHAR;
	}

	printBoard();

}


void printBoard() {
	// prints the board in the beginning of the game
	int i, j;
	alt_printf("  0 1 2 3 4 5 6 7 8 9\n"); // prints the top row of number
	for (i = 0; i < 10; i++) {
		alt_printf("%x ", i); // prints the vertical row of number
		for (j = 0; j < 10; j++) {
			alt_printf("%c ", gameBoard[i][j]);
		}
		alt_putstr("\n");
	}
}


int playerOnePlay() {
	attack();
	alt_putstr("Player 2's Turn...");
	getAttacked();
	return 0;
}

int playerTwoPlay() {
	alt_putstr("Player 1's Turn...");
	getAttacked();
	attack();
	return 0;
}

void attack() {
	// Send a missile
	getCoordinates();

	// Wait for response to hit
	unsigned int response = receive();

	switch (response) {
	case MISS_CHAR :
		alt_putstr("Miss!\n");
		break;
	case CARRIER_CHAR :
		alt_putstr("You hit the carrierer! \n");
		counter++;
		carrierCounter++;
		break;
	case BATTLESHIP_CHAR :
		alt_putstr("You hit the battleship! \n");
		counter++;
		battleshipCounter++;
		break;
	case CRUISER_CHAR :
		alt_putstr("You hit the cruiser! \n");
		counter++;
		cruiserCounter++;
		break;
	case SUBMARINE_CHAR :
		alt_putstr("You hit the submarine! \n");
		counter++;
		submarineCounter++;
		break;
	case DESTROYER_CHAR :
		alt_putstr("You hit the destroyer! \n");
		counter++;
		destroyerCounter++;
		break;
	}


//	 The following checks if a certain ship is hit certain
//	 number of times and output the message to the user
//	 saying that the have drowned that particular ship
	if (carrierCounter == 5) {
		alt_putstr("You just drowned the carrier\n");
		carrierCounter = 0;
	} else if (battleshipCounter == 4) {
		alt_putstr("You just drowned the battleship\n");
		battleshipCounter = 0;
	} else if (cruiserCounter == 3) {
		alt_putstr("You just drowned the cruiser\n");
		cruiserCounter = 0;
	} else if (submarineCounter == 3) {
		alt_putstr("You just drowned the submarine\n");
		submarineCounter = 0;
	} else if (destroyerCounter == 2) {
		alt_putstr("You just drowned the destroyer\n");
		destroyerCounter = 0;
	}

}

void getCoordinates() {
	unsigned int h, k;

//	 the following alt_putstr asks and stores
//	 players input

	alt_putstr("> Enter Target:\n");
	alt_putstr("> Enter longitude: ");
	h = alt_getchar();
	if (h == '\n') {
		h = alt_getchar();
	}
	h = h - 48;

	alt_putstr("> Enter latitude: ");
	k = alt_getchar();
	if (k == '\n') {
		k = alt_getchar();
	}
	k = k - 48;
	send(h);
	send(k);
}

int send(unsigned int str) {
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

unsigned int receive() {
	*transmit_enable = 1;
	alt_putstr("Receive!\n");
	unsigned int data;
	while (1) {
		if (*character_received) {
			usleep(100);
			data = *data_bus_in;

			if (data & 128) {
				data = (data / 2) & 127;
			}
			//break;

		}
	}
	return data;
}

// The following function checks the coordinate
int checkShot(char gameBoard[10][10], int i, int j) {
	int HIT = 0;

	switch (gameBoard[i][j]) {
	// when its a miss
	case '~':
		HIT = 0;
		break;

		// when its a hit
	case 'c':
	case 'b':
	case 'r':
	case 's':
	case 'd':
		HIT = 1;
		break;
		// when its already been used
	case 'x':
	case 'm':
	default:
		HIT = 2;
		break;
	}

	return HIT;
}


void getAttacked() {
	// Wait for other players attack
	unsigned int h = receive();
	unsigned int k = receive();


//	 sends the data to checkShot to see if
//	 the player hit, miss, or has he already used that input

	int shot = checkShot(gameBoard, h, k);

//	 gets the data from the checkShot and checks
//	 if the coordinates entered by the user was a hit
//	 or a miss or if the user has already used those
//	 coordinates

	switch (shot) {
	case 0:
		alt_putstr("Miss!\n");
		gameBoard[h][k] = MISS_CHAR;
		send(MISS_CHAR);
		break;
	case 1:
		alt_putstr("It was a hit! \n");
		gameBoard[h][k] = HIT_CHAR;
		send(gameBoard[h][k]);
		break;
	case 2:
		alt_putstr("Please pick another value you have already chosen that\n");
		break;
	}


}
