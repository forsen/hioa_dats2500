#include <stdio.h>

int addints( int a, int b )
{
	return a+b; 
}

int main(){
	int a; 
	int b; 
	int sum; 
	a = 6; 
	b = 7; 
	sum = addints(a,b);
	printf("The sum of a and b is %d\n", sum );

	return 0;
}
