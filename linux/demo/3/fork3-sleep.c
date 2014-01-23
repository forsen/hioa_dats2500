#include <unistd.h>   /* fork,sleep */
#include <stdio.h>    /* printf */
#include <sys/wait.h> /* wait */

int main(void)
{
  int p;

  p=fork();
  if (p==0) { /* sjekk om vi er i child eller parent */
    printf("\n...er i child og skal sove 4 sekunder!\n");
    sleep(4);
  } else {
    printf("\n\n...har skapt child og venter på at den skal avslutte!\n");
    wait(NULL);
    printf("\n...og der var den ferdig, gitt.\n\n");
  }

  return 0;
}

