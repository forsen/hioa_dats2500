#include <unistd.h>
#include <stdio.h>

int main(){
	int p;  

	p = fork();
	printf("%d\n", p);
	return 0; 

}