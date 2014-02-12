#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>     /* usleep */
#include <pthread.h>
#include <semaphore.h>
#define SHARED 0        /* process-sharing if !=0, thread-sharing if =0*/
#define BUF_SIZE 20
#define MAX_MOD 100000
#define NUM_ITER 1000

void *Producer(void *); /* Producer thread */
void *Consumer(void *); /* Consumer thread */

sem_t empty;            /* empty: How many empty buffer slots */
sem_t full;             /* full: How many full buffer slots */
sem_t b;                /* b: binary, used as a mutex */
int data[BUF_SIZE];     /* shared finite buffer  */

int main(int argc, char* argv[]) {
  if( argc < 2 )
  {
    printf("This program expects an argument\n");
    exit(1);
  }
  if( argc > 2 )
  {
    printf("Too many arguments, this program expects one argument\n");
    exit(1); 
  }

  
  sem_init(&empty, SHARED, BUF_SIZE);
  sem_init(&full, SHARED, 0);
  sem_init(&b, SHARED, 1);
  int j = atoi (argv[1]) ; 
  pthread_t id[2*j];
  int i; 
  printf("main started\n");
  for( i = 0; i < j; i++)
  {
    pthread_create(&id[i], NULL, Producer, (void *) i);
    pthread_create(&id[i+j], NULL, Consumer, (void *) i);
  }

  for( i = 0; i < j; i++)
  {
    pthread_join(id[i], NULL);
    pthread_join(id[i+j], NULL);  
  }

  printf("main done\n");

  return 0;
}


void *Producer( void *arg ) {
  int semvalem,i=0,j;          /* semvalem: semaphore value of empty semaphore */
  while(i < NUM_ITER) {
//    usleep(rand()%MAX_MOD);    /* pretend to generate an item by a random wait*/
    sem_wait(&empty);
    sem_wait(&b);
    sem_getvalue(&empty, &semvalem);
    data[BUF_SIZE-(semvalem-1)]=1; /* put item in buffer */
    /* the following two lines just prints a bar showing current buffer fill */
    j=BUF_SIZE; printf("(Producer %d, semaphore empty is %d) \t",(int) arg, semvalem);
    while(j > semvalem) { j--; printf("="); } printf("\n");
    sem_post(&b);
    sem_post(&full);
    i++;    
  }

  return 0;
}


void *Consumer(void *arg) {
  int semvalfu,i=0,j;       /* semvalfu: semaphore value of full semaphore */

  while(i < NUM_ITER) {
//    usleep(rand()%MAX_MOD); /* pretend to consume an item by a random wait*/
    sem_wait(&full);
    sem_wait(&b);
    sem_getvalue(&full, &semvalfu);
    data[semvalfu]=0;       /* remove item from buffer */
    /* the following two lines just prints a bar showing current buffer fill */
    j=0; printf("(Consumer %d, semaphore full is %d)  \t",(int) arg, semvalfu);
    while(j < semvalfu) { j++; printf("="); } printf("\n");
    sem_post(&b);
    sem_post(&empty);    
    i++;
  }

  return 0;

}
