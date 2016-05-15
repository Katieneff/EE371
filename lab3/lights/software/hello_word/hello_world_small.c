#include "sys/alt_stdio.h"
#define switches (volatile char *) 0x0003000
#define leds (volatile char *) 0x0003010

int main()
{ 
  alt_putstr("Hello from Nios II!\n");//Prints out hello from Nios II 

  // creates a variable type Char 
  char c;
  
  // assigns the input from console to variable 'c'
  c = alt_getchar();
  
  // executes only if the user enteres the letter G 
  if (c == 'G') {
	  // The following while loops runs if the user enteres a 
	  // letter 'G' and always keeps running 
	  while (1) {
		  // The following if statement uses masking to get the 
		  // the status of the zeroth bit if it is on the if statement
		  // executes other wise else happens 
		  if (((*switches) & 1) == 1) {
			  
			  /*if the zeroth bit is true or in our case 
			    if the zeroth switch is turned on then the switches 
			    do the opposite and turn off an led when a when its corresponding switch 
			    is  */
			  *leds = 0 - (*switches >> 1);
		  } else {
			  *leds = *switches;
		  }
	  }
  }
  return 0;
}
