#include <stdio.h>		/* printf */
#include <stdlib.h>		/* exit */
#include <unistd.h> 	/* fork */
#include <sys/wait.h>	/* waitpid */
#include <sys/types.h>	/* pid_t */



void process( int number, int time) {
	printf("Prosess %d kjører\n", number);
	sleep(time);
	printf("Prosses %d kjørte i %d sekunder\n", number, time ); 
}

int main(void){
	pid_t pid; 
	pid = fork(); 

	if( pid == 0 ){
		process( 0, 1);
		pid = fork(); 
		if( pid == 0 ){
			process( 1, 2);
			process(3,2);
			exit(0);
		}
		process(4,3); 
		process(5,3);
		exit(0);  
	}
	process(2,3); 

	waitpid( pid, NULL, 0);
	return 0;

}
