//  preprocessor directive to support printing to the display
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

//  the main program
int main(void) {

	//bool x = true;
	//float a = 0.0;
	double rate = 0.0;
    double amount = 0.0;
	double total = 0.0;
	int repeat = 1;
	int answer2 = 1;
	char answer[10];
	char response[10];
	char c[10];

	//  ask the user for some data
	/*printf("please enter a value\n");

	//  get the data from the user
	//   the data will be a floating point number: %f
	//   stored in the variable 'a'
	//   the & operator takes the address of the variable 'a'
	scanf("%f", &a);
	printf("the value is %.2f\n", a);*/

    /*char str1[20], str2[30];

    printf("Enter name: \n");
    scanf("%s", str1);

    printf("%s", str1);*/

//  float valone = 126489 * 17.88;
//  double valtwo = 126489 * 17.88;
//  printf("%f\n", valone);
//  printf("%f\n", valtwo);

	while (repeat) {
        total = 0.0;
        if (answer2) {
            printf("How much is one US dollar worth in that country?\n");
            printf("In other words, what is the exchange rate? ($1 = ?)\n");
            scanf("%lf", &rate);
            printf("\n");
        }

		printf("What is the currency amount you want converted?\n");
		scanf("%lf", &amount);
		printf("\n");

		printf("Is this amount in US dollars?\n");
		printf("Input either 'y' for yes or 'n' for no\n");
		scanf("%s", &c);
		printf("\n");

		if(c[0] == 'y') {
			total = amount * rate;
			printf("Your total is %.2lf\n", total);
		} else if (c[0] == 'n'){
			total = amount / rate;
			printf("Your total is $%.2lf\n", total);
		} else {
			printf("input is invalid\n");
		}

        printf("\n");
		printf("Would like to convert another value?\n");
		printf("Input either 'y' for yes or 'n' for no\n");
		scanf("%s", &answer);
		printf("\n");
		if (answer[0] == 'n') {
			repeat = 0;
		} else if (answer[0] != 'y') {
			printf("Not sure what you wanted so I'll assume you want this to end\n");
			repeat = 0;
		} else {
            printf("Would like to use the same exchange rate?\n");
            printf("Input either 'y' for yes or 'n' for no\n");
            scanf("%s", &response);
            printf("\n");
            if (response[0] == 'y') {
                answer2 = 0;
            } else if (response[0] != 'n') {
                printf("Not sure what you wanted so I'll assume you don't\n");
            } else {
                answer2 = 1;
            }
        }
	}

    return 0;

}
