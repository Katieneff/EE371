#include <stdio.h>
#include <stdlib.h>

int main ()
{
	/* Part 1 */
    /*Declare several variables of the following types: 
	  two variables of type int, two
	  variables of type float, and two variables of type char.*/
	  int a = 5;
	  int b = 17;
	  float c = 3.14;
	  float d = -5128823.0;
	  char e ='e';
	  char f = 'f';
	
	/*Declare the following pointer type variables: 
	  one pointer to an int, one pointer to
      a float, and one pointer to a char.*/
	  int* xPtr;
	  float* yPtr;
	  char* zPtr;

	/*Assign the address of one of the integer variables 
	  to the pointer to int. Print out
	  the value of that integer.*/
	  xPtr = &a;
	  printf("The value of a = %d\n", *xPtr);
	  printf("The address of a = %d\n\n", xPtr);
	  
	  //Repeat with the second integer.
	  xPtr = &b;
	  printf("The value of b = %d\n", *xPtr);
	  printf("The address of b = %d\n\n", xPtr);
	  
	  //Repeat steps 3 and 4 with the two floats and then the two chars.
	  yPtr = &c;
	  printf("The value of c = %f\n", *yPtr);
	  printf("The address of c = %d\n\n", yPtr);
	  
      yPtr = &d;
      printf("The value of d = %f\n", *yPtr);
	  printf("The address of d = %d\n\n", yPtr);
	  
      zPtr = &e;
      printf("The value of e = %c\n", *zPtr);
	  printf("The address of e = %d\n\n", zPtr);
	  
      zPtr = &f;
      printf("The value of f = %c\n", *zPtr);
	  printf("The address of f = %d\n\n", zPtr);
	  
	  //Part 2 – Working with Pointer Variables
	  // Declare and define variables
      int A = 22;
      int B = 17;
      int C = 6;
      int D = 4;
      int E = 9;
      int result = 0;
	  
	/*declare and define five variables of type pointer to 
	  integer and let each refer to one
      of the variables.*/
      int* aPtr = &A;
      int* bPtr = &B;
      int* cPtr = &C;
      int* dPtr = &D;
      int* ePtr = &E;
	  
	/*perform the computation:result = ((A – B)*(C+D))/E
      only instead of using the variables directly, refer 
	  to each through its pointer*/
	  result = ((*aPtr - *bPtr) * (*cPtr + *dPtr)) / (*ePtr);
	  printf("result = %d\n\n", result);
	  
	return 0; 




}