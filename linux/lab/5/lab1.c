#include <unistd.h> /* fork */
#include <stdio.h> /* printf */
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#define SHARED 0

sem_t sem[6];

struct threadargs {
	int id; 
	int sec;
	int signal[6];
}; 

void *tfunc( void *arg ) {
	int i; 
	struct threadargs *targs=(struct threadargs*)arg; 
	while( sem_wait( &sem[targs->id] ) != 0) continue; 
	printf("Tråd %d kjører\n", targs->id);
	sleep(targs->sec);
	printf("Tråd %d er ferdig og vekker kanskje andre...\n", targs->id); 
	for( i = 0; i < 6; i++){
		if (targs->signal[i] == 1 )
			sem_post(&sem[i]); 
	}
	pthread_exit(NULL); 	
}

int main(void){
	int i,j;
	pthread_t tid[6];
	struct threadargs *targs[6];

	for(i=0;i<6;i++) {
		targs[i] = (struct threadargs*) malloc(sizeof(struct threadargs));
		for(j=0;j<6;j++) targs[i]->signal[j]=0; 
	}
	
	targs[0]->id=0; 
	targs[0]->sec=1;
	targs[0]->signal[1]=1;
	targs[0]->signal[4]=1;
	sem_init(&sem[0], SHARED, 1); 
	pthread_create( &tid[0], NULL, tfunc, targs[0]); 


	targs[1]->id=1; 
	targs[1]->sec=2;
	targs[1]->signal[3]=1;
	sem_init(&sem[1], SHARED, 0); 
	pthread_create( &tid[1], NULL, tfunc, targs[1]); 

	targs[2]->id=2; 
	targs[2]->sec=3;
	sem_init(&sem[2], SHARED, 1); 
	pthread_create( &tid[2], NULL, tfunc, targs[2]); 

	targs[3]->id=3; 
	targs[3]->sec=1;
	sem_init(&sem[3], SHARED, 0); 
	pthread_create( &tid[3], NULL, tfunc, targs[3]); 

	targs[4]->id=4; 
	targs[4]->sec=3;
	targs[4]->signal[5]=1;
	sem_init(&sem[4], SHARED, 0); 
	pthread_create( &tid[4], NULL, tfunc, targs[4]); 

	targs[5]->id=5; 
	targs[5]->sec=3;
	sem_init(&sem[5], SHARED, 0); 
	pthread_create( &tid[5], NULL, tfunc, targs[5]); 

	for(i=0;i<6;i++) pthread_join(tid[i], NULL);

	return 0;

}