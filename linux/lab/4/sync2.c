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
	p[1] = fork(); 
	if( p[1]==0){
		process(1,2);
		return 0; 
	}
	p[4] = fork();
	if( p[4]==0 ){
		process( 4, 3);
		return 0;
	}

	waitpid( p[2], NULL, 0);
	p[3] = fork(); 
	if( p[3] == 0 ){
		process( 3, 2);
		return 0;
	}

	waitpid( p[4], NULL, 0);
	p[5] = fork();
	if( p[5] == 0){
		process(5,3);
		return 0;
	}

	waitpid( p[5], NULL, 0 ); //  
	return 0; 
}