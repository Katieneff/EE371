#include <stdio.h>
#include <stdlib.h>



// The folloing function checks the coordinate 
int checkShot (char gameBoard[10][10], int i, int j) {
	int HIT = 0;

	switch (gameBoard[i][j]) {
		// when its a miss 
		case '~':HIT = 0;
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


int main () { 

char gameBoard [ 10 ][ 10 ];


// initialize all the variables. 
/******************************/
char water      =   '~';
char hit        =   'x';
char miss       =   'm'; 
char carrier    =   'c'; // length 5
char battleship =   'b'; // length 4
char cruiser    =   'r'; // length 3
char submarine  =   's'; // length 3 
char destroyer  =   'd'; // length 2 
/********************************/

//Variable being used in the main program
/**********************************/
int h = 0;
int k = 0; 
char answer ;
int shot = 0; 
int counter = 0; 
int keepScore = 0;
/************************************/

//makes counter for the number of hits on a certain ship
/************************************/
int carrierCounter = 0;
int battleshipCounter = 0; 
int cruiserCounter = 0;
int submarineCounter = 0;
int destroyerCounter = 0; 
/**********************/


/***************************
puts in water in the 2d array*/
for (int i = 0; i<10; i++ ){
	for (int j = 0; j <10; j++){
		gameBoard[i][j] = water; 
	}
}
/*****************************/


/*******************************
 assigns all the different characters 
 to different positions in the 2d array */
for (int j = 0; j<5 ; j++){
	gameBoard [1][j] = carrier; 
 }
 
for (int i = 0; i< 4; i++){
	gameBoard [i+3][7] = battleship; 
 }

for (int i = 0; i< 3; i++){
	gameBoard [i+4][9] = cruiser; 
 }
 
for (int j = 0; j< 3; j++){
	gameBoard [7][1+j] = submarine; 
 }
 
for (int j = 0; j< 2; j++){
	gameBoard [9][8+j] = destroyer; 
 }
/**************************************/

/***************************************/
/*prints the board in the beginning of the game*/
printf("  0 1 2 3 4 5 6 7 8 9\n"); // prints the top row of number
for (int i = 0; i<10; i++ ){
	printf("%d ",i);//prints the verticle row of number 
		for (int j = 0; j <10; j++){
			printf ("%c ", gameBoard[i][j]);
	} 
	printf("\n"); 
 }
 /******************************************/
 
do { 
	/**************************************
	the following printf asks and stores 
	players input*/
	
    printf ("> Enter Target (ex. > 3 4):\n");
	printf ("> ");
	scanf ("%d %d", &h, &k);
	/***************************************/
	
	
	/*The following checks if you have hit some 
	ship and keeps track of how many times 
	the player has hit the ship */
	
if (gameBoard[h][k] == carrier){
	carrierCounter ++;
	}
else if (gameBoard[h][k] == battleship){
	battleshipCounter++;
	}
else if (gameBoard[h][k] == cruiser){
	cruiserCounter++;
	}
else if (gameBoard[h][k] == submarine){
	submarineCounter++;
	}
else if (gameBoard[h][k] == destroyer){
	destroyerCounter++;
	}
	/***************************************/
	
	
	/*******************************************************
	sends the data to checkShot to see if 
	the player hit, miss, or has he already used tht input*/
	
	shot = checkShot (gameBoard,h,k ); 
	/******************************************************/
	
	
	/***********************************
	gets the data from the checkShot and checks
	if the coordinates entered by the user was a hit 
	or a miss or if the user has already used those 
	coordinates */
switch (shot){
	case 0: printf("Sorry you missed \n");
			gameBoard[h][k] = miss; 
			break;
	case 1: printf("It was a hit! \n");
			gameBoard[h][k] = hit;
			counter++; 
			break;
	case 2: printf("Please pick another value you have already chosen that\n");
			break;
	}
    /*************************************/
	
	
	
	/****************************************
	The follwing checks if a certain ship is hit certain 
	number of times and output the message to the user 
	saying that the have drowned that particular ship*/
if (carrierCounter == 5){
	printf("You just drowned the carrier\n");
	carrierCounter = 0; 
	}
else if (battleshipCounter==4){
	printf("You just drowned the battleship\n");
	battleshipCounter = 0;
	}
else if (cruiserCounter==3){
	printf("You just drowned the cruiser\n");
	cruiserCounter = 0;
	}
else if(submarineCounter==3){
	printf("You just drowned the submarine\n");
	submarineCounter = 0;
	}
else if(destroyerCounter == 2){
	printf("You just drowned the destroyer\n");
	destroyerCounter = 0;
	}
	/***********************************************/

	
	
	
	/*************************************
	just prints the board after adding the hit or miss*/
	printf("  0 1 2 3 4 5 6 7 8 9\n");
for (int i = 0; i<10; i++ ){
	printf("%d ",i);
for (int j = 0; j <10; j++){
	printf ("%c ", gameBoard[i][j]);
	} 
printf("\n"); 
 }  
	/**************************************/

	
	keepScore ++; // how many turns did the player take to win 
	
  }while (counter<17);
  /*************************************************************/
  
  
  
  
  printf("Congragulations you won and it took you %d turns\n",keepScore);
  
return 0; 
}

