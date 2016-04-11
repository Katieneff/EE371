/*///////////////////////////////////////////////////////////////////////////////////
Author: Adolfo Pineda
Title: Currency Calculator

Abstract: 		 The Currency Calculator program uses inputs from the user to
				 to calculate

Introduction: 	 Ever wonder how much an item from the United States costs in
				 another country? Or how about wanting to know how much an item
				 from another country costs in the United States? The currency
				 calculator can help you deduce these costs using the Currency
				 Calculator. All you need to do is input the exchange rate for
				 that country and follow the instructions.

Inputs: (double) exchange rate - There are no limits set to this input, but the
				 user should be aware that negative or zero conversion rates do
				 not exist; This the exchange rate used between countries.

        (double) currency amount - There are no limits set to this input, but the
				 user should be aware that negative dollars do not exist. Also,
				 if a non-integer is inputed, then the program does not compute
				 anything and asks the user if they would like to calculate
				 another value; This is the money amount the user wants converted.

Outputs:(double) total amount - There are no limits set to the size of the conversion
				 rate or the currency amount, but the output will be rounded to 2 decimal
				 places (in other words, the nearest cent);

Major Functions: If I am calculating everything in the main function, then do I still
				 have to have a major function? or do I have to break up my code into
				 major functions? Also, I have char inputs but they're just asking
				 the user for yes or no answers. Do I have to include this as well?
*////////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>

// the main program
int main(void) {

	double rate = 0.0;      //
    double amount = 0.0;
	double total = 0.0;
	int repeat = 1;
	int diffConversion = 1;
	char isDollars[10];
	char anotherValue[10];
	char sameRate[10];

	while (repeat) {
        total = 0.0;
        if (diffConversion) {
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
		scanf("%s", &isDollars);
		printf("\n");

		if(isDollars[0] == 'y') {
			total = amount * rate;
			printf("Your total is %.2lf\n", total);
		} else if (isDollars[0] == 'n'){
			total = amount / rate;
			printf("Your total is $%.2lf\n", total);
		} else {
			printf("input is invalid\n");
		}

        printf("\n");
		printf("Would like to convert another value?\n");
		printf("Input either 'y' for yes or 'n' for no\n");
		scanf("%s", &anotherValue);
		printf("\n");
		if (anotherValue[0] == 'n') {
			repeat = 0;
		} else if (anotherValue[0] != 'y') {
			printf("Not sure what you wanted so I'll assume you want this to end\n");
			repeat = 0;
		} else {
            printf("Would like to use the same exchange rate?\n");
            printf("Input either 'y' for yes or 'n' for no\n");
            scanf("%s", &sameRate);
            printf("\n");
            if (sameRate[0] == 'y') {
                diffConversion = 0;
            } else if (sameRate[0] != 'n') {
                printf("Not sure what you wanted so I'll assume you don't\n");
                diffConversion = 0;
            } else {
                diffConversion = 1;
            }
        }
	}

    return 0;
}
