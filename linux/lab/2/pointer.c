
#include <stdio.h>

int main(){
	
	int var_x; 
	int* ptrX; 
	var_x = 6; 
	ptrX = &var_x; 
	*ptrX = 12; 
	printf("value of x : %d\n", var_x ); 

	return 0; 
}
