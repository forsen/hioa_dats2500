#include <unistd.h> /* fork */
#include <stdio.h> /* printf */
#include <sys/wait.h> /* waitpid */

void process( int number, int time) {
	printf( "Prosess %d kjører\n", number);
	sleep(time); 
	printf("Prosess %d kjørte i %d sekunder\n", number, time);
}

int main(void){
	int p[6]; 
	p[0] = fork(); 
	if(p[0]==0){
		process( 0,1);	
		return 0; 
	}
	p[2] = fork();
	if( p[2]==0 ) {
		process(2, 3); 
		return 0; 
	}
	waitpid( p[0], NULL, 0 ); 


	return 0; 
}