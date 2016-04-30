/*
Author  : Sharyar Khalid
Title   : Working with pointers
Summary : Program that explores pointers by experimenting
          with pointer variables. References and dereferences
          the addresses themselves, computes a formula that
          consists of pointer variables, and displays the results
*/

#include <stdio.h>
#include <stdlib.h>

int main () {

    // Part 1: Getting to Know Pointers
    // References the addresses of the created variables
    // and dereferences them to display the values.
	  int a = 5;
	  int b = 17;
	  float c = 3.14;
	  float d = -5128823.0;
	  char e ='e';
	  char f = 'f';

	  int* xPtr;
	  float* yPtr;
	  char* zPtr;

	  xPtr = &a;
	  printf("The value of a = %d\n", *xPtr);
	  printf("The address of a = %d\n\n", xPtr);

	  xPtr = &b;
	  printf("The value of b = %d\n", *xPtr);
	  printf("The address of b = %d\n\n", xPtr);

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


	  // Part 2: Working with Pointer Variables
	  // Computes a formula that consists of
    // pointer values and displays the result.
    int A = 22;
    int B = 17;
    int C = 6;
    int D = 4;
    int E = 9;
    int result = 0;

    int* aPtr = &A;
    int* bPtr = &B;
    int* cPtr = &C;
    int* dPtr = &D;
    int* ePtr = &E;

    result = ((*aPtr - *bPtr) * (*cPtr + *dPtr)) / (*ePtr);
    printf("result = %d\n\n", result);

    return 0;

}
