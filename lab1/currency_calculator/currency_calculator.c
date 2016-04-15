/*///////////////////////////////////////////////////////////////////////////////////
Author: Adolfo Pineda
		Katie neff
		Sharyar Khalid
		
Title: Currency Calculator

<<<<<<< HEAD
Abstract: 		 The Currency Calculator program uses inputs from the user to
				 to calculate the worth of an item in US dollars from foreign
				 currency, or from foreign currency
=======
Abstract: 		 The following program allows the user to enter the rate of change 
				 of currency as compared with the U.S dollar. It then asks the user
				 how much the user wanted to convert to either to dollars or 
				 from dollar to which ever country's currency the user entered.
>>>>>>> 5f02b329445b40a1a1a166e4e2613e735914c124

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

Major Functions: The only major function used was the 'main' function where most of the 
				 above mentioned uses of the program were implemented. 
				 
*////////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>

int main(void) {
	
	// The following couple of lines of code creates varialbles and assigns variable to them.
	double rate = 0.0;      
    double amount = 0.0;
	double total = 0.0;
	int repeat = 1;
	int diffConversion = 1;
	char isDollars;
	char anotherValue;
	char sameRate;
	int s ;
	int h;
	int r; 
	
	/* The following while loop is does the main part of the program and keeps repeating as long 
	   the user wants to keep converting currency and breaks out of the loop when the user wants it to stop
	*/
	while (repeat) {
        total = 0.0;
		
		/* The following if statement takes in the rate of change of currency compared to 1 U.S dollar.
		    the if statement only executes if the varialble diffeConversion is true, so if the user wants 
			to convert another value and if the user wants to change the rate of change of currency the difFconversion 
			is set to 1 and if statement executes 
		*/
		 if (diffConversion) {
            printf("How much is one US dollar worth in that country?\n");
            printf("In other words, what is the exchange rate? ($1 = ?)\n");
            scanf("%lf", &rate); // saves the rate of change in the variable rate
            printf("\n");
        }
		
		// The following three statments takes in the value that the user wants converted
		
		printf("What is the currency amount you want converted?\n");
		scanf("%lf", &amount); // saves the ammount to be converted in the variable ammount 
		printf("\n");
		
		/* The following three statments checks to see if the value entered by the user above is in U.S dollars
		   or if the ammount is in different currency and the user wants to convert it to U.S dollar 
		*/
		printf("Is this amount in US dollars?\n");
		printf("Please enter either 'y' for yes or 'n' for no\n");
		scanf("%s", &isDollars); // saves the letter entered by the user in the variable isDollars
		s = 1; // sets the condition of the while loop below to true so that it always runs until the user enters the correct letter. 
		printf("\n");
		
		/* The following while loop executes everytime and breaks if and only if the user enters Y for yes 
		   or N for no. This ensures if the user enters anything other than Y or N a warning would be displayed reminding the 
		   user to only enter Y or N 
		*/ 
		while(s){
		
		/* The following if statment only executes if and only if the user enters yes for the question above
		   asking if the amount entered was in dollars or some other currency and if the ammount entered 
		   above is in dollars the if statment multiplies that ammount with the rate of change and 
		   converts the dollars to which every currency the user entered rate of change of. It also sets
		   the condition for the while loop to false so that the while loop breaks. 
		*/
		if(isDollars == 'y'|| isDollars == 'Y') {
			total = amount * rate;
			printf("Your total is %.2lf\n", total);
			s = 0;
			
		/* The following else if statement executes if and only if the user enters no to the question above and it 
		   takes the ammount entered by the user and divides it by the rate of change to convert what ever currency was 
		   entered by the user to U.S dollars. It also sets the condition for the while loop to false so that the while loop breaks
		*/ 
		   } else if (isDollars == 'n' || isDollars == 'N'){
			total = amount / rate;
			printf("Your total is $%.2lf\n", total);
			s = 0; 
			
		/* The following else statment executes if the user enters letters or numbers other than Y or N and it gives a warning 
		   to the user and reminds the user to only enter Y or N depending on what they want to do with the ammount entered above 
		*/
		} else {
			printf("Input is invalid\n");
			printf("Please enter either 'y' for yes or 'n' for no\n");
			scanf("%s", &isDollars);
		}
		}
		
		// The following three statements asks the user if they would like to convert another value or not.
        printf("\n");
		printf("Would like to convert another value?\n");
		printf("Please enter either 'y' for yes or 'n' for no\n");
		scanf("%s", &anotherValue); // saves the letter entered by the user iin the variable anotherValue
		printf("\n");
		r = 1; // sets the condition for the following while loop to true 
		
		/* The following while loop executes everytime and breaks if and only if the user enters Y for yes 
		   or N for no. This ensures if the user enters anything other than Y or N a warning would be displayed reminding the 
		   user to only enter Y or N 
		*/ 
			while (r){
				/* The following if statment runs if the user enters Y for the question above asking if they would 
				   like to convert another amount. If they do enter Y the if statement also asks if they would like 
				   to keep the same rate of change for another value.
				 */
				 
				if ( anotherValue == 'Y' || anotherValue == 'y'){
					printf("Would you like to use the same exchange rate?\n");
					printf("Please enter either 'y' for yes or 'n' for no\n");
					scanf("%s", &sameRate);
					printf("\n");
					h = 1; // sets the condition for the following while loop to true.  
					r = 0; // sets the condition for the while loop to false.
					
					/* The following while loop executes everytime and breaks if and only if the user enters Y for yes 
		   			or N for no. This ensures if the user enters anything other than Y or N a warning would be displayed reminding the 
		  			user to only enter Y or N 
					*/ 
						while (h)
							{
							
							/* the following if statement executes if and only if the user enters Y for the question above that is if the user
							  wants to convert another value by keeping the same rate of change or change the rate of change. If the user
							  enters Y which means the user would like to convert the value by keeping the same rate of change as before
							  and it sets the condition for the first if statement to false 
							 */
							if(sameRate == 'Y' || sameRate == 'y'){
								diffConversion = 0; // set the condtion for the first if statement to false
								h = 0; // sets the condition for this while loop to false 
								 
							/* the following else if statement executes if and only if the user enters N for the question above. It sets the condition 
							   for the first IF statement to true and that if statment executes asking the user for another rate of change they would like to use
							 */   	
							}else if (sameRate == 'N' || sameRate == 'n'){
								diffConversion = 1; // set the condition for the first if statment to true 
								h = 0; // sets the condition for this while loop to false
								
						     /* The following else statment executes if the user enters letters or numbers other than Y or N and it gives a warning 
		  						to the user and reminds the user to only enter Y or N depending on if they would like to use same rate of chane or not 
							 */
							}else {
								printf("Input is invalid\n");
								printf("Please enter either a 'y' for yes or 'n' for no\n");
								scanf("%s", &sameRate);
							}
							}
							}
			    /* The following else if statement executes if and only if the user enters N to the question of whether or not they would like 
				   to convert another value if they entered N then the condition for the first while loop is set to 0 and the program ends\
				 */
				else if (anotherValue == 'n' || anotherValue == 'N'){
					printf("Goodbye have a nice day!\n");
					repeat = 0;
					r = 0;
				
				/* The following else statment executes if the user enters letters or numbers other than Y or N and it gives a warning 
		  			to the user and reminds the user to only enter Y or N depending on if they would like to convert another value or not
				*/	
				}else{
					printf("Input is invalid\n");
					printf("Please enter either a 'y' for yes or 'n' no \n");
					scanf("%s", &anotherValue);
					h = 1; 
					 } 
					 }
					 }
			 
	return 0;
}	