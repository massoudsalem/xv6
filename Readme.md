# XV6 (Unix version 6)
This is our Operating systems course project we were assigned by our lecturer to modify UNIX version 6 to get a better sense of how an operating system works, We do implement a few projects inside a real OS kernel.
The kernel we'll be using is a port of the original Unix (version 6) and is runnable on modern x86 processors. It was developed at MIT and is a small and relatively understandable OS and thus an excellent focus for simple projects.
More information about xv6, including a very useful book written by the MIT folks who built xv6, is available here. Do note, however, that we use a slightly older version of xv6 (for various pedagogical reasons), and thus the book may not match our code base exactly.

## Modifications we made to the system:
- a system call returns the value of a counter (perhaps called readcount or something like that) which is incremented every time any process calls the read() system call.
- a lottery scheduler, The basic idea is simple: assign each running process a slice of the processor-based in proportion to the number of tickets it has; the more tickets a process has, the more it runs. Each time slice, a randomized lottery determines the winner of the lottery; that winning process is the one that runs for that time slice.
- `int getpinfo(struct pstat *).` This routine returns some information about all running processes, including how many times each has been chosen to run and the process ID of each. You can use this system call to build a variant of the command line program **ps**, which can then be called to see what is going on, you can test it by typing `sched_test 10 &; sched_test 20 &; sched_test 30 &; ps` as a command in the system this is a preview of the output:
![PS Command preview](https://user-images.githubusercontent.com/36207910/73631999-31d57200-4663-11ea-8cb8-25f1c62fe588.png)
- VM system as its structured user code is loaded into the very first part of the address space. Thus, if you dereference a null pointer, you will not see an exception (as you might expect); rather, you will see whatever code is the first bit of code in the program that is running, We fix it by making it traps trap_14 (page fault trap) and kill the process output of null dereferencing:
![null test](https://user-images.githubusercontent.com/36207910/73632741-62b6a680-4665-11ea-8c85-f4a5f6367e07.png)
- In most operating systems, code is marked read-only instead of read-write. However, in xv6 this is not the case, so a buggy program could accidentally overwrite its own text. We will change the protection bits of parts of the page table to be read-only, thus preventing such over-writes, and also be able to change them back.
By adding two system calls: `int mprotect(void *addr, int len).` and `int munprotect(void *addr, int len).`
Calling `mprotect()` should change the protection bits of the page range starting at addr and of len pages to be read only. Thus, the program could still read the pages in this range after `mprotect()` finishes, but a write to this region should cause a trap (and thus kill the process). The `munprotect()` call does the opposite: sets the region back to both readable and writeable. The page protections is inherited on `fork()`. Thus, if a process has mprotected some of its pages, when the process calls fork, the OS should copy those protections to the child process a preview of the protection system calls test (it traps in the child that doesn't call `munprotect()`):                       
![Protection test](https://user-images.githubusercontent.com/36207910/73633260-e329d700-4666-11ea-9136-72c2a5d29a84.png)
- By the moment of now we are real kernel hackers :sunglasses:, so we decided to go further with the xv6 by adding real kernel threads to xv6. Sound like fun? Well, it was. Just having a simple `int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2).` routine. This routine should call `malloc()` to create a new user stack, use `clone()` to create the child thread and get it running. It returns the newly created PID to the parent and 0 to the child (if successful), -1 otherwise. An `int thread_join()` call should also be created, which calls the underlying `join()` system call, frees the user stack, and then returns. It returns the waited-for PID (when successful), -1 otherwise, The following code is running on xv6 using theading:
![Theading](https://user-images.githubusercontent.com/36207910/73635801-f770d280-466c-11ea-9d71-9a4b42ae924b.png)

### Team Members:
> *  Mohammad Massoud : [@massoudsalem]( https://github.com/massoudsalem )
> * Mohammad Ashraf : [@elhedeq]( https://github.com/elhedeq )
> * Omar Ali : [@OmarAli3]( https://github.com/OmarAli3 )
> * Ahmed Hafez : [@Ahmed-Hafez]( https://github.com/Ahmed-Hafez )
> * Shimaa Hamdy : [@shimaahamdy]( https://github.com/shimaahamdy )
> * Hadeer Mohammad : [@HadeerOsman]( https://github.com/HadeerOsman )
> * Khalid Mahmoud : [@Khalid-MahmouD]( https://github.com/Khalid-MahmouD )
