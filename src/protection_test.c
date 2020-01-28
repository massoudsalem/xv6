#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
int
main(int argc, char *argv[])
{

  char *brk = sbrk(0);
  sbrk(PGROUNDUP((uint)brk) - (uint)brk);
  char *start = sbrk(0);
  sbrk(PGSIZE * 1);
  *start=100;
  mprotect(start, 1) ;
  int child=fork();
  if(child==0){
	printf(1, "protected value = %d\n",*start); 
        munprotect(start, 1) ;  
        *start=5;
        printf(1, "After unprotecting the value became = %d\n",*start); 
        exit();
  }
  else if(child>0){
        wait();
        printf(1, "\nWatch this,I'll trap now\n"); 
        *start=5; 
        printf(1, "\nThis statement will not be printed\n");
        exit(); 
  }   
 exit();
}
