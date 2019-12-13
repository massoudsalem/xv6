#include "types.h"
#include "user.h"
#include "date.h"

// Do some useless computations
void spin(int tix, int process) {
    struct rtcdate end;
    unsigned x = 0;
    unsigned y = 0;
    while (x < 50) { // Changed from 100000
	printf(0, "p%d ", process);
        y = 0;
        while (y < 5) {
	    printf(0, "c%d ", process);
            y++;
        }
        x++;
    }
    printf(0, "\n");
    gettime(&end);
    printf(0, "spin with %d tickets ended at %d hours %d minutes %d seconds\n", tix, end.hour, end.minute, end.second);
}

int main() {
    int pid1;
    int pid2;
    struct rtcdate start;
    gettime(&start);
    printf(0, "starting test at %d hours %d minutes %d seconds\n", start.hour, start.minute, start.second);
    if ((pid1 = fork()) == 0) {
        settickets(20);
        spin(20,1);
        exit();
    }
    else if ((pid2 = fork()) == 0) {
        settickets(80);
        spin(80,2);
        exit();
    }
    // Go to sleep and wait for subprocesses to finish
    wait();
    wait();
    exit();
    
}
