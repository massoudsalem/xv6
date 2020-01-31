#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
int
main(int argc, char *argv[])
{
  /*
  char *start = sbrk(0);
  sbrk(PGSIZE*2);
  *start=100;
  mprotect(start, 2) ;
  int child=fork();
  if(child==0){
	printf(1, "protected value = %d\n",*start); 
        munprotect(start, 2) ;  
        *start=5;
        printf(1, "After unprotecting the value became = %d\n",*start); 
        exit();
  }
  else if(child>0){
        wait();
        printf(1, "\nWatch this,I'll trap now\n"); 
        *(start+4096)=5; 
        printf(1, "\nThis statement will not be printed\n");
        exit(); 
  } */
  char arr[]={'1','2','3','4'};
  arr[0]='a';
  /*printf(1,"\narr[0] = %d\n",arr[0]);
  mprotect((void *)(((uint)arr/PGSIZE)*PGSIZE),1);
  printf(1,"reched here \n");
//  munprotect((void *)(((uint)arr/PGSIZE-1)*PGSIZE),1);
  arr[0]='b';
   printf(1,"\narr[0] = %d\n",arr[0]);
  */
 char *p=sbrk(0);
 printf(1,"\nS = %d\nHeap = %d",(int)arr/PGSIZE,(int)p/PGSIZE); 
 exit();
}
