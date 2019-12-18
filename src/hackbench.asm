
_hackbench:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  /* Reap number of children to reap */
  return num_fds * 2;
}

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  //        barf("Usage: hackbench [-pipe] <num groups>\n");

  // NOTE: More than 3 causes error due to num of processes.
  num_groups = NUM_GROUPS; // TODO: This may seriously be considered.

  fdpair(readyfds);
  11:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
  fdpair(wakefds);

  total_children = 0;
  17:	31 f6                	xor    %esi,%esi
{
  19:	81 ec a8 00 00 00    	sub    $0xa8,%esp
  use_pipes = 1;
  1f:	c7 05 78 0e 00 00 01 	movl   $0x1,0xe78
  26:	00 00 00 
  fdpair(readyfds);
  29:	e8 32 03 00 00       	call   360 <fdpair>
  fdpair(wakefds);
  2e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
  34:	e8 27 03 00 00       	call   360 <fdpair>
  for (i = 0; i < num_groups; i++)
    total_children += group(num_fds, readyfds[1], wakefds[0]);
  39:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
{
  3f:	89 a5 60 ff ff ff    	mov    %esp,-0xa0(%ebp)
  unsigned int out_fds[num_fds];
  45:	83 ec 30             	sub    $0x30,%esp
  48:	89 e3                	mov    %esp,%ebx
  for (i = 0; i < num_fds; i++) {
  4a:	31 ff                	xor    %edi,%edi
    total_children += group(num_fds, readyfds[1], wakefds[0]);
  4c:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
  52:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
  58:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
  5e:	66 90                	xchg   %ax,%ax
    fdpair(fds);
  60:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
  66:	e8 f5 02 00 00       	call   360 <fdpair>
    switch (fork()) {
  6b:	e8 7a 05 00 00       	call   5ea <fork>
  70:	83 f8 ff             	cmp    $0xffffffff,%eax
  73:	0f 84 17 01 00 00    	je     190 <main+0x190>
  79:	85 c0                	test   %eax,%eax
  7b:	0f 84 01 02 00 00    	je     282 <main+0x282>
    out_fds[i] = fds[1];
  81:	8b 45 80             	mov    -0x80(%ebp),%eax
    close(fds[0]);
  84:	83 ec 0c             	sub    $0xc,%esp
    out_fds[i] = fds[1];
  87:	89 04 bb             	mov    %eax,(%ebx,%edi,4)
    close(fds[0]);
  8a:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
  for (i = 0; i < num_fds; i++) {
  90:	83 c7 01             	add    $0x1,%edi
    close(fds[0]);
  93:	e8 82 05 00 00       	call   61a <close>
  for (i = 0; i < num_fds; i++) {
  98:	83 c4 10             	add    $0x10,%esp
  9b:	83 ff 08             	cmp    $0x8,%edi
  9e:	75 c0                	jne    60 <main+0x60>
  for (i = 0; i < num_fds; i++) {
  a0:	31 ff                	xor    %edi,%edi
  a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    switch (fork()) {
  a8:	e8 3d 05 00 00       	call   5ea <fork>
  ad:	83 f8 ff             	cmp    $0xffffffff,%eax
  b0:	0f 84 da 00 00 00    	je     190 <main+0x190>
  b6:	85 c0                	test   %eax,%eax
  b8:	0f 84 dc 00 00 00    	je     19a <main+0x19a>
  for (i = 0; i < num_fds; i++) {
  be:	83 c7 01             	add    $0x1,%edi
  c1:	83 ff 08             	cmp    $0x8,%edi
  c4:	75 e2                	jne    a8 <main+0xa8>
  c6:	8d 7b 20             	lea    0x20(%ebx),%edi
  c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    close(out_fds[i]);
  d0:	83 ec 0c             	sub    $0xc,%esp
  d3:	ff 33                	pushl  (%ebx)
  d5:	83 c3 04             	add    $0x4,%ebx
  d8:	e8 3d 05 00 00       	call   61a <close>
  for (i = 0; i < num_fds; i++)
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	39 df                	cmp    %ebx,%edi
  e2:	75 ec                	jne    d0 <main+0xd0>
    total_children += group(num_fds, readyfds[1], wakefds[0]);
  e4:	83 c6 10             	add    $0x10,%esi
  e7:	8b a5 60 ff ff ff    	mov    -0xa0(%ebp),%esp
  for (i = 0; i < num_groups; i++)
  ed:	83 fe 20             	cmp    $0x20,%esi
  f0:	0f 85 43 ff ff ff    	jne    39 <main+0x39>

  /* Wait for everyone to be ready */
  for (i = 0; i < total_children; i++)
  f6:	31 db                	xor    %ebx,%ebx
  f8:	8d 75 84             	lea    -0x7c(%ebp),%esi
  fb:	eb 0b                	jmp    108 <main+0x108>
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c3 01             	add    $0x1,%ebx
 103:	83 fb 20             	cmp    $0x20,%ebx
 106:	74 23                	je     12b <main+0x12b>
    if (read(readyfds[0], &dummy, 1) != 1)
 108:	83 ec 04             	sub    $0x4,%esp
 10b:	6a 01                	push   $0x1
 10d:	56                   	push   %esi
 10e:	ff b5 6c ff ff ff    	pushl  -0x94(%ebp)
 114:	e8 f1 04 00 00       	call   60a <read>
 119:	83 c4 10             	add    $0x10,%esp
 11c:	83 f8 01             	cmp    $0x1,%eax
 11f:	74 df                	je     100 <main+0x100>
      barf("Reading for readyfds");
 121:	b8 1b 0b 00 00       	mov    $0xb1b,%eax
 126:	e8 15 02 00 00       	call   340 <barf>
}

static inline unsigned long long rdtsc(void)
{
    unsigned long long ret;
    asm volatile ( "rdtsc" : "=A"(ret) );
 12b:	0f 31                	rdtsc  
 12d:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 133:	89 95 64 ff ff ff    	mov    %edx,-0x9c(%ebp)
  if (write(wakefds[1], &dummy, 1) != 1)
    barf("Writing to start them");

  /* Reap them all */
  //TODO: Fix different specifications between xv6 and Linux
  for (i = 0; i < total_children; i++) {
 139:	31 db                	xor    %ebx,%ebx
  if (write(wakefds[1], &dummy, 1) != 1)
 13b:	50                   	push   %eax
 13c:	6a 01                	push   $0x1
 13e:	56                   	push   %esi
 13f:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
 145:	e8 c8 04 00 00       	call   612 <write>
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	83 e8 01             	sub    $0x1,%eax
 150:	75 34                	jne    186 <main+0x186>
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for (i = 0; i < total_children; i++) {
 158:	83 c3 01             	add    $0x1,%ebx
    //int status;
    //wait(&status); // TODO: Too Many Arguments???
    wait(); // Waiting for that all child's tasks finish.
 15b:	e8 9a 04 00 00       	call   5fa <wait>
  for (i = 0; i < total_children; i++) {
 160:	83 fb 20             	cmp    $0x20,%ebx
 163:	75 f3                	jne    158 <main+0x158>
 165:	0f 31                	rdtsc  
    //  exit();
  }
  
  stop = rdtsc();
  if(DEBUG) printf(STDOUT, "Stop Watching Time ...\n");
  diff = stop - start;
 167:	2b 85 60 ff ff ff    	sub    -0xa0(%ebp),%eax
 16d:	1b 95 64 ff ff ff    	sbb    -0x9c(%ebp),%edx

  /* Print time... */
  printf(STDOUT, "Time: 0x%l [ticks]\n", diff);
 173:	52                   	push   %edx
 174:	50                   	push   %eax
 175:	68 46 0b 00 00       	push   $0xb46
 17a:	6a 01                	push   $0x1
 17c:	e8 df 05 00 00       	call   760 <printf>
  if(DEBUG) printf(STDOUT, "fd_count = %d\n", fd_count);
  exit();
 181:	e8 6c 04 00 00       	call   5f2 <exit>
    barf("Writing to start them");
 186:	b8 30 0b 00 00       	mov    $0xb30,%eax
 18b:	e8 b0 01 00 00       	call   340 <barf>
    case -1: barf("fork()");
 190:	b8 e5 0a 00 00       	mov    $0xae5,%eax
 195:	e8 a6 01 00 00       	call   340 <barf>
      fd_count += 2;
 19a:	83 05 80 0e 00 00 02 	addl   $0x2,0xe80
 1a1:	8d 75 84             	lea    -0x7c(%ebp),%esi
 1a4:	8d 55 e7             	lea    -0x19(%ebp),%edx
 1a7:	89 f0                	mov    %esi,%eax
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    data[k] = 'b';
 1b0:	c6 00 62             	movb   $0x62,(%eax)
 1b3:	83 c0 01             	add    $0x1,%eax
  for(k=0; k<DATASIZE-1 ; k++){
 1b6:	39 c2                	cmp    %eax,%edx
 1b8:	75 f6                	jne    1b0 <main+0x1b0>
  pollfd[id].fd = wakefd;
 1ba:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
  data[k] = '\0';
 1c0:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  dummy = 'a';
 1c4:	c6 85 6b ff ff ff 61 	movb   $0x61,-0x95(%ebp)
  pollfd[id].fd = wakefd;
 1cb:	89 04 fd a0 0e 00 00 	mov    %eax,0xea0(,%edi,8)
  if (write(ready_out, &dummy, 1) != 1)
 1d2:	8d 85 6b ff ff ff    	lea    -0x95(%ebp),%eax
 1d8:	52                   	push   %edx
 1d9:	6a 01                	push   $0x1
 1db:	50                   	push   %eax
 1dc:	ff b5 58 ff ff ff    	pushl  -0xa8(%ebp)
 1e2:	e8 2b 04 00 00       	call   612 <write>
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	83 e8 01             	sub    $0x1,%eax
 1ed:	0f 85 42 01 00 00    	jne    335 <main+0x335>
    while(pollfd[id].events == POLLIN);
 1f3:	66 83 3c fd a4 0e 00 	cmpw   $0x1,0xea4(,%edi,8)
 1fa:	00 01 
 1fc:	75 02                	jne    200 <main+0x200>
 1fe:	eb fe                	jmp    1fe <main+0x1fe>
 200:	8d 43 20             	lea    0x20(%ebx),%eax
 203:	c7 85 58 ff ff ff 64 	movl   $0x64,-0xa8(%ebp)
 20a:	00 00 00 
 20d:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
 213:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
 219:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
 21f:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
 225:	8d 76 00             	lea    0x0(%esi),%esi
 228:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
      int ret, done = 0;
 22e:	31 ff                	xor    %edi,%edi
 230:	8b 18                	mov    (%eax),%ebx
 232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ret = write(out_fd[j], data + done, sizeof(data)-done);
 238:	b8 64 00 00 00       	mov    $0x64,%eax
 23d:	83 ec 04             	sub    $0x4,%esp
 240:	29 f8                	sub    %edi,%eax
 242:	50                   	push   %eax
 243:	8d 04 3e             	lea    (%esi,%edi,1),%eax
 246:	50                   	push   %eax
 247:	53                   	push   %ebx
 248:	e8 c5 03 00 00       	call   612 <write>
      if (ret < 0)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	0f 88 c9 00 00 00    	js     321 <main+0x321>
      done += ret;
 258:	01 c7                	add    %eax,%edi
      if (done < sizeof(data))
 25a:	83 ff 63             	cmp    $0x63,%edi
 25d:	7e d9                	jle    238 <main+0x238>
 25f:	83 85 60 ff ff ff 04 	addl   $0x4,-0xa0(%ebp)
 266:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
    for (j = 0; j < num_fds; j++) {
 26c:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
 272:	75 b4                	jne    228 <main+0x228>
  for (i = 0; i < loops; i++) {
 274:	83 ad 58 ff ff ff 01 	subl   $0x1,-0xa8(%ebp)
 27b:	75 9c                	jne    219 <main+0x219>
      exit();
 27d:	e8 70 03 00 00       	call   5f2 <exit>
      close(fds[1]);
 282:	83 ec 0c             	sub    $0xc,%esp
 285:	ff 75 80             	pushl  -0x80(%ebp)
 288:	e8 8d 03 00 00       	call   61a <close>
  pollfd[id].fd = wakefd;
 28d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
  if (write(ready_out, &dummy, 1) != 1)
 293:	83 c4 0c             	add    $0xc,%esp
      fd_count++;
 296:	83 05 80 0e 00 00 01 	addl   $0x1,0xe80
      receiver(num_fds*loops, fds[0], ready_out, wakefd, i);
 29d:	8b 9d 7c ff ff ff    	mov    -0x84(%ebp),%ebx
  dummy = 'a';
 2a3:	c6 85 6a ff ff ff 61 	movb   $0x61,-0x96(%ebp)
  if(caller == RECEIVER) pollfd[id].events = POLLIN;
 2aa:	66 c7 04 fd a4 0e 00 	movw   $0x1,0xea4(,%edi,8)
 2b1:	00 01 00 
  pollfd[id].fd = wakefd;
 2b4:	89 04 fd a0 0e 00 00 	mov    %eax,0xea0(,%edi,8)
  if (write(ready_out, &dummy, 1) != 1)
 2bb:	8d 85 6a ff ff ff    	lea    -0x96(%ebp),%eax
 2c1:	6a 01                	push   $0x1
 2c3:	50                   	push   %eax
 2c4:	ff b5 58 ff ff ff    	pushl  -0xa8(%ebp)
 2ca:	e8 43 03 00 00       	call   612 <write>
 2cf:	83 c4 10             	add    $0x10,%esp
 2d2:	83 e8 01             	sub    $0x1,%eax
 2d5:	75 5e                	jne    335 <main+0x335>
 2d7:	8d 75 84             	lea    -0x7c(%ebp),%esi
    pollfd[id].events = FREE;
 2da:	66 c7 04 fd a4 0e 00 	movw   $0x0,0xea4(,%edi,8)
 2e1:	00 00 00 
 2e4:	c7 85 60 ff ff ff 20 	movl   $0x320,-0xa0(%ebp)
 2eb:	03 00 00 
    int ret, done = 0;
 2ee:	31 ff                	xor    %edi,%edi
    ret = read(in_fd, data + done, DATASIZE - done);
 2f0:	b8 64 00 00 00       	mov    $0x64,%eax
 2f5:	83 ec 04             	sub    $0x4,%esp
 2f8:	29 f8                	sub    %edi,%eax
 2fa:	50                   	push   %eax
 2fb:	8d 04 3e             	lea    (%esi,%edi,1),%eax
 2fe:	50                   	push   %eax
 2ff:	53                   	push   %ebx
 300:	e8 05 03 00 00       	call   60a <read>
    if (ret < 0)
 305:	83 c4 10             	add    $0x10,%esp
 308:	85 c0                	test   %eax,%eax
 30a:	78 1f                	js     32b <main+0x32b>
    done += ret;
 30c:	01 c7                	add    %eax,%edi
    if (done < DATASIZE){
 30e:	83 ff 63             	cmp    $0x63,%edi
 311:	7e dd                	jle    2f0 <main+0x2f0>
  for (i = 0; i < num_packets; i++) {
 313:	83 ad 60 ff ff ff 01 	subl   $0x1,-0xa0(%ebp)
 31a:	75 d2                	jne    2ee <main+0x2ee>
 31c:	e9 5c ff ff ff       	jmp    27d <main+0x27d>
	barf("SENDER: write");
 321:	b8 0d 0b 00 00       	mov    $0xb0d,%eax
 326:	e8 15 00 00 00       	call   340 <barf>
      barf("SERVER: read");
 32b:	b8 00 0b 00 00       	mov    $0xb00,%eax
 330:	e8 0b 00 00 00       	call   340 <barf>
    barf("CLIENT: ready write");
 335:	b8 ec 0a 00 00       	mov    $0xaec,%eax
 33a:	e8 01 00 00 00       	call   340 <barf>
 33f:	90                   	nop

00000340 <barf>:
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	83 ec 0c             	sub    $0xc,%esp
  printf(STDOUT, "(Error: %s)\n", msg);
 346:	50                   	push   %eax
 347:	68 d8 0a 00 00       	push   $0xad8
 34c:	6a 01                	push   $0x1
 34e:	e8 0d 04 00 00       	call   760 <printf>
  exit();
 353:	e8 9a 02 00 00       	call   5f2 <exit>
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <fdpair>:
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	83 ec 08             	sub    $0x8,%esp
  if (use_pipes) {
 366:	8b 15 78 0e 00 00    	mov    0xe78,%edx
 36c:	85 d2                	test   %edx,%edx
 36e:	74 19                	je     389 <fdpair+0x29>
    if (pipe(fds) == 0){
 370:	83 ec 0c             	sub    $0xc,%esp
 373:	50                   	push   %eax
 374:	e8 89 02 00 00       	call   602 <pipe>
 379:	83 c4 10             	add    $0x10,%esp
 37c:	85 c0                	test   %eax,%eax
 37e:	75 07                	jne    387 <fdpair+0x27>
      fd_count += 2;
 380:	83 05 80 0e 00 00 02 	addl   $0x2,0xe80
}
 387:	c9                   	leave  
 388:	c3                   	ret    
    barf("Socket mode is running. (error)\n");
 389:	b8 5c 0b 00 00       	mov    $0xb5c,%eax
 38e:	e8 ad ff ff ff       	call   340 <barf>
 393:	66 90                	xchg   %ax,%ax
 395:	66 90                	xchg   %ax,%ax
 397:	66 90                	xchg   %ax,%ax
 399:	66 90                	xchg   %ax,%ax
 39b:	66 90                	xchg   %ax,%ax
 39d:	66 90                	xchg   %ax,%ax
 39f:	90                   	nop

000003a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3aa:	89 c2                	mov    %eax,%edx
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b0:	83 c1 01             	add    $0x1,%ecx
 3b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 3b7:	83 c2 01             	add    $0x1,%edx
 3ba:	84 db                	test   %bl,%bl
 3bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 3bf:	75 ef                	jne    3b0 <strcpy+0x10>
    ;
  return os;
}
 3c1:	5b                   	pop    %ebx
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
 3d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3da:	0f b6 02             	movzbl (%edx),%eax
 3dd:	0f b6 19             	movzbl (%ecx),%ebx
 3e0:	84 c0                	test   %al,%al
 3e2:	75 1c                	jne    400 <strcmp+0x30>
 3e4:	eb 2a                	jmp    410 <strcmp+0x40>
 3e6:	8d 76 00             	lea    0x0(%esi),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 3f0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3f6:	83 c1 01             	add    $0x1,%ecx
 3f9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 3fc:	84 c0                	test   %al,%al
 3fe:	74 10                	je     410 <strcmp+0x40>
 400:	38 d8                	cmp    %bl,%al
 402:	74 ec                	je     3f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 404:	29 d8                	sub    %ebx,%eax
}
 406:	5b                   	pop    %ebx
 407:	5d                   	pop    %ebp
 408:	c3                   	ret    
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 410:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 412:	29 d8                	sub    %ebx,%eax
}
 414:	5b                   	pop    %ebx
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <strlen>:

uint
strlen(const char *s)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 426:	80 39 00             	cmpb   $0x0,(%ecx)
 429:	74 15                	je     440 <strlen+0x20>
 42b:	31 d2                	xor    %edx,%edx
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	83 c2 01             	add    $0x1,%edx
 433:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 437:	89 d0                	mov    %edx,%eax
 439:	75 f5                	jne    430 <strlen+0x10>
    ;
  return n;
}
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 440:	31 c0                	xor    %eax,%eax
}
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 44a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000450 <memset>:

void*
memset(void *dst, int c, uint n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 457:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	89 d7                	mov    %edx,%edi
 45f:	fc                   	cld    
 460:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 462:	89 d0                	mov    %edx,%eax
 464:	5f                   	pop    %edi
 465:	5d                   	pop    %ebp
 466:	c3                   	ret    
 467:	89 f6                	mov    %esi,%esi
 469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000470 <strchr>:

char*
strchr(const char *s, char c)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 47a:	0f b6 10             	movzbl (%eax),%edx
 47d:	84 d2                	test   %dl,%dl
 47f:	74 1d                	je     49e <strchr+0x2e>
    if(*s == c)
 481:	38 d3                	cmp    %dl,%bl
 483:	89 d9                	mov    %ebx,%ecx
 485:	75 0d                	jne    494 <strchr+0x24>
 487:	eb 17                	jmp    4a0 <strchr+0x30>
 489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 490:	38 ca                	cmp    %cl,%dl
 492:	74 0c                	je     4a0 <strchr+0x30>
  for(; *s; s++)
 494:	83 c0 01             	add    $0x1,%eax
 497:	0f b6 10             	movzbl (%eax),%edx
 49a:	84 d2                	test   %dl,%dl
 49c:	75 f2                	jne    490 <strchr+0x20>
      return (char*)s;
  return 0;
 49e:	31 c0                	xor    %eax,%eax
}
 4a0:	5b                   	pop    %ebx
 4a1:	5d                   	pop    %ebp
 4a2:	c3                   	ret    
 4a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <gets>:

char*
gets(char *buf, int max)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4b6:	31 f6                	xor    %esi,%esi
 4b8:	89 f3                	mov    %esi,%ebx
{
 4ba:	83 ec 1c             	sub    $0x1c,%esp
 4bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 4c0:	eb 2f                	jmp    4f1 <gets+0x41>
 4c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 4c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4cb:	83 ec 04             	sub    $0x4,%esp
 4ce:	6a 01                	push   $0x1
 4d0:	50                   	push   %eax
 4d1:	6a 00                	push   $0x0
 4d3:	e8 32 01 00 00       	call   60a <read>
    if(cc < 1)
 4d8:	83 c4 10             	add    $0x10,%esp
 4db:	85 c0                	test   %eax,%eax
 4dd:	7e 1c                	jle    4fb <gets+0x4b>
      break;
    buf[i++] = c;
 4df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4e3:	83 c7 01             	add    $0x1,%edi
 4e6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4e9:	3c 0a                	cmp    $0xa,%al
 4eb:	74 23                	je     510 <gets+0x60>
 4ed:	3c 0d                	cmp    $0xd,%al
 4ef:	74 1f                	je     510 <gets+0x60>
  for(i=0; i+1 < max; ){
 4f1:	83 c3 01             	add    $0x1,%ebx
 4f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4f7:	89 fe                	mov    %edi,%esi
 4f9:	7c cd                	jl     4c8 <gets+0x18>
 4fb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4fd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 500:	c6 03 00             	movb   $0x0,(%ebx)
}
 503:	8d 65 f4             	lea    -0xc(%ebp),%esp
 506:	5b                   	pop    %ebx
 507:	5e                   	pop    %esi
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    
 50b:	90                   	nop
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 510:	8b 75 08             	mov    0x8(%ebp),%esi
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	01 de                	add    %ebx,%esi
 518:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 51a:	c6 03 00             	movb   $0x0,(%ebx)
}
 51d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 520:	5b                   	pop    %ebx
 521:	5e                   	pop    %esi
 522:	5f                   	pop    %edi
 523:	5d                   	pop    %ebp
 524:	c3                   	ret    
 525:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000530 <stat>:

int
stat(const char *n, struct stat *st)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 535:	83 ec 08             	sub    $0x8,%esp
 538:	6a 00                	push   $0x0
 53a:	ff 75 08             	pushl  0x8(%ebp)
 53d:	e8 f0 00 00 00       	call   632 <open>
  if(fd < 0)
 542:	83 c4 10             	add    $0x10,%esp
 545:	85 c0                	test   %eax,%eax
 547:	78 27                	js     570 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 549:	83 ec 08             	sub    $0x8,%esp
 54c:	ff 75 0c             	pushl  0xc(%ebp)
 54f:	89 c3                	mov    %eax,%ebx
 551:	50                   	push   %eax
 552:	e8 f3 00 00 00       	call   64a <fstat>
  close(fd);
 557:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 55a:	89 c6                	mov    %eax,%esi
  close(fd);
 55c:	e8 b9 00 00 00       	call   61a <close>
  return r;
 561:	83 c4 10             	add    $0x10,%esp
}
 564:	8d 65 f8             	lea    -0x8(%ebp),%esp
 567:	89 f0                	mov    %esi,%eax
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
 56d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 570:	be ff ff ff ff       	mov    $0xffffffff,%esi
 575:	eb ed                	jmp    564 <stat+0x34>
 577:	89 f6                	mov    %esi,%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000580 <atoi>:

int
atoi(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 587:	0f be 11             	movsbl (%ecx),%edx
 58a:	8d 42 d0             	lea    -0x30(%edx),%eax
 58d:	3c 09                	cmp    $0x9,%al
  n = 0;
 58f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 594:	77 1f                	ja     5b5 <atoi+0x35>
 596:	8d 76 00             	lea    0x0(%esi),%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 5a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 5a3:	83 c1 01             	add    $0x1,%ecx
 5a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 5aa:	0f be 11             	movsbl (%ecx),%edx
 5ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 5b0:	80 fb 09             	cmp    $0x9,%bl
 5b3:	76 eb                	jbe    5a0 <atoi+0x20>
  return n;
}
 5b5:	5b                   	pop    %ebx
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	56                   	push   %esi
 5c4:	53                   	push   %ebx
 5c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ce:	85 db                	test   %ebx,%ebx
 5d0:	7e 14                	jle    5e6 <memmove+0x26>
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 5d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 5dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 5df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 5e2:	39 d3                	cmp    %edx,%ebx
 5e4:	75 f2                	jne    5d8 <memmove+0x18>
  return vdst;
}
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5d                   	pop    %ebp
 5e9:	c3                   	ret    

000005ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ea:	b8 01 00 00 00       	mov    $0x1,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <exit>:
SYSCALL(exit)
 5f2:	b8 02 00 00 00       	mov    $0x2,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <wait>:
SYSCALL(wait)
 5fa:	b8 03 00 00 00       	mov    $0x3,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <pipe>:
SYSCALL(pipe)
 602:	b8 04 00 00 00       	mov    $0x4,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <read>:
SYSCALL(read)
 60a:	b8 05 00 00 00       	mov    $0x5,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <write>:
SYSCALL(write)
 612:	b8 10 00 00 00       	mov    $0x10,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <close>:
SYSCALL(close)
 61a:	b8 15 00 00 00       	mov    $0x15,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <kill>:
SYSCALL(kill)
 622:	b8 06 00 00 00       	mov    $0x6,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <exec>:
SYSCALL(exec)
 62a:	b8 07 00 00 00       	mov    $0x7,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <open>:
SYSCALL(open)
 632:	b8 0f 00 00 00       	mov    $0xf,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <mknod>:
SYSCALL(mknod)
 63a:	b8 11 00 00 00       	mov    $0x11,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <unlink>:
SYSCALL(unlink)
 642:	b8 12 00 00 00       	mov    $0x12,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <fstat>:
SYSCALL(fstat)
 64a:	b8 08 00 00 00       	mov    $0x8,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <link>:
SYSCALL(link)
 652:	b8 13 00 00 00       	mov    $0x13,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <mkdir>:
SYSCALL(mkdir)
 65a:	b8 14 00 00 00       	mov    $0x14,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <chdir>:
SYSCALL(chdir)
 662:	b8 09 00 00 00       	mov    $0x9,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <dup>:
SYSCALL(dup)
 66a:	b8 0a 00 00 00       	mov    $0xa,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <getpid>:
SYSCALL(getpid)
 672:	b8 0b 00 00 00       	mov    $0xb,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <sbrk>:
SYSCALL(sbrk)
 67a:	b8 0c 00 00 00       	mov    $0xc,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <sleep>:
SYSCALL(sleep)
 682:	b8 0d 00 00 00       	mov    $0xd,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <uptime>:
SYSCALL(uptime)
 68a:	b8 0e 00 00 00       	mov    $0xe,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <getreadcount>:
SYSCALL(getreadcount)
 692:	b8 16 00 00 00       	mov    $0x16,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <gettime>:
SYSCALL(gettime)
 69a:	b8 17 00 00 00       	mov    $0x17,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <settickets>:
SYSCALL(settickets)
 6a2:	b8 18 00 00 00       	mov    $0x18,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <getpinfo>:
 6aa:	b8 19 00 00 00       	mov    $0x19,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    
 6b2:	66 90                	xchg   %ax,%ax
 6b4:	66 90                	xchg   %ax,%ax
 6b6:	66 90                	xchg   %ax,%ax
 6b8:	66 90                	xchg   %ax,%ax
 6ba:	66 90                	xchg   %ax,%ax
 6bc:	66 90                	xchg   %ax,%ax
 6be:	66 90                	xchg   %ax,%ax

000006c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6c9:	85 d2                	test   %edx,%edx
{
 6cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 6ce:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 6d0:	79 76                	jns    748 <printint+0x88>
 6d2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6d6:	74 70                	je     748 <printint+0x88>
    x = -xx;
 6d8:	f7 d8                	neg    %eax
    neg = 1;
 6da:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6e1:	31 f6                	xor    %esi,%esi
 6e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6e6:	eb 0a                	jmp    6f2 <printint+0x32>
 6e8:	90                   	nop
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 6f0:	89 fe                	mov    %edi,%esi
 6f2:	31 d2                	xor    %edx,%edx
 6f4:	8d 7e 01             	lea    0x1(%esi),%edi
 6f7:	f7 f1                	div    %ecx
 6f9:	0f b6 92 88 0b 00 00 	movzbl 0xb88(%edx),%edx
  }while((x /= base) != 0);
 700:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 702:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 705:	75 e9                	jne    6f0 <printint+0x30>
  if(neg)
 707:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 70a:	85 c0                	test   %eax,%eax
 70c:	74 08                	je     716 <printint+0x56>
    buf[i++] = '-';
 70e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 713:	8d 7e 02             	lea    0x2(%esi),%edi
 716:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 71a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 71d:	8d 76 00             	lea    0x0(%esi),%esi
 720:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
 726:	83 ee 01             	sub    $0x1,%esi
 729:	6a 01                	push   $0x1
 72b:	53                   	push   %ebx
 72c:	57                   	push   %edi
 72d:	88 45 d7             	mov    %al,-0x29(%ebp)
 730:	e8 dd fe ff ff       	call   612 <write>

  while(--i >= 0)
 735:	83 c4 10             	add    $0x10,%esp
 738:	39 de                	cmp    %ebx,%esi
 73a:	75 e4                	jne    720 <printint+0x60>
    putc(fd, buf[i]);
}
 73c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73f:	5b                   	pop    %ebx
 740:	5e                   	pop    %esi
 741:	5f                   	pop    %edi
 742:	5d                   	pop    %ebp
 743:	c3                   	ret    
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 748:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 74f:	eb 90                	jmp    6e1 <printint+0x21>
 751:	eb 0d                	jmp    760 <printf>
 753:	90                   	nop
 754:	90                   	nop
 755:	90                   	nop
 756:	90                   	nop
 757:	90                   	nop
 758:	90                   	nop
 759:	90                   	nop
 75a:	90                   	nop
 75b:	90                   	nop
 75c:	90                   	nop
 75d:	90                   	nop
 75e:	90                   	nop
 75f:	90                   	nop

00000760 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 769:	8b 75 0c             	mov    0xc(%ebp),%esi
 76c:	0f b6 1e             	movzbl (%esi),%ebx
 76f:	84 db                	test   %bl,%bl
 771:	0f 84 bf 00 00 00    	je     836 <printf+0xd6>
 777:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
 77a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
 77d:	31 d2                	xor    %edx,%edx
 77f:	eb 39                	jmp    7ba <printf+0x5a>
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 78e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 793:	74 1a                	je     7af <printf+0x4f>
  write(fd, &c, 1);
 795:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 798:	83 ec 04             	sub    $0x4,%esp
 79b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 79e:	6a 01                	push   $0x1
 7a0:	50                   	push   %eax
 7a1:	ff 75 08             	pushl  0x8(%ebp)
 7a4:	e8 69 fe ff ff       	call   612 <write>
 7a9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7ac:	83 c4 10             	add    $0x10,%esp
 7af:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 7b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 7b6:	84 db                	test   %bl,%bl
 7b8:	74 7c                	je     836 <printf+0xd6>
    if(state == 0){
 7ba:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 7bc:	0f be cb             	movsbl %bl,%ecx
 7bf:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7c2:	74 c4                	je     788 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 7c4:	83 fa 25             	cmp    $0x25,%edx
 7c7:	75 e6                	jne    7af <printf+0x4f>
      if(c == 'd'){
 7c9:	83 f8 64             	cmp    $0x64,%eax
 7cc:	0f 84 a6 00 00 00    	je     878 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
 7d2:	83 f8 6c             	cmp    $0x6c,%eax
 7d5:	0f 84 ad 00 00 00    	je     888 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
 7db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7e1:	83 f9 70             	cmp    $0x70,%ecx
 7e4:	74 5a                	je     840 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7e6:	83 f8 73             	cmp    $0x73,%eax
 7e9:	0f 84 e1 00 00 00    	je     8d0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7ef:	83 f8 63             	cmp    $0x63,%eax
 7f2:	0f 84 28 01 00 00    	je     920 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7f8:	83 f8 25             	cmp    $0x25,%eax
 7fb:	74 6b                	je     868 <printf+0x108>
  write(fd, &c, 1);
 7fd:	8d 45 e7             	lea    -0x19(%ebp),%eax
 800:	83 ec 04             	sub    $0x4,%esp
 803:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 807:	6a 01                	push   $0x1
 809:	50                   	push   %eax
 80a:	ff 75 08             	pushl  0x8(%ebp)
 80d:	e8 00 fe ff ff       	call   612 <write>
 812:	83 c4 0c             	add    $0xc,%esp
 815:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 818:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 81b:	6a 01                	push   $0x1
 81d:	50                   	push   %eax
 81e:	ff 75 08             	pushl  0x8(%ebp)
 821:	83 c6 01             	add    $0x1,%esi
 824:	e8 e9 fd ff ff       	call   612 <write>
  for(i = 0; fmt[i]; i++){
 829:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 82d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 830:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 832:	84 db                	test   %bl,%bl
 834:	75 84                	jne    7ba <printf+0x5a>
    }
  }
}
 836:	8d 65 f4             	lea    -0xc(%ebp),%esp
 839:	5b                   	pop    %ebx
 83a:	5e                   	pop    %esi
 83b:	5f                   	pop    %edi
 83c:	5d                   	pop    %ebp
 83d:	c3                   	ret    
 83e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 840:	83 ec 0c             	sub    $0xc,%esp
 843:	b9 10 00 00 00       	mov    $0x10,%ecx
 848:	6a 00                	push   $0x0
 84a:	8b 17                	mov    (%edi),%edx
 84c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
 84f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 852:	e8 69 fe ff ff       	call   6c0 <printint>
 857:	83 c4 10             	add    $0x10,%esp
      state = 0;
 85a:	31 d2                	xor    %edx,%edx
 85c:	e9 4e ff ff ff       	jmp    7af <printf+0x4f>
 861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 868:	83 ec 04             	sub    $0x4,%esp
 86b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 86e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 871:	6a 01                	push   $0x1
 873:	eb a8                	jmp    81d <printf+0xbd>
 875:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 878:	83 ec 0c             	sub    $0xc,%esp
 87b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 880:	6a 01                	push   $0x1
 882:	eb c6                	jmp    84a <printf+0xea>
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
 888:	8b 57 04             	mov    0x4(%edi),%edx
 88b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
 88d:	85 d2                	test   %edx,%edx
 88f:	74 15                	je     8a6 <printf+0x146>
 891:	83 ec 0c             	sub    $0xc,%esp
 894:	8b 45 08             	mov    0x8(%ebp),%eax
 897:	b9 10 00 00 00       	mov    $0x10,%ecx
 89c:	6a 00                	push   $0x0
 89e:	e8 1d fe ff ff       	call   6c0 <printint>
 8a3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
 8a6:	83 ec 0c             	sub    $0xc,%esp
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ac:	89 da                	mov    %ebx,%edx
 8ae:	6a 00                	push   $0x0
 8b0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 8b5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
 8b8:	e8 03 fe ff ff       	call   6c0 <printint>
 8bd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8c0:	31 d2                	xor    %edx,%edx
 8c2:	e9 e8 fe ff ff       	jmp    7af <printf+0x4f>
 8c7:	89 f6                	mov    %esi,%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 8d0:	8b 0f                	mov    (%edi),%ecx
        ap++;
 8d2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 8d5:	85 c9                	test   %ecx,%ecx
 8d7:	74 6a                	je     943 <printf+0x1e3>
        while(*s != 0){
 8d9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 8dc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
 8de:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 8e0:	84 c0                	test   %al,%al
 8e2:	0f 84 c7 fe ff ff    	je     7af <printf+0x4f>
 8e8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8eb:	89 de                	mov    %ebx,%esi
 8ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 8f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 8f6:	83 ec 04             	sub    $0x4,%esp
 8f9:	6a 01                	push   $0x1
          s++;
 8fb:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8fe:	50                   	push   %eax
 8ff:	53                   	push   %ebx
 900:	e8 0d fd ff ff       	call   612 <write>
        while(*s != 0){
 905:	0f b6 06             	movzbl (%esi),%eax
 908:	83 c4 10             	add    $0x10,%esp
 90b:	84 c0                	test   %al,%al
 90d:	75 e1                	jne    8f0 <printf+0x190>
 90f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 912:	31 d2                	xor    %edx,%edx
 914:	e9 96 fe ff ff       	jmp    7af <printf+0x4f>
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 920:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 922:	83 ec 04             	sub    $0x4,%esp
        ap++;
 925:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
 928:	6a 01                	push   $0x1
        putc(fd, *ap);
 92a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 92d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 930:	50                   	push   %eax
 931:	ff 75 08             	pushl  0x8(%ebp)
 934:	e8 d9 fc ff ff       	call   612 <write>
 939:	83 c4 10             	add    $0x10,%esp
      state = 0;
 93c:	31 d2                	xor    %edx,%edx
 93e:	e9 6c fe ff ff       	jmp    7af <printf+0x4f>
          s = "(null)";
 943:	bb 80 0b 00 00       	mov    $0xb80,%ebx
        while(*s != 0){
 948:	b8 28 00 00 00       	mov    $0x28,%eax
 94d:	eb 99                	jmp    8e8 <printf+0x188>
 94f:	90                   	nop

00000950 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 950:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	a1 84 0e 00 00       	mov    0xe84,%eax
{
 956:	89 e5                	mov    %esp,%ebp
 958:	57                   	push   %edi
 959:	56                   	push   %esi
 95a:	53                   	push   %ebx
 95b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 95e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 968:	39 c8                	cmp    %ecx,%eax
 96a:	8b 10                	mov    (%eax),%edx
 96c:	73 32                	jae    9a0 <free+0x50>
 96e:	39 d1                	cmp    %edx,%ecx
 970:	72 04                	jb     976 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 972:	39 d0                	cmp    %edx,%eax
 974:	72 32                	jb     9a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 976:	8b 73 fc             	mov    -0x4(%ebx),%esi
 979:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 97c:	39 fa                	cmp    %edi,%edx
 97e:	74 30                	je     9b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 980:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 983:	8b 50 04             	mov    0x4(%eax),%edx
 986:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 989:	39 f1                	cmp    %esi,%ecx
 98b:	74 3a                	je     9c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 98d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 98f:	a3 84 0e 00 00       	mov    %eax,0xe84
}
 994:	5b                   	pop    %ebx
 995:	5e                   	pop    %esi
 996:	5f                   	pop    %edi
 997:	5d                   	pop    %ebp
 998:	c3                   	ret    
 999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a0:	39 d0                	cmp    %edx,%eax
 9a2:	72 04                	jb     9a8 <free+0x58>
 9a4:	39 d1                	cmp    %edx,%ecx
 9a6:	72 ce                	jb     976 <free+0x26>
{
 9a8:	89 d0                	mov    %edx,%eax
 9aa:	eb bc                	jmp    968 <free+0x18>
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 9b0:	03 72 04             	add    0x4(%edx),%esi
 9b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b6:	8b 10                	mov    (%eax),%edx
 9b8:	8b 12                	mov    (%edx),%edx
 9ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9bd:	8b 50 04             	mov    0x4(%eax),%edx
 9c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9c3:	39 f1                	cmp    %esi,%ecx
 9c5:	75 c6                	jne    98d <free+0x3d>
    p->s.size += bp->s.size;
 9c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9ca:	a3 84 0e 00 00       	mov    %eax,0xe84
    p->s.size += bp->s.size;
 9cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9d5:	89 10                	mov    %edx,(%eax)
}
 9d7:	5b                   	pop    %ebx
 9d8:	5e                   	pop    %esi
 9d9:	5f                   	pop    %edi
 9da:	5d                   	pop    %ebp
 9db:	c3                   	ret    
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	57                   	push   %edi
 9e4:	56                   	push   %esi
 9e5:	53                   	push   %ebx
 9e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9ec:	8b 15 84 0e 00 00    	mov    0xe84,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f2:	8d 78 07             	lea    0x7(%eax),%edi
 9f5:	c1 ef 03             	shr    $0x3,%edi
 9f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9fb:	85 d2                	test   %edx,%edx
 9fd:	0f 84 9d 00 00 00    	je     aa0 <malloc+0xc0>
 a03:	8b 02                	mov    (%edx),%eax
 a05:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a08:	39 cf                	cmp    %ecx,%edi
 a0a:	76 6c                	jbe    a78 <malloc+0x98>
 a0c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a12:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a17:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 a1a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 a21:	eb 0e                	jmp    a31 <malloc+0x51>
 a23:	90                   	nop
 a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a2a:	8b 48 04             	mov    0x4(%eax),%ecx
 a2d:	39 f9                	cmp    %edi,%ecx
 a2f:	73 47                	jae    a78 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a31:	39 05 84 0e 00 00    	cmp    %eax,0xe84
 a37:	89 c2                	mov    %eax,%edx
 a39:	75 ed                	jne    a28 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a3b:	83 ec 0c             	sub    $0xc,%esp
 a3e:	56                   	push   %esi
 a3f:	e8 36 fc ff ff       	call   67a <sbrk>
  if(p == (char*)-1)
 a44:	83 c4 10             	add    $0x10,%esp
 a47:	83 f8 ff             	cmp    $0xffffffff,%eax
 a4a:	74 1c                	je     a68 <malloc+0x88>
  hp->s.size = nu;
 a4c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a4f:	83 ec 0c             	sub    $0xc,%esp
 a52:	83 c0 08             	add    $0x8,%eax
 a55:	50                   	push   %eax
 a56:	e8 f5 fe ff ff       	call   950 <free>
  return freep;
 a5b:	8b 15 84 0e 00 00    	mov    0xe84,%edx
      if((p = morecore(nunits)) == 0)
 a61:	83 c4 10             	add    $0x10,%esp
 a64:	85 d2                	test   %edx,%edx
 a66:	75 c0                	jne    a28 <malloc+0x48>
        return 0;
  }
}
 a68:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a6b:	31 c0                	xor    %eax,%eax
}
 a6d:	5b                   	pop    %ebx
 a6e:	5e                   	pop    %esi
 a6f:	5f                   	pop    %edi
 a70:	5d                   	pop    %ebp
 a71:	c3                   	ret    
 a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a78:	39 cf                	cmp    %ecx,%edi
 a7a:	74 54                	je     ad0 <malloc+0xf0>
        p->s.size -= nunits;
 a7c:	29 f9                	sub    %edi,%ecx
 a7e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a81:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a84:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a87:	89 15 84 0e 00 00    	mov    %edx,0xe84
}
 a8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a90:	83 c0 08             	add    $0x8,%eax
}
 a93:	5b                   	pop    %ebx
 a94:	5e                   	pop    %esi
 a95:	5f                   	pop    %edi
 a96:	5d                   	pop    %ebp
 a97:	c3                   	ret    
 a98:	90                   	nop
 a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 aa0:	c7 05 84 0e 00 00 88 	movl   $0xe88,0xe84
 aa7:	0e 00 00 
 aaa:	c7 05 88 0e 00 00 88 	movl   $0xe88,0xe88
 ab1:	0e 00 00 
    base.s.size = 0;
 ab4:	b8 88 0e 00 00       	mov    $0xe88,%eax
 ab9:	c7 05 8c 0e 00 00 00 	movl   $0x0,0xe8c
 ac0:	00 00 00 
 ac3:	e9 44 ff ff ff       	jmp    a0c <malloc+0x2c>
 ac8:	90                   	nop
 ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 ad0:	8b 08                	mov    (%eax),%ecx
 ad2:	89 0a                	mov    %ecx,(%edx)
 ad4:	eb b1                	jmp    a87 <malloc+0xa7>
