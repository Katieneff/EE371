#include "sys/alt_stdio.h"
#define switches (volatile char *) 0x0003000
#define leds (volatile char *) 0x0003010
int main(){
	// the following while loops always runs 
	while (1)
		// the following statement assigns the leds to the 
		// switcheso n the board 
		*leds = *switches;
}
