#include "types.h"
#include "stat.h"
#include "user.h"
#include "mmu.h"
int
main(int argc, char *argv[])
{
    int a[5] = {1,2,3,4,5};
    int x = (int)a-((int)a&(PGSIZE-1));
    mprotect((void *)x, 1);
    a[2] = 20;


   exit();
}