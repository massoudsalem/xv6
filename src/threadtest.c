#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

void test1();

void Omar(){
    printf(1, "Hello Omar bymasi\n");
    exit();
}


void Hafez(void* Ahmed){
    printf(1, "Hello Abo Hafez bymasi\n");
    printf(1, "y: %d\n",*(int*) Ahmed);
    thread_create(&Omar, (void *)(0));
    thread_join();
    exit();
}
int fib(int n) {
	if (n <= 1) {
		return n;
	} else {
		return fib(n - 1) + fib(n - 2);
	}
}

void AdelShakal(){
  int f;
  int y = 5;
	printf(1, "The 30th Fibonacci number is:\n");
	f = fib(30);
	printf(1, "%d\n", f);
  thread_create(&Hafez, (void *)&y);
  thread_join();
  exit();
}

int
main(int argc, char *argv[])
{
  int y = 5;
  printf(1, "Welcome revolutionary army\n");
  thread_create(&AdelShakal, (void *)&y);
  thread_join();
  thread_create(&Omar, (void *)&y);
  thread_join();
  printf(1, "Thanks for watching, please press like, subscribe and give us the bonus now pleeeeeeeeeeeeeeeeeeeeeeeease\n");
  exit();
}