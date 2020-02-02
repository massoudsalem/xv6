#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#define NULL (void *)(0)

void Omar(){
    printf(1, "Hello Omar bymasi\n");
    exit();
}


void Hafez(void* Ahmed, void* Mohammed){
    printf(1, "Hello Abo Hafez bymasi\n");
    printf(1, "x: %d\ny: %d\n",*(int*) Ahmed, *(int*) Mohammed);
    thread_create(&Omar, NULL, NULL);
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

void AdelShakal(void* z3ama, void* na7o){
  int f;
	printf(1, "The 30th Fibonacci number is:\n");
	f = fib(30);
	printf(1, "%d\n", f);
  thread_create(&Hafez, z3ama, na7o);
  thread_join();
  exit();
}

int
main(int argc, char *argv[])
{
  int x = 5, y = 10;
  printf(1, "Welcome revolutionary army\n");
  thread_create(&AdelShakal, (void *)&x, (void *)&y);
  thread_join();
  thread_create(&Omar, NULL, NULL);
  thread_join();
  printf(1, "Thanks for watching, please press like, subscribe and give us the bonus now pleeeeeeeeeeeeeeeeeeeeeeeease\n");
  exit();

}