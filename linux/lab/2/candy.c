#include <stdio.h>

int main(){
	int numcandy; // declare a number variable
	double cost; // declare a variable that can store decimals

	printf("How many lollipops do you want: "); 
	scanf("%d", &numcandy); // get input from user

	cost = 0.55 * numcandy; // do some math
	printf("\nPlease pay %f to the cashier!\n", cost);

	return 0; 
}
