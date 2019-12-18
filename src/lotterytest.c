#include "types.h"
#include "user.h"
#include "date.h"
int main(int argc, char* argv[]){
    
    int tickets_number = atoi(argv[1]);
    settickets(tickets_number);
    int rc = fork();
    if(rc == 0){
        printf(1,"\nSucsses in forking.\n");
    }else if(rc < 0){
        printf(1,"\nfail in forking.\n");
        exit();
    }
    while (1);
    exit();
    return 0;
}