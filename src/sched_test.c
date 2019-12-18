#include "types.h"
#include "user.h"
#include "date.h"
int main(int argc, char* argv[]){
    
    int tickets_number = atoi(argv[1]);
    settickets(tickets_number);
    while (1);
    exit();
    return 0;
}