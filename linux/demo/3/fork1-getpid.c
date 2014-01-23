#include <unistd.h> /* fork, getpid, getppid */
#include <stdio.h>  /* printf */

int main(void)
{
  int p;

  printf("\nOriginalt program har pid = %d\n", getpid());
  p=fork();
  if (p==0) {
    printf("\n I childprosessen er pid = %d og har parent prosessen med pid = %d\n", getpid(), getppid());
  } else {
    printf("\n\n I parentprosessen er pid = %d, fork returnerte = %d\n", getpid(), p);
    printf("\n\nParent til original parent har pid = %d\n\n", getppid());
  }
/* sleep(1); /* need this to avoid parent terminating before child */
 /* if parent terminates before child, child is adopted by the init process */
 return 0;
}

