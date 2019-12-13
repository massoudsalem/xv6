#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  int *p;
  p = (int *)100000000;
  printf(1, "%x\n",*p);
  exit();
}
