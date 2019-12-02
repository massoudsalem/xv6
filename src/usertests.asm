
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 36 4d 00 00       	push   $0x4d36
      16:	6a 01                	push   $0x1
      18:	e8 d3 39 00 00       	call   39f0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 4a 4d 00 00       	push   $0x4d4a
      26:	e8 b7 38 00 00       	call   38e2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 13                	js     45 <main+0x45>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 b4 54 00 00       	push   $0x54b4
      39:	6a 01                	push   $0x1
      3b:	e8 b0 39 00 00       	call   39f0 <printf>
    exit();
      40:	e8 5d 38 00 00       	call   38a2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      45:	50                   	push   %eax
      46:	50                   	push   %eax
      47:	68 00 02 00 00       	push   $0x200
      4c:	68 4a 4d 00 00       	push   $0x4d4a
      51:	e8 8c 38 00 00       	call   38e2 <open>
      56:	89 04 24             	mov    %eax,(%esp)
      59:	e8 6c 38 00 00       	call   38ca <close>

  argptest();
      5e:	e8 5d 35 00 00       	call   35c0 <argptest>
  createdelete();
      63:	e8 a8 11 00 00       	call   1210 <createdelete>
  linkunlink();
      68:	e8 63 1a 00 00       	call   1ad0 <linkunlink>
  concreate();
      6d:	e8 5e 17 00 00       	call   17d0 <concreate>
  fourfiles();
      72:	e8 99 0f 00 00       	call   1010 <fourfiles>
  sharedfd();
      77:	e8 d4 0d 00 00       	call   e50 <sharedfd>

  bigargtest();
      7c:	e8 ff 31 00 00       	call   3280 <bigargtest>
  bigwrite();
      81:	e8 6a 23 00 00       	call   23f0 <bigwrite>
  bigargtest();
      86:	e8 f5 31 00 00       	call   3280 <bigargtest>
  bsstest();
      8b:	e8 70 31 00 00       	call   3200 <bsstest>
  sbrktest();
      90:	e8 9b 2c 00 00       	call   2d30 <sbrktest>
  validatetest();
      95:	e8 b6 30 00 00       	call   3150 <validatetest>

  opentest();
      9a:	e8 51 03 00 00       	call   3f0 <opentest>
  writetest();
      9f:	e8 dc 03 00 00       	call   480 <writetest>
  writetest1();
      a4:	e8 b7 05 00 00       	call   660 <writetest1>
  createtest();
      a9:	e8 82 07 00 00       	call   830 <createtest>

  openiputtest();
      ae:	e8 3d 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b3:	e8 48 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b8:	e8 63 00 00 00       	call   120 <iputtest>

  mem();
      bd:	e8 be 0c 00 00       	call   d80 <mem>
  pipe1();
      c2:	e8 49 09 00 00       	call   a10 <pipe1>
  preempt();
      c7:	e8 e4 0a 00 00       	call   bb0 <preempt>
  exitwait();
      cc:	e8 1f 0c 00 00       	call   cf0 <exitwait>

  rmdot();
      d1:	e8 0a 27 00 00       	call   27e0 <rmdot>
  fourteen();
      d6:	e8 c5 25 00 00       	call   26a0 <fourteen>
  bigfile();
      db:	e8 f0 23 00 00       	call   24d0 <bigfile>
  subdir();
      e0:	e8 2b 1c 00 00       	call   1d10 <subdir>
  linktest();
      e5:	e8 d6 14 00 00       	call   15c0 <linktest>
  unlinkread();
      ea:	e8 41 13 00 00       	call   1430 <unlinkread>
  dirfile();
      ef:	e8 6c 28 00 00       	call   2960 <dirfile>
  iref();
      f4:	e8 67 2a 00 00       	call   2b60 <iref>
  forktest();
      f9:	e8 82 2b 00 00       	call   2c80 <forktest>
  bigdir(); // slow
      fe:	e8 dd 1a 00 00       	call   1be0 <bigdir>

  uio();
     103:	e8 48 34 00 00       	call   3550 <uio>

  exectest();
     108:	e8 b3 08 00 00       	call   9c0 <exectest>

  exit();
     10d:	e8 90 37 00 00       	call   38a2 <exit>
     112:	66 90                	xchg   %ax,%ax
     114:	66 90                	xchg   %ax,%ax
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <iputtest>:
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 dc 3d 00 00       	push   $0x3ddc
     12b:	ff 35 f8 5d 00 00    	pushl  0x5df8
     131:	e8 ba 38 00 00       	call   39f0 <printf>
  if(mkdir("iputdir") < 0){
     136:	c7 04 24 6f 3d 00 00 	movl   $0x3d6f,(%esp)
     13d:	e8 c8 37 00 00       	call   390a <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 6f 3d 00 00       	push   $0x3d6f
     151:	e8 bc 37 00 00       	call   3912 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 6c 3d 00 00       	push   $0x3d6c
     169:	e8 84 37 00 00       	call   38f2 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 91 3d 00 00       	push   $0x3d91
     17d:	e8 90 37 00 00       	call   3912 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 14 3e 00 00       	push   $0x3e14
     191:	ff 35 f8 5d 00 00    	pushl  0x5df8
     197:	e8 54 38 00 00       	call   39f0 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 48 3d 00 00       	push   $0x3d48
     1a8:	ff 35 f8 5d 00 00    	pushl  0x5df8
     1ae:	e8 3d 38 00 00       	call   39f0 <printf>
    exit();
     1b3:	e8 ea 36 00 00       	call   38a2 <exit>
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 93 3d 00 00       	push   $0x3d93
     1bf:	ff 35 f8 5d 00 00    	pushl  0x5df8
     1c5:	e8 26 38 00 00       	call   39f0 <printf>
    exit();
     1ca:	e8 d3 36 00 00       	call   38a2 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 77 3d 00 00       	push   $0x3d77
     1d6:	ff 35 f8 5d 00 00    	pushl  0x5df8
     1dc:	e8 0f 38 00 00       	call   39f0 <printf>
    exit();
     1e1:	e8 bc 36 00 00       	call   38a2 <exit>
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 56 3d 00 00       	push   $0x3d56
     1ed:	ff 35 f8 5d 00 00    	pushl  0x5df8
     1f3:	e8 f8 37 00 00       	call   39f0 <printf>
    exit();
     1f8:	e8 a5 36 00 00       	call   38a2 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     206:	68 a3 3d 00 00       	push   $0x3da3
     20b:	ff 35 f8 5d 00 00    	pushl  0x5df8
     211:	e8 da 37 00 00       	call   39f0 <printf>
  pid = fork();
     216:	e8 7f 36 00 00       	call   389a <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
  if(pid == 0){
     226:	75 48                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 6f 3d 00 00       	push   $0x3d6f
     230:	e8 d5 36 00 00       	call   390a <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 6f 3d 00 00       	push   $0x3d6f
     248:	e8 c5 36 00 00       	call   3912 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
    if(unlink("../iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 6c 3d 00 00       	push   $0x3d6c
     25c:	e8 91 36 00 00       	call   38f2 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
    exit();
     268:	e8 35 36 00 00       	call   38a2 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
  wait();
     270:	e8 35 36 00 00       	call   38aa <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 c6 3d 00 00       	push   $0x3dc6
     27d:	ff 35 f8 5d 00 00    	pushl  0x5df8
     283:	e8 68 37 00 00       	call   39f0 <printf>
}
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 77 3d 00 00       	push   $0x3d77
     298:	ff 35 f8 5d 00 00    	pushl  0x5df8
     29e:	e8 4d 37 00 00       	call   39f0 <printf>
      exit();
     2a3:	e8 fa 35 00 00       	call   38a2 <exit>
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 89 4c 00 00       	push   $0x4c89
     2af:	ff 35 f8 5d 00 00    	pushl  0x5df8
     2b5:	e8 36 37 00 00       	call   39f0 <printf>
    exit();
     2ba:	e8 e3 35 00 00       	call   38a2 <exit>
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 b2 3d 00 00       	push   $0x3db2
     2c6:	ff 35 f8 5d 00 00    	pushl  0x5df8
     2cc:	e8 1f 37 00 00       	call   39f0 <printf>
      exit();
     2d1:	e8 cc 35 00 00       	call   38a2 <exit>
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 48 3d 00 00       	push   $0x3d48
     2dd:	ff 35 f8 5d 00 00    	pushl  0x5df8
     2e3:	e8 08 37 00 00       	call   39f0 <printf>
      exit();
     2e8:	e8 b5 35 00 00       	call   38a2 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     2f6:	68 d8 3d 00 00       	push   $0x3dd8
     2fb:	ff 35 f8 5d 00 00    	pushl  0x5df8
     301:	e8 ea 36 00 00       	call   39f0 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 e7 3d 00 00 	movl   $0x3de7,(%esp)
     30d:	e8 f8 35 00 00       	call   390a <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
  pid = fork();
     31d:	e8 78 35 00 00       	call   389a <fork>
  if(pid < 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
  if(pid == 0){
     32a:	75 34                	jne    360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 e7 3d 00 00       	push   $0x3de7
     336:	e8 a7 35 00 00       	call   38e2 <open>
    if(fd >= 0){
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 6c 4d 00 00       	push   $0x4d6c
     34a:	ff 35 f8 5d 00 00    	pushl  0x5df8
     350:	e8 9b 36 00 00       	call   39f0 <printf>
      exit();
     355:	e8 48 35 00 00       	call   38a2 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  sleep(1);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 c8 35 00 00       	call   3932 <sleep>
  if(unlink("oidir") != 0){
     36a:	c7 04 24 e7 3d 00 00 	movl   $0x3de7,(%esp)
     371:	e8 7c 35 00 00       	call   38f2 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
  wait();
     37d:	e8 28 35 00 00       	call   38aa <wait>
  printf(stdout, "openiput test ok\n");
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 10 3e 00 00       	push   $0x3e10
     38a:	ff 35 f8 5d 00 00    	pushl  0x5df8
     390:	e8 5b 36 00 00       	call   39f0 <printf>
     395:	83 c4 10             	add    $0x10,%esp
}
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     3a0:	e8 fd 34 00 00       	call   38a2 <exit>
    printf(stdout, "mkdir oidir failed\n");
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 ed 3d 00 00       	push   $0x3ded
     3ac:	ff 35 f8 5d 00 00    	pushl  0x5df8
     3b2:	e8 39 36 00 00       	call   39f0 <printf>
    exit();
     3b7:	e8 e6 34 00 00       	call   38a2 <exit>
    printf(stdout, "fork failed\n");
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 89 4c 00 00       	push   $0x4c89
     3c3:	ff 35 f8 5d 00 00    	pushl  0x5df8
     3c9:	e8 22 36 00 00       	call   39f0 <printf>
    exit();
     3ce:	e8 cf 34 00 00       	call   38a2 <exit>
    printf(stdout, "unlink failed\n");
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 01 3e 00 00       	push   $0x3e01
     3da:	ff 35 f8 5d 00 00    	pushl  0x5df8
     3e0:	e8 0b 36 00 00       	call   39f0 <printf>
    exit();
     3e5:	e8 b8 34 00 00       	call   38a2 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     3f6:	68 22 3e 00 00       	push   $0x3e22
     3fb:	ff 35 f8 5d 00 00    	pushl  0x5df8
     401:	e8 ea 35 00 00       	call   39f0 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 2d 3e 00 00       	push   $0x3e2d
     40f:	e8 ce 34 00 00       	call   38e2 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 a6 34 00 00       	call   38ca <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 45 3e 00 00       	push   $0x3e45
     42d:	e8 b0 34 00 00       	call   38e2 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 70 3e 00 00       	push   $0x3e70
     441:	ff 35 f8 5d 00 00    	pushl  0x5df8
     447:	e8 a4 35 00 00       	call   39f0 <printf>
}
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 32 3e 00 00       	push   $0x3e32
     458:	ff 35 f8 5d 00 00    	pushl  0x5df8
     45e:	e8 8d 35 00 00       	call   39f0 <printf>
    exit();
     463:	e8 3a 34 00 00       	call   38a2 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 52 3e 00 00       	push   $0x3e52
     46f:	ff 35 f8 5d 00 00    	pushl  0x5df8
     475:	e8 76 35 00 00       	call   39f0 <printf>
    exit();
     47a:	e8 23 34 00 00       	call   38a2 <exit>
     47f:	90                   	nop

00000480 <writetest>:
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 7e 3e 00 00       	push   $0x3e7e
     48d:	ff 35 f8 5d 00 00    	pushl  0x5df8
     493:	e8 58 35 00 00       	call   39f0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	58                   	pop    %eax
     499:	5a                   	pop    %edx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 8f 3e 00 00       	push   $0x3e8f
     4a4:	e8 39 34 00 00       	call   38e2 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 88 01 00 00    	js     63c <writetest+0x1bc>
    printf(stdout, "creat small succeeded; ok\n");
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 95 3e 00 00       	push   $0x3e95
     4c0:	ff 35 f8 5d 00 00    	pushl  0x5df8
     4c6:	e8 25 35 00 00       	call   39f0 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 cc 3e 00 00       	push   $0x3ecc
     4da:	56                   	push   %esi
     4db:	e8 e2 33 00 00       	call   38c2 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 d7 3e 00 00       	push   $0x3ed7
     4f6:	56                   	push   %esi
     4f7:	e8 c6 33 00 00       	call   38c2 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 e2 3e 00 00       	push   $0x3ee2
     518:	ff 35 f8 5d 00 00    	pushl  0x5df8
     51e:	e8 cd 34 00 00       	call   39f0 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 9f 33 00 00       	call   38ca <close>
  fd = open("small", O_RDONLY);
     52b:	5b                   	pop    %ebx
     52c:	5e                   	pop    %esi
     52d:	6a 00                	push   $0x0
     52f:	68 8f 3e 00 00       	push   $0x3e8f
     534:	e8 a9 33 00 00       	call   38e2 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 ed 3e 00 00       	push   $0x3eed
     54e:	ff 35 f8 5d 00 00    	pushl  0x5df8
     554:	e8 97 34 00 00       	call   39f0 <printf>
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 e0 85 00 00       	push   $0x85e0
     566:	53                   	push   %ebx
     567:	e8 4e 33 00 00       	call   38ba <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 94 00 00 00    	jne    60e <writetest+0x18e>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 21 3f 00 00       	push   $0x3f21
     582:	ff 35 f8 5d 00 00    	pushl  0x5df8
     588:	e8 63 34 00 00       	call   39f0 <printf>
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 35 33 00 00       	call   38ca <close>
  if(unlink("small") < 0){
     595:	c7 04 24 8f 3e 00 00 	movl   $0x3e8f,(%esp)
     59c:	e8 51 33 00 00       	call   38f2 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7d                	js     625 <writetest+0x1a5>
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 49 3f 00 00       	push   $0x3f49
     5b0:	ff 35 f8 5d 00 00    	pushl  0x5df8
     5b6:	e8 35 34 00 00       	call   39f0 <printf>
}
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 90 4d 00 00       	push   $0x4d90
     5ce:	ff 35 f8 5d 00 00    	pushl  0x5df8
     5d4:	e8 17 34 00 00       	call   39f0 <printf>
      exit();
     5d9:	e8 c4 32 00 00       	call   38a2 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 b4 4d 00 00       	push   $0x4db4
     5e7:	ff 35 f8 5d 00 00    	pushl  0x5df8
     5ed:	e8 fe 33 00 00       	call   39f0 <printf>
      exit();
     5f2:	e8 ab 32 00 00       	call   38a2 <exit>
    printf(stdout, "error: open small failed!\n");
     5f7:	51                   	push   %ecx
     5f8:	51                   	push   %ecx
     5f9:	68 06 3f 00 00       	push   $0x3f06
     5fe:	ff 35 f8 5d 00 00    	pushl  0x5df8
     604:	e8 e7 33 00 00       	call   39f0 <printf>
    exit();
     609:	e8 94 32 00 00       	call   38a2 <exit>
    printf(stdout, "read failed\n");
     60e:	52                   	push   %edx
     60f:	52                   	push   %edx
     610:	68 4d 42 00 00       	push   $0x424d
     615:	ff 35 f8 5d 00 00    	pushl  0x5df8
     61b:	e8 d0 33 00 00       	call   39f0 <printf>
    exit();
     620:	e8 7d 32 00 00       	call   38a2 <exit>
    printf(stdout, "unlink small failed\n");
     625:	50                   	push   %eax
     626:	50                   	push   %eax
     627:	68 34 3f 00 00       	push   $0x3f34
     62c:	ff 35 f8 5d 00 00    	pushl  0x5df8
     632:	e8 b9 33 00 00       	call   39f0 <printf>
    exit();
     637:	e8 66 32 00 00       	call   38a2 <exit>
    printf(stdout, "error: creat small failed!\n");
     63c:	50                   	push   %eax
     63d:	50                   	push   %eax
     63e:	68 b0 3e 00 00       	push   $0x3eb0
     643:	ff 35 f8 5d 00 00    	pushl  0x5df8
     649:	e8 a2 33 00 00       	call   39f0 <printf>
    exit();
     64e:	e8 4f 32 00 00       	call   38a2 <exit>
     653:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 5d 3f 00 00       	push   $0x3f5d
     66d:	ff 35 f8 5d 00 00    	pushl  0x5df8
     673:	e8 78 33 00 00       	call   39f0 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     678:	58                   	pop    %eax
     679:	5a                   	pop    %edx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 d7 3f 00 00       	push   $0x3fd7
     684:	e8 59 32 00 00       	call   38e2 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 61 01 00 00    	js     7f5 <writetest1+0x195>
     694:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     6a3:	89 1d e0 85 00 00    	mov    %ebx,0x85e0
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 e0 85 00 00       	push   $0x85e0
     6b3:	56                   	push   %esi
     6b4:	e8 09 32 00 00       	call   38c2 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 ef 31 00 00       	call   38ca <close>
  fd = open("big", O_RDONLY);
     6db:	5b                   	pop    %ebx
     6dc:	5e                   	pop    %esi
     6dd:	6a 00                	push   $0x0
     6df:	68 d7 3f 00 00       	push   $0x3fd7
     6e4:	e8 f9 31 00 00       	call   38e2 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 e8 00 00 00    	js     7de <writetest1+0x17e>
  n = 0;
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
    if(((int*)buf)[0] != n){
     70b:	a1 e0 85 00 00       	mov    0x85e0,%eax
     710:	39 d8                	cmp    %ebx,%eax
     712:	75 7f                	jne    793 <writetest1+0x133>
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 e0 85 00 00       	push   $0x85e0
     724:	56                   	push   %esi
     725:	e8 90 31 00 00       	call   38ba <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 84 31 00 00       	call   38ca <close>
  if(unlink("big") < 0){
     746:	c7 04 24 d7 3f 00 00 	movl   $0x3fd7,(%esp)
     74d:	e8 a0 31 00 00       	call   38f2 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 af 00 00 00    	js     80c <writetest1+0x1ac>
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 fe 3f 00 00       	push   $0x3ffe
     765:	ff 35 f8 5d 00 00    	pushl  0x5df8
     76b:	e8 80 32 00 00       	call   39f0 <printf>
}
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 87 3f 00 00       	push   $0x3f87
     783:	ff 35 f8 5d 00 00    	pushl  0x5df8
     789:	e8 62 32 00 00       	call   39f0 <printf>
      exit();
     78e:	e8 0f 31 00 00       	call   38a2 <exit>
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 d8 4d 00 00       	push   $0x4dd8
     79a:	ff 35 f8 5d 00 00    	pushl  0x5df8
     7a0:	e8 4b 32 00 00       	call   39f0 <printf>
      exit();
     7a5:	e8 f8 30 00 00       	call   38a2 <exit>
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 db 3f 00 00       	push   $0x3fdb
     7b3:	ff 35 f8 5d 00 00    	pushl  0x5df8
     7b9:	e8 32 32 00 00       	call   39f0 <printf>
      exit();
     7be:	e8 df 30 00 00       	call   38a2 <exit>
        printf(stdout, "read only %d blocks from big", n);
     7c3:	52                   	push   %edx
     7c4:	68 8b 00 00 00       	push   $0x8b
     7c9:	68 be 3f 00 00       	push   $0x3fbe
     7ce:	ff 35 f8 5d 00 00    	pushl  0x5df8
     7d4:	e8 17 32 00 00       	call   39f0 <printf>
        exit();
     7d9:	e8 c4 30 00 00       	call   38a2 <exit>
    printf(stdout, "error: open big failed!\n");
     7de:	51                   	push   %ecx
     7df:	51                   	push   %ecx
     7e0:	68 a5 3f 00 00       	push   $0x3fa5
     7e5:	ff 35 f8 5d 00 00    	pushl  0x5df8
     7eb:	e8 00 32 00 00       	call   39f0 <printf>
    exit();
     7f0:	e8 ad 30 00 00       	call   38a2 <exit>
    printf(stdout, "error: creat big failed!\n");
     7f5:	50                   	push   %eax
     7f6:	50                   	push   %eax
     7f7:	68 6d 3f 00 00       	push   $0x3f6d
     7fc:	ff 35 f8 5d 00 00    	pushl  0x5df8
     802:	e8 e9 31 00 00       	call   39f0 <printf>
    exit();
     807:	e8 96 30 00 00       	call   38a2 <exit>
    printf(stdout, "unlink big failed\n");
     80c:	50                   	push   %eax
     80d:	50                   	push   %eax
     80e:	68 eb 3f 00 00       	push   $0x3feb
     813:	ff 35 f8 5d 00 00    	pushl  0x5df8
     819:	e8 d2 31 00 00       	call   39f0 <printf>
    exit();
     81e:	e8 7f 30 00 00       	call   38a2 <exit>
     823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000830 <createtest>:
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     839:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 f8 4d 00 00       	push   $0x4df8
     841:	ff 35 f8 5d 00 00    	pushl  0x5df8
     847:	e8 a4 31 00 00       	call   39f0 <printf>
  name[0] = 'a';
     84c:	c6 05 e0 a5 00 00 61 	movb   $0x61,0xa5e0
  name[2] = '\0';
     853:	c6 05 e2 a5 00 00 00 	movb   $0x0,0xa5e2
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     863:	88 1d e1 a5 00 00    	mov    %bl,0xa5e1
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 e0 a5 00 00       	push   $0xa5e0
     876:	e8 67 30 00 00       	call   38e2 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 47 30 00 00       	call   38ca <close>
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
  name[0] = 'a';
     88b:	c6 05 e0 a5 00 00 61 	movb   $0x61,0xa5e0
  name[2] = '\0';
     892:	c6 05 e2 a5 00 00 00 	movb   $0x0,0xa5e2
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     8a3:	88 1d e1 a5 00 00    	mov    %bl,0xa5e1
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 e0 a5 00 00       	push   $0xa5e0
     8b1:	e8 3c 30 00 00       	call   38f2 <unlink>
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 20 4e 00 00       	push   $0x4e20
     8c6:	ff 35 f8 5d 00 00    	pushl  0x5df8
     8cc:	e8 1f 31 00 00       	call   39f0 <printf>
}
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 0c 40 00 00       	push   $0x400c
     8eb:	ff 35 f8 5d 00 00    	pushl  0x5df8
     8f1:	e8 fa 30 00 00       	call   39f0 <printf>
  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 18 40 00 00 	movl   $0x4018,(%esp)
     8fd:	e8 08 30 00 00       	call   390a <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 18 40 00 00       	push   $0x4018
     911:	e8 fc 2f 00 00       	call   3912 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 bd 45 00 00       	push   $0x45bd
     929:	e8 e4 2f 00 00       	call   3912 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 18 40 00 00       	push   $0x4018
     93d:	e8 b0 2f 00 00       	call   38f2 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 55 40 00 00       	push   $0x4055
     951:	ff 35 f8 5d 00 00    	pushl  0x5df8
     957:	e8 94 30 00 00       	call   39f0 <printf>
}
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 48 3d 00 00       	push   $0x3d48
     968:	ff 35 f8 5d 00 00    	pushl  0x5df8
     96e:	e8 7d 30 00 00       	call   39f0 <printf>
    exit();
     973:	e8 2a 2f 00 00       	call   38a2 <exit>
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 41 40 00 00       	push   $0x4041
     97f:	ff 35 f8 5d 00 00    	pushl  0x5df8
     985:	e8 66 30 00 00       	call   39f0 <printf>
    exit();
     98a:	e8 13 2f 00 00       	call   38a2 <exit>
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 30 40 00 00       	push   $0x4030
     996:	ff 35 f8 5d 00 00    	pushl  0x5df8
     99c:	e8 4f 30 00 00       	call   39f0 <printf>
    exit();
     9a1:	e8 fc 2e 00 00       	call   38a2 <exit>
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 1d 40 00 00       	push   $0x401d
     9ad:	ff 35 f8 5d 00 00    	pushl  0x5df8
     9b3:	e8 38 30 00 00       	call   39f0 <printf>
    exit();
     9b8:	e8 e5 2e 00 00       	call   38a2 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 64 40 00 00       	push   $0x4064
     9cb:	ff 35 f8 5d 00 00    	pushl  0x5df8
     9d1:	e8 1a 30 00 00       	call   39f0 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 fc 5d 00 00       	push   $0x5dfc
     9dd:	68 2d 3e 00 00       	push   $0x3e2d
     9e2:	e8 f3 2e 00 00       	call   38da <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 6f 40 00 00       	push   $0x406f
     9f7:	ff 35 f8 5d 00 00    	pushl  0x5df8
     9fd:	e8 ee 2f 00 00       	call   39f0 <printf>
    exit();
     a02:	e8 9b 2e 00 00       	call   38a2 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     a19:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 90 2e 00 00       	call   38b2 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 3e 01 00 00    	jne    b6b <pipe1+0x15b>
     a2d:	89 c3                	mov    %eax,%ebx
  pid = fork();
     a2f:	e8 66 2e 00 00       	call   389a <fork>
  if(pid == 0){
     a34:	83 f8 00             	cmp    $0x0,%eax
     a37:	0f 84 84 00 00 00    	je     ac1 <pipe1+0xb1>
  } else if(pid > 0){
     a3d:	0f 8e 3b 01 00 00    	jle    b7e <pipe1+0x16e>
    close(fds[1]);
     a43:	83 ec 0c             	sub    $0xc,%esp
     a46:	ff 75 e4             	pushl  -0x1c(%ebp)
    cc = 1;
     a49:	bf 01 00 00 00       	mov    $0x1,%edi
    close(fds[1]);
     a4e:	e8 77 2e 00 00       	call   38ca <close>
    while((n = read(fds[0], buf, cc)) > 0){
     a53:	83 c4 10             	add    $0x10,%esp
    total = 0;
     a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     a5d:	83 ec 04             	sub    $0x4,%esp
     a60:	57                   	push   %edi
     a61:	68 e0 85 00 00       	push   $0x85e0
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 4c 2e 00 00       	call   38ba <read>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	0f 8e ab 00 00 00    	jle    b24 <pipe1+0x114>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a79:	89 d9                	mov    %ebx,%ecx
     a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a7e:	f7 d9                	neg    %ecx
     a80:	38 9c 0b e0 85 00 00 	cmp    %bl,0x85e0(%ebx,%ecx,1)
     a87:	8d 53 01             	lea    0x1(%ebx),%edx
     a8a:	75 1b                	jne    aa7 <pipe1+0x97>
      for(i = 0; i < n; i++){
     a8c:	39 f2                	cmp    %esi,%edx
     a8e:	89 d3                	mov    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
      cc = cc * 2;
     a92:	01 ff                	add    %edi,%edi
      total += n;
     a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a97:	b8 00 20 00 00       	mov    $0x2000,%eax
     a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     aa2:	0f 4f f8             	cmovg  %eax,%edi
     aa5:	eb b6                	jmp    a5d <pipe1+0x4d>
          printf(1, "pipe1 oops 2\n");
     aa7:	83 ec 08             	sub    $0x8,%esp
     aaa:	68 9e 40 00 00       	push   $0x409e
     aaf:	6a 01                	push   $0x1
     ab1:	e8 3a 2f 00 00       	call   39f0 <printf>
          return;
     ab6:	83 c4 10             	add    $0x10,%esp
}
     ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     abc:	5b                   	pop    %ebx
     abd:	5e                   	pop    %esi
     abe:	5f                   	pop    %edi
     abf:	5d                   	pop    %ebp
     ac0:	c3                   	ret    
    close(fds[0]);
     ac1:	83 ec 0c             	sub    $0xc,%esp
     ac4:	ff 75 e0             	pushl  -0x20(%ebp)
     ac7:	31 db                	xor    %ebx,%ebx
     ac9:	be 09 04 00 00       	mov    $0x409,%esi
     ace:	e8 f7 2d 00 00       	call   38ca <close>
     ad3:	83 c4 10             	add    $0x10,%esp
     ad6:	89 d8                	mov    %ebx,%eax
     ad8:	89 f2                	mov    %esi,%edx
     ada:	f7 d8                	neg    %eax
     adc:	29 da                	sub    %ebx,%edx
     ade:	66 90                	xchg   %ax,%ax
        buf[i] = seq++;
     ae0:	88 84 03 e0 85 00 00 	mov    %al,0x85e0(%ebx,%eax,1)
     ae7:	83 c0 01             	add    $0x1,%eax
      for(i = 0; i < 1033; i++)
     aea:	39 d0                	cmp    %edx,%eax
     aec:	75 f2                	jne    ae0 <pipe1+0xd0>
      if(write(fds[1], buf, 1033) != 1033){
     aee:	83 ec 04             	sub    $0x4,%esp
     af1:	68 09 04 00 00       	push   $0x409
     af6:	68 e0 85 00 00       	push   $0x85e0
     afb:	ff 75 e4             	pushl  -0x1c(%ebp)
     afe:	e8 bf 2d 00 00       	call   38c2 <write>
     b03:	83 c4 10             	add    $0x10,%esp
     b06:	3d 09 04 00 00       	cmp    $0x409,%eax
     b0b:	0f 85 80 00 00 00    	jne    b91 <pipe1+0x181>
     b11:	81 eb 09 04 00 00    	sub    $0x409,%ebx
    for(n = 0; n < 5; n++){
     b17:	81 fb d3 eb ff ff    	cmp    $0xffffebd3,%ebx
     b1d:	75 b7                	jne    ad6 <pipe1+0xc6>
    exit();
     b1f:	e8 7e 2d 00 00       	call   38a2 <exit>
    if(total != 5 * 1033){
     b24:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b2b:	75 29                	jne    b56 <pipe1+0x146>
    close(fds[0]);
     b2d:	83 ec 0c             	sub    $0xc,%esp
     b30:	ff 75 e0             	pushl  -0x20(%ebp)
     b33:	e8 92 2d 00 00       	call   38ca <close>
    wait();
     b38:	e8 6d 2d 00 00       	call   38aa <wait>
  printf(1, "pipe1 ok\n");
     b3d:	5a                   	pop    %edx
     b3e:	59                   	pop    %ecx
     b3f:	68 c3 40 00 00       	push   $0x40c3
     b44:	6a 01                	push   $0x1
     b46:	e8 a5 2e 00 00       	call   39f0 <printf>
     b4b:	83 c4 10             	add    $0x10,%esp
}
     b4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b51:	5b                   	pop    %ebx
     b52:	5e                   	pop    %esi
     b53:	5f                   	pop    %edi
     b54:	5d                   	pop    %ebp
     b55:	c3                   	ret    
      printf(1, "pipe1 oops 3 total %d\n", total);
     b56:	53                   	push   %ebx
     b57:	ff 75 d4             	pushl  -0x2c(%ebp)
     b5a:	68 ac 40 00 00       	push   $0x40ac
     b5f:	6a 01                	push   $0x1
     b61:	e8 8a 2e 00 00       	call   39f0 <printf>
      exit();
     b66:	e8 37 2d 00 00       	call   38a2 <exit>
    printf(1, "pipe() failed\n");
     b6b:	57                   	push   %edi
     b6c:	57                   	push   %edi
     b6d:	68 81 40 00 00       	push   $0x4081
     b72:	6a 01                	push   $0x1
     b74:	e8 77 2e 00 00       	call   39f0 <printf>
    exit();
     b79:	e8 24 2d 00 00       	call   38a2 <exit>
    printf(1, "fork() failed\n");
     b7e:	50                   	push   %eax
     b7f:	50                   	push   %eax
     b80:	68 cd 40 00 00       	push   $0x40cd
     b85:	6a 01                	push   $0x1
     b87:	e8 64 2e 00 00       	call   39f0 <printf>
    exit();
     b8c:	e8 11 2d 00 00       	call   38a2 <exit>
        printf(1, "pipe1 oops 1\n");
     b91:	56                   	push   %esi
     b92:	56                   	push   %esi
     b93:	68 90 40 00 00       	push   $0x4090
     b98:	6a 01                	push   $0x1
     b9a:	e8 51 2e 00 00       	call   39f0 <printf>
        exit();
     b9f:	e8 fe 2c 00 00       	call   38a2 <exit>
     ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bb0 <preempt>:
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
     bb5:	53                   	push   %ebx
     bb6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     bb9:	68 dc 40 00 00       	push   $0x40dc
     bbe:	6a 01                	push   $0x1
     bc0:	e8 2b 2e 00 00       	call   39f0 <printf>
  pid1 = fork();
     bc5:	e8 d0 2c 00 00       	call   389a <fork>
  if(pid1 == 0)
     bca:	83 c4 10             	add    $0x10,%esp
     bcd:	85 c0                	test   %eax,%eax
     bcf:	75 02                	jne    bd3 <preempt+0x23>
     bd1:	eb fe                	jmp    bd1 <preempt+0x21>
     bd3:	89 c7                	mov    %eax,%edi
  pid2 = fork();
     bd5:	e8 c0 2c 00 00       	call   389a <fork>
  if(pid2 == 0)
     bda:	85 c0                	test   %eax,%eax
  pid2 = fork();
     bdc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bde:	75 02                	jne    be2 <preempt+0x32>
     be0:	eb fe                	jmp    be0 <preempt+0x30>
  pipe(pfds);
     be2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     be5:	83 ec 0c             	sub    $0xc,%esp
     be8:	50                   	push   %eax
     be9:	e8 c4 2c 00 00       	call   38b2 <pipe>
  pid3 = fork();
     bee:	e8 a7 2c 00 00       	call   389a <fork>
  if(pid3 == 0){
     bf3:	83 c4 10             	add    $0x10,%esp
     bf6:	85 c0                	test   %eax,%eax
  pid3 = fork();
     bf8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bfa:	75 46                	jne    c42 <preempt+0x92>
    close(pfds[0]);
     bfc:	83 ec 0c             	sub    $0xc,%esp
     bff:	ff 75 e0             	pushl  -0x20(%ebp)
     c02:	e8 c3 2c 00 00       	call   38ca <close>
    if(write(pfds[1], "x", 1) != 1)
     c07:	83 c4 0c             	add    $0xc,%esp
     c0a:	6a 01                	push   $0x1
     c0c:	68 a1 46 00 00       	push   $0x46a1
     c11:	ff 75 e4             	pushl  -0x1c(%ebp)
     c14:	e8 a9 2c 00 00       	call   38c2 <write>
     c19:	83 c4 10             	add    $0x10,%esp
     c1c:	83 e8 01             	sub    $0x1,%eax
     c1f:	74 11                	je     c32 <preempt+0x82>
      printf(1, "preempt write error");
     c21:	50                   	push   %eax
     c22:	50                   	push   %eax
     c23:	68 e6 40 00 00       	push   $0x40e6
     c28:	6a 01                	push   $0x1
     c2a:	e8 c1 2d 00 00       	call   39f0 <printf>
     c2f:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c32:	83 ec 0c             	sub    $0xc,%esp
     c35:	ff 75 e4             	pushl  -0x1c(%ebp)
     c38:	e8 8d 2c 00 00       	call   38ca <close>
     c3d:	83 c4 10             	add    $0x10,%esp
     c40:	eb fe                	jmp    c40 <preempt+0x90>
  close(pfds[1]);
     c42:	83 ec 0c             	sub    $0xc,%esp
     c45:	ff 75 e4             	pushl  -0x1c(%ebp)
     c48:	e8 7d 2c 00 00       	call   38ca <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c4d:	83 c4 0c             	add    $0xc,%esp
     c50:	68 00 20 00 00       	push   $0x2000
     c55:	68 e0 85 00 00       	push   $0x85e0
     c5a:	ff 75 e0             	pushl  -0x20(%ebp)
     c5d:	e8 58 2c 00 00       	call   38ba <read>
     c62:	83 c4 10             	add    $0x10,%esp
     c65:	83 e8 01             	sub    $0x1,%eax
     c68:	74 19                	je     c83 <preempt+0xd3>
    printf(1, "preempt read error");
     c6a:	50                   	push   %eax
     c6b:	50                   	push   %eax
     c6c:	68 fa 40 00 00       	push   $0x40fa
     c71:	6a 01                	push   $0x1
     c73:	e8 78 2d 00 00       	call   39f0 <printf>
    return;
     c78:	83 c4 10             	add    $0x10,%esp
}
     c7b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c7e:	5b                   	pop    %ebx
     c7f:	5e                   	pop    %esi
     c80:	5f                   	pop    %edi
     c81:	5d                   	pop    %ebp
     c82:	c3                   	ret    
  close(pfds[0]);
     c83:	83 ec 0c             	sub    $0xc,%esp
     c86:	ff 75 e0             	pushl  -0x20(%ebp)
     c89:	e8 3c 2c 00 00       	call   38ca <close>
  printf(1, "kill... ");
     c8e:	58                   	pop    %eax
     c8f:	5a                   	pop    %edx
     c90:	68 0d 41 00 00       	push   $0x410d
     c95:	6a 01                	push   $0x1
     c97:	e8 54 2d 00 00       	call   39f0 <printf>
  kill(pid1);
     c9c:	89 3c 24             	mov    %edi,(%esp)
     c9f:	e8 2e 2c 00 00       	call   38d2 <kill>
  kill(pid2);
     ca4:	89 34 24             	mov    %esi,(%esp)
     ca7:	e8 26 2c 00 00       	call   38d2 <kill>
  kill(pid3);
     cac:	89 1c 24             	mov    %ebx,(%esp)
     caf:	e8 1e 2c 00 00       	call   38d2 <kill>
  printf(1, "wait... ");
     cb4:	59                   	pop    %ecx
     cb5:	5b                   	pop    %ebx
     cb6:	68 16 41 00 00       	push   $0x4116
     cbb:	6a 01                	push   $0x1
     cbd:	e8 2e 2d 00 00       	call   39f0 <printf>
  wait();
     cc2:	e8 e3 2b 00 00       	call   38aa <wait>
  wait();
     cc7:	e8 de 2b 00 00       	call   38aa <wait>
  wait();
     ccc:	e8 d9 2b 00 00       	call   38aa <wait>
  printf(1, "preempt ok\n");
     cd1:	5e                   	pop    %esi
     cd2:	5f                   	pop    %edi
     cd3:	68 1f 41 00 00       	push   $0x411f
     cd8:	6a 01                	push   $0x1
     cda:	e8 11 2d 00 00       	call   39f0 <printf>
     cdf:	83 c4 10             	add    $0x10,%esp
     ce2:	eb 97                	jmp    c7b <preempt+0xcb>
     ce4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000cf0 <exitwait>:
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	be 64 00 00 00       	mov    $0x64,%esi
     cf9:	53                   	push   %ebx
     cfa:	eb 14                	jmp    d10 <exitwait+0x20>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     d00:	74 6f                	je     d71 <exitwait+0x81>
      if(wait() != pid){
     d02:	e8 a3 2b 00 00       	call   38aa <wait>
     d07:	39 d8                	cmp    %ebx,%eax
     d09:	75 2d                	jne    d38 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     d0b:	83 ee 01             	sub    $0x1,%esi
     d0e:	74 48                	je     d58 <exitwait+0x68>
    pid = fork();
     d10:	e8 85 2b 00 00       	call   389a <fork>
    if(pid < 0){
     d15:	85 c0                	test   %eax,%eax
    pid = fork();
     d17:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d19:	79 e5                	jns    d00 <exitwait+0x10>
      printf(1, "fork failed\n");
     d1b:	83 ec 08             	sub    $0x8,%esp
     d1e:	68 89 4c 00 00       	push   $0x4c89
     d23:	6a 01                	push   $0x1
     d25:	e8 c6 2c 00 00       	call   39f0 <printf>
      return;
     d2a:	83 c4 10             	add    $0x10,%esp
}
     d2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d30:	5b                   	pop    %ebx
     d31:	5e                   	pop    %esi
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 2b 41 00 00       	push   $0x412b
     d40:	6a 01                	push   $0x1
     d42:	e8 a9 2c 00 00       	call   39f0 <printf>
        return;
     d47:	83 c4 10             	add    $0x10,%esp
}
     d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d4d:	5b                   	pop    %ebx
     d4e:	5e                   	pop    %esi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
     d58:	83 ec 08             	sub    $0x8,%esp
     d5b:	68 3b 41 00 00       	push   $0x413b
     d60:	6a 01                	push   $0x1
     d62:	e8 89 2c 00 00       	call   39f0 <printf>
     d67:	83 c4 10             	add    $0x10,%esp
}
     d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d6d:	5b                   	pop    %ebx
     d6e:	5e                   	pop    %esi
     d6f:	5d                   	pop    %ebp
     d70:	c3                   	ret    
      exit();
     d71:	e8 2c 2b 00 00       	call   38a2 <exit>
     d76:	8d 76 00             	lea    0x0(%esi),%esi
     d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d80 <mem>:
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	56                   	push   %esi
     d85:	53                   	push   %ebx
     d86:	31 db                	xor    %ebx,%ebx
     d88:	83 ec 14             	sub    $0x14,%esp
  printf(1, "mem test\n");
     d8b:	68 48 41 00 00       	push   $0x4148
     d90:	6a 01                	push   $0x1
     d92:	e8 59 2c 00 00       	call   39f0 <printf>
  ppid = getpid();
     d97:	e8 86 2b 00 00       	call   3922 <getpid>
     d9c:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d9e:	e8 f7 2a 00 00       	call   389a <fork>
     da3:	83 c4 10             	add    $0x10,%esp
     da6:	85 c0                	test   %eax,%eax
     da8:	74 0a                	je     db4 <mem+0x34>
     daa:	e9 89 00 00 00       	jmp    e38 <mem+0xb8>
     daf:	90                   	nop
      *(char**)m2 = m1;
     db0:	89 18                	mov    %ebx,(%eax)
     db2:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     db4:	83 ec 0c             	sub    $0xc,%esp
     db7:	68 11 27 00 00       	push   $0x2711
     dbc:	e8 8f 2e 00 00       	call   3c50 <malloc>
     dc1:	83 c4 10             	add    $0x10,%esp
     dc4:	85 c0                	test   %eax,%eax
     dc6:	75 e8                	jne    db0 <mem+0x30>
    while(m1){
     dc8:	85 db                	test   %ebx,%ebx
     dca:	74 18                	je     de4 <mem+0x64>
     dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     dd0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     dd2:	83 ec 0c             	sub    $0xc,%esp
     dd5:	53                   	push   %ebx
     dd6:	89 fb                	mov    %edi,%ebx
     dd8:	e8 e3 2d 00 00       	call   3bc0 <free>
    while(m1){
     ddd:	83 c4 10             	add    $0x10,%esp
     de0:	85 db                	test   %ebx,%ebx
     de2:	75 ec                	jne    dd0 <mem+0x50>
    m1 = malloc(1024*20);
     de4:	83 ec 0c             	sub    $0xc,%esp
     de7:	68 00 50 00 00       	push   $0x5000
     dec:	e8 5f 2e 00 00       	call   3c50 <malloc>
    if(m1 == 0){
     df1:	83 c4 10             	add    $0x10,%esp
     df4:	85 c0                	test   %eax,%eax
     df6:	74 20                	je     e18 <mem+0x98>
    free(m1);
     df8:	83 ec 0c             	sub    $0xc,%esp
     dfb:	50                   	push   %eax
     dfc:	e8 bf 2d 00 00       	call   3bc0 <free>
    printf(1, "mem ok\n");
     e01:	58                   	pop    %eax
     e02:	5a                   	pop    %edx
     e03:	68 6c 41 00 00       	push   $0x416c
     e08:	6a 01                	push   $0x1
     e0a:	e8 e1 2b 00 00       	call   39f0 <printf>
    exit();
     e0f:	e8 8e 2a 00 00       	call   38a2 <exit>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     e18:	83 ec 08             	sub    $0x8,%esp
     e1b:	68 52 41 00 00       	push   $0x4152
     e20:	6a 01                	push   $0x1
     e22:	e8 c9 2b 00 00       	call   39f0 <printf>
      kill(ppid);
     e27:	89 34 24             	mov    %esi,(%esp)
     e2a:	e8 a3 2a 00 00       	call   38d2 <kill>
      exit();
     e2f:	e8 6e 2a 00 00       	call   38a2 <exit>
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     e38:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e3b:	5b                   	pop    %ebx
     e3c:	5e                   	pop    %esi
     e3d:	5f                   	pop    %edi
     e3e:	5d                   	pop    %ebp
    wait();
     e3f:	e9 66 2a 00 00       	jmp    38aa <wait>
     e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e50 <sharedfd>:
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	57                   	push   %edi
     e54:	56                   	push   %esi
     e55:	53                   	push   %ebx
     e56:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     e59:	68 74 41 00 00       	push   $0x4174
     e5e:	6a 01                	push   $0x1
     e60:	e8 8b 2b 00 00       	call   39f0 <printf>
  unlink("sharedfd");
     e65:	c7 04 24 83 41 00 00 	movl   $0x4183,(%esp)
     e6c:	e8 81 2a 00 00       	call   38f2 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e71:	59                   	pop    %ecx
     e72:	5b                   	pop    %ebx
     e73:	68 02 02 00 00       	push   $0x202
     e78:	68 83 41 00 00       	push   $0x4183
     e7d:	e8 60 2a 00 00       	call   38e2 <open>
  if(fd < 0){
     e82:	83 c4 10             	add    $0x10,%esp
     e85:	85 c0                	test   %eax,%eax
     e87:	0f 88 33 01 00 00    	js     fc0 <sharedfd+0x170>
     e8d:	89 c6                	mov    %eax,%esi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e8f:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
     e94:	e8 01 2a 00 00       	call   389a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e99:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     e9c:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e9e:	19 c0                	sbb    %eax,%eax
     ea0:	83 ec 04             	sub    $0x4,%esp
     ea3:	83 e0 f3             	and    $0xfffffff3,%eax
     ea6:	6a 0a                	push   $0xa
     ea8:	83 c0 70             	add    $0x70,%eax
     eab:	50                   	push   %eax
     eac:	8d 45 de             	lea    -0x22(%ebp),%eax
     eaf:	50                   	push   %eax
     eb0:	e8 4b 28 00 00       	call   3700 <memset>
     eb5:	83 c4 10             	add    $0x10,%esp
     eb8:	eb 0b                	jmp    ec5 <sharedfd+0x75>
     eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 1000; i++){
     ec0:	83 eb 01             	sub    $0x1,%ebx
     ec3:	74 29                	je     eee <sharedfd+0x9e>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ec5:	8d 45 de             	lea    -0x22(%ebp),%eax
     ec8:	83 ec 04             	sub    $0x4,%esp
     ecb:	6a 0a                	push   $0xa
     ecd:	50                   	push   %eax
     ece:	56                   	push   %esi
     ecf:	e8 ee 29 00 00       	call   38c2 <write>
     ed4:	83 c4 10             	add    $0x10,%esp
     ed7:	83 f8 0a             	cmp    $0xa,%eax
     eda:	74 e4                	je     ec0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     edc:	83 ec 08             	sub    $0x8,%esp
     edf:	68 74 4e 00 00       	push   $0x4e74
     ee4:	6a 01                	push   $0x1
     ee6:	e8 05 2b 00 00       	call   39f0 <printf>
      break;
     eeb:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     eee:	85 ff                	test   %edi,%edi
     ef0:	0f 84 fe 00 00 00    	je     ff4 <sharedfd+0x1a4>
    wait();
     ef6:	e8 af 29 00 00       	call   38aa <wait>
  close(fd);
     efb:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
     efe:	31 db                	xor    %ebx,%ebx
     f00:	31 ff                	xor    %edi,%edi
  close(fd);
     f02:	56                   	push   %esi
     f03:	8d 75 e8             	lea    -0x18(%ebp),%esi
     f06:	e8 bf 29 00 00       	call   38ca <close>
  fd = open("sharedfd", 0);
     f0b:	58                   	pop    %eax
     f0c:	5a                   	pop    %edx
     f0d:	6a 00                	push   $0x0
     f0f:	68 83 41 00 00       	push   $0x4183
     f14:	e8 c9 29 00 00       	call   38e2 <open>
  if(fd < 0){
     f19:	83 c4 10             	add    $0x10,%esp
     f1c:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
     f1e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(fd < 0){
     f21:	0f 88 b3 00 00 00    	js     fda <sharedfd+0x18a>
     f27:	89 f8                	mov    %edi,%eax
     f29:	89 df                	mov    %ebx,%edi
     f2b:	89 c3                	mov    %eax,%ebx
     f2d:	8d 76 00             	lea    0x0(%esi),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f30:	8d 45 de             	lea    -0x22(%ebp),%eax
     f33:	83 ec 04             	sub    $0x4,%esp
     f36:	6a 0a                	push   $0xa
     f38:	50                   	push   %eax
     f39:	ff 75 d4             	pushl  -0x2c(%ebp)
     f3c:	e8 79 29 00 00       	call   38ba <read>
     f41:	83 c4 10             	add    $0x10,%esp
     f44:	85 c0                	test   %eax,%eax
     f46:	7e 28                	jle    f70 <sharedfd+0x120>
     f48:	8d 45 de             	lea    -0x22(%ebp),%eax
     f4b:	eb 15                	jmp    f62 <sharedfd+0x112>
     f4d:	8d 76 00             	lea    0x0(%esi),%esi
        np++;
     f50:	80 fa 70             	cmp    $0x70,%dl
     f53:	0f 94 c2             	sete   %dl
     f56:	0f b6 d2             	movzbl %dl,%edx
     f59:	01 d7                	add    %edx,%edi
     f5b:	83 c0 01             	add    $0x1,%eax
    for(i = 0; i < sizeof(buf); i++){
     f5e:	39 f0                	cmp    %esi,%eax
     f60:	74 ce                	je     f30 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f62:	0f b6 10             	movzbl (%eax),%edx
     f65:	80 fa 63             	cmp    $0x63,%dl
     f68:	75 e6                	jne    f50 <sharedfd+0x100>
        nc++;
     f6a:	83 c3 01             	add    $0x1,%ebx
     f6d:	eb ec                	jmp    f5b <sharedfd+0x10b>
     f6f:	90                   	nop
  close(fd);
     f70:	83 ec 0c             	sub    $0xc,%esp
     f73:	89 d8                	mov    %ebx,%eax
     f75:	ff 75 d4             	pushl  -0x2c(%ebp)
     f78:	89 fb                	mov    %edi,%ebx
     f7a:	89 c7                	mov    %eax,%edi
     f7c:	e8 49 29 00 00       	call   38ca <close>
  unlink("sharedfd");
     f81:	c7 04 24 83 41 00 00 	movl   $0x4183,(%esp)
     f88:	e8 65 29 00 00       	call   38f2 <unlink>
  if(nc == 10000 && np == 10000){
     f8d:	83 c4 10             	add    $0x10,%esp
     f90:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     f96:	75 61                	jne    ff9 <sharedfd+0x1a9>
     f98:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f9e:	75 59                	jne    ff9 <sharedfd+0x1a9>
    printf(1, "sharedfd ok\n");
     fa0:	83 ec 08             	sub    $0x8,%esp
     fa3:	68 8c 41 00 00       	push   $0x418c
     fa8:	6a 01                	push   $0x1
     faa:	e8 41 2a 00 00       	call   39f0 <printf>
     faf:	83 c4 10             	add    $0x10,%esp
}
     fb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fb5:	5b                   	pop    %ebx
     fb6:	5e                   	pop    %esi
     fb7:	5f                   	pop    %edi
     fb8:	5d                   	pop    %ebp
     fb9:	c3                   	ret    
     fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "fstests: cannot open sharedfd for writing");
     fc0:	83 ec 08             	sub    $0x8,%esp
     fc3:	68 48 4e 00 00       	push   $0x4e48
     fc8:	6a 01                	push   $0x1
     fca:	e8 21 2a 00 00       	call   39f0 <printf>
    return;
     fcf:	83 c4 10             	add    $0x10,%esp
}
     fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd5:	5b                   	pop    %ebx
     fd6:	5e                   	pop    %esi
     fd7:	5f                   	pop    %edi
     fd8:	5d                   	pop    %ebp
     fd9:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fda:	83 ec 08             	sub    $0x8,%esp
     fdd:	68 94 4e 00 00       	push   $0x4e94
     fe2:	6a 01                	push   $0x1
     fe4:	e8 07 2a 00 00       	call   39f0 <printf>
    return;
     fe9:	83 c4 10             	add    $0x10,%esp
}
     fec:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fef:	5b                   	pop    %ebx
     ff0:	5e                   	pop    %esi
     ff1:	5f                   	pop    %edi
     ff2:	5d                   	pop    %ebp
     ff3:	c3                   	ret    
    exit();
     ff4:	e8 a9 28 00 00       	call   38a2 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
     ff9:	53                   	push   %ebx
     ffa:	57                   	push   %edi
     ffb:	68 99 41 00 00       	push   $0x4199
    1000:	6a 01                	push   $0x1
    1002:	e8 e9 29 00 00       	call   39f0 <printf>
    exit();
    1007:	e8 96 28 00 00       	call   38a2 <exit>
    100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001010 <fourfiles>:
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
  printf(1, "fourfiles test\n");
    1016:	be ae 41 00 00       	mov    $0x41ae,%esi
  for(pi = 0; pi < 4; pi++){
    101b:	31 db                	xor    %ebx,%ebx
{
    101d:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    1020:	c7 45 d8 ae 41 00 00 	movl   $0x41ae,-0x28(%ebp)
    1027:	c7 45 dc f7 42 00 00 	movl   $0x42f7,-0x24(%ebp)
  printf(1, "fourfiles test\n");
    102e:	68 b4 41 00 00       	push   $0x41b4
    1033:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    1035:	c7 45 e0 fb 42 00 00 	movl   $0x42fb,-0x20(%ebp)
    103c:	c7 45 e4 b1 41 00 00 	movl   $0x41b1,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    1043:	e8 a8 29 00 00       	call   39f0 <printf>
    1048:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    104b:	83 ec 0c             	sub    $0xc,%esp
    104e:	56                   	push   %esi
    104f:	e8 9e 28 00 00       	call   38f2 <unlink>
    pid = fork();
    1054:	e8 41 28 00 00       	call   389a <fork>
    if(pid < 0){
    1059:	83 c4 10             	add    $0x10,%esp
    105c:	85 c0                	test   %eax,%eax
    105e:	0f 88 68 01 00 00    	js     11cc <fourfiles+0x1bc>
    if(pid == 0){
    1064:	0f 84 df 00 00 00    	je     1149 <fourfiles+0x139>
  for(pi = 0; pi < 4; pi++){
    106a:	83 c3 01             	add    $0x1,%ebx
    106d:	83 fb 04             	cmp    $0x4,%ebx
    1070:	74 06                	je     1078 <fourfiles+0x68>
    1072:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1076:	eb d3                	jmp    104b <fourfiles+0x3b>
    wait();
    1078:	e8 2d 28 00 00       	call   38aa <wait>
  for(i = 0; i < 2; i++){
    107d:	31 ff                	xor    %edi,%edi
    wait();
    107f:	e8 26 28 00 00       	call   38aa <wait>
    1084:	e8 21 28 00 00       	call   38aa <wait>
    1089:	e8 1c 28 00 00       	call   38aa <wait>
    108e:	c7 45 d0 ae 41 00 00 	movl   $0x41ae,-0x30(%ebp)
    fd = open(fname, 0);
    1095:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    1098:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    109a:	6a 00                	push   $0x0
    109c:	ff 75 d0             	pushl  -0x30(%ebp)
    109f:	e8 3e 28 00 00       	call   38e2 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a4:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    10a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 20 00 00       	push   $0x2000
    10b8:	68 e0 85 00 00       	push   $0x85e0
    10bd:	ff 75 d4             	pushl  -0x2c(%ebp)
    10c0:	e8 f5 27 00 00       	call   38ba <read>
    10c5:	83 c4 10             	add    $0x10,%esp
    10c8:	85 c0                	test   %eax,%eax
    10ca:	7e 26                	jle    10f2 <fourfiles+0xe2>
      for(j = 0; j < n; j++){
    10cc:	31 d2                	xor    %edx,%edx
    10ce:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
    10d0:	0f be b2 e0 85 00 00 	movsbl 0x85e0(%edx),%esi
    10d7:	83 ff 01             	cmp    $0x1,%edi
    10da:	19 c9                	sbb    %ecx,%ecx
    10dc:	83 c1 31             	add    $0x31,%ecx
    10df:	39 ce                	cmp    %ecx,%esi
    10e1:	0f 85 be 00 00 00    	jne    11a5 <fourfiles+0x195>
      for(j = 0; j < n; j++){
    10e7:	83 c2 01             	add    $0x1,%edx
    10ea:	39 d0                	cmp    %edx,%eax
    10ec:	75 e2                	jne    10d0 <fourfiles+0xc0>
      total += n;
    10ee:	01 c3                	add    %eax,%ebx
    10f0:	eb be                	jmp    10b0 <fourfiles+0xa0>
    close(fd);
    10f2:	83 ec 0c             	sub    $0xc,%esp
    10f5:	ff 75 d4             	pushl  -0x2c(%ebp)
    10f8:	e8 cd 27 00 00       	call   38ca <close>
    if(total != 12*500){
    10fd:	83 c4 10             	add    $0x10,%esp
    1100:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1106:	0f 85 d3 00 00 00    	jne    11df <fourfiles+0x1cf>
    unlink(fname);
    110c:	83 ec 0c             	sub    $0xc,%esp
    110f:	ff 75 d0             	pushl  -0x30(%ebp)
    1112:	e8 db 27 00 00       	call   38f2 <unlink>
  for(i = 0; i < 2; i++){
    1117:	83 c4 10             	add    $0x10,%esp
    111a:	83 ff 01             	cmp    $0x1,%edi
    111d:	75 1a                	jne    1139 <fourfiles+0x129>
  printf(1, "fourfiles ok\n");
    111f:	83 ec 08             	sub    $0x8,%esp
    1122:	68 f2 41 00 00       	push   $0x41f2
    1127:	6a 01                	push   $0x1
    1129:	e8 c2 28 00 00       	call   39f0 <printf>
}
    112e:	83 c4 10             	add    $0x10,%esp
    1131:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1134:	5b                   	pop    %ebx
    1135:	5e                   	pop    %esi
    1136:	5f                   	pop    %edi
    1137:	5d                   	pop    %ebp
    1138:	c3                   	ret    
    1139:	8b 45 dc             	mov    -0x24(%ebp),%eax
    113c:	bf 01 00 00 00       	mov    $0x1,%edi
    1141:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1144:	e9 4c ff ff ff       	jmp    1095 <fourfiles+0x85>
      fd = open(fname, O_CREATE | O_RDWR);
    1149:	83 ec 08             	sub    $0x8,%esp
    114c:	68 02 02 00 00       	push   $0x202
    1151:	56                   	push   %esi
    1152:	e8 8b 27 00 00       	call   38e2 <open>
      if(fd < 0){
    1157:	83 c4 10             	add    $0x10,%esp
    115a:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    115c:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    115e:	78 59                	js     11b9 <fourfiles+0x1a9>
      memset(buf, '0'+pi, 512);
    1160:	83 ec 04             	sub    $0x4,%esp
    1163:	83 c3 30             	add    $0x30,%ebx
    1166:	68 00 02 00 00       	push   $0x200
    116b:	53                   	push   %ebx
    116c:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1171:	68 e0 85 00 00       	push   $0x85e0
    1176:	e8 85 25 00 00       	call   3700 <memset>
    117b:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    117e:	83 ec 04             	sub    $0x4,%esp
    1181:	68 f4 01 00 00       	push   $0x1f4
    1186:	68 e0 85 00 00       	push   $0x85e0
    118b:	56                   	push   %esi
    118c:	e8 31 27 00 00       	call   38c2 <write>
    1191:	83 c4 10             	add    $0x10,%esp
    1194:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    1199:	75 57                	jne    11f2 <fourfiles+0x1e2>
      for(i = 0; i < 12; i++){
    119b:	83 eb 01             	sub    $0x1,%ebx
    119e:	75 de                	jne    117e <fourfiles+0x16e>
      exit();
    11a0:	e8 fd 26 00 00       	call   38a2 <exit>
          printf(1, "wrong char\n");
    11a5:	83 ec 08             	sub    $0x8,%esp
    11a8:	68 d5 41 00 00       	push   $0x41d5
    11ad:	6a 01                	push   $0x1
    11af:	e8 3c 28 00 00       	call   39f0 <printf>
          exit();
    11b4:	e8 e9 26 00 00       	call   38a2 <exit>
        printf(1, "create failed\n");
    11b9:	51                   	push   %ecx
    11ba:	51                   	push   %ecx
    11bb:	68 4f 44 00 00       	push   $0x444f
    11c0:	6a 01                	push   $0x1
    11c2:	e8 29 28 00 00       	call   39f0 <printf>
        exit();
    11c7:	e8 d6 26 00 00       	call   38a2 <exit>
      printf(1, "fork failed\n");
    11cc:	53                   	push   %ebx
    11cd:	53                   	push   %ebx
    11ce:	68 89 4c 00 00       	push   $0x4c89
    11d3:	6a 01                	push   $0x1
    11d5:	e8 16 28 00 00       	call   39f0 <printf>
      exit();
    11da:	e8 c3 26 00 00       	call   38a2 <exit>
      printf(1, "wrong length %d\n", total);
    11df:	50                   	push   %eax
    11e0:	53                   	push   %ebx
    11e1:	68 e1 41 00 00       	push   $0x41e1
    11e6:	6a 01                	push   $0x1
    11e8:	e8 03 28 00 00       	call   39f0 <printf>
      exit();
    11ed:	e8 b0 26 00 00       	call   38a2 <exit>
          printf(1, "write failed %d\n", n);
    11f2:	52                   	push   %edx
    11f3:	50                   	push   %eax
    11f4:	68 c4 41 00 00       	push   $0x41c4
    11f9:	6a 01                	push   $0x1
    11fb:	e8 f0 27 00 00       	call   39f0 <printf>
          exit();
    1200:	e8 9d 26 00 00       	call   38a2 <exit>
    1205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <createdelete>:
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
    1215:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    1216:	31 db                	xor    %ebx,%ebx
{
    1218:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    121b:	68 00 42 00 00       	push   $0x4200
    1220:	6a 01                	push   $0x1
    1222:	e8 c9 27 00 00       	call   39f0 <printf>
    1227:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    122a:	e8 6b 26 00 00       	call   389a <fork>
    if(pid < 0){
    122f:	85 c0                	test   %eax,%eax
    1231:	0f 88 be 01 00 00    	js     13f5 <createdelete+0x1e5>
    if(pid == 0){
    1237:	0f 84 0b 01 00 00    	je     1348 <createdelete+0x138>
  for(pi = 0; pi < 4; pi++){
    123d:	83 c3 01             	add    $0x1,%ebx
    1240:	83 fb 04             	cmp    $0x4,%ebx
    1243:	75 e5                	jne    122a <createdelete+0x1a>
    1245:	8d 7d c8             	lea    -0x38(%ebp),%edi
  name[0] = name[1] = name[2] = 0;
    1248:	be ff ff ff ff       	mov    $0xffffffff,%esi
    wait();
    124d:	e8 58 26 00 00       	call   38aa <wait>
    1252:	e8 53 26 00 00       	call   38aa <wait>
    1257:	e8 4e 26 00 00       	call   38aa <wait>
    125c:	e8 49 26 00 00       	call   38aa <wait>
  name[0] = name[1] = name[2] = 0;
    1261:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1265:	8d 76 00             	lea    0x0(%esi),%esi
    1268:	8d 46 31             	lea    0x31(%esi),%eax
    126b:	88 45 c7             	mov    %al,-0x39(%ebp)
    126e:	8d 46 01             	lea    0x1(%esi),%eax
    1271:	83 f8 09             	cmp    $0x9,%eax
    1274:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1277:	0f 9f c3             	setg   %bl
    127a:	85 c0                	test   %eax,%eax
    127c:	0f 94 c0             	sete   %al
    127f:	09 c3                	or     %eax,%ebx
    1281:	88 5d c6             	mov    %bl,-0x3a(%ebp)
      name[2] = '\0';
    1284:	bb 70 00 00 00       	mov    $0x70,%ebx
      name[1] = '0' + i;
    1289:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    128d:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    1290:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    1293:	6a 00                	push   $0x0
    1295:	57                   	push   %edi
      name[1] = '0' + i;
    1296:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1299:	e8 44 26 00 00       	call   38e2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    129e:	83 c4 10             	add    $0x10,%esp
    12a1:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12a5:	0f 84 85 00 00 00    	je     1330 <createdelete+0x120>
    12ab:	85 c0                	test   %eax,%eax
    12ad:	0f 88 1a 01 00 00    	js     13cd <createdelete+0x1bd>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12b3:	83 fe 08             	cmp    $0x8,%esi
    12b6:	0f 86 54 01 00 00    	jbe    1410 <createdelete+0x200>
        close(fd);
    12bc:	83 ec 0c             	sub    $0xc,%esp
    12bf:	50                   	push   %eax
    12c0:	e8 05 26 00 00       	call   38ca <close>
    12c5:	83 c4 10             	add    $0x10,%esp
    12c8:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
    12cb:	80 fb 74             	cmp    $0x74,%bl
    12ce:	75 b9                	jne    1289 <createdelete+0x79>
    12d0:	8b 75 c0             	mov    -0x40(%ebp),%esi
  for(i = 0; i < N; i++){
    12d3:	83 fe 13             	cmp    $0x13,%esi
    12d6:	75 90                	jne    1268 <createdelete+0x58>
    12d8:	be 70 00 00 00       	mov    $0x70,%esi
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    12e0:	8d 46 c0             	lea    -0x40(%esi),%eax
  name[0] = name[1] = name[2] = 0;
    12e3:	bb 04 00 00 00       	mov    $0x4,%ebx
    12e8:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    12eb:	89 f0                	mov    %esi,%eax
      unlink(name);
    12ed:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    12f0:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12f3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12f7:	57                   	push   %edi
      name[1] = '0' + i;
    12f8:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    12fb:	e8 f2 25 00 00       	call   38f2 <unlink>
    for(pi = 0; pi < 4; pi++){
    1300:	83 c4 10             	add    $0x10,%esp
    1303:	83 eb 01             	sub    $0x1,%ebx
    1306:	75 e3                	jne    12eb <createdelete+0xdb>
    1308:	83 c6 01             	add    $0x1,%esi
  for(i = 0; i < N; i++){
    130b:	89 f0                	mov    %esi,%eax
    130d:	3c 84                	cmp    $0x84,%al
    130f:	75 cf                	jne    12e0 <createdelete+0xd0>
  printf(1, "createdelete ok\n");
    1311:	83 ec 08             	sub    $0x8,%esp
    1314:	68 13 42 00 00       	push   $0x4213
    1319:	6a 01                	push   $0x1
    131b:	e8 d0 26 00 00       	call   39f0 <printf>
}
    1320:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1323:	5b                   	pop    %ebx
    1324:	5e                   	pop    %esi
    1325:	5f                   	pop    %edi
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret    
    1328:	90                   	nop
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1330:	83 fe 08             	cmp    $0x8,%esi
    1333:	0f 86 cf 00 00 00    	jbe    1408 <createdelete+0x1f8>
      if(fd >= 0)
    1339:	85 c0                	test   %eax,%eax
    133b:	78 8b                	js     12c8 <createdelete+0xb8>
    133d:	e9 7a ff ff ff       	jmp    12bc <createdelete+0xac>
    1342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      name[0] = 'p' + pi;
    1348:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    134b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    134f:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    1352:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    1355:	31 db                	xor    %ebx,%ebx
    1357:	eb 0f                	jmp    1368 <createdelete+0x158>
    1359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1360:	83 fb 13             	cmp    $0x13,%ebx
    1363:	74 63                	je     13c8 <createdelete+0x1b8>
    1365:	83 c3 01             	add    $0x1,%ebx
        fd = open(name, O_CREATE | O_RDWR);
    1368:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    136b:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    136e:	68 02 02 00 00       	push   $0x202
    1373:	57                   	push   %edi
        name[1] = '0' + i;
    1374:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1377:	e8 66 25 00 00       	call   38e2 <open>
        if(fd < 0){
    137c:	83 c4 10             	add    $0x10,%esp
    137f:	85 c0                	test   %eax,%eax
    1381:	78 5f                	js     13e2 <createdelete+0x1d2>
        close(fd);
    1383:	83 ec 0c             	sub    $0xc,%esp
    1386:	50                   	push   %eax
    1387:	e8 3e 25 00 00       	call   38ca <close>
        if(i > 0 && (i % 2 ) == 0){
    138c:	83 c4 10             	add    $0x10,%esp
    138f:	85 db                	test   %ebx,%ebx
    1391:	74 d2                	je     1365 <createdelete+0x155>
    1393:	f6 c3 01             	test   $0x1,%bl
    1396:	75 c8                	jne    1360 <createdelete+0x150>
          if(unlink(name) < 0){
    1398:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    139b:	89 d8                	mov    %ebx,%eax
    139d:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    139f:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    13a0:	83 c0 30             	add    $0x30,%eax
    13a3:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    13a6:	e8 47 25 00 00       	call   38f2 <unlink>
    13ab:	83 c4 10             	add    $0x10,%esp
    13ae:	85 c0                	test   %eax,%eax
    13b0:	79 ae                	jns    1360 <createdelete+0x150>
            printf(1, "unlink failed\n");
    13b2:	52                   	push   %edx
    13b3:	52                   	push   %edx
    13b4:	68 01 3e 00 00       	push   $0x3e01
    13b9:	6a 01                	push   $0x1
    13bb:	e8 30 26 00 00       	call   39f0 <printf>
            exit();
    13c0:	e8 dd 24 00 00       	call   38a2 <exit>
    13c5:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
    13c8:	e8 d5 24 00 00       	call   38a2 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    13cd:	83 ec 04             	sub    $0x4,%esp
    13d0:	57                   	push   %edi
    13d1:	68 c0 4e 00 00       	push   $0x4ec0
    13d6:	6a 01                	push   $0x1
    13d8:	e8 13 26 00 00       	call   39f0 <printf>
        exit();
    13dd:	e8 c0 24 00 00       	call   38a2 <exit>
          printf(1, "create failed\n");
    13e2:	51                   	push   %ecx
    13e3:	51                   	push   %ecx
    13e4:	68 4f 44 00 00       	push   $0x444f
    13e9:	6a 01                	push   $0x1
    13eb:	e8 00 26 00 00       	call   39f0 <printf>
          exit();
    13f0:	e8 ad 24 00 00       	call   38a2 <exit>
      printf(1, "fork failed\n");
    13f5:	53                   	push   %ebx
    13f6:	53                   	push   %ebx
    13f7:	68 89 4c 00 00       	push   $0x4c89
    13fc:	6a 01                	push   $0x1
    13fe:	e8 ed 25 00 00       	call   39f0 <printf>
      exit();
    1403:	e8 9a 24 00 00       	call   38a2 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1408:	85 c0                	test   %eax,%eax
    140a:	0f 88 b8 fe ff ff    	js     12c8 <createdelete+0xb8>
        printf(1, "oops createdelete %s did exist\n", name);
    1410:	50                   	push   %eax
    1411:	57                   	push   %edi
    1412:	68 e4 4e 00 00       	push   $0x4ee4
    1417:	6a 01                	push   $0x1
    1419:	e8 d2 25 00 00       	call   39f0 <printf>
        exit();
    141e:	e8 7f 24 00 00       	call   38a2 <exit>
    1423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001430 <unlinkread>:
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	56                   	push   %esi
    1434:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1435:	83 ec 08             	sub    $0x8,%esp
    1438:	68 24 42 00 00       	push   $0x4224
    143d:	6a 01                	push   $0x1
    143f:	e8 ac 25 00 00       	call   39f0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1444:	5b                   	pop    %ebx
    1445:	5e                   	pop    %esi
    1446:	68 02 02 00 00       	push   $0x202
    144b:	68 35 42 00 00       	push   $0x4235
    1450:	e8 8d 24 00 00       	call   38e2 <open>
  if(fd < 0){
    1455:	83 c4 10             	add    $0x10,%esp
    1458:	85 c0                	test   %eax,%eax
    145a:	0f 88 e6 00 00 00    	js     1546 <unlinkread+0x116>
  write(fd, "hello", 5);
    1460:	83 ec 04             	sub    $0x4,%esp
    1463:	89 c3                	mov    %eax,%ebx
    1465:	6a 05                	push   $0x5
    1467:	68 5a 42 00 00       	push   $0x425a
    146c:	50                   	push   %eax
    146d:	e8 50 24 00 00       	call   38c2 <write>
  close(fd);
    1472:	89 1c 24             	mov    %ebx,(%esp)
    1475:	e8 50 24 00 00       	call   38ca <close>
  fd = open("unlinkread", O_RDWR);
    147a:	58                   	pop    %eax
    147b:	5a                   	pop    %edx
    147c:	6a 02                	push   $0x2
    147e:	68 35 42 00 00       	push   $0x4235
    1483:	e8 5a 24 00 00       	call   38e2 <open>
  if(fd < 0){
    1488:	83 c4 10             	add    $0x10,%esp
    148b:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
    148d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    148f:	0f 88 10 01 00 00    	js     15a5 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    1495:	83 ec 0c             	sub    $0xc,%esp
    1498:	68 35 42 00 00       	push   $0x4235
    149d:	e8 50 24 00 00       	call   38f2 <unlink>
    14a2:	83 c4 10             	add    $0x10,%esp
    14a5:	85 c0                	test   %eax,%eax
    14a7:	0f 85 e5 00 00 00    	jne    1592 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14ad:	83 ec 08             	sub    $0x8,%esp
    14b0:	68 02 02 00 00       	push   $0x202
    14b5:	68 35 42 00 00       	push   $0x4235
    14ba:	e8 23 24 00 00       	call   38e2 <open>
  write(fd1, "yyy", 3);
    14bf:	83 c4 0c             	add    $0xc,%esp
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14c2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14c4:	6a 03                	push   $0x3
    14c6:	68 92 42 00 00       	push   $0x4292
    14cb:	50                   	push   %eax
    14cc:	e8 f1 23 00 00       	call   38c2 <write>
  close(fd1);
    14d1:	89 34 24             	mov    %esi,(%esp)
    14d4:	e8 f1 23 00 00       	call   38ca <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    14d9:	83 c4 0c             	add    $0xc,%esp
    14dc:	68 00 20 00 00       	push   $0x2000
    14e1:	68 e0 85 00 00       	push   $0x85e0
    14e6:	53                   	push   %ebx
    14e7:	e8 ce 23 00 00       	call   38ba <read>
    14ec:	83 c4 10             	add    $0x10,%esp
    14ef:	83 f8 05             	cmp    $0x5,%eax
    14f2:	0f 85 87 00 00 00    	jne    157f <unlinkread+0x14f>
  if(buf[0] != 'h'){
    14f8:	80 3d e0 85 00 00 68 	cmpb   $0x68,0x85e0
    14ff:	75 6b                	jne    156c <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    1501:	83 ec 04             	sub    $0x4,%esp
    1504:	6a 0a                	push   $0xa
    1506:	68 e0 85 00 00       	push   $0x85e0
    150b:	53                   	push   %ebx
    150c:	e8 b1 23 00 00       	call   38c2 <write>
    1511:	83 c4 10             	add    $0x10,%esp
    1514:	83 f8 0a             	cmp    $0xa,%eax
    1517:	75 40                	jne    1559 <unlinkread+0x129>
  close(fd);
    1519:	83 ec 0c             	sub    $0xc,%esp
    151c:	53                   	push   %ebx
    151d:	e8 a8 23 00 00       	call   38ca <close>
  unlink("unlinkread");
    1522:	c7 04 24 35 42 00 00 	movl   $0x4235,(%esp)
    1529:	e8 c4 23 00 00       	call   38f2 <unlink>
  printf(1, "unlinkread ok\n");
    152e:	58                   	pop    %eax
    152f:	5a                   	pop    %edx
    1530:	68 dd 42 00 00       	push   $0x42dd
    1535:	6a 01                	push   $0x1
    1537:	e8 b4 24 00 00       	call   39f0 <printf>
}
    153c:	83 c4 10             	add    $0x10,%esp
    153f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1542:	5b                   	pop    %ebx
    1543:	5e                   	pop    %esi
    1544:	5d                   	pop    %ebp
    1545:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1546:	51                   	push   %ecx
    1547:	51                   	push   %ecx
    1548:	68 40 42 00 00       	push   $0x4240
    154d:	6a 01                	push   $0x1
    154f:	e8 9c 24 00 00       	call   39f0 <printf>
    exit();
    1554:	e8 49 23 00 00       	call   38a2 <exit>
    printf(1, "unlinkread write failed\n");
    1559:	51                   	push   %ecx
    155a:	51                   	push   %ecx
    155b:	68 c4 42 00 00       	push   $0x42c4
    1560:	6a 01                	push   $0x1
    1562:	e8 89 24 00 00       	call   39f0 <printf>
    exit();
    1567:	e8 36 23 00 00       	call   38a2 <exit>
    printf(1, "unlinkread wrong data\n");
    156c:	53                   	push   %ebx
    156d:	53                   	push   %ebx
    156e:	68 ad 42 00 00       	push   $0x42ad
    1573:	6a 01                	push   $0x1
    1575:	e8 76 24 00 00       	call   39f0 <printf>
    exit();
    157a:	e8 23 23 00 00       	call   38a2 <exit>
    printf(1, "unlinkread read failed");
    157f:	56                   	push   %esi
    1580:	56                   	push   %esi
    1581:	68 96 42 00 00       	push   $0x4296
    1586:	6a 01                	push   $0x1
    1588:	e8 63 24 00 00       	call   39f0 <printf>
    exit();
    158d:	e8 10 23 00 00       	call   38a2 <exit>
    printf(1, "unlink unlinkread failed\n");
    1592:	50                   	push   %eax
    1593:	50                   	push   %eax
    1594:	68 78 42 00 00       	push   $0x4278
    1599:	6a 01                	push   $0x1
    159b:	e8 50 24 00 00       	call   39f0 <printf>
    exit();
    15a0:	e8 fd 22 00 00       	call   38a2 <exit>
    printf(1, "open unlinkread failed\n");
    15a5:	50                   	push   %eax
    15a6:	50                   	push   %eax
    15a7:	68 60 42 00 00       	push   $0x4260
    15ac:	6a 01                	push   $0x1
    15ae:	e8 3d 24 00 00       	call   39f0 <printf>
    exit();
    15b3:	e8 ea 22 00 00       	call   38a2 <exit>
    15b8:	90                   	nop
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015c0 <linktest>:
{
    15c0:	55                   	push   %ebp
    15c1:	89 e5                	mov    %esp,%ebp
    15c3:	53                   	push   %ebx
    15c4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    15c7:	68 ec 42 00 00       	push   $0x42ec
    15cc:	6a 01                	push   $0x1
    15ce:	e8 1d 24 00 00       	call   39f0 <printf>
  unlink("lf1");
    15d3:	c7 04 24 f6 42 00 00 	movl   $0x42f6,(%esp)
    15da:	e8 13 23 00 00       	call   38f2 <unlink>
  unlink("lf2");
    15df:	c7 04 24 fa 42 00 00 	movl   $0x42fa,(%esp)
    15e6:	e8 07 23 00 00       	call   38f2 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    15eb:	58                   	pop    %eax
    15ec:	5a                   	pop    %edx
    15ed:	68 02 02 00 00       	push   $0x202
    15f2:	68 f6 42 00 00       	push   $0x42f6
    15f7:	e8 e6 22 00 00       	call   38e2 <open>
  if(fd < 0){
    15fc:	83 c4 10             	add    $0x10,%esp
    15ff:	85 c0                	test   %eax,%eax
    1601:	0f 88 1e 01 00 00    	js     1725 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    1607:	83 ec 04             	sub    $0x4,%esp
    160a:	89 c3                	mov    %eax,%ebx
    160c:	6a 05                	push   $0x5
    160e:	68 5a 42 00 00       	push   $0x425a
    1613:	50                   	push   %eax
    1614:	e8 a9 22 00 00       	call   38c2 <write>
    1619:	83 c4 10             	add    $0x10,%esp
    161c:	83 f8 05             	cmp    $0x5,%eax
    161f:	0f 85 98 01 00 00    	jne    17bd <linktest+0x1fd>
  close(fd);
    1625:	83 ec 0c             	sub    $0xc,%esp
    1628:	53                   	push   %ebx
    1629:	e8 9c 22 00 00       	call   38ca <close>
  if(link("lf1", "lf2") < 0){
    162e:	5b                   	pop    %ebx
    162f:	58                   	pop    %eax
    1630:	68 fa 42 00 00       	push   $0x42fa
    1635:	68 f6 42 00 00       	push   $0x42f6
    163a:	e8 c3 22 00 00       	call   3902 <link>
    163f:	83 c4 10             	add    $0x10,%esp
    1642:	85 c0                	test   %eax,%eax
    1644:	0f 88 60 01 00 00    	js     17aa <linktest+0x1ea>
  unlink("lf1");
    164a:	83 ec 0c             	sub    $0xc,%esp
    164d:	68 f6 42 00 00       	push   $0x42f6
    1652:	e8 9b 22 00 00       	call   38f2 <unlink>
  if(open("lf1", 0) >= 0){
    1657:	58                   	pop    %eax
    1658:	5a                   	pop    %edx
    1659:	6a 00                	push   $0x0
    165b:	68 f6 42 00 00       	push   $0x42f6
    1660:	e8 7d 22 00 00       	call   38e2 <open>
    1665:	83 c4 10             	add    $0x10,%esp
    1668:	85 c0                	test   %eax,%eax
    166a:	0f 89 27 01 00 00    	jns    1797 <linktest+0x1d7>
  fd = open("lf2", 0);
    1670:	83 ec 08             	sub    $0x8,%esp
    1673:	6a 00                	push   $0x0
    1675:	68 fa 42 00 00       	push   $0x42fa
    167a:	e8 63 22 00 00       	call   38e2 <open>
  if(fd < 0){
    167f:	83 c4 10             	add    $0x10,%esp
    1682:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    1684:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1686:	0f 88 f8 00 00 00    	js     1784 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    168c:	83 ec 04             	sub    $0x4,%esp
    168f:	68 00 20 00 00       	push   $0x2000
    1694:	68 e0 85 00 00       	push   $0x85e0
    1699:	50                   	push   %eax
    169a:	e8 1b 22 00 00       	call   38ba <read>
    169f:	83 c4 10             	add    $0x10,%esp
    16a2:	83 f8 05             	cmp    $0x5,%eax
    16a5:	0f 85 c6 00 00 00    	jne    1771 <linktest+0x1b1>
  close(fd);
    16ab:	83 ec 0c             	sub    $0xc,%esp
    16ae:	53                   	push   %ebx
    16af:	e8 16 22 00 00       	call   38ca <close>
  if(link("lf2", "lf2") >= 0){
    16b4:	58                   	pop    %eax
    16b5:	5a                   	pop    %edx
    16b6:	68 fa 42 00 00       	push   $0x42fa
    16bb:	68 fa 42 00 00       	push   $0x42fa
    16c0:	e8 3d 22 00 00       	call   3902 <link>
    16c5:	83 c4 10             	add    $0x10,%esp
    16c8:	85 c0                	test   %eax,%eax
    16ca:	0f 89 8e 00 00 00    	jns    175e <linktest+0x19e>
  unlink("lf2");
    16d0:	83 ec 0c             	sub    $0xc,%esp
    16d3:	68 fa 42 00 00       	push   $0x42fa
    16d8:	e8 15 22 00 00       	call   38f2 <unlink>
  if(link("lf2", "lf1") >= 0){
    16dd:	59                   	pop    %ecx
    16de:	5b                   	pop    %ebx
    16df:	68 f6 42 00 00       	push   $0x42f6
    16e4:	68 fa 42 00 00       	push   $0x42fa
    16e9:	e8 14 22 00 00       	call   3902 <link>
    16ee:	83 c4 10             	add    $0x10,%esp
    16f1:	85 c0                	test   %eax,%eax
    16f3:	79 56                	jns    174b <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    16f5:	83 ec 08             	sub    $0x8,%esp
    16f8:	68 f6 42 00 00       	push   $0x42f6
    16fd:	68 be 45 00 00       	push   $0x45be
    1702:	e8 fb 21 00 00       	call   3902 <link>
    1707:	83 c4 10             	add    $0x10,%esp
    170a:	85 c0                	test   %eax,%eax
    170c:	79 2a                	jns    1738 <linktest+0x178>
  printf(1, "linktest ok\n");
    170e:	83 ec 08             	sub    $0x8,%esp
    1711:	68 94 43 00 00       	push   $0x4394
    1716:	6a 01                	push   $0x1
    1718:	e8 d3 22 00 00       	call   39f0 <printf>
}
    171d:	83 c4 10             	add    $0x10,%esp
    1720:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1723:	c9                   	leave  
    1724:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1725:	50                   	push   %eax
    1726:	50                   	push   %eax
    1727:	68 fe 42 00 00       	push   $0x42fe
    172c:	6a 01                	push   $0x1
    172e:	e8 bd 22 00 00       	call   39f0 <printf>
    exit();
    1733:	e8 6a 21 00 00       	call   38a2 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1738:	50                   	push   %eax
    1739:	50                   	push   %eax
    173a:	68 78 43 00 00       	push   $0x4378
    173f:	6a 01                	push   $0x1
    1741:	e8 aa 22 00 00       	call   39f0 <printf>
    exit();
    1746:	e8 57 21 00 00       	call   38a2 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    174b:	52                   	push   %edx
    174c:	52                   	push   %edx
    174d:	68 2c 4f 00 00       	push   $0x4f2c
    1752:	6a 01                	push   $0x1
    1754:	e8 97 22 00 00       	call   39f0 <printf>
    exit();
    1759:	e8 44 21 00 00       	call   38a2 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    175e:	50                   	push   %eax
    175f:	50                   	push   %eax
    1760:	68 5a 43 00 00       	push   $0x435a
    1765:	6a 01                	push   $0x1
    1767:	e8 84 22 00 00       	call   39f0 <printf>
    exit();
    176c:	e8 31 21 00 00       	call   38a2 <exit>
    printf(1, "read lf2 failed\n");
    1771:	51                   	push   %ecx
    1772:	51                   	push   %ecx
    1773:	68 49 43 00 00       	push   $0x4349
    1778:	6a 01                	push   $0x1
    177a:	e8 71 22 00 00       	call   39f0 <printf>
    exit();
    177f:	e8 1e 21 00 00       	call   38a2 <exit>
    printf(1, "open lf2 failed\n");
    1784:	53                   	push   %ebx
    1785:	53                   	push   %ebx
    1786:	68 38 43 00 00       	push   $0x4338
    178b:	6a 01                	push   $0x1
    178d:	e8 5e 22 00 00       	call   39f0 <printf>
    exit();
    1792:	e8 0b 21 00 00       	call   38a2 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    1797:	50                   	push   %eax
    1798:	50                   	push   %eax
    1799:	68 04 4f 00 00       	push   $0x4f04
    179e:	6a 01                	push   $0x1
    17a0:	e8 4b 22 00 00       	call   39f0 <printf>
    exit();
    17a5:	e8 f8 20 00 00       	call   38a2 <exit>
    printf(1, "link lf1 lf2 failed\n");
    17aa:	51                   	push   %ecx
    17ab:	51                   	push   %ecx
    17ac:	68 23 43 00 00       	push   $0x4323
    17b1:	6a 01                	push   $0x1
    17b3:	e8 38 22 00 00       	call   39f0 <printf>
    exit();
    17b8:	e8 e5 20 00 00       	call   38a2 <exit>
    printf(1, "write lf1 failed\n");
    17bd:	50                   	push   %eax
    17be:	50                   	push   %eax
    17bf:	68 11 43 00 00       	push   $0x4311
    17c4:	6a 01                	push   $0x1
    17c6:	e8 25 22 00 00       	call   39f0 <printf>
    exit();
    17cb:	e8 d2 20 00 00       	call   38a2 <exit>

000017d0 <concreate>:
{
    17d0:	55                   	push   %ebp
    17d1:	89 e5                	mov    %esp,%ebp
    17d3:	57                   	push   %edi
    17d4:	56                   	push   %esi
    17d5:	53                   	push   %ebx
  for(i = 0; i < 40; i++){
    17d6:	31 f6                	xor    %esi,%esi
    17d8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    if(pid && (i % 3) == 1){
    17db:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
{
    17e0:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    17e3:	68 a1 43 00 00       	push   $0x43a1
    17e8:	6a 01                	push   $0x1
    17ea:	e8 01 22 00 00       	call   39f0 <printf>
  file[0] = 'C';
    17ef:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17f3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17f7:	83 c4 10             	add    $0x10,%esp
    17fa:	eb 4c                	jmp    1848 <concreate+0x78>
    17fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    1800:	89 f0                	mov    %esi,%eax
    1802:	89 f1                	mov    %esi,%ecx
    1804:	f7 e7                	mul    %edi
    1806:	d1 ea                	shr    %edx
    1808:	8d 04 52             	lea    (%edx,%edx,2),%eax
    180b:	29 c1                	sub    %eax,%ecx
    180d:	83 f9 01             	cmp    $0x1,%ecx
    1810:	0f 84 ba 00 00 00    	je     18d0 <concreate+0x100>
      fd = open(file, O_CREATE | O_RDWR);
    1816:	83 ec 08             	sub    $0x8,%esp
    1819:	68 02 02 00 00       	push   $0x202
    181e:	53                   	push   %ebx
    181f:	e8 be 20 00 00       	call   38e2 <open>
      if(fd < 0){
    1824:	83 c4 10             	add    $0x10,%esp
    1827:	85 c0                	test   %eax,%eax
    1829:	78 67                	js     1892 <concreate+0xc2>
      close(fd);
    182b:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    182e:	83 c6 01             	add    $0x1,%esi
      close(fd);
    1831:	50                   	push   %eax
    1832:	e8 93 20 00 00       	call   38ca <close>
    1837:	83 c4 10             	add    $0x10,%esp
      wait();
    183a:	e8 6b 20 00 00       	call   38aa <wait>
  for(i = 0; i < 40; i++){
    183f:	83 fe 28             	cmp    $0x28,%esi
    1842:	0f 84 aa 00 00 00    	je     18f2 <concreate+0x122>
    unlink(file);
    1848:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    184b:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    184e:	53                   	push   %ebx
    file[1] = '0' + i;
    184f:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1852:	e8 9b 20 00 00       	call   38f2 <unlink>
    pid = fork();
    1857:	e8 3e 20 00 00       	call   389a <fork>
    if(pid && (i % 3) == 1){
    185c:	83 c4 10             	add    $0x10,%esp
    185f:	85 c0                	test   %eax,%eax
    1861:	75 9d                	jne    1800 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    1863:	89 f0                	mov    %esi,%eax
    1865:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    186a:	f7 e2                	mul    %edx
    186c:	c1 ea 02             	shr    $0x2,%edx
    186f:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1872:	29 c6                	sub    %eax,%esi
    1874:	83 fe 01             	cmp    $0x1,%esi
    1877:	74 37                	je     18b0 <concreate+0xe0>
      fd = open(file, O_CREATE | O_RDWR);
    1879:	83 ec 08             	sub    $0x8,%esp
    187c:	68 02 02 00 00       	push   $0x202
    1881:	53                   	push   %ebx
    1882:	e8 5b 20 00 00       	call   38e2 <open>
      if(fd < 0){
    1887:	83 c4 10             	add    $0x10,%esp
    188a:	85 c0                	test   %eax,%eax
    188c:	0f 89 28 02 00 00    	jns    1aba <concreate+0x2ea>
        printf(1, "concreate create %s failed\n", file);
    1892:	83 ec 04             	sub    $0x4,%esp
    1895:	53                   	push   %ebx
    1896:	68 b4 43 00 00       	push   $0x43b4
    189b:	6a 01                	push   $0x1
    189d:	e8 4e 21 00 00       	call   39f0 <printf>
        exit();
    18a2:	e8 fb 1f 00 00       	call   38a2 <exit>
    18a7:	89 f6                	mov    %esi,%esi
    18a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    18b0:	83 ec 08             	sub    $0x8,%esp
    18b3:	53                   	push   %ebx
    18b4:	68 b1 43 00 00       	push   $0x43b1
    18b9:	e8 44 20 00 00       	call   3902 <link>
    18be:	83 c4 10             	add    $0x10,%esp
      exit();
    18c1:	e8 dc 1f 00 00       	call   38a2 <exit>
    18c6:	8d 76 00             	lea    0x0(%esi),%esi
    18c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    18d0:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    18d3:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    18d6:	53                   	push   %ebx
    18d7:	68 b1 43 00 00       	push   $0x43b1
    18dc:	e8 21 20 00 00       	call   3902 <link>
    18e1:	83 c4 10             	add    $0x10,%esp
      wait();
    18e4:	e8 c1 1f 00 00       	call   38aa <wait>
  for(i = 0; i < 40; i++){
    18e9:	83 fe 28             	cmp    $0x28,%esi
    18ec:	0f 85 56 ff ff ff    	jne    1848 <concreate+0x78>
  memset(fa, 0, sizeof(fa));
    18f2:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18f5:	83 ec 04             	sub    $0x4,%esp
    18f8:	6a 28                	push   $0x28
    18fa:	6a 00                	push   $0x0
    18fc:	50                   	push   %eax
    18fd:	e8 fe 1d 00 00       	call   3700 <memset>
  fd = open(".", 0);
    1902:	5f                   	pop    %edi
    1903:	58                   	pop    %eax
    1904:	6a 00                	push   $0x0
    1906:	68 be 45 00 00       	push   $0x45be
    190b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    190e:	e8 cf 1f 00 00       	call   38e2 <open>
  while(read(fd, &de, sizeof(de)) > 0){
    1913:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1916:	89 c6                	mov    %eax,%esi
  n = 0;
    1918:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    191f:	90                   	nop
  while(read(fd, &de, sizeof(de)) > 0){
    1920:	83 ec 04             	sub    $0x4,%esp
    1923:	6a 10                	push   $0x10
    1925:	57                   	push   %edi
    1926:	56                   	push   %esi
    1927:	e8 8e 1f 00 00       	call   38ba <read>
    192c:	83 c4 10             	add    $0x10,%esp
    192f:	85 c0                	test   %eax,%eax
    1931:	7e 3d                	jle    1970 <concreate+0x1a0>
    if(de.inum == 0)
    1933:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1938:	74 e6                	je     1920 <concreate+0x150>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    193a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    193e:	75 e0                	jne    1920 <concreate+0x150>
    1940:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1944:	75 da                	jne    1920 <concreate+0x150>
      i = de.name[1] - '0';
    1946:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    194a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    194d:	83 f8 27             	cmp    $0x27,%eax
    1950:	0f 87 4e 01 00 00    	ja     1aa4 <concreate+0x2d4>
      if(fa[i]){
    1956:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    195b:	0f 85 2d 01 00 00    	jne    1a8e <concreate+0x2be>
      fa[i] = 1;
    1961:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    1966:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    196a:	eb b4                	jmp    1920 <concreate+0x150>
    196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    1970:	83 ec 0c             	sub    $0xc,%esp
    1973:	56                   	push   %esi
    1974:	e8 51 1f 00 00       	call   38ca <close>
  if(n != 40){
    1979:	83 c4 10             	add    $0x10,%esp
    197c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1980:	0f 85 f5 00 00 00    	jne    1a7b <concreate+0x2ab>
  for(i = 0; i < 40; i++){
    1986:	31 f6                	xor    %esi,%esi
    1988:	eb 48                	jmp    19d2 <concreate+0x202>
    198a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    1990:	85 ff                	test   %edi,%edi
    1992:	74 05                	je     1999 <concreate+0x1c9>
    1994:	83 fa 01             	cmp    $0x1,%edx
    1997:	74 64                	je     19fd <concreate+0x22d>
      unlink(file);
    1999:	83 ec 0c             	sub    $0xc,%esp
    199c:	53                   	push   %ebx
    199d:	e8 50 1f 00 00       	call   38f2 <unlink>
      unlink(file);
    19a2:	89 1c 24             	mov    %ebx,(%esp)
    19a5:	e8 48 1f 00 00       	call   38f2 <unlink>
      unlink(file);
    19aa:	89 1c 24             	mov    %ebx,(%esp)
    19ad:	e8 40 1f 00 00       	call   38f2 <unlink>
      unlink(file);
    19b2:	89 1c 24             	mov    %ebx,(%esp)
    19b5:	e8 38 1f 00 00       	call   38f2 <unlink>
    19ba:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    19bd:	85 ff                	test   %edi,%edi
    19bf:	0f 84 fc fe ff ff    	je     18c1 <concreate+0xf1>
  for(i = 0; i < 40; i++){
    19c5:	83 c6 01             	add    $0x1,%esi
      wait();
    19c8:	e8 dd 1e 00 00       	call   38aa <wait>
  for(i = 0; i < 40; i++){
    19cd:	83 fe 28             	cmp    $0x28,%esi
    19d0:	74 7e                	je     1a50 <concreate+0x280>
    file[1] = '0' + i;
    19d2:	8d 46 30             	lea    0x30(%esi),%eax
    19d5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19d8:	e8 bd 1e 00 00       	call   389a <fork>
    if(pid < 0){
    19dd:	85 c0                	test   %eax,%eax
    pid = fork();
    19df:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    19e1:	0f 88 80 00 00 00    	js     1a67 <concreate+0x297>
    if(((i % 3) == 0 && pid == 0) ||
    19e7:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    19ec:	f7 e6                	mul    %esi
    19ee:	d1 ea                	shr    %edx
    19f0:	8d 04 52             	lea    (%edx,%edx,2),%eax
    19f3:	89 f2                	mov    %esi,%edx
    19f5:	29 c2                	sub    %eax,%edx
    19f7:	89 d0                	mov    %edx,%eax
    19f9:	09 f8                	or     %edi,%eax
    19fb:	75 93                	jne    1990 <concreate+0x1c0>
      close(open(file, 0));
    19fd:	83 ec 08             	sub    $0x8,%esp
    1a00:	6a 00                	push   $0x0
    1a02:	53                   	push   %ebx
    1a03:	e8 da 1e 00 00       	call   38e2 <open>
    1a08:	89 04 24             	mov    %eax,(%esp)
    1a0b:	e8 ba 1e 00 00       	call   38ca <close>
      close(open(file, 0));
    1a10:	58                   	pop    %eax
    1a11:	5a                   	pop    %edx
    1a12:	6a 00                	push   $0x0
    1a14:	53                   	push   %ebx
    1a15:	e8 c8 1e 00 00       	call   38e2 <open>
    1a1a:	89 04 24             	mov    %eax,(%esp)
    1a1d:	e8 a8 1e 00 00       	call   38ca <close>
      close(open(file, 0));
    1a22:	59                   	pop    %ecx
    1a23:	58                   	pop    %eax
    1a24:	6a 00                	push   $0x0
    1a26:	53                   	push   %ebx
    1a27:	e8 b6 1e 00 00       	call   38e2 <open>
    1a2c:	89 04 24             	mov    %eax,(%esp)
    1a2f:	e8 96 1e 00 00       	call   38ca <close>
      close(open(file, 0));
    1a34:	58                   	pop    %eax
    1a35:	5a                   	pop    %edx
    1a36:	6a 00                	push   $0x0
    1a38:	53                   	push   %ebx
    1a39:	e8 a4 1e 00 00       	call   38e2 <open>
    1a3e:	89 04 24             	mov    %eax,(%esp)
    1a41:	e8 84 1e 00 00       	call   38ca <close>
    1a46:	83 c4 10             	add    $0x10,%esp
    1a49:	e9 6f ff ff ff       	jmp    19bd <concreate+0x1ed>
    1a4e:	66 90                	xchg   %ax,%ax
  printf(1, "concreate ok\n");
    1a50:	83 ec 08             	sub    $0x8,%esp
    1a53:	68 06 44 00 00       	push   $0x4406
    1a58:	6a 01                	push   $0x1
    1a5a:	e8 91 1f 00 00       	call   39f0 <printf>
}
    1a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a62:	5b                   	pop    %ebx
    1a63:	5e                   	pop    %esi
    1a64:	5f                   	pop    %edi
    1a65:	5d                   	pop    %ebp
    1a66:	c3                   	ret    
      printf(1, "fork failed\n");
    1a67:	83 ec 08             	sub    $0x8,%esp
    1a6a:	68 89 4c 00 00       	push   $0x4c89
    1a6f:	6a 01                	push   $0x1
    1a71:	e8 7a 1f 00 00       	call   39f0 <printf>
      exit();
    1a76:	e8 27 1e 00 00       	call   38a2 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1a7b:	51                   	push   %ecx
    1a7c:	51                   	push   %ecx
    1a7d:	68 50 4f 00 00       	push   $0x4f50
    1a82:	6a 01                	push   $0x1
    1a84:	e8 67 1f 00 00       	call   39f0 <printf>
    exit();
    1a89:	e8 14 1e 00 00       	call   38a2 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1a8e:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a91:	53                   	push   %ebx
    1a92:	50                   	push   %eax
    1a93:	68 e9 43 00 00       	push   $0x43e9
    1a98:	6a 01                	push   $0x1
    1a9a:	e8 51 1f 00 00       	call   39f0 <printf>
        exit();
    1a9f:	e8 fe 1d 00 00       	call   38a2 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1aa4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1aa7:	56                   	push   %esi
    1aa8:	50                   	push   %eax
    1aa9:	68 d0 43 00 00       	push   $0x43d0
    1aae:	6a 01                	push   $0x1
    1ab0:	e8 3b 1f 00 00       	call   39f0 <printf>
        exit();
    1ab5:	e8 e8 1d 00 00       	call   38a2 <exit>
      close(fd);
    1aba:	83 ec 0c             	sub    $0xc,%esp
    1abd:	50                   	push   %eax
    1abe:	e8 07 1e 00 00       	call   38ca <close>
    1ac3:	83 c4 10             	add    $0x10,%esp
    1ac6:	e9 f6 fd ff ff       	jmp    18c1 <concreate+0xf1>
    1acb:	90                   	nop
    1acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001ad0 <linkunlink>:
{
    1ad0:	55                   	push   %ebp
    1ad1:	89 e5                	mov    %esp,%ebp
    1ad3:	57                   	push   %edi
    1ad4:	56                   	push   %esi
    1ad5:	53                   	push   %ebx
    1ad6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1ad9:	68 14 44 00 00       	push   $0x4414
    1ade:	6a 01                	push   $0x1
    1ae0:	e8 0b 1f 00 00       	call   39f0 <printf>
  unlink("x");
    1ae5:	c7 04 24 a1 46 00 00 	movl   $0x46a1,(%esp)
    1aec:	e8 01 1e 00 00       	call   38f2 <unlink>
  pid = fork();
    1af1:	e8 a4 1d 00 00       	call   389a <fork>
  if(pid < 0){
    1af6:	83 c4 10             	add    $0x10,%esp
    1af9:	85 c0                	test   %eax,%eax
  pid = fork();
    1afb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1afe:	0f 88 b6 00 00 00    	js     1bba <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1b04:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b08:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1b0d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1b12:	19 ff                	sbb    %edi,%edi
    1b14:	83 e7 60             	and    $0x60,%edi
    1b17:	83 c7 01             	add    $0x1,%edi
    1b1a:	eb 1e                	jmp    1b3a <linkunlink+0x6a>
    1b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1b20:	83 fa 01             	cmp    $0x1,%edx
    1b23:	74 7b                	je     1ba0 <linkunlink+0xd0>
      unlink("x");
    1b25:	83 ec 0c             	sub    $0xc,%esp
    1b28:	68 a1 46 00 00       	push   $0x46a1
    1b2d:	e8 c0 1d 00 00       	call   38f2 <unlink>
    1b32:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b35:	83 eb 01             	sub    $0x1,%ebx
    1b38:	74 3d                	je     1b77 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b3a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b40:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b46:	89 f8                	mov    %edi,%eax
    1b48:	f7 e6                	mul    %esi
    1b4a:	d1 ea                	shr    %edx
    1b4c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b4f:	89 fa                	mov    %edi,%edx
    1b51:	29 c2                	sub    %eax,%edx
    1b53:	75 cb                	jne    1b20 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b55:	83 ec 08             	sub    $0x8,%esp
    1b58:	68 02 02 00 00       	push   $0x202
    1b5d:	68 a1 46 00 00       	push   $0x46a1
    1b62:	e8 7b 1d 00 00       	call   38e2 <open>
    1b67:	89 04 24             	mov    %eax,(%esp)
    1b6a:	e8 5b 1d 00 00       	call   38ca <close>
    1b6f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b72:	83 eb 01             	sub    $0x1,%ebx
    1b75:	75 c3                	jne    1b3a <linkunlink+0x6a>
  if(pid)
    1b77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b7a:	85 c0                	test   %eax,%eax
    1b7c:	74 4f                	je     1bcd <linkunlink+0xfd>
    wait();
    1b7e:	e8 27 1d 00 00       	call   38aa <wait>
  printf(1, "linkunlink ok\n");
    1b83:	83 ec 08             	sub    $0x8,%esp
    1b86:	68 29 44 00 00       	push   $0x4429
    1b8b:	6a 01                	push   $0x1
    1b8d:	e8 5e 1e 00 00       	call   39f0 <printf>
}
    1b92:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b95:	5b                   	pop    %ebx
    1b96:	5e                   	pop    %esi
    1b97:	5f                   	pop    %edi
    1b98:	5d                   	pop    %ebp
    1b99:	c3                   	ret    
    1b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("cat", "x");
    1ba0:	83 ec 08             	sub    $0x8,%esp
    1ba3:	68 a1 46 00 00       	push   $0x46a1
    1ba8:	68 25 44 00 00       	push   $0x4425
    1bad:	e8 50 1d 00 00       	call   3902 <link>
    1bb2:	83 c4 10             	add    $0x10,%esp
    1bb5:	e9 7b ff ff ff       	jmp    1b35 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1bba:	52                   	push   %edx
    1bbb:	52                   	push   %edx
    1bbc:	68 89 4c 00 00       	push   $0x4c89
    1bc1:	6a 01                	push   $0x1
    1bc3:	e8 28 1e 00 00       	call   39f0 <printf>
    exit();
    1bc8:	e8 d5 1c 00 00       	call   38a2 <exit>
    exit();
    1bcd:	e8 d0 1c 00 00       	call   38a2 <exit>
    1bd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001be0 <bigdir>:
{
    1be0:	55                   	push   %ebp
    1be1:	89 e5                	mov    %esp,%ebp
    1be3:	57                   	push   %edi
    1be4:	56                   	push   %esi
    1be5:	53                   	push   %ebx
    1be6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1be9:	68 38 44 00 00       	push   $0x4438
    1bee:	6a 01                	push   $0x1
    1bf0:	e8 fb 1d 00 00       	call   39f0 <printf>
  unlink("bd");
    1bf5:	c7 04 24 45 44 00 00 	movl   $0x4445,(%esp)
    1bfc:	e8 f1 1c 00 00       	call   38f2 <unlink>
  fd = open("bd", O_CREATE);
    1c01:	5a                   	pop    %edx
    1c02:	59                   	pop    %ecx
    1c03:	68 00 02 00 00       	push   $0x200
    1c08:	68 45 44 00 00       	push   $0x4445
    1c0d:	e8 d0 1c 00 00       	call   38e2 <open>
  if(fd < 0){
    1c12:	83 c4 10             	add    $0x10,%esp
    1c15:	85 c0                	test   %eax,%eax
    1c17:	0f 88 de 00 00 00    	js     1cfb <bigdir+0x11b>
  close(fd);
    1c1d:	83 ec 0c             	sub    $0xc,%esp
    1c20:	8d 7d de             	lea    -0x22(%ebp),%edi
  for(i = 0; i < 500; i++){
    1c23:	31 f6                	xor    %esi,%esi
  close(fd);
    1c25:	50                   	push   %eax
    1c26:	e8 9f 1c 00 00       	call   38ca <close>
    1c2b:	83 c4 10             	add    $0x10,%esp
    1c2e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1c30:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1c32:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1c35:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c39:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1c3c:	57                   	push   %edi
    1c3d:	68 45 44 00 00       	push   $0x4445
    name[1] = '0' + (i / 64);
    1c42:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1c45:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c49:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c4c:	89 f0                	mov    %esi,%eax
    1c4e:	83 e0 3f             	and    $0x3f,%eax
    1c51:	83 c0 30             	add    $0x30,%eax
    1c54:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1c57:	e8 a6 1c 00 00       	call   3902 <link>
    1c5c:	83 c4 10             	add    $0x10,%esp
    1c5f:	85 c0                	test   %eax,%eax
    1c61:	89 c3                	mov    %eax,%ebx
    1c63:	75 6e                	jne    1cd3 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1c65:	83 c6 01             	add    $0x1,%esi
    1c68:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1c6e:	75 c0                	jne    1c30 <bigdir+0x50>
  unlink("bd");
    1c70:	83 ec 0c             	sub    $0xc,%esp
    1c73:	68 45 44 00 00       	push   $0x4445
    1c78:	e8 75 1c 00 00       	call   38f2 <unlink>
    1c7d:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1c80:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1c82:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1c85:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c89:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1c8c:	57                   	push   %edi
    name[3] = '\0';
    1c8d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c91:	83 c0 30             	add    $0x30,%eax
    1c94:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c97:	89 d8                	mov    %ebx,%eax
    1c99:	83 e0 3f             	and    $0x3f,%eax
    1c9c:	83 c0 30             	add    $0x30,%eax
    1c9f:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1ca2:	e8 4b 1c 00 00       	call   38f2 <unlink>
    1ca7:	83 c4 10             	add    $0x10,%esp
    1caa:	85 c0                	test   %eax,%eax
    1cac:	75 39                	jne    1ce7 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    1cae:	83 c3 01             	add    $0x1,%ebx
    1cb1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cb7:	75 c7                	jne    1c80 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1cb9:	83 ec 08             	sub    $0x8,%esp
    1cbc:	68 87 44 00 00       	push   $0x4487
    1cc1:	6a 01                	push   $0x1
    1cc3:	e8 28 1d 00 00       	call   39f0 <printf>
}
    1cc8:	83 c4 10             	add    $0x10,%esp
    1ccb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cce:	5b                   	pop    %ebx
    1ccf:	5e                   	pop    %esi
    1cd0:	5f                   	pop    %edi
    1cd1:	5d                   	pop    %ebp
    1cd2:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1cd3:	83 ec 08             	sub    $0x8,%esp
    1cd6:	68 5e 44 00 00       	push   $0x445e
    1cdb:	6a 01                	push   $0x1
    1cdd:	e8 0e 1d 00 00       	call   39f0 <printf>
      exit();
    1ce2:	e8 bb 1b 00 00       	call   38a2 <exit>
      printf(1, "bigdir unlink failed");
    1ce7:	83 ec 08             	sub    $0x8,%esp
    1cea:	68 72 44 00 00       	push   $0x4472
    1cef:	6a 01                	push   $0x1
    1cf1:	e8 fa 1c 00 00       	call   39f0 <printf>
      exit();
    1cf6:	e8 a7 1b 00 00       	call   38a2 <exit>
    printf(1, "bigdir create failed\n");
    1cfb:	50                   	push   %eax
    1cfc:	50                   	push   %eax
    1cfd:	68 48 44 00 00       	push   $0x4448
    1d02:	6a 01                	push   $0x1
    1d04:	e8 e7 1c 00 00       	call   39f0 <printf>
    exit();
    1d09:	e8 94 1b 00 00       	call   38a2 <exit>
    1d0e:	66 90                	xchg   %ax,%ax

00001d10 <subdir>:
{
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	53                   	push   %ebx
    1d14:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1d17:	68 92 44 00 00       	push   $0x4492
    1d1c:	6a 01                	push   $0x1
    1d1e:	e8 cd 1c 00 00       	call   39f0 <printf>
  unlink("ff");
    1d23:	c7 04 24 1b 45 00 00 	movl   $0x451b,(%esp)
    1d2a:	e8 c3 1b 00 00       	call   38f2 <unlink>
  if(mkdir("dd") != 0){
    1d2f:	c7 04 24 b8 45 00 00 	movl   $0x45b8,(%esp)
    1d36:	e8 cf 1b 00 00       	call   390a <mkdir>
    1d3b:	83 c4 10             	add    $0x10,%esp
    1d3e:	85 c0                	test   %eax,%eax
    1d40:	0f 85 b3 05 00 00    	jne    22f9 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d46:	83 ec 08             	sub    $0x8,%esp
    1d49:	68 02 02 00 00       	push   $0x202
    1d4e:	68 f1 44 00 00       	push   $0x44f1
    1d53:	e8 8a 1b 00 00       	call   38e2 <open>
  if(fd < 0){
    1d58:	83 c4 10             	add    $0x10,%esp
    1d5b:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d5d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d5f:	0f 88 81 05 00 00    	js     22e6 <subdir+0x5d6>
  write(fd, "ff", 2);
    1d65:	83 ec 04             	sub    $0x4,%esp
    1d68:	6a 02                	push   $0x2
    1d6a:	68 1b 45 00 00       	push   $0x451b
    1d6f:	50                   	push   %eax
    1d70:	e8 4d 1b 00 00       	call   38c2 <write>
  close(fd);
    1d75:	89 1c 24             	mov    %ebx,(%esp)
    1d78:	e8 4d 1b 00 00       	call   38ca <close>
  if(unlink("dd") >= 0){
    1d7d:	c7 04 24 b8 45 00 00 	movl   $0x45b8,(%esp)
    1d84:	e8 69 1b 00 00       	call   38f2 <unlink>
    1d89:	83 c4 10             	add    $0x10,%esp
    1d8c:	85 c0                	test   %eax,%eax
    1d8e:	0f 89 3f 05 00 00    	jns    22d3 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    1d94:	83 ec 0c             	sub    $0xc,%esp
    1d97:	68 cc 44 00 00       	push   $0x44cc
    1d9c:	e8 69 1b 00 00       	call   390a <mkdir>
    1da1:	83 c4 10             	add    $0x10,%esp
    1da4:	85 c0                	test   %eax,%eax
    1da6:	0f 85 14 05 00 00    	jne    22c0 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dac:	83 ec 08             	sub    $0x8,%esp
    1daf:	68 02 02 00 00       	push   $0x202
    1db4:	68 ee 44 00 00       	push   $0x44ee
    1db9:	e8 24 1b 00 00       	call   38e2 <open>
  if(fd < 0){
    1dbe:	83 c4 10             	add    $0x10,%esp
    1dc1:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dc3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dc5:	0f 88 24 04 00 00    	js     21ef <subdir+0x4df>
  write(fd, "FF", 2);
    1dcb:	83 ec 04             	sub    $0x4,%esp
    1dce:	6a 02                	push   $0x2
    1dd0:	68 0f 45 00 00       	push   $0x450f
    1dd5:	50                   	push   %eax
    1dd6:	e8 e7 1a 00 00       	call   38c2 <write>
  close(fd);
    1ddb:	89 1c 24             	mov    %ebx,(%esp)
    1dde:	e8 e7 1a 00 00       	call   38ca <close>
  fd = open("dd/dd/../ff", 0);
    1de3:	58                   	pop    %eax
    1de4:	5a                   	pop    %edx
    1de5:	6a 00                	push   $0x0
    1de7:	68 12 45 00 00       	push   $0x4512
    1dec:	e8 f1 1a 00 00       	call   38e2 <open>
  if(fd < 0){
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    1df6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1df8:	0f 88 de 03 00 00    	js     21dc <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    1dfe:	83 ec 04             	sub    $0x4,%esp
    1e01:	68 00 20 00 00       	push   $0x2000
    1e06:	68 e0 85 00 00       	push   $0x85e0
    1e0b:	50                   	push   %eax
    1e0c:	e8 a9 1a 00 00       	call   38ba <read>
  if(cc != 2 || buf[0] != 'f'){
    1e11:	83 c4 10             	add    $0x10,%esp
    1e14:	83 f8 02             	cmp    $0x2,%eax
    1e17:	0f 85 3a 03 00 00    	jne    2157 <subdir+0x447>
    1e1d:	80 3d e0 85 00 00 66 	cmpb   $0x66,0x85e0
    1e24:	0f 85 2d 03 00 00    	jne    2157 <subdir+0x447>
  close(fd);
    1e2a:	83 ec 0c             	sub    $0xc,%esp
    1e2d:	53                   	push   %ebx
    1e2e:	e8 97 1a 00 00       	call   38ca <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e33:	5b                   	pop    %ebx
    1e34:	58                   	pop    %eax
    1e35:	68 52 45 00 00       	push   $0x4552
    1e3a:	68 ee 44 00 00       	push   $0x44ee
    1e3f:	e8 be 1a 00 00       	call   3902 <link>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	85 c0                	test   %eax,%eax
    1e49:	0f 85 c6 03 00 00    	jne    2215 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    1e4f:	83 ec 0c             	sub    $0xc,%esp
    1e52:	68 ee 44 00 00       	push   $0x44ee
    1e57:	e8 96 1a 00 00       	call   38f2 <unlink>
    1e5c:	83 c4 10             	add    $0x10,%esp
    1e5f:	85 c0                	test   %eax,%eax
    1e61:	0f 85 16 03 00 00    	jne    217d <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e67:	83 ec 08             	sub    $0x8,%esp
    1e6a:	6a 00                	push   $0x0
    1e6c:	68 ee 44 00 00       	push   $0x44ee
    1e71:	e8 6c 1a 00 00       	call   38e2 <open>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	85 c0                	test   %eax,%eax
    1e7b:	0f 89 2c 04 00 00    	jns    22ad <subdir+0x59d>
  if(chdir("dd") != 0){
    1e81:	83 ec 0c             	sub    $0xc,%esp
    1e84:	68 b8 45 00 00       	push   $0x45b8
    1e89:	e8 84 1a 00 00       	call   3912 <chdir>
    1e8e:	83 c4 10             	add    $0x10,%esp
    1e91:	85 c0                	test   %eax,%eax
    1e93:	0f 85 01 04 00 00    	jne    229a <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    1e99:	83 ec 0c             	sub    $0xc,%esp
    1e9c:	68 86 45 00 00       	push   $0x4586
    1ea1:	e8 6c 1a 00 00       	call   3912 <chdir>
    1ea6:	83 c4 10             	add    $0x10,%esp
    1ea9:	85 c0                	test   %eax,%eax
    1eab:	0f 85 b9 02 00 00    	jne    216a <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    1eb1:	83 ec 0c             	sub    $0xc,%esp
    1eb4:	68 ac 45 00 00       	push   $0x45ac
    1eb9:	e8 54 1a 00 00       	call   3912 <chdir>
    1ebe:	83 c4 10             	add    $0x10,%esp
    1ec1:	85 c0                	test   %eax,%eax
    1ec3:	0f 85 a1 02 00 00    	jne    216a <subdir+0x45a>
  if(chdir("./..") != 0){
    1ec9:	83 ec 0c             	sub    $0xc,%esp
    1ecc:	68 bb 45 00 00       	push   $0x45bb
    1ed1:	e8 3c 1a 00 00       	call   3912 <chdir>
    1ed6:	83 c4 10             	add    $0x10,%esp
    1ed9:	85 c0                	test   %eax,%eax
    1edb:	0f 85 21 03 00 00    	jne    2202 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    1ee1:	83 ec 08             	sub    $0x8,%esp
    1ee4:	6a 00                	push   $0x0
    1ee6:	68 52 45 00 00       	push   $0x4552
    1eeb:	e8 f2 19 00 00       	call   38e2 <open>
  if(fd < 0){
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    1ef5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ef7:	0f 88 e0 04 00 00    	js     23dd <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    1efd:	83 ec 04             	sub    $0x4,%esp
    1f00:	68 00 20 00 00       	push   $0x2000
    1f05:	68 e0 85 00 00       	push   $0x85e0
    1f0a:	50                   	push   %eax
    1f0b:	e8 aa 19 00 00       	call   38ba <read>
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	83 f8 02             	cmp    $0x2,%eax
    1f16:	0f 85 ae 04 00 00    	jne    23ca <subdir+0x6ba>
  close(fd);
    1f1c:	83 ec 0c             	sub    $0xc,%esp
    1f1f:	53                   	push   %ebx
    1f20:	e8 a5 19 00 00       	call   38ca <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f25:	59                   	pop    %ecx
    1f26:	5b                   	pop    %ebx
    1f27:	6a 00                	push   $0x0
    1f29:	68 ee 44 00 00       	push   $0x44ee
    1f2e:	e8 af 19 00 00       	call   38e2 <open>
    1f33:	83 c4 10             	add    $0x10,%esp
    1f36:	85 c0                	test   %eax,%eax
    1f38:	0f 89 65 02 00 00    	jns    21a3 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f3e:	83 ec 08             	sub    $0x8,%esp
    1f41:	68 02 02 00 00       	push   $0x202
    1f46:	68 06 46 00 00       	push   $0x4606
    1f4b:	e8 92 19 00 00       	call   38e2 <open>
    1f50:	83 c4 10             	add    $0x10,%esp
    1f53:	85 c0                	test   %eax,%eax
    1f55:	0f 89 35 02 00 00    	jns    2190 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f5b:	83 ec 08             	sub    $0x8,%esp
    1f5e:	68 02 02 00 00       	push   $0x202
    1f63:	68 2b 46 00 00       	push   $0x462b
    1f68:	e8 75 19 00 00       	call   38e2 <open>
    1f6d:	83 c4 10             	add    $0x10,%esp
    1f70:	85 c0                	test   %eax,%eax
    1f72:	0f 89 0f 03 00 00    	jns    2287 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    1f78:	83 ec 08             	sub    $0x8,%esp
    1f7b:	68 00 02 00 00       	push   $0x200
    1f80:	68 b8 45 00 00       	push   $0x45b8
    1f85:	e8 58 19 00 00       	call   38e2 <open>
    1f8a:	83 c4 10             	add    $0x10,%esp
    1f8d:	85 c0                	test   %eax,%eax
    1f8f:	0f 89 df 02 00 00    	jns    2274 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    1f95:	83 ec 08             	sub    $0x8,%esp
    1f98:	6a 02                	push   $0x2
    1f9a:	68 b8 45 00 00       	push   $0x45b8
    1f9f:	e8 3e 19 00 00       	call   38e2 <open>
    1fa4:	83 c4 10             	add    $0x10,%esp
    1fa7:	85 c0                	test   %eax,%eax
    1fa9:	0f 89 b2 02 00 00    	jns    2261 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    1faf:	83 ec 08             	sub    $0x8,%esp
    1fb2:	6a 01                	push   $0x1
    1fb4:	68 b8 45 00 00       	push   $0x45b8
    1fb9:	e8 24 19 00 00       	call   38e2 <open>
    1fbe:	83 c4 10             	add    $0x10,%esp
    1fc1:	85 c0                	test   %eax,%eax
    1fc3:	0f 89 85 02 00 00    	jns    224e <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fc9:	83 ec 08             	sub    $0x8,%esp
    1fcc:	68 9a 46 00 00       	push   $0x469a
    1fd1:	68 06 46 00 00       	push   $0x4606
    1fd6:	e8 27 19 00 00       	call   3902 <link>
    1fdb:	83 c4 10             	add    $0x10,%esp
    1fde:	85 c0                	test   %eax,%eax
    1fe0:	0f 84 55 02 00 00    	je     223b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 9a 46 00 00       	push   $0x469a
    1fee:	68 2b 46 00 00       	push   $0x462b
    1ff3:	e8 0a 19 00 00       	call   3902 <link>
    1ff8:	83 c4 10             	add    $0x10,%esp
    1ffb:	85 c0                	test   %eax,%eax
    1ffd:	0f 84 25 02 00 00    	je     2228 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2003:	83 ec 08             	sub    $0x8,%esp
    2006:	68 52 45 00 00       	push   $0x4552
    200b:	68 f1 44 00 00       	push   $0x44f1
    2010:	e8 ed 18 00 00       	call   3902 <link>
    2015:	83 c4 10             	add    $0x10,%esp
    2018:	85 c0                	test   %eax,%eax
    201a:	0f 84 a9 01 00 00    	je     21c9 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    2020:	83 ec 0c             	sub    $0xc,%esp
    2023:	68 06 46 00 00       	push   $0x4606
    2028:	e8 dd 18 00 00       	call   390a <mkdir>
    202d:	83 c4 10             	add    $0x10,%esp
    2030:	85 c0                	test   %eax,%eax
    2032:	0f 84 7e 01 00 00    	je     21b6 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    2038:	83 ec 0c             	sub    $0xc,%esp
    203b:	68 2b 46 00 00       	push   $0x462b
    2040:	e8 c5 18 00 00       	call   390a <mkdir>
    2045:	83 c4 10             	add    $0x10,%esp
    2048:	85 c0                	test   %eax,%eax
    204a:	0f 84 67 03 00 00    	je     23b7 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    2050:	83 ec 0c             	sub    $0xc,%esp
    2053:	68 52 45 00 00       	push   $0x4552
    2058:	e8 ad 18 00 00       	call   390a <mkdir>
    205d:	83 c4 10             	add    $0x10,%esp
    2060:	85 c0                	test   %eax,%eax
    2062:	0f 84 3c 03 00 00    	je     23a4 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    2068:	83 ec 0c             	sub    $0xc,%esp
    206b:	68 2b 46 00 00       	push   $0x462b
    2070:	e8 7d 18 00 00       	call   38f2 <unlink>
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	85 c0                	test   %eax,%eax
    207a:	0f 84 11 03 00 00    	je     2391 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	68 06 46 00 00       	push   $0x4606
    2088:	e8 65 18 00 00       	call   38f2 <unlink>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	85 c0                	test   %eax,%eax
    2092:	0f 84 e6 02 00 00    	je     237e <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	68 f1 44 00 00       	push   $0x44f1
    20a0:	e8 6d 18 00 00       	call   3912 <chdir>
    20a5:	83 c4 10             	add    $0x10,%esp
    20a8:	85 c0                	test   %eax,%eax
    20aa:	0f 84 bb 02 00 00    	je     236b <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    20b0:	83 ec 0c             	sub    $0xc,%esp
    20b3:	68 9d 46 00 00       	push   $0x469d
    20b8:	e8 55 18 00 00       	call   3912 <chdir>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 84 90 02 00 00    	je     2358 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 52 45 00 00       	push   $0x4552
    20d0:	e8 1d 18 00 00       	call   38f2 <unlink>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	85 c0                	test   %eax,%eax
    20da:	0f 85 9d 00 00 00    	jne    217d <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    20e0:	83 ec 0c             	sub    $0xc,%esp
    20e3:	68 f1 44 00 00       	push   $0x44f1
    20e8:	e8 05 18 00 00       	call   38f2 <unlink>
    20ed:	83 c4 10             	add    $0x10,%esp
    20f0:	85 c0                	test   %eax,%eax
    20f2:	0f 85 4d 02 00 00    	jne    2345 <subdir+0x635>
  if(unlink("dd") == 0){
    20f8:	83 ec 0c             	sub    $0xc,%esp
    20fb:	68 b8 45 00 00       	push   $0x45b8
    2100:	e8 ed 17 00 00       	call   38f2 <unlink>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	85 c0                	test   %eax,%eax
    210a:	0f 84 22 02 00 00    	je     2332 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    2110:	83 ec 0c             	sub    $0xc,%esp
    2113:	68 cd 44 00 00       	push   $0x44cd
    2118:	e8 d5 17 00 00       	call   38f2 <unlink>
    211d:	83 c4 10             	add    $0x10,%esp
    2120:	85 c0                	test   %eax,%eax
    2122:	0f 88 f7 01 00 00    	js     231f <subdir+0x60f>
  if(unlink("dd") < 0){
    2128:	83 ec 0c             	sub    $0xc,%esp
    212b:	68 b8 45 00 00       	push   $0x45b8
    2130:	e8 bd 17 00 00       	call   38f2 <unlink>
    2135:	83 c4 10             	add    $0x10,%esp
    2138:	85 c0                	test   %eax,%eax
    213a:	0f 88 cc 01 00 00    	js     230c <subdir+0x5fc>
  printf(1, "subdir ok\n");
    2140:	83 ec 08             	sub    $0x8,%esp
    2143:	68 9a 47 00 00       	push   $0x479a
    2148:	6a 01                	push   $0x1
    214a:	e8 a1 18 00 00       	call   39f0 <printf>
}
    214f:	83 c4 10             	add    $0x10,%esp
    2152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2155:	c9                   	leave  
    2156:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    2157:	50                   	push   %eax
    2158:	50                   	push   %eax
    2159:	68 37 45 00 00       	push   $0x4537
    215e:	6a 01                	push   $0x1
    2160:	e8 8b 18 00 00       	call   39f0 <printf>
    exit();
    2165:	e8 38 17 00 00       	call   38a2 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    216a:	50                   	push   %eax
    216b:	50                   	push   %eax
    216c:	68 92 45 00 00       	push   $0x4592
    2171:	6a 01                	push   $0x1
    2173:	e8 78 18 00 00       	call   39f0 <printf>
    exit();
    2178:	e8 25 17 00 00       	call   38a2 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    217d:	52                   	push   %edx
    217e:	52                   	push   %edx
    217f:	68 5d 45 00 00       	push   $0x455d
    2184:	6a 01                	push   $0x1
    2186:	e8 65 18 00 00       	call   39f0 <printf>
    exit();
    218b:	e8 12 17 00 00       	call   38a2 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    2190:	50                   	push   %eax
    2191:	50                   	push   %eax
    2192:	68 0f 46 00 00       	push   $0x460f
    2197:	6a 01                	push   $0x1
    2199:	e8 52 18 00 00       	call   39f0 <printf>
    exit();
    219e:	e8 ff 16 00 00       	call   38a2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21a3:	52                   	push   %edx
    21a4:	52                   	push   %edx
    21a5:	68 f4 4f 00 00       	push   $0x4ff4
    21aa:	6a 01                	push   $0x1
    21ac:	e8 3f 18 00 00       	call   39f0 <printf>
    exit();
    21b1:	e8 ec 16 00 00       	call   38a2 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    21b6:	52                   	push   %edx
    21b7:	52                   	push   %edx
    21b8:	68 a3 46 00 00       	push   $0x46a3
    21bd:	6a 01                	push   $0x1
    21bf:	e8 2c 18 00 00       	call   39f0 <printf>
    exit();
    21c4:	e8 d9 16 00 00       	call   38a2 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21c9:	51                   	push   %ecx
    21ca:	51                   	push   %ecx
    21cb:	68 64 50 00 00       	push   $0x5064
    21d0:	6a 01                	push   $0x1
    21d2:	e8 19 18 00 00       	call   39f0 <printf>
    exit();
    21d7:	e8 c6 16 00 00       	call   38a2 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    21dc:	50                   	push   %eax
    21dd:	50                   	push   %eax
    21de:	68 1e 45 00 00       	push   $0x451e
    21e3:	6a 01                	push   $0x1
    21e5:	e8 06 18 00 00       	call   39f0 <printf>
    exit();
    21ea:	e8 b3 16 00 00       	call   38a2 <exit>
    printf(1, "create dd/dd/ff failed\n");
    21ef:	51                   	push   %ecx
    21f0:	51                   	push   %ecx
    21f1:	68 f7 44 00 00       	push   $0x44f7
    21f6:	6a 01                	push   $0x1
    21f8:	e8 f3 17 00 00       	call   39f0 <printf>
    exit();
    21fd:	e8 a0 16 00 00       	call   38a2 <exit>
    printf(1, "chdir ./.. failed\n");
    2202:	50                   	push   %eax
    2203:	50                   	push   %eax
    2204:	68 c0 45 00 00       	push   $0x45c0
    2209:	6a 01                	push   $0x1
    220b:	e8 e0 17 00 00       	call   39f0 <printf>
    exit();
    2210:	e8 8d 16 00 00       	call   38a2 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2215:	51                   	push   %ecx
    2216:	51                   	push   %ecx
    2217:	68 ac 4f 00 00       	push   $0x4fac
    221c:	6a 01                	push   $0x1
    221e:	e8 cd 17 00 00       	call   39f0 <printf>
    exit();
    2223:	e8 7a 16 00 00       	call   38a2 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2228:	53                   	push   %ebx
    2229:	53                   	push   %ebx
    222a:	68 40 50 00 00       	push   $0x5040
    222f:	6a 01                	push   $0x1
    2231:	e8 ba 17 00 00       	call   39f0 <printf>
    exit();
    2236:	e8 67 16 00 00       	call   38a2 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    223b:	50                   	push   %eax
    223c:	50                   	push   %eax
    223d:	68 1c 50 00 00       	push   $0x501c
    2242:	6a 01                	push   $0x1
    2244:	e8 a7 17 00 00       	call   39f0 <printf>
    exit();
    2249:	e8 54 16 00 00       	call   38a2 <exit>
    printf(1, "open dd wronly succeeded!\n");
    224e:	50                   	push   %eax
    224f:	50                   	push   %eax
    2250:	68 7f 46 00 00       	push   $0x467f
    2255:	6a 01                	push   $0x1
    2257:	e8 94 17 00 00       	call   39f0 <printf>
    exit();
    225c:	e8 41 16 00 00       	call   38a2 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    2261:	50                   	push   %eax
    2262:	50                   	push   %eax
    2263:	68 66 46 00 00       	push   $0x4666
    2268:	6a 01                	push   $0x1
    226a:	e8 81 17 00 00       	call   39f0 <printf>
    exit();
    226f:	e8 2e 16 00 00       	call   38a2 <exit>
    printf(1, "create dd succeeded!\n");
    2274:	50                   	push   %eax
    2275:	50                   	push   %eax
    2276:	68 50 46 00 00       	push   $0x4650
    227b:	6a 01                	push   $0x1
    227d:	e8 6e 17 00 00       	call   39f0 <printf>
    exit();
    2282:	e8 1b 16 00 00       	call   38a2 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    2287:	50                   	push   %eax
    2288:	50                   	push   %eax
    2289:	68 34 46 00 00       	push   $0x4634
    228e:	6a 01                	push   $0x1
    2290:	e8 5b 17 00 00       	call   39f0 <printf>
    exit();
    2295:	e8 08 16 00 00       	call   38a2 <exit>
    printf(1, "chdir dd failed\n");
    229a:	50                   	push   %eax
    229b:	50                   	push   %eax
    229c:	68 75 45 00 00       	push   $0x4575
    22a1:	6a 01                	push   $0x1
    22a3:	e8 48 17 00 00       	call   39f0 <printf>
    exit();
    22a8:	e8 f5 15 00 00       	call   38a2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22ad:	50                   	push   %eax
    22ae:	50                   	push   %eax
    22af:	68 d0 4f 00 00       	push   $0x4fd0
    22b4:	6a 01                	push   $0x1
    22b6:	e8 35 17 00 00       	call   39f0 <printf>
    exit();
    22bb:	e8 e2 15 00 00       	call   38a2 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    22c0:	53                   	push   %ebx
    22c1:	53                   	push   %ebx
    22c2:	68 d3 44 00 00       	push   $0x44d3
    22c7:	6a 01                	push   $0x1
    22c9:	e8 22 17 00 00       	call   39f0 <printf>
    exit();
    22ce:	e8 cf 15 00 00       	call   38a2 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22d3:	50                   	push   %eax
    22d4:	50                   	push   %eax
    22d5:	68 84 4f 00 00       	push   $0x4f84
    22da:	6a 01                	push   $0x1
    22dc:	e8 0f 17 00 00       	call   39f0 <printf>
    exit();
    22e1:	e8 bc 15 00 00       	call   38a2 <exit>
    printf(1, "create dd/ff failed\n");
    22e6:	50                   	push   %eax
    22e7:	50                   	push   %eax
    22e8:	68 b7 44 00 00       	push   $0x44b7
    22ed:	6a 01                	push   $0x1
    22ef:	e8 fc 16 00 00       	call   39f0 <printf>
    exit();
    22f4:	e8 a9 15 00 00       	call   38a2 <exit>
    printf(1, "subdir mkdir dd failed\n");
    22f9:	50                   	push   %eax
    22fa:	50                   	push   %eax
    22fb:	68 9f 44 00 00       	push   $0x449f
    2300:	6a 01                	push   $0x1
    2302:	e8 e9 16 00 00       	call   39f0 <printf>
    exit();
    2307:	e8 96 15 00 00       	call   38a2 <exit>
    printf(1, "unlink dd failed\n");
    230c:	50                   	push   %eax
    230d:	50                   	push   %eax
    230e:	68 88 47 00 00       	push   $0x4788
    2313:	6a 01                	push   $0x1
    2315:	e8 d6 16 00 00       	call   39f0 <printf>
    exit();
    231a:	e8 83 15 00 00       	call   38a2 <exit>
    printf(1, "unlink dd/dd failed\n");
    231f:	52                   	push   %edx
    2320:	52                   	push   %edx
    2321:	68 73 47 00 00       	push   $0x4773
    2326:	6a 01                	push   $0x1
    2328:	e8 c3 16 00 00       	call   39f0 <printf>
    exit();
    232d:	e8 70 15 00 00       	call   38a2 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2332:	51                   	push   %ecx
    2333:	51                   	push   %ecx
    2334:	68 88 50 00 00       	push   $0x5088
    2339:	6a 01                	push   $0x1
    233b:	e8 b0 16 00 00       	call   39f0 <printf>
    exit();
    2340:	e8 5d 15 00 00       	call   38a2 <exit>
    printf(1, "unlink dd/ff failed\n");
    2345:	53                   	push   %ebx
    2346:	53                   	push   %ebx
    2347:	68 5e 47 00 00       	push   $0x475e
    234c:	6a 01                	push   $0x1
    234e:	e8 9d 16 00 00       	call   39f0 <printf>
    exit();
    2353:	e8 4a 15 00 00       	call   38a2 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2358:	50                   	push   %eax
    2359:	50                   	push   %eax
    235a:	68 46 47 00 00       	push   $0x4746
    235f:	6a 01                	push   $0x1
    2361:	e8 8a 16 00 00       	call   39f0 <printf>
    exit();
    2366:	e8 37 15 00 00       	call   38a2 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    236b:	50                   	push   %eax
    236c:	50                   	push   %eax
    236d:	68 2e 47 00 00       	push   $0x472e
    2372:	6a 01                	push   $0x1
    2374:	e8 77 16 00 00       	call   39f0 <printf>
    exit();
    2379:	e8 24 15 00 00       	call   38a2 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    237e:	50                   	push   %eax
    237f:	50                   	push   %eax
    2380:	68 12 47 00 00       	push   $0x4712
    2385:	6a 01                	push   $0x1
    2387:	e8 64 16 00 00       	call   39f0 <printf>
    exit();
    238c:	e8 11 15 00 00       	call   38a2 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2391:	50                   	push   %eax
    2392:	50                   	push   %eax
    2393:	68 f6 46 00 00       	push   $0x46f6
    2398:	6a 01                	push   $0x1
    239a:	e8 51 16 00 00       	call   39f0 <printf>
    exit();
    239f:	e8 fe 14 00 00       	call   38a2 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23a4:	50                   	push   %eax
    23a5:	50                   	push   %eax
    23a6:	68 d9 46 00 00       	push   $0x46d9
    23ab:	6a 01                	push   $0x1
    23ad:	e8 3e 16 00 00       	call   39f0 <printf>
    exit();
    23b2:	e8 eb 14 00 00       	call   38a2 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    23b7:	50                   	push   %eax
    23b8:	50                   	push   %eax
    23b9:	68 be 46 00 00       	push   $0x46be
    23be:	6a 01                	push   $0x1
    23c0:	e8 2b 16 00 00       	call   39f0 <printf>
    exit();
    23c5:	e8 d8 14 00 00       	call   38a2 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    23ca:	50                   	push   %eax
    23cb:	50                   	push   %eax
    23cc:	68 eb 45 00 00       	push   $0x45eb
    23d1:	6a 01                	push   $0x1
    23d3:	e8 18 16 00 00       	call   39f0 <printf>
    exit();
    23d8:	e8 c5 14 00 00       	call   38a2 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    23dd:	50                   	push   %eax
    23de:	50                   	push   %eax
    23df:	68 d3 45 00 00       	push   $0x45d3
    23e4:	6a 01                	push   $0x1
    23e6:	e8 05 16 00 00       	call   39f0 <printf>
    exit();
    23eb:	e8 b2 14 00 00       	call   38a2 <exit>

000023f0 <bigwrite>:
{
    23f0:	55                   	push   %ebp
    23f1:	89 e5                	mov    %esp,%ebp
    23f3:	56                   	push   %esi
    23f4:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    23f5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    23fa:	83 ec 08             	sub    $0x8,%esp
    23fd:	68 a5 47 00 00       	push   $0x47a5
    2402:	6a 01                	push   $0x1
    2404:	e8 e7 15 00 00       	call   39f0 <printf>
  unlink("bigwrite");
    2409:	c7 04 24 b4 47 00 00 	movl   $0x47b4,(%esp)
    2410:	e8 dd 14 00 00       	call   38f2 <unlink>
    2415:	83 c4 10             	add    $0x10,%esp
    2418:	90                   	nop
    2419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2420:	83 ec 08             	sub    $0x8,%esp
    2423:	68 02 02 00 00       	push   $0x202
    2428:	68 b4 47 00 00       	push   $0x47b4
    242d:	e8 b0 14 00 00       	call   38e2 <open>
    if(fd < 0){
    2432:	83 c4 10             	add    $0x10,%esp
    2435:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2437:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2439:	78 7e                	js     24b9 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    243b:	83 ec 04             	sub    $0x4,%esp
    243e:	53                   	push   %ebx
    243f:	68 e0 85 00 00       	push   $0x85e0
    2444:	50                   	push   %eax
    2445:	e8 78 14 00 00       	call   38c2 <write>
      if(cc != sz){
    244a:	83 c4 10             	add    $0x10,%esp
    244d:	39 d8                	cmp    %ebx,%eax
    244f:	75 55                	jne    24a6 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    2451:	83 ec 04             	sub    $0x4,%esp
    2454:	53                   	push   %ebx
    2455:	68 e0 85 00 00       	push   $0x85e0
    245a:	56                   	push   %esi
    245b:	e8 62 14 00 00       	call   38c2 <write>
      if(cc != sz){
    2460:	83 c4 10             	add    $0x10,%esp
    2463:	39 d8                	cmp    %ebx,%eax
    2465:	75 3f                	jne    24a6 <bigwrite+0xb6>
    close(fd);
    2467:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    246a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2470:	56                   	push   %esi
    2471:	e8 54 14 00 00       	call   38ca <close>
    unlink("bigwrite");
    2476:	c7 04 24 b4 47 00 00 	movl   $0x47b4,(%esp)
    247d:	e8 70 14 00 00       	call   38f2 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2482:	83 c4 10             	add    $0x10,%esp
    2485:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    248b:	75 93                	jne    2420 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    248d:	83 ec 08             	sub    $0x8,%esp
    2490:	68 e7 47 00 00       	push   $0x47e7
    2495:	6a 01                	push   $0x1
    2497:	e8 54 15 00 00       	call   39f0 <printf>
}
    249c:	83 c4 10             	add    $0x10,%esp
    249f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24a2:	5b                   	pop    %ebx
    24a3:	5e                   	pop    %esi
    24a4:	5d                   	pop    %ebp
    24a5:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    24a6:	50                   	push   %eax
    24a7:	53                   	push   %ebx
    24a8:	68 d5 47 00 00       	push   $0x47d5
    24ad:	6a 01                	push   $0x1
    24af:	e8 3c 15 00 00       	call   39f0 <printf>
        exit();
    24b4:	e8 e9 13 00 00       	call   38a2 <exit>
      printf(1, "cannot create bigwrite\n");
    24b9:	83 ec 08             	sub    $0x8,%esp
    24bc:	68 bd 47 00 00       	push   $0x47bd
    24c1:	6a 01                	push   $0x1
    24c3:	e8 28 15 00 00       	call   39f0 <printf>
      exit();
    24c8:	e8 d5 13 00 00       	call   38a2 <exit>
    24cd:	8d 76 00             	lea    0x0(%esi),%esi

000024d0 <bigfile>:
{
    24d0:	55                   	push   %ebp
    24d1:	89 e5                	mov    %esp,%ebp
    24d3:	57                   	push   %edi
    24d4:	56                   	push   %esi
    24d5:	53                   	push   %ebx
    24d6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    24d9:	68 f4 47 00 00       	push   $0x47f4
    24de:	6a 01                	push   $0x1
    24e0:	e8 0b 15 00 00       	call   39f0 <printf>
  unlink("bigfile");
    24e5:	c7 04 24 10 48 00 00 	movl   $0x4810,(%esp)
    24ec:	e8 01 14 00 00       	call   38f2 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    24f1:	58                   	pop    %eax
    24f2:	5a                   	pop    %edx
    24f3:	68 02 02 00 00       	push   $0x202
    24f8:	68 10 48 00 00       	push   $0x4810
    24fd:	e8 e0 13 00 00       	call   38e2 <open>
  if(fd < 0){
    2502:	83 c4 10             	add    $0x10,%esp
    2505:	85 c0                	test   %eax,%eax
    2507:	0f 88 5e 01 00 00    	js     266b <bigfile+0x19b>
    250d:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    250f:	31 db                	xor    %ebx,%ebx
    2511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2518:	83 ec 04             	sub    $0x4,%esp
    251b:	68 58 02 00 00       	push   $0x258
    2520:	53                   	push   %ebx
    2521:	68 e0 85 00 00       	push   $0x85e0
    2526:	e8 d5 11 00 00       	call   3700 <memset>
    if(write(fd, buf, 600) != 600){
    252b:	83 c4 0c             	add    $0xc,%esp
    252e:	68 58 02 00 00       	push   $0x258
    2533:	68 e0 85 00 00       	push   $0x85e0
    2538:	56                   	push   %esi
    2539:	e8 84 13 00 00       	call   38c2 <write>
    253e:	83 c4 10             	add    $0x10,%esp
    2541:	3d 58 02 00 00       	cmp    $0x258,%eax
    2546:	0f 85 f8 00 00 00    	jne    2644 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    254c:	83 c3 01             	add    $0x1,%ebx
    254f:	83 fb 14             	cmp    $0x14,%ebx
    2552:	75 c4                	jne    2518 <bigfile+0x48>
  close(fd);
    2554:	83 ec 0c             	sub    $0xc,%esp
    2557:	56                   	push   %esi
    2558:	e8 6d 13 00 00       	call   38ca <close>
  fd = open("bigfile", 0);
    255d:	5e                   	pop    %esi
    255e:	5f                   	pop    %edi
    255f:	6a 00                	push   $0x0
    2561:	68 10 48 00 00       	push   $0x4810
    2566:	e8 77 13 00 00       	call   38e2 <open>
  if(fd < 0){
    256b:	83 c4 10             	add    $0x10,%esp
    256e:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    2570:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2572:	0f 88 e0 00 00 00    	js     2658 <bigfile+0x188>
  total = 0;
    2578:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    257a:	31 ff                	xor    %edi,%edi
    257c:	eb 30                	jmp    25ae <bigfile+0xde>
    257e:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    2580:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2585:	0f 85 91 00 00 00    	jne    261c <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    258b:	0f be 05 e0 85 00 00 	movsbl 0x85e0,%eax
    2592:	89 fa                	mov    %edi,%edx
    2594:	d1 fa                	sar    %edx
    2596:	39 d0                	cmp    %edx,%eax
    2598:	75 6e                	jne    2608 <bigfile+0x138>
    259a:	0f be 15 0b 87 00 00 	movsbl 0x870b,%edx
    25a1:	39 d0                	cmp    %edx,%eax
    25a3:	75 63                	jne    2608 <bigfile+0x138>
    total += cc;
    25a5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    25ab:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25ae:	83 ec 04             	sub    $0x4,%esp
    25b1:	68 2c 01 00 00       	push   $0x12c
    25b6:	68 e0 85 00 00       	push   $0x85e0
    25bb:	56                   	push   %esi
    25bc:	e8 f9 12 00 00       	call   38ba <read>
    if(cc < 0){
    25c1:	83 c4 10             	add    $0x10,%esp
    25c4:	85 c0                	test   %eax,%eax
    25c6:	78 68                	js     2630 <bigfile+0x160>
    if(cc == 0)
    25c8:	75 b6                	jne    2580 <bigfile+0xb0>
  close(fd);
    25ca:	83 ec 0c             	sub    $0xc,%esp
    25cd:	56                   	push   %esi
    25ce:	e8 f7 12 00 00       	call   38ca <close>
  if(total != 20*600){
    25d3:	83 c4 10             	add    $0x10,%esp
    25d6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25dc:	0f 85 9c 00 00 00    	jne    267e <bigfile+0x1ae>
  unlink("bigfile");
    25e2:	83 ec 0c             	sub    $0xc,%esp
    25e5:	68 10 48 00 00       	push   $0x4810
    25ea:	e8 03 13 00 00       	call   38f2 <unlink>
  printf(1, "bigfile test ok\n");
    25ef:	58                   	pop    %eax
    25f0:	5a                   	pop    %edx
    25f1:	68 9f 48 00 00       	push   $0x489f
    25f6:	6a 01                	push   $0x1
    25f8:	e8 f3 13 00 00       	call   39f0 <printf>
}
    25fd:	83 c4 10             	add    $0x10,%esp
    2600:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2603:	5b                   	pop    %ebx
    2604:	5e                   	pop    %esi
    2605:	5f                   	pop    %edi
    2606:	5d                   	pop    %ebp
    2607:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    2608:	83 ec 08             	sub    $0x8,%esp
    260b:	68 6c 48 00 00       	push   $0x486c
    2610:	6a 01                	push   $0x1
    2612:	e8 d9 13 00 00       	call   39f0 <printf>
      exit();
    2617:	e8 86 12 00 00       	call   38a2 <exit>
      printf(1, "short read bigfile\n");
    261c:	83 ec 08             	sub    $0x8,%esp
    261f:	68 58 48 00 00       	push   $0x4858
    2624:	6a 01                	push   $0x1
    2626:	e8 c5 13 00 00       	call   39f0 <printf>
      exit();
    262b:	e8 72 12 00 00       	call   38a2 <exit>
      printf(1, "read bigfile failed\n");
    2630:	83 ec 08             	sub    $0x8,%esp
    2633:	68 43 48 00 00       	push   $0x4843
    2638:	6a 01                	push   $0x1
    263a:	e8 b1 13 00 00       	call   39f0 <printf>
      exit();
    263f:	e8 5e 12 00 00       	call   38a2 <exit>
      printf(1, "write bigfile failed\n");
    2644:	83 ec 08             	sub    $0x8,%esp
    2647:	68 18 48 00 00       	push   $0x4818
    264c:	6a 01                	push   $0x1
    264e:	e8 9d 13 00 00       	call   39f0 <printf>
      exit();
    2653:	e8 4a 12 00 00       	call   38a2 <exit>
    printf(1, "cannot open bigfile\n");
    2658:	53                   	push   %ebx
    2659:	53                   	push   %ebx
    265a:	68 2e 48 00 00       	push   $0x482e
    265f:	6a 01                	push   $0x1
    2661:	e8 8a 13 00 00       	call   39f0 <printf>
    exit();
    2666:	e8 37 12 00 00       	call   38a2 <exit>
    printf(1, "cannot create bigfile");
    266b:	50                   	push   %eax
    266c:	50                   	push   %eax
    266d:	68 02 48 00 00       	push   $0x4802
    2672:	6a 01                	push   $0x1
    2674:	e8 77 13 00 00       	call   39f0 <printf>
    exit();
    2679:	e8 24 12 00 00       	call   38a2 <exit>
    printf(1, "read bigfile wrong total\n");
    267e:	51                   	push   %ecx
    267f:	51                   	push   %ecx
    2680:	68 85 48 00 00       	push   $0x4885
    2685:	6a 01                	push   $0x1
    2687:	e8 64 13 00 00       	call   39f0 <printf>
    exit();
    268c:	e8 11 12 00 00       	call   38a2 <exit>
    2691:	eb 0d                	jmp    26a0 <fourteen>
    2693:	90                   	nop
    2694:	90                   	nop
    2695:	90                   	nop
    2696:	90                   	nop
    2697:	90                   	nop
    2698:	90                   	nop
    2699:	90                   	nop
    269a:	90                   	nop
    269b:	90                   	nop
    269c:	90                   	nop
    269d:	90                   	nop
    269e:	90                   	nop
    269f:	90                   	nop

000026a0 <fourteen>:
{
    26a0:	55                   	push   %ebp
    26a1:	89 e5                	mov    %esp,%ebp
    26a3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    26a6:	68 b0 48 00 00       	push   $0x48b0
    26ab:	6a 01                	push   $0x1
    26ad:	e8 3e 13 00 00       	call   39f0 <printf>
  if(mkdir("12345678901234") != 0){
    26b2:	c7 04 24 eb 48 00 00 	movl   $0x48eb,(%esp)
    26b9:	e8 4c 12 00 00       	call   390a <mkdir>
    26be:	83 c4 10             	add    $0x10,%esp
    26c1:	85 c0                	test   %eax,%eax
    26c3:	0f 85 97 00 00 00    	jne    2760 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    26c9:	83 ec 0c             	sub    $0xc,%esp
    26cc:	68 a8 50 00 00       	push   $0x50a8
    26d1:	e8 34 12 00 00       	call   390a <mkdir>
    26d6:	83 c4 10             	add    $0x10,%esp
    26d9:	85 c0                	test   %eax,%eax
    26db:	0f 85 de 00 00 00    	jne    27bf <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    26e1:	83 ec 08             	sub    $0x8,%esp
    26e4:	68 00 02 00 00       	push   $0x200
    26e9:	68 f8 50 00 00       	push   $0x50f8
    26ee:	e8 ef 11 00 00       	call   38e2 <open>
  if(fd < 0){
    26f3:	83 c4 10             	add    $0x10,%esp
    26f6:	85 c0                	test   %eax,%eax
    26f8:	0f 88 ae 00 00 00    	js     27ac <fourteen+0x10c>
  close(fd);
    26fe:	83 ec 0c             	sub    $0xc,%esp
    2701:	50                   	push   %eax
    2702:	e8 c3 11 00 00       	call   38ca <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2707:	58                   	pop    %eax
    2708:	5a                   	pop    %edx
    2709:	6a 00                	push   $0x0
    270b:	68 68 51 00 00       	push   $0x5168
    2710:	e8 cd 11 00 00       	call   38e2 <open>
  if(fd < 0){
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	85 c0                	test   %eax,%eax
    271a:	78 7d                	js     2799 <fourteen+0xf9>
  close(fd);
    271c:	83 ec 0c             	sub    $0xc,%esp
    271f:	50                   	push   %eax
    2720:	e8 a5 11 00 00       	call   38ca <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2725:	c7 04 24 dc 48 00 00 	movl   $0x48dc,(%esp)
    272c:	e8 d9 11 00 00       	call   390a <mkdir>
    2731:	83 c4 10             	add    $0x10,%esp
    2734:	85 c0                	test   %eax,%eax
    2736:	74 4e                	je     2786 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    2738:	83 ec 0c             	sub    $0xc,%esp
    273b:	68 04 52 00 00       	push   $0x5204
    2740:	e8 c5 11 00 00       	call   390a <mkdir>
    2745:	83 c4 10             	add    $0x10,%esp
    2748:	85 c0                	test   %eax,%eax
    274a:	74 27                	je     2773 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    274c:	83 ec 08             	sub    $0x8,%esp
    274f:	68 fa 48 00 00       	push   $0x48fa
    2754:	6a 01                	push   $0x1
    2756:	e8 95 12 00 00       	call   39f0 <printf>
}
    275b:	83 c4 10             	add    $0x10,%esp
    275e:	c9                   	leave  
    275f:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2760:	50                   	push   %eax
    2761:	50                   	push   %eax
    2762:	68 bf 48 00 00       	push   $0x48bf
    2767:	6a 01                	push   $0x1
    2769:	e8 82 12 00 00       	call   39f0 <printf>
    exit();
    276e:	e8 2f 11 00 00       	call   38a2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2773:	50                   	push   %eax
    2774:	50                   	push   %eax
    2775:	68 24 52 00 00       	push   $0x5224
    277a:	6a 01                	push   $0x1
    277c:	e8 6f 12 00 00       	call   39f0 <printf>
    exit();
    2781:	e8 1c 11 00 00       	call   38a2 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2786:	52                   	push   %edx
    2787:	52                   	push   %edx
    2788:	68 d4 51 00 00       	push   $0x51d4
    278d:	6a 01                	push   $0x1
    278f:	e8 5c 12 00 00       	call   39f0 <printf>
    exit();
    2794:	e8 09 11 00 00       	call   38a2 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2799:	51                   	push   %ecx
    279a:	51                   	push   %ecx
    279b:	68 98 51 00 00       	push   $0x5198
    27a0:	6a 01                	push   $0x1
    27a2:	e8 49 12 00 00       	call   39f0 <printf>
    exit();
    27a7:	e8 f6 10 00 00       	call   38a2 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27ac:	51                   	push   %ecx
    27ad:	51                   	push   %ecx
    27ae:	68 28 51 00 00       	push   $0x5128
    27b3:	6a 01                	push   $0x1
    27b5:	e8 36 12 00 00       	call   39f0 <printf>
    exit();
    27ba:	e8 e3 10 00 00       	call   38a2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27bf:	50                   	push   %eax
    27c0:	50                   	push   %eax
    27c1:	68 c8 50 00 00       	push   $0x50c8
    27c6:	6a 01                	push   $0x1
    27c8:	e8 23 12 00 00       	call   39f0 <printf>
    exit();
    27cd:	e8 d0 10 00 00       	call   38a2 <exit>
    27d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027e0 <rmdot>:
{
    27e0:	55                   	push   %ebp
    27e1:	89 e5                	mov    %esp,%ebp
    27e3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    27e6:	68 07 49 00 00       	push   $0x4907
    27eb:	6a 01                	push   $0x1
    27ed:	e8 fe 11 00 00       	call   39f0 <printf>
  if(mkdir("dots") != 0){
    27f2:	c7 04 24 13 49 00 00 	movl   $0x4913,(%esp)
    27f9:	e8 0c 11 00 00       	call   390a <mkdir>
    27fe:	83 c4 10             	add    $0x10,%esp
    2801:	85 c0                	test   %eax,%eax
    2803:	0f 85 b0 00 00 00    	jne    28b9 <rmdot+0xd9>
  if(chdir("dots") != 0){
    2809:	83 ec 0c             	sub    $0xc,%esp
    280c:	68 13 49 00 00       	push   $0x4913
    2811:	e8 fc 10 00 00       	call   3912 <chdir>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	85 c0                	test   %eax,%eax
    281b:	0f 85 1d 01 00 00    	jne    293e <rmdot+0x15e>
  if(unlink(".") == 0){
    2821:	83 ec 0c             	sub    $0xc,%esp
    2824:	68 be 45 00 00       	push   $0x45be
    2829:	e8 c4 10 00 00       	call   38f2 <unlink>
    282e:	83 c4 10             	add    $0x10,%esp
    2831:	85 c0                	test   %eax,%eax
    2833:	0f 84 f2 00 00 00    	je     292b <rmdot+0x14b>
  if(unlink("..") == 0){
    2839:	83 ec 0c             	sub    $0xc,%esp
    283c:	68 bd 45 00 00       	push   $0x45bd
    2841:	e8 ac 10 00 00       	call   38f2 <unlink>
    2846:	83 c4 10             	add    $0x10,%esp
    2849:	85 c0                	test   %eax,%eax
    284b:	0f 84 c7 00 00 00    	je     2918 <rmdot+0x138>
  if(chdir("/") != 0){
    2851:	83 ec 0c             	sub    $0xc,%esp
    2854:	68 91 3d 00 00       	push   $0x3d91
    2859:	e8 b4 10 00 00       	call   3912 <chdir>
    285e:	83 c4 10             	add    $0x10,%esp
    2861:	85 c0                	test   %eax,%eax
    2863:	0f 85 9c 00 00 00    	jne    2905 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    2869:	83 ec 0c             	sub    $0xc,%esp
    286c:	68 5b 49 00 00       	push   $0x495b
    2871:	e8 7c 10 00 00       	call   38f2 <unlink>
    2876:	83 c4 10             	add    $0x10,%esp
    2879:	85 c0                	test   %eax,%eax
    287b:	74 75                	je     28f2 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    287d:	83 ec 0c             	sub    $0xc,%esp
    2880:	68 79 49 00 00       	push   $0x4979
    2885:	e8 68 10 00 00       	call   38f2 <unlink>
    288a:	83 c4 10             	add    $0x10,%esp
    288d:	85 c0                	test   %eax,%eax
    288f:	74 4e                	je     28df <rmdot+0xff>
  if(unlink("dots") != 0){
    2891:	83 ec 0c             	sub    $0xc,%esp
    2894:	68 13 49 00 00       	push   $0x4913
    2899:	e8 54 10 00 00       	call   38f2 <unlink>
    289e:	83 c4 10             	add    $0x10,%esp
    28a1:	85 c0                	test   %eax,%eax
    28a3:	75 27                	jne    28cc <rmdot+0xec>
  printf(1, "rmdot ok\n");
    28a5:	83 ec 08             	sub    $0x8,%esp
    28a8:	68 ae 49 00 00       	push   $0x49ae
    28ad:	6a 01                	push   $0x1
    28af:	e8 3c 11 00 00       	call   39f0 <printf>
}
    28b4:	83 c4 10             	add    $0x10,%esp
    28b7:	c9                   	leave  
    28b8:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    28b9:	50                   	push   %eax
    28ba:	50                   	push   %eax
    28bb:	68 18 49 00 00       	push   $0x4918
    28c0:	6a 01                	push   $0x1
    28c2:	e8 29 11 00 00       	call   39f0 <printf>
    exit();
    28c7:	e8 d6 0f 00 00       	call   38a2 <exit>
    printf(1, "unlink dots failed!\n");
    28cc:	50                   	push   %eax
    28cd:	50                   	push   %eax
    28ce:	68 99 49 00 00       	push   $0x4999
    28d3:	6a 01                	push   $0x1
    28d5:	e8 16 11 00 00       	call   39f0 <printf>
    exit();
    28da:	e8 c3 0f 00 00       	call   38a2 <exit>
    printf(1, "unlink dots/.. worked!\n");
    28df:	52                   	push   %edx
    28e0:	52                   	push   %edx
    28e1:	68 81 49 00 00       	push   $0x4981
    28e6:	6a 01                	push   $0x1
    28e8:	e8 03 11 00 00       	call   39f0 <printf>
    exit();
    28ed:	e8 b0 0f 00 00       	call   38a2 <exit>
    printf(1, "unlink dots/. worked!\n");
    28f2:	51                   	push   %ecx
    28f3:	51                   	push   %ecx
    28f4:	68 62 49 00 00       	push   $0x4962
    28f9:	6a 01                	push   $0x1
    28fb:	e8 f0 10 00 00       	call   39f0 <printf>
    exit();
    2900:	e8 9d 0f 00 00       	call   38a2 <exit>
    printf(1, "chdir / failed\n");
    2905:	50                   	push   %eax
    2906:	50                   	push   %eax
    2907:	68 93 3d 00 00       	push   $0x3d93
    290c:	6a 01                	push   $0x1
    290e:	e8 dd 10 00 00       	call   39f0 <printf>
    exit();
    2913:	e8 8a 0f 00 00       	call   38a2 <exit>
    printf(1, "rm .. worked!\n");
    2918:	50                   	push   %eax
    2919:	50                   	push   %eax
    291a:	68 4c 49 00 00       	push   $0x494c
    291f:	6a 01                	push   $0x1
    2921:	e8 ca 10 00 00       	call   39f0 <printf>
    exit();
    2926:	e8 77 0f 00 00       	call   38a2 <exit>
    printf(1, "rm . worked!\n");
    292b:	50                   	push   %eax
    292c:	50                   	push   %eax
    292d:	68 3e 49 00 00       	push   $0x493e
    2932:	6a 01                	push   $0x1
    2934:	e8 b7 10 00 00       	call   39f0 <printf>
    exit();
    2939:	e8 64 0f 00 00       	call   38a2 <exit>
    printf(1, "chdir dots failed\n");
    293e:	50                   	push   %eax
    293f:	50                   	push   %eax
    2940:	68 2b 49 00 00       	push   $0x492b
    2945:	6a 01                	push   $0x1
    2947:	e8 a4 10 00 00       	call   39f0 <printf>
    exit();
    294c:	e8 51 0f 00 00       	call   38a2 <exit>
    2951:	eb 0d                	jmp    2960 <dirfile>
    2953:	90                   	nop
    2954:	90                   	nop
    2955:	90                   	nop
    2956:	90                   	nop
    2957:	90                   	nop
    2958:	90                   	nop
    2959:	90                   	nop
    295a:	90                   	nop
    295b:	90                   	nop
    295c:	90                   	nop
    295d:	90                   	nop
    295e:	90                   	nop
    295f:	90                   	nop

00002960 <dirfile>:
{
    2960:	55                   	push   %ebp
    2961:	89 e5                	mov    %esp,%ebp
    2963:	53                   	push   %ebx
    2964:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    2967:	68 b8 49 00 00       	push   $0x49b8
    296c:	6a 01                	push   $0x1
    296e:	e8 7d 10 00 00       	call   39f0 <printf>
  fd = open("dirfile", O_CREATE);
    2973:	59                   	pop    %ecx
    2974:	5b                   	pop    %ebx
    2975:	68 00 02 00 00       	push   $0x200
    297a:	68 c5 49 00 00       	push   $0x49c5
    297f:	e8 5e 0f 00 00       	call   38e2 <open>
  if(fd < 0){
    2984:	83 c4 10             	add    $0x10,%esp
    2987:	85 c0                	test   %eax,%eax
    2989:	0f 88 43 01 00 00    	js     2ad2 <dirfile+0x172>
  close(fd);
    298f:	83 ec 0c             	sub    $0xc,%esp
    2992:	50                   	push   %eax
    2993:	e8 32 0f 00 00       	call   38ca <close>
  if(chdir("dirfile") == 0){
    2998:	c7 04 24 c5 49 00 00 	movl   $0x49c5,(%esp)
    299f:	e8 6e 0f 00 00       	call   3912 <chdir>
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	85 c0                	test   %eax,%eax
    29a9:	0f 84 10 01 00 00    	je     2abf <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    29af:	83 ec 08             	sub    $0x8,%esp
    29b2:	6a 00                	push   $0x0
    29b4:	68 fe 49 00 00       	push   $0x49fe
    29b9:	e8 24 0f 00 00       	call   38e2 <open>
  if(fd >= 0){
    29be:	83 c4 10             	add    $0x10,%esp
    29c1:	85 c0                	test   %eax,%eax
    29c3:	0f 89 e3 00 00 00    	jns    2aac <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    29c9:	83 ec 08             	sub    $0x8,%esp
    29cc:	68 00 02 00 00       	push   $0x200
    29d1:	68 fe 49 00 00       	push   $0x49fe
    29d6:	e8 07 0f 00 00       	call   38e2 <open>
  if(fd >= 0){
    29db:	83 c4 10             	add    $0x10,%esp
    29de:	85 c0                	test   %eax,%eax
    29e0:	0f 89 c6 00 00 00    	jns    2aac <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    29e6:	83 ec 0c             	sub    $0xc,%esp
    29e9:	68 fe 49 00 00       	push   $0x49fe
    29ee:	e8 17 0f 00 00       	call   390a <mkdir>
    29f3:	83 c4 10             	add    $0x10,%esp
    29f6:	85 c0                	test   %eax,%eax
    29f8:	0f 84 46 01 00 00    	je     2b44 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    29fe:	83 ec 0c             	sub    $0xc,%esp
    2a01:	68 fe 49 00 00       	push   $0x49fe
    2a06:	e8 e7 0e 00 00       	call   38f2 <unlink>
    2a0b:	83 c4 10             	add    $0x10,%esp
    2a0e:	85 c0                	test   %eax,%eax
    2a10:	0f 84 1b 01 00 00    	je     2b31 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    2a16:	83 ec 08             	sub    $0x8,%esp
    2a19:	68 fe 49 00 00       	push   $0x49fe
    2a1e:	68 62 4a 00 00       	push   $0x4a62
    2a23:	e8 da 0e 00 00       	call   3902 <link>
    2a28:	83 c4 10             	add    $0x10,%esp
    2a2b:	85 c0                	test   %eax,%eax
    2a2d:	0f 84 eb 00 00 00    	je     2b1e <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    2a33:	83 ec 0c             	sub    $0xc,%esp
    2a36:	68 c5 49 00 00       	push   $0x49c5
    2a3b:	e8 b2 0e 00 00       	call   38f2 <unlink>
    2a40:	83 c4 10             	add    $0x10,%esp
    2a43:	85 c0                	test   %eax,%eax
    2a45:	0f 85 c0 00 00 00    	jne    2b0b <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    2a4b:	83 ec 08             	sub    $0x8,%esp
    2a4e:	6a 02                	push   $0x2
    2a50:	68 be 45 00 00       	push   $0x45be
    2a55:	e8 88 0e 00 00       	call   38e2 <open>
  if(fd >= 0){
    2a5a:	83 c4 10             	add    $0x10,%esp
    2a5d:	85 c0                	test   %eax,%eax
    2a5f:	0f 89 93 00 00 00    	jns    2af8 <dirfile+0x198>
  fd = open(".", 0);
    2a65:	83 ec 08             	sub    $0x8,%esp
    2a68:	6a 00                	push   $0x0
    2a6a:	68 be 45 00 00       	push   $0x45be
    2a6f:	e8 6e 0e 00 00       	call   38e2 <open>
  if(write(fd, "x", 1) > 0){
    2a74:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", 0);
    2a77:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a79:	6a 01                	push   $0x1
    2a7b:	68 a1 46 00 00       	push   $0x46a1
    2a80:	50                   	push   %eax
    2a81:	e8 3c 0e 00 00       	call   38c2 <write>
    2a86:	83 c4 10             	add    $0x10,%esp
    2a89:	85 c0                	test   %eax,%eax
    2a8b:	7f 58                	jg     2ae5 <dirfile+0x185>
  close(fd);
    2a8d:	83 ec 0c             	sub    $0xc,%esp
    2a90:	53                   	push   %ebx
    2a91:	e8 34 0e 00 00       	call   38ca <close>
  printf(1, "dir vs file OK\n");
    2a96:	58                   	pop    %eax
    2a97:	5a                   	pop    %edx
    2a98:	68 95 4a 00 00       	push   $0x4a95
    2a9d:	6a 01                	push   $0x1
    2a9f:	e8 4c 0f 00 00       	call   39f0 <printf>
}
    2aa4:	83 c4 10             	add    $0x10,%esp
    2aa7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aaa:	c9                   	leave  
    2aab:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2aac:	50                   	push   %eax
    2aad:	50                   	push   %eax
    2aae:	68 09 4a 00 00       	push   $0x4a09
    2ab3:	6a 01                	push   $0x1
    2ab5:	e8 36 0f 00 00       	call   39f0 <printf>
    exit();
    2aba:	e8 e3 0d 00 00       	call   38a2 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2abf:	50                   	push   %eax
    2ac0:	50                   	push   %eax
    2ac1:	68 e4 49 00 00       	push   $0x49e4
    2ac6:	6a 01                	push   $0x1
    2ac8:	e8 23 0f 00 00       	call   39f0 <printf>
    exit();
    2acd:	e8 d0 0d 00 00       	call   38a2 <exit>
    printf(1, "create dirfile failed\n");
    2ad2:	52                   	push   %edx
    2ad3:	52                   	push   %edx
    2ad4:	68 cd 49 00 00       	push   $0x49cd
    2ad9:	6a 01                	push   $0x1
    2adb:	e8 10 0f 00 00       	call   39f0 <printf>
    exit();
    2ae0:	e8 bd 0d 00 00       	call   38a2 <exit>
    printf(1, "write . succeeded!\n");
    2ae5:	51                   	push   %ecx
    2ae6:	51                   	push   %ecx
    2ae7:	68 81 4a 00 00       	push   $0x4a81
    2aec:	6a 01                	push   $0x1
    2aee:	e8 fd 0e 00 00       	call   39f0 <printf>
    exit();
    2af3:	e8 aa 0d 00 00       	call   38a2 <exit>
    printf(1, "open . for writing succeeded!\n");
    2af8:	53                   	push   %ebx
    2af9:	53                   	push   %ebx
    2afa:	68 78 52 00 00       	push   $0x5278
    2aff:	6a 01                	push   $0x1
    2b01:	e8 ea 0e 00 00       	call   39f0 <printf>
    exit();
    2b06:	e8 97 0d 00 00       	call   38a2 <exit>
    printf(1, "unlink dirfile failed!\n");
    2b0b:	50                   	push   %eax
    2b0c:	50                   	push   %eax
    2b0d:	68 69 4a 00 00       	push   $0x4a69
    2b12:	6a 01                	push   $0x1
    2b14:	e8 d7 0e 00 00       	call   39f0 <printf>
    exit();
    2b19:	e8 84 0d 00 00       	call   38a2 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b1e:	50                   	push   %eax
    2b1f:	50                   	push   %eax
    2b20:	68 58 52 00 00       	push   $0x5258
    2b25:	6a 01                	push   $0x1
    2b27:	e8 c4 0e 00 00       	call   39f0 <printf>
    exit();
    2b2c:	e8 71 0d 00 00       	call   38a2 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b31:	50                   	push   %eax
    2b32:	50                   	push   %eax
    2b33:	68 44 4a 00 00       	push   $0x4a44
    2b38:	6a 01                	push   $0x1
    2b3a:	e8 b1 0e 00 00       	call   39f0 <printf>
    exit();
    2b3f:	e8 5e 0d 00 00       	call   38a2 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b44:	50                   	push   %eax
    2b45:	50                   	push   %eax
    2b46:	68 27 4a 00 00       	push   $0x4a27
    2b4b:	6a 01                	push   $0x1
    2b4d:	e8 9e 0e 00 00       	call   39f0 <printf>
    exit();
    2b52:	e8 4b 0d 00 00       	call   38a2 <exit>
    2b57:	89 f6                	mov    %esi,%esi
    2b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b60 <iref>:
{
    2b60:	55                   	push   %ebp
    2b61:	89 e5                	mov    %esp,%ebp
    2b63:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2b64:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2b69:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2b6c:	68 a5 4a 00 00       	push   $0x4aa5
    2b71:	6a 01                	push   $0x1
    2b73:	e8 78 0e 00 00       	call   39f0 <printf>
    2b78:	83 c4 10             	add    $0x10,%esp
    2b7b:	90                   	nop
    2b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    2b80:	83 ec 0c             	sub    $0xc,%esp
    2b83:	68 b6 4a 00 00       	push   $0x4ab6
    2b88:	e8 7d 0d 00 00       	call   390a <mkdir>
    2b8d:	83 c4 10             	add    $0x10,%esp
    2b90:	85 c0                	test   %eax,%eax
    2b92:	0f 85 bb 00 00 00    	jne    2c53 <iref+0xf3>
    if(chdir("irefd") != 0){
    2b98:	83 ec 0c             	sub    $0xc,%esp
    2b9b:	68 b6 4a 00 00       	push   $0x4ab6
    2ba0:	e8 6d 0d 00 00       	call   3912 <chdir>
    2ba5:	83 c4 10             	add    $0x10,%esp
    2ba8:	85 c0                	test   %eax,%eax
    2baa:	0f 85 b7 00 00 00    	jne    2c67 <iref+0x107>
    mkdir("");
    2bb0:	83 ec 0c             	sub    $0xc,%esp
    2bb3:	68 6b 41 00 00       	push   $0x416b
    2bb8:	e8 4d 0d 00 00       	call   390a <mkdir>
    link("README", "");
    2bbd:	59                   	pop    %ecx
    2bbe:	58                   	pop    %eax
    2bbf:	68 6b 41 00 00       	push   $0x416b
    2bc4:	68 62 4a 00 00       	push   $0x4a62
    2bc9:	e8 34 0d 00 00       	call   3902 <link>
    fd = open("", O_CREATE);
    2bce:	58                   	pop    %eax
    2bcf:	5a                   	pop    %edx
    2bd0:	68 00 02 00 00       	push   $0x200
    2bd5:	68 6b 41 00 00       	push   $0x416b
    2bda:	e8 03 0d 00 00       	call   38e2 <open>
    if(fd >= 0)
    2bdf:	83 c4 10             	add    $0x10,%esp
    2be2:	85 c0                	test   %eax,%eax
    2be4:	78 0c                	js     2bf2 <iref+0x92>
      close(fd);
    2be6:	83 ec 0c             	sub    $0xc,%esp
    2be9:	50                   	push   %eax
    2bea:	e8 db 0c 00 00       	call   38ca <close>
    2bef:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2bf2:	83 ec 08             	sub    $0x8,%esp
    2bf5:	68 00 02 00 00       	push   $0x200
    2bfa:	68 a0 46 00 00       	push   $0x46a0
    2bff:	e8 de 0c 00 00       	call   38e2 <open>
    if(fd >= 0)
    2c04:	83 c4 10             	add    $0x10,%esp
    2c07:	85 c0                	test   %eax,%eax
    2c09:	78 0c                	js     2c17 <iref+0xb7>
      close(fd);
    2c0b:	83 ec 0c             	sub    $0xc,%esp
    2c0e:	50                   	push   %eax
    2c0f:	e8 b6 0c 00 00       	call   38ca <close>
    2c14:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c17:	83 ec 0c             	sub    $0xc,%esp
    2c1a:	68 a0 46 00 00       	push   $0x46a0
    2c1f:	e8 ce 0c 00 00       	call   38f2 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2c24:	83 c4 10             	add    $0x10,%esp
    2c27:	83 eb 01             	sub    $0x1,%ebx
    2c2a:	0f 85 50 ff ff ff    	jne    2b80 <iref+0x20>
  chdir("/");
    2c30:	83 ec 0c             	sub    $0xc,%esp
    2c33:	68 91 3d 00 00       	push   $0x3d91
    2c38:	e8 d5 0c 00 00       	call   3912 <chdir>
  printf(1, "empty file name OK\n");
    2c3d:	58                   	pop    %eax
    2c3e:	5a                   	pop    %edx
    2c3f:	68 e4 4a 00 00       	push   $0x4ae4
    2c44:	6a 01                	push   $0x1
    2c46:	e8 a5 0d 00 00       	call   39f0 <printf>
}
    2c4b:	83 c4 10             	add    $0x10,%esp
    2c4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c51:	c9                   	leave  
    2c52:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2c53:	83 ec 08             	sub    $0x8,%esp
    2c56:	68 bc 4a 00 00       	push   $0x4abc
    2c5b:	6a 01                	push   $0x1
    2c5d:	e8 8e 0d 00 00       	call   39f0 <printf>
      exit();
    2c62:	e8 3b 0c 00 00       	call   38a2 <exit>
      printf(1, "chdir irefd failed\n");
    2c67:	83 ec 08             	sub    $0x8,%esp
    2c6a:	68 d0 4a 00 00       	push   $0x4ad0
    2c6f:	6a 01                	push   $0x1
    2c71:	e8 7a 0d 00 00       	call   39f0 <printf>
      exit();
    2c76:	e8 27 0c 00 00       	call   38a2 <exit>
    2c7b:	90                   	nop
    2c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c80 <forktest>:
{
    2c80:	55                   	push   %ebp
    2c81:	89 e5                	mov    %esp,%ebp
    2c83:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2c84:	31 db                	xor    %ebx,%ebx
{
    2c86:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2c89:	68 f8 4a 00 00       	push   $0x4af8
    2c8e:	6a 01                	push   $0x1
    2c90:	e8 5b 0d 00 00       	call   39f0 <printf>
    2c95:	83 c4 10             	add    $0x10,%esp
    2c98:	eb 13                	jmp    2cad <forktest+0x2d>
    2c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    2ca0:	74 62                	je     2d04 <forktest+0x84>
  for(n=0; n<1000; n++){
    2ca2:	83 c3 01             	add    $0x1,%ebx
    2ca5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2cab:	74 43                	je     2cf0 <forktest+0x70>
    pid = fork();
    2cad:	e8 e8 0b 00 00       	call   389a <fork>
    if(pid < 0)
    2cb2:	85 c0                	test   %eax,%eax
    2cb4:	79 ea                	jns    2ca0 <forktest+0x20>
  for(; n > 0; n--){
    2cb6:	85 db                	test   %ebx,%ebx
    2cb8:	74 14                	je     2cce <forktest+0x4e>
    2cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2cc0:	e8 e5 0b 00 00       	call   38aa <wait>
    2cc5:	85 c0                	test   %eax,%eax
    2cc7:	78 40                	js     2d09 <forktest+0x89>
  for(; n > 0; n--){
    2cc9:	83 eb 01             	sub    $0x1,%ebx
    2ccc:	75 f2                	jne    2cc0 <forktest+0x40>
  if(wait() != -1){
    2cce:	e8 d7 0b 00 00       	call   38aa <wait>
    2cd3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cd6:	75 45                	jne    2d1d <forktest+0x9d>
  printf(1, "fork test OK\n");
    2cd8:	83 ec 08             	sub    $0x8,%esp
    2cdb:	68 2a 4b 00 00       	push   $0x4b2a
    2ce0:	6a 01                	push   $0x1
    2ce2:	e8 09 0d 00 00       	call   39f0 <printf>
}
    2ce7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cea:	c9                   	leave  
    2ceb:	c3                   	ret    
    2cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
    2cf0:	83 ec 08             	sub    $0x8,%esp
    2cf3:	68 98 52 00 00       	push   $0x5298
    2cf8:	6a 01                	push   $0x1
    2cfa:	e8 f1 0c 00 00       	call   39f0 <printf>
    exit();
    2cff:	e8 9e 0b 00 00       	call   38a2 <exit>
      exit();
    2d04:	e8 99 0b 00 00       	call   38a2 <exit>
      printf(1, "wait stopped early\n");
    2d09:	83 ec 08             	sub    $0x8,%esp
    2d0c:	68 03 4b 00 00       	push   $0x4b03
    2d11:	6a 01                	push   $0x1
    2d13:	e8 d8 0c 00 00       	call   39f0 <printf>
      exit();
    2d18:	e8 85 0b 00 00       	call   38a2 <exit>
    printf(1, "wait got too many\n");
    2d1d:	50                   	push   %eax
    2d1e:	50                   	push   %eax
    2d1f:	68 17 4b 00 00       	push   $0x4b17
    2d24:	6a 01                	push   $0x1
    2d26:	e8 c5 0c 00 00       	call   39f0 <printf>
    exit();
    2d2b:	e8 72 0b 00 00       	call   38a2 <exit>

00002d30 <sbrktest>:
{
    2d30:	55                   	push   %ebp
    2d31:	89 e5                	mov    %esp,%ebp
    2d33:	57                   	push   %edi
    2d34:	56                   	push   %esi
    2d35:	53                   	push   %ebx
  for(i = 0; i < 5000; i++){
    2d36:	31 ff                	xor    %edi,%edi
{
    2d38:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    2d3b:	68 38 4b 00 00       	push   $0x4b38
    2d40:	ff 35 f8 5d 00 00    	pushl  0x5df8
    2d46:	e8 a5 0c 00 00       	call   39f0 <printf>
  oldbrk = sbrk(0);
    2d4b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d52:	e8 d3 0b 00 00       	call   392a <sbrk>
  a = sbrk(0);
    2d57:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2d5e:	89 c3                	mov    %eax,%ebx
  a = sbrk(0);
    2d60:	e8 c5 0b 00 00       	call   392a <sbrk>
    2d65:	83 c4 10             	add    $0x10,%esp
    2d68:	89 c6                	mov    %eax,%esi
    2d6a:	eb 06                	jmp    2d72 <sbrktest+0x42>
    2d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    a = b + 1;
    2d70:	89 c6                	mov    %eax,%esi
    b = sbrk(1);
    2d72:	83 ec 0c             	sub    $0xc,%esp
    2d75:	6a 01                	push   $0x1
    2d77:	e8 ae 0b 00 00       	call   392a <sbrk>
    if(b != a){
    2d7c:	83 c4 10             	add    $0x10,%esp
    2d7f:	39 f0                	cmp    %esi,%eax
    2d81:	0f 85 62 02 00 00    	jne    2fe9 <sbrktest+0x2b9>
  for(i = 0; i < 5000; i++){
    2d87:	83 c7 01             	add    $0x1,%edi
    *b = 1;
    2d8a:	c6 06 01             	movb   $0x1,(%esi)
    a = b + 1;
    2d8d:	8d 46 01             	lea    0x1(%esi),%eax
  for(i = 0; i < 5000; i++){
    2d90:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2d96:	75 d8                	jne    2d70 <sbrktest+0x40>
  pid = fork();
    2d98:	e8 fd 0a 00 00       	call   389a <fork>
  if(pid < 0){
    2d9d:	85 c0                	test   %eax,%eax
  pid = fork();
    2d9f:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2da1:	0f 88 82 03 00 00    	js     3129 <sbrktest+0x3f9>
  c = sbrk(1);
    2da7:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2daa:	83 c6 02             	add    $0x2,%esi
  c = sbrk(1);
    2dad:	6a 01                	push   $0x1
    2daf:	e8 76 0b 00 00       	call   392a <sbrk>
  c = sbrk(1);
    2db4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dbb:	e8 6a 0b 00 00       	call   392a <sbrk>
  if(c != a + 1){
    2dc0:	83 c4 10             	add    $0x10,%esp
    2dc3:	39 f0                	cmp    %esi,%eax
    2dc5:	0f 85 47 03 00 00    	jne    3112 <sbrktest+0x3e2>
  if(pid == 0)
    2dcb:	85 ff                	test   %edi,%edi
    2dcd:	0f 84 3a 03 00 00    	je     310d <sbrktest+0x3dd>
  wait();
    2dd3:	e8 d2 0a 00 00       	call   38aa <wait>
  a = sbrk(0);
    2dd8:	83 ec 0c             	sub    $0xc,%esp
    2ddb:	6a 00                	push   $0x0
    2ddd:	e8 48 0b 00 00       	call   392a <sbrk>
    2de2:	89 c6                	mov    %eax,%esi
  amt = (BIG) - (uint)a;
    2de4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2de9:	29 f0                	sub    %esi,%eax
  p = sbrk(amt);
    2deb:	89 04 24             	mov    %eax,(%esp)
    2dee:	e8 37 0b 00 00       	call   392a <sbrk>
  if (p != a) {
    2df3:	83 c4 10             	add    $0x10,%esp
    2df6:	39 c6                	cmp    %eax,%esi
    2df8:	0f 85 f8 02 00 00    	jne    30f6 <sbrktest+0x3c6>
  a = sbrk(0);
    2dfe:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2e01:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2e08:	6a 00                	push   $0x0
    2e0a:	e8 1b 0b 00 00       	call   392a <sbrk>
  c = sbrk(-4096);
    2e0f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2e16:	89 c6                	mov    %eax,%esi
  c = sbrk(-4096);
    2e18:	e8 0d 0b 00 00       	call   392a <sbrk>
  if(c == (char*)0xffffffff){
    2e1d:	83 c4 10             	add    $0x10,%esp
    2e20:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e23:	0f 84 b6 02 00 00    	je     30df <sbrktest+0x3af>
  c = sbrk(0);
    2e29:	83 ec 0c             	sub    $0xc,%esp
    2e2c:	6a 00                	push   $0x0
    2e2e:	e8 f7 0a 00 00       	call   392a <sbrk>
  if(c != a - 4096){
    2e33:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    2e39:	83 c4 10             	add    $0x10,%esp
    2e3c:	39 d0                	cmp    %edx,%eax
    2e3e:	0f 85 84 02 00 00    	jne    30c8 <sbrktest+0x398>
  a = sbrk(0);
    2e44:	83 ec 0c             	sub    $0xc,%esp
    2e47:	6a 00                	push   $0x0
    2e49:	e8 dc 0a 00 00       	call   392a <sbrk>
    2e4e:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    2e50:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e57:	e8 ce 0a 00 00       	call   392a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e5c:	83 c4 10             	add    $0x10,%esp
    2e5f:	39 c6                	cmp    %eax,%esi
  c = sbrk(4096);
    2e61:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2e63:	0f 85 48 02 00 00    	jne    30b1 <sbrktest+0x381>
    2e69:	83 ec 0c             	sub    $0xc,%esp
    2e6c:	6a 00                	push   $0x0
    2e6e:	e8 b7 0a 00 00       	call   392a <sbrk>
    2e73:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    2e79:	83 c4 10             	add    $0x10,%esp
    2e7c:	39 d0                	cmp    %edx,%eax
    2e7e:	0f 85 2d 02 00 00    	jne    30b1 <sbrktest+0x381>
  if(*lastaddr == 99){
    2e84:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e8b:	0f 84 09 02 00 00    	je     309a <sbrktest+0x36a>
  a = sbrk(0);
    2e91:	83 ec 0c             	sub    $0xc,%esp
    2e94:	6a 00                	push   $0x0
    2e96:	e8 8f 0a 00 00       	call   392a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2e9b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2ea2:	89 c6                	mov    %eax,%esi
  c = sbrk(-(sbrk(0) - oldbrk));
    2ea4:	e8 81 0a 00 00       	call   392a <sbrk>
    2ea9:	89 d9                	mov    %ebx,%ecx
    2eab:	29 c1                	sub    %eax,%ecx
    2ead:	89 0c 24             	mov    %ecx,(%esp)
    2eb0:	e8 75 0a 00 00       	call   392a <sbrk>
  if(c != a){
    2eb5:	83 c4 10             	add    $0x10,%esp
    2eb8:	39 c6                	cmp    %eax,%esi
    2eba:	0f 85 c3 01 00 00    	jne    3083 <sbrktest+0x353>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ec0:	be 00 00 00 80       	mov    $0x80000000,%esi
    ppid = getpid();
    2ec5:	e8 58 0a 00 00       	call   3922 <getpid>
    2eca:	89 c7                	mov    %eax,%edi
    pid = fork();
    2ecc:	e8 c9 09 00 00       	call   389a <fork>
    if(pid < 0){
    2ed1:	85 c0                	test   %eax,%eax
    2ed3:	0f 88 93 01 00 00    	js     306c <sbrktest+0x33c>
    if(pid == 0){
    2ed9:	0f 84 6b 01 00 00    	je     304a <sbrktest+0x31a>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2edf:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    wait();
    2ee5:	e8 c0 09 00 00       	call   38aa <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2eea:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    2ef0:	75 d3                	jne    2ec5 <sbrktest+0x195>
  if(pipe(fds) != 0){
    2ef2:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2ef5:	83 ec 0c             	sub    $0xc,%esp
    2ef8:	50                   	push   %eax
    2ef9:	e8 b4 09 00 00       	call   38b2 <pipe>
    2efe:	83 c4 10             	add    $0x10,%esp
    2f01:	85 c0                	test   %eax,%eax
    2f03:	0f 85 2e 01 00 00    	jne    3037 <sbrktest+0x307>
    2f09:	8d 7d c0             	lea    -0x40(%ebp),%edi
    2f0c:	89 fe                	mov    %edi,%esi
    2f0e:	eb 23                	jmp    2f33 <sbrktest+0x203>
    if(pids[i] != -1)
    2f10:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f13:	74 14                	je     2f29 <sbrktest+0x1f9>
      read(fds[0], &scratch, 1);
    2f15:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f18:	83 ec 04             	sub    $0x4,%esp
    2f1b:	6a 01                	push   $0x1
    2f1d:	50                   	push   %eax
    2f1e:	ff 75 b8             	pushl  -0x48(%ebp)
    2f21:	e8 94 09 00 00       	call   38ba <read>
    2f26:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f29:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2f2c:	83 c6 04             	add    $0x4,%esi
    2f2f:	39 c6                	cmp    %eax,%esi
    2f31:	74 4f                	je     2f82 <sbrktest+0x252>
    if((pids[i] = fork()) == 0){
    2f33:	e8 62 09 00 00       	call   389a <fork>
    2f38:	85 c0                	test   %eax,%eax
    2f3a:	89 06                	mov    %eax,(%esi)
    2f3c:	75 d2                	jne    2f10 <sbrktest+0x1e0>
      sbrk(BIG - (uint)sbrk(0));
    2f3e:	83 ec 0c             	sub    $0xc,%esp
    2f41:	6a 00                	push   $0x0
    2f43:	e8 e2 09 00 00       	call   392a <sbrk>
    2f48:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2f4d:	29 c2                	sub    %eax,%edx
    2f4f:	89 14 24             	mov    %edx,(%esp)
    2f52:	e8 d3 09 00 00       	call   392a <sbrk>
      write(fds[1], "x", 1);
    2f57:	83 c4 0c             	add    $0xc,%esp
    2f5a:	6a 01                	push   $0x1
    2f5c:	68 a1 46 00 00       	push   $0x46a1
    2f61:	ff 75 bc             	pushl  -0x44(%ebp)
    2f64:	e8 59 09 00 00       	call   38c2 <write>
    2f69:	83 c4 10             	add    $0x10,%esp
    2f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    2f70:	83 ec 0c             	sub    $0xc,%esp
    2f73:	68 e8 03 00 00       	push   $0x3e8
    2f78:	e8 b5 09 00 00       	call   3932 <sleep>
    2f7d:	83 c4 10             	add    $0x10,%esp
    2f80:	eb ee                	jmp    2f70 <sbrktest+0x240>
  c = sbrk(4096);
    2f82:	83 ec 0c             	sub    $0xc,%esp
    2f85:	68 00 10 00 00       	push   $0x1000
    2f8a:	e8 9b 09 00 00       	call   392a <sbrk>
    2f8f:	83 c4 10             	add    $0x10,%esp
    2f92:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    if(pids[i] == -1)
    2f95:	8b 07                	mov    (%edi),%eax
    2f97:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f9a:	74 11                	je     2fad <sbrktest+0x27d>
    kill(pids[i]);
    2f9c:	83 ec 0c             	sub    $0xc,%esp
    2f9f:	50                   	push   %eax
    2fa0:	e8 2d 09 00 00       	call   38d2 <kill>
    wait();
    2fa5:	e8 00 09 00 00       	call   38aa <wait>
    2faa:	83 c4 10             	add    $0x10,%esp
    2fad:	83 c7 04             	add    $0x4,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fb0:	39 fe                	cmp    %edi,%esi
    2fb2:	75 e1                	jne    2f95 <sbrktest+0x265>
  if(c == (char*)0xffffffff){
    2fb4:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    2fb8:	74 66                	je     3020 <sbrktest+0x2f0>
  if(sbrk(0) > oldbrk)
    2fba:	83 ec 0c             	sub    $0xc,%esp
    2fbd:	6a 00                	push   $0x0
    2fbf:	e8 66 09 00 00       	call   392a <sbrk>
    2fc4:	83 c4 10             	add    $0x10,%esp
    2fc7:	39 d8                	cmp    %ebx,%eax
    2fc9:	77 3c                	ja     3007 <sbrktest+0x2d7>
  printf(stdout, "sbrk test OK\n");
    2fcb:	83 ec 08             	sub    $0x8,%esp
    2fce:	68 e0 4b 00 00       	push   $0x4be0
    2fd3:	ff 35 f8 5d 00 00    	pushl  0x5df8
    2fd9:	e8 12 0a 00 00       	call   39f0 <printf>
}
    2fde:	83 c4 10             	add    $0x10,%esp
    2fe1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fe4:	5b                   	pop    %ebx
    2fe5:	5e                   	pop    %esi
    2fe6:	5f                   	pop    %edi
    2fe7:	5d                   	pop    %ebp
    2fe8:	c3                   	ret    
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2fe9:	83 ec 0c             	sub    $0xc,%esp
    2fec:	50                   	push   %eax
    2fed:	56                   	push   %esi
    2fee:	57                   	push   %edi
    2fef:	68 43 4b 00 00       	push   $0x4b43
    2ff4:	ff 35 f8 5d 00 00    	pushl  0x5df8
    2ffa:	e8 f1 09 00 00       	call   39f0 <printf>
      exit();
    2fff:	83 c4 20             	add    $0x20,%esp
    3002:	e8 9b 08 00 00       	call   38a2 <exit>
    sbrk(-(sbrk(0) - oldbrk));
    3007:	83 ec 0c             	sub    $0xc,%esp
    300a:	6a 00                	push   $0x0
    300c:	e8 19 09 00 00       	call   392a <sbrk>
    3011:	29 c3                	sub    %eax,%ebx
    3013:	89 1c 24             	mov    %ebx,(%esp)
    3016:	e8 0f 09 00 00       	call   392a <sbrk>
    301b:	83 c4 10             	add    $0x10,%esp
    301e:	eb ab                	jmp    2fcb <sbrktest+0x29b>
    printf(stdout, "failed sbrk leaked memory\n");
    3020:	50                   	push   %eax
    3021:	50                   	push   %eax
    3022:	68 c5 4b 00 00       	push   $0x4bc5
    3027:	ff 35 f8 5d 00 00    	pushl  0x5df8
    302d:	e8 be 09 00 00       	call   39f0 <printf>
    exit();
    3032:	e8 6b 08 00 00       	call   38a2 <exit>
    printf(1, "pipe() failed\n");
    3037:	52                   	push   %edx
    3038:	52                   	push   %edx
    3039:	68 81 40 00 00       	push   $0x4081
    303e:	6a 01                	push   $0x1
    3040:	e8 ab 09 00 00       	call   39f0 <printf>
    exit();
    3045:	e8 58 08 00 00       	call   38a2 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    304a:	0f be 06             	movsbl (%esi),%eax
    304d:	50                   	push   %eax
    304e:	56                   	push   %esi
    304f:	68 ac 4b 00 00       	push   $0x4bac
    3054:	ff 35 f8 5d 00 00    	pushl  0x5df8
    305a:	e8 91 09 00 00       	call   39f0 <printf>
      kill(ppid);
    305f:	89 3c 24             	mov    %edi,(%esp)
    3062:	e8 6b 08 00 00       	call   38d2 <kill>
      exit();
    3067:	e8 36 08 00 00       	call   38a2 <exit>
      printf(stdout, "fork failed\n");
    306c:	51                   	push   %ecx
    306d:	51                   	push   %ecx
    306e:	68 89 4c 00 00       	push   $0x4c89
    3073:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3079:	e8 72 09 00 00       	call   39f0 <printf>
      exit();
    307e:	e8 1f 08 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3083:	50                   	push   %eax
    3084:	56                   	push   %esi
    3085:	68 8c 53 00 00       	push   $0x538c
    308a:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3090:	e8 5b 09 00 00       	call   39f0 <printf>
    exit();
    3095:	e8 08 08 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    309a:	53                   	push   %ebx
    309b:	53                   	push   %ebx
    309c:	68 5c 53 00 00       	push   $0x535c
    30a1:	ff 35 f8 5d 00 00    	pushl  0x5df8
    30a7:	e8 44 09 00 00       	call   39f0 <printf>
    exit();
    30ac:	e8 f1 07 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30b1:	57                   	push   %edi
    30b2:	56                   	push   %esi
    30b3:	68 34 53 00 00       	push   $0x5334
    30b8:	ff 35 f8 5d 00 00    	pushl  0x5df8
    30be:	e8 2d 09 00 00       	call   39f0 <printf>
    exit();
    30c3:	e8 da 07 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30c8:	50                   	push   %eax
    30c9:	56                   	push   %esi
    30ca:	68 fc 52 00 00       	push   $0x52fc
    30cf:	ff 35 f8 5d 00 00    	pushl  0x5df8
    30d5:	e8 16 09 00 00       	call   39f0 <printf>
    exit();
    30da:	e8 c3 07 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    30df:	56                   	push   %esi
    30e0:	56                   	push   %esi
    30e1:	68 91 4b 00 00       	push   $0x4b91
    30e6:	ff 35 f8 5d 00 00    	pushl  0x5df8
    30ec:	e8 ff 08 00 00       	call   39f0 <printf>
    exit();
    30f1:	e8 ac 07 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    30f6:	57                   	push   %edi
    30f7:	57                   	push   %edi
    30f8:	68 bc 52 00 00       	push   $0x52bc
    30fd:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3103:	e8 e8 08 00 00       	call   39f0 <printf>
    exit();
    3108:	e8 95 07 00 00       	call   38a2 <exit>
    exit();
    310d:	e8 90 07 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3112:	50                   	push   %eax
    3113:	50                   	push   %eax
    3114:	68 75 4b 00 00       	push   $0x4b75
    3119:	ff 35 f8 5d 00 00    	pushl  0x5df8
    311f:	e8 cc 08 00 00       	call   39f0 <printf>
    exit();
    3124:	e8 79 07 00 00       	call   38a2 <exit>
    printf(stdout, "sbrk test fork failed\n");
    3129:	50                   	push   %eax
    312a:	50                   	push   %eax
    312b:	68 5e 4b 00 00       	push   $0x4b5e
    3130:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3136:	e8 b5 08 00 00       	call   39f0 <printf>
    exit();
    313b:	e8 62 07 00 00       	call   38a2 <exit>

00003140 <validateint>:
{
    3140:	55                   	push   %ebp
    3141:	89 e5                	mov    %esp,%ebp
}
    3143:	5d                   	pop    %ebp
    3144:	c3                   	ret    
    3145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003150 <validatetest>:
{
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	56                   	push   %esi
    3154:	53                   	push   %ebx
  for(p = 0; p <= (uint)hi; p += 4096){
    3155:	31 db                	xor    %ebx,%ebx
  printf(stdout, "validate test\n");
    3157:	83 ec 08             	sub    $0x8,%esp
    315a:	68 ee 4b 00 00       	push   $0x4bee
    315f:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3165:	e8 86 08 00 00       	call   39f0 <printf>
    316a:	83 c4 10             	add    $0x10,%esp
    316d:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    3170:	e8 25 07 00 00       	call   389a <fork>
    3175:	85 c0                	test   %eax,%eax
    3177:	89 c6                	mov    %eax,%esi
    3179:	74 63                	je     31de <validatetest+0x8e>
    sleep(0);
    317b:	83 ec 0c             	sub    $0xc,%esp
    317e:	6a 00                	push   $0x0
    3180:	e8 ad 07 00 00       	call   3932 <sleep>
    sleep(0);
    3185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    318c:	e8 a1 07 00 00       	call   3932 <sleep>
    kill(pid);
    3191:	89 34 24             	mov    %esi,(%esp)
    3194:	e8 39 07 00 00       	call   38d2 <kill>
    wait();
    3199:	e8 0c 07 00 00       	call   38aa <wait>
    if(link("nosuchfile", (char*)p) != -1){
    319e:	58                   	pop    %eax
    319f:	5a                   	pop    %edx
    31a0:	53                   	push   %ebx
    31a1:	68 fd 4b 00 00       	push   $0x4bfd
    31a6:	e8 57 07 00 00       	call   3902 <link>
    31ab:	83 c4 10             	add    $0x10,%esp
    31ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    31b1:	75 30                	jne    31e3 <validatetest+0x93>
  for(p = 0; p <= (uint)hi; p += 4096){
    31b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31b9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31bf:	75 af                	jne    3170 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    31c1:	83 ec 08             	sub    $0x8,%esp
    31c4:	68 21 4c 00 00       	push   $0x4c21
    31c9:	ff 35 f8 5d 00 00    	pushl  0x5df8
    31cf:	e8 1c 08 00 00       	call   39f0 <printf>
}
    31d4:	83 c4 10             	add    $0x10,%esp
    31d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31da:	5b                   	pop    %ebx
    31db:	5e                   	pop    %esi
    31dc:	5d                   	pop    %ebp
    31dd:	c3                   	ret    
      exit();
    31de:	e8 bf 06 00 00       	call   38a2 <exit>
      printf(stdout, "link should not succeed\n");
    31e3:	83 ec 08             	sub    $0x8,%esp
    31e6:	68 08 4c 00 00       	push   $0x4c08
    31eb:	ff 35 f8 5d 00 00    	pushl  0x5df8
    31f1:	e8 fa 07 00 00       	call   39f0 <printf>
      exit();
    31f6:	e8 a7 06 00 00       	call   38a2 <exit>
    31fb:	90                   	nop
    31fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003200 <bsstest>:
{
    3200:	55                   	push   %ebp
    3201:	89 e5                	mov    %esp,%ebp
    3203:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    3206:	68 2e 4c 00 00       	push   $0x4c2e
    320b:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3211:	e8 da 07 00 00       	call   39f0 <printf>
    if(uninit[i] != '\0'){
    3216:	83 c4 10             	add    $0x10,%esp
    3219:	80 3d c0 5e 00 00 00 	cmpb   $0x0,0x5ec0
    3220:	75 39                	jne    325b <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3222:	b8 01 00 00 00       	mov    $0x1,%eax
    3227:	89 f6                	mov    %esi,%esi
    3229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(uninit[i] != '\0'){
    3230:	80 b8 c0 5e 00 00 00 	cmpb   $0x0,0x5ec0(%eax)
    3237:	75 22                	jne    325b <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3239:	83 c0 01             	add    $0x1,%eax
    323c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3241:	75 ed                	jne    3230 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    3243:	83 ec 08             	sub    $0x8,%esp
    3246:	68 49 4c 00 00       	push   $0x4c49
    324b:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3251:	e8 9a 07 00 00       	call   39f0 <printf>
}
    3256:	83 c4 10             	add    $0x10,%esp
    3259:	c9                   	leave  
    325a:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    325b:	83 ec 08             	sub    $0x8,%esp
    325e:	68 38 4c 00 00       	push   $0x4c38
    3263:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3269:	e8 82 07 00 00       	call   39f0 <printf>
      exit();
    326e:	e8 2f 06 00 00       	call   38a2 <exit>
    3273:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003280 <bigargtest>:
{
    3280:	55                   	push   %ebp
    3281:	89 e5                	mov    %esp,%ebp
    3283:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    3286:	68 56 4c 00 00       	push   $0x4c56
    328b:	e8 62 06 00 00       	call   38f2 <unlink>
  pid = fork();
    3290:	e8 05 06 00 00       	call   389a <fork>
  if(pid == 0){
    3295:	83 c4 10             	add    $0x10,%esp
    3298:	85 c0                	test   %eax,%eax
    329a:	74 3f                	je     32db <bigargtest+0x5b>
  } else if(pid < 0){
    329c:	0f 88 c2 00 00 00    	js     3364 <bigargtest+0xe4>
  wait();
    32a2:	e8 03 06 00 00       	call   38aa <wait>
  fd = open("bigarg-ok", 0);
    32a7:	83 ec 08             	sub    $0x8,%esp
    32aa:	6a 00                	push   $0x0
    32ac:	68 56 4c 00 00       	push   $0x4c56
    32b1:	e8 2c 06 00 00       	call   38e2 <open>
  if(fd < 0){
    32b6:	83 c4 10             	add    $0x10,%esp
    32b9:	85 c0                	test   %eax,%eax
    32bb:	0f 88 8c 00 00 00    	js     334d <bigargtest+0xcd>
  close(fd);
    32c1:	83 ec 0c             	sub    $0xc,%esp
    32c4:	50                   	push   %eax
    32c5:	e8 00 06 00 00       	call   38ca <close>
  unlink("bigarg-ok");
    32ca:	c7 04 24 56 4c 00 00 	movl   $0x4c56,(%esp)
    32d1:	e8 1c 06 00 00       	call   38f2 <unlink>
}
    32d6:	83 c4 10             	add    $0x10,%esp
    32d9:	c9                   	leave  
    32da:	c3                   	ret    
    32db:	b8 20 5e 00 00       	mov    $0x5e20,%eax
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    32e0:	c7 00 b0 53 00 00    	movl   $0x53b0,(%eax)
    32e6:	83 c0 04             	add    $0x4,%eax
    for(i = 0; i < MAXARG-1; i++)
    32e9:	3d 9c 5e 00 00       	cmp    $0x5e9c,%eax
    32ee:	75 f0                	jne    32e0 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    32f0:	51                   	push   %ecx
    32f1:	51                   	push   %ecx
    32f2:	68 60 4c 00 00       	push   $0x4c60
    32f7:	ff 35 f8 5d 00 00    	pushl  0x5df8
    args[MAXARG-1] = 0;
    32fd:	c7 05 9c 5e 00 00 00 	movl   $0x0,0x5e9c
    3304:	00 00 00 
    printf(stdout, "bigarg test\n");
    3307:	e8 e4 06 00 00       	call   39f0 <printf>
    exec("echo", args);
    330c:	58                   	pop    %eax
    330d:	5a                   	pop    %edx
    330e:	68 20 5e 00 00       	push   $0x5e20
    3313:	68 2d 3e 00 00       	push   $0x3e2d
    3318:	e8 bd 05 00 00       	call   38da <exec>
    printf(stdout, "bigarg test ok\n");
    331d:	59                   	pop    %ecx
    331e:	58                   	pop    %eax
    331f:	68 6d 4c 00 00       	push   $0x4c6d
    3324:	ff 35 f8 5d 00 00    	pushl  0x5df8
    332a:	e8 c1 06 00 00       	call   39f0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    332f:	58                   	pop    %eax
    3330:	5a                   	pop    %edx
    3331:	68 00 02 00 00       	push   $0x200
    3336:	68 56 4c 00 00       	push   $0x4c56
    333b:	e8 a2 05 00 00       	call   38e2 <open>
    close(fd);
    3340:	89 04 24             	mov    %eax,(%esp)
    3343:	e8 82 05 00 00       	call   38ca <close>
    exit();
    3348:	e8 55 05 00 00       	call   38a2 <exit>
    printf(stdout, "bigarg test failed!\n");
    334d:	50                   	push   %eax
    334e:	50                   	push   %eax
    334f:	68 96 4c 00 00       	push   $0x4c96
    3354:	ff 35 f8 5d 00 00    	pushl  0x5df8
    335a:	e8 91 06 00 00       	call   39f0 <printf>
    exit();
    335f:	e8 3e 05 00 00       	call   38a2 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3364:	52                   	push   %edx
    3365:	52                   	push   %edx
    3366:	68 7d 4c 00 00       	push   $0x4c7d
    336b:	ff 35 f8 5d 00 00    	pushl  0x5df8
    3371:	e8 7a 06 00 00       	call   39f0 <printf>
    exit();
    3376:	e8 27 05 00 00       	call   38a2 <exit>
    337b:	90                   	nop
    337c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003380 <fsfull>:
{
    3380:	55                   	push   %ebp
    3381:	89 e5                	mov    %esp,%ebp
    3383:	57                   	push   %edi
    3384:	56                   	push   %esi
    3385:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    3386:	31 db                	xor    %ebx,%ebx
{
    3388:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    338b:	68 ab 4c 00 00       	push   $0x4cab
    3390:	6a 01                	push   $0x1
    3392:	e8 59 06 00 00       	call   39f0 <printf>
    3397:	83 c4 10             	add    $0x10,%esp
    339a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    33a0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    33a5:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    33aa:	83 ec 04             	sub    $0x4,%esp
    name[1] = '0' + nfiles / 1000;
    33ad:	f7 e3                	mul    %ebx
    name[0] = 'f';
    33af:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    33b3:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    33b7:	c1 ea 06             	shr    $0x6,%edx
    33ba:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33bd:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    33c3:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33c6:	89 d8                	mov    %ebx,%eax
    33c8:	29 d0                	sub    %edx,%eax
    33ca:	89 c2                	mov    %eax,%edx
    33cc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33d1:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    33d3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33d8:	c1 ea 05             	shr    $0x5,%edx
    33db:	83 c2 30             	add    $0x30,%edx
    33de:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    33e1:	f7 e3                	mul    %ebx
    33e3:	89 d8                	mov    %ebx,%eax
    33e5:	c1 ea 05             	shr    $0x5,%edx
    33e8:	6b d2 64             	imul   $0x64,%edx,%edx
    33eb:	29 d0                	sub    %edx,%eax
    33ed:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    33ef:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    33f1:	c1 ea 03             	shr    $0x3,%edx
    33f4:	83 c2 30             	add    $0x30,%edx
    33f7:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    33fa:	f7 e1                	mul    %ecx
    33fc:	89 d9                	mov    %ebx,%ecx
    33fe:	c1 ea 03             	shr    $0x3,%edx
    3401:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3404:	01 c0                	add    %eax,%eax
    3406:	29 c1                	sub    %eax,%ecx
    3408:	89 c8                	mov    %ecx,%eax
    340a:	83 c0 30             	add    $0x30,%eax
    340d:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    3410:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3413:	50                   	push   %eax
    3414:	68 b8 4c 00 00       	push   $0x4cb8
    3419:	6a 01                	push   $0x1
    341b:	e8 d0 05 00 00       	call   39f0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3420:	58                   	pop    %eax
    3421:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3424:	5a                   	pop    %edx
    3425:	68 02 02 00 00       	push   $0x202
    342a:	50                   	push   %eax
    342b:	e8 b2 04 00 00       	call   38e2 <open>
    if(fd < 0){
    3430:	83 c4 10             	add    $0x10,%esp
    3433:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
    3435:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    3437:	78 57                	js     3490 <fsfull+0x110>
    int total = 0;
    3439:	31 f6                	xor    %esi,%esi
    343b:	eb 05                	jmp    3442 <fsfull+0xc2>
    343d:	8d 76 00             	lea    0x0(%esi),%esi
      total += cc;
    3440:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    3442:	83 ec 04             	sub    $0x4,%esp
    3445:	68 00 02 00 00       	push   $0x200
    344a:	68 e0 85 00 00       	push   $0x85e0
    344f:	57                   	push   %edi
    3450:	e8 6d 04 00 00       	call   38c2 <write>
      if(cc < 512)
    3455:	83 c4 10             	add    $0x10,%esp
    3458:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    345d:	7f e1                	jg     3440 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    345f:	83 ec 04             	sub    $0x4,%esp
    3462:	56                   	push   %esi
    3463:	68 d4 4c 00 00       	push   $0x4cd4
    3468:	6a 01                	push   $0x1
    346a:	e8 81 05 00 00       	call   39f0 <printf>
    close(fd);
    346f:	89 3c 24             	mov    %edi,(%esp)
    3472:	e8 53 04 00 00       	call   38ca <close>
    if(total == 0)
    3477:	83 c4 10             	add    $0x10,%esp
    347a:	85 f6                	test   %esi,%esi
    347c:	74 28                	je     34a6 <fsfull+0x126>
  for(nfiles = 0; ; nfiles++){
    347e:	83 c3 01             	add    $0x1,%ebx
    3481:	e9 1a ff ff ff       	jmp    33a0 <fsfull+0x20>
    3486:	8d 76 00             	lea    0x0(%esi),%esi
    3489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, "open %s failed\n", name);
    3490:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3493:	83 ec 04             	sub    $0x4,%esp
    3496:	50                   	push   %eax
    3497:	68 c4 4c 00 00       	push   $0x4cc4
    349c:	6a 01                	push   $0x1
    349e:	e8 4d 05 00 00       	call   39f0 <printf>
      break;
    34a3:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    34a6:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    34ab:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
    name[1] = '0' + nfiles / 1000;
    34b0:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    34b2:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    unlink(name);
    34b7:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + nfiles / 1000;
    34ba:	f7 e7                	mul    %edi
    name[0] = 'f';
    34bc:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    34c0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    34c4:	c1 ea 06             	shr    $0x6,%edx
    34c7:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34ca:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    34d0:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34d3:	89 d8                	mov    %ebx,%eax
    34d5:	29 d0                	sub    %edx,%eax
    34d7:	f7 e6                	mul    %esi
    name[3] = '0' + (nfiles % 100) / 10;
    34d9:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34db:	c1 ea 05             	shr    $0x5,%edx
    34de:	83 c2 30             	add    $0x30,%edx
    34e1:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    34e4:	f7 e6                	mul    %esi
    34e6:	89 d8                	mov    %ebx,%eax
    34e8:	c1 ea 05             	shr    $0x5,%edx
    34eb:	6b d2 64             	imul   $0x64,%edx,%edx
    34ee:	29 d0                	sub    %edx,%eax
    34f0:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    34f2:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    34f4:	c1 ea 03             	shr    $0x3,%edx
    34f7:	83 c2 30             	add    $0x30,%edx
    34fa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    34fd:	f7 e1                	mul    %ecx
    34ff:	89 d9                	mov    %ebx,%ecx
    nfiles--;
    3501:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    3504:	c1 ea 03             	shr    $0x3,%edx
    3507:	8d 04 92             	lea    (%edx,%edx,4),%eax
    350a:	01 c0                	add    %eax,%eax
    350c:	29 c1                	sub    %eax,%ecx
    350e:	89 c8                	mov    %ecx,%eax
    3510:	83 c0 30             	add    $0x30,%eax
    3513:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    3516:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3519:	50                   	push   %eax
    351a:	e8 d3 03 00 00       	call   38f2 <unlink>
  while(nfiles >= 0){
    351f:	83 c4 10             	add    $0x10,%esp
    3522:	83 fb ff             	cmp    $0xffffffff,%ebx
    3525:	75 89                	jne    34b0 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    3527:	83 ec 08             	sub    $0x8,%esp
    352a:	68 e4 4c 00 00       	push   $0x4ce4
    352f:	6a 01                	push   $0x1
    3531:	e8 ba 04 00 00       	call   39f0 <printf>
}
    3536:	83 c4 10             	add    $0x10,%esp
    3539:	8d 65 f4             	lea    -0xc(%ebp),%esp
    353c:	5b                   	pop    %ebx
    353d:	5e                   	pop    %esi
    353e:	5f                   	pop    %edi
    353f:	5d                   	pop    %ebp
    3540:	c3                   	ret    
    3541:	eb 0d                	jmp    3550 <uio>
    3543:	90                   	nop
    3544:	90                   	nop
    3545:	90                   	nop
    3546:	90                   	nop
    3547:	90                   	nop
    3548:	90                   	nop
    3549:	90                   	nop
    354a:	90                   	nop
    354b:	90                   	nop
    354c:	90                   	nop
    354d:	90                   	nop
    354e:	90                   	nop
    354f:	90                   	nop

00003550 <uio>:
{
    3550:	55                   	push   %ebp
    3551:	89 e5                	mov    %esp,%ebp
    3553:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    3556:	68 fa 4c 00 00       	push   $0x4cfa
    355b:	6a 01                	push   $0x1
    355d:	e8 8e 04 00 00       	call   39f0 <printf>
  pid = fork();
    3562:	e8 33 03 00 00       	call   389a <fork>
  if(pid == 0){
    3567:	83 c4 10             	add    $0x10,%esp
    356a:	85 c0                	test   %eax,%eax
    356c:	74 1b                	je     3589 <uio+0x39>
  } else if(pid < 0){
    356e:	78 3d                	js     35ad <uio+0x5d>
  wait();
    3570:	e8 35 03 00 00       	call   38aa <wait>
  printf(1, "uio test done\n");
    3575:	83 ec 08             	sub    $0x8,%esp
    3578:	68 04 4d 00 00       	push   $0x4d04
    357d:	6a 01                	push   $0x1
    357f:	e8 6c 04 00 00       	call   39f0 <printf>
}
    3584:	83 c4 10             	add    $0x10,%esp
    3587:	c9                   	leave  
    3588:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3589:	b8 09 00 00 00       	mov    $0x9,%eax
    358e:	ba 70 00 00 00       	mov    $0x70,%edx
    3593:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3594:	ba 71 00 00 00       	mov    $0x71,%edx
    3599:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    359a:	52                   	push   %edx
    359b:	52                   	push   %edx
    359c:	68 90 54 00 00       	push   $0x5490
    35a1:	6a 01                	push   $0x1
    35a3:	e8 48 04 00 00       	call   39f0 <printf>
    exit();
    35a8:	e8 f5 02 00 00       	call   38a2 <exit>
    printf (1, "fork failed\n");
    35ad:	50                   	push   %eax
    35ae:	50                   	push   %eax
    35af:	68 89 4c 00 00       	push   $0x4c89
    35b4:	6a 01                	push   $0x1
    35b6:	e8 35 04 00 00       	call   39f0 <printf>
    exit();
    35bb:	e8 e2 02 00 00       	call   38a2 <exit>

000035c0 <argptest>:
{
    35c0:	55                   	push   %ebp
    35c1:	89 e5                	mov    %esp,%ebp
    35c3:	53                   	push   %ebx
    35c4:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    35c7:	6a 00                	push   $0x0
    35c9:	68 13 4d 00 00       	push   $0x4d13
    35ce:	e8 0f 03 00 00       	call   38e2 <open>
  if (fd < 0) {
    35d3:	83 c4 10             	add    $0x10,%esp
    35d6:	85 c0                	test   %eax,%eax
    35d8:	78 39                	js     3613 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    35da:	83 ec 0c             	sub    $0xc,%esp
    35dd:	89 c3                	mov    %eax,%ebx
    35df:	6a 00                	push   $0x0
    35e1:	e8 44 03 00 00       	call   392a <sbrk>
    35e6:	83 c4 0c             	add    $0xc,%esp
    35e9:	83 e8 01             	sub    $0x1,%eax
    35ec:	6a ff                	push   $0xffffffff
    35ee:	50                   	push   %eax
    35ef:	53                   	push   %ebx
    35f0:	e8 c5 02 00 00       	call   38ba <read>
  close(fd);
    35f5:	89 1c 24             	mov    %ebx,(%esp)
    35f8:	e8 cd 02 00 00       	call   38ca <close>
  printf(1, "arg test passed\n");
    35fd:	58                   	pop    %eax
    35fe:	5a                   	pop    %edx
    35ff:	68 25 4d 00 00       	push   $0x4d25
    3604:	6a 01                	push   $0x1
    3606:	e8 e5 03 00 00       	call   39f0 <printf>
}
    360b:	83 c4 10             	add    $0x10,%esp
    360e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3611:	c9                   	leave  
    3612:	c3                   	ret    
    printf(2, "open failed\n");
    3613:	51                   	push   %ecx
    3614:	51                   	push   %ecx
    3615:	68 18 4d 00 00       	push   $0x4d18
    361a:	6a 02                	push   $0x2
    361c:	e8 cf 03 00 00       	call   39f0 <printf>
    exit();
    3621:	e8 7c 02 00 00       	call   38a2 <exit>
    3626:	8d 76 00             	lea    0x0(%esi),%esi
    3629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003630 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3630:	69 05 f4 5d 00 00 0d 	imul   $0x19660d,0x5df4,%eax
    3637:	66 19 00 
{
    363a:	55                   	push   %ebp
    363b:	89 e5                	mov    %esp,%ebp
}
    363d:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
    363e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3643:	a3 f4 5d 00 00       	mov    %eax,0x5df4
}
    3648:	c3                   	ret    
    3649:	66 90                	xchg   %ax,%ax
    364b:	66 90                	xchg   %ax,%ax
    364d:	66 90                	xchg   %ax,%ax
    364f:	90                   	nop

00003650 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3650:	55                   	push   %ebp
    3651:	89 e5                	mov    %esp,%ebp
    3653:	53                   	push   %ebx
    3654:	8b 45 08             	mov    0x8(%ebp),%eax
    3657:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    365a:	89 c2                	mov    %eax,%edx
    365c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3660:	83 c1 01             	add    $0x1,%ecx
    3663:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3667:	83 c2 01             	add    $0x1,%edx
    366a:	84 db                	test   %bl,%bl
    366c:	88 5a ff             	mov    %bl,-0x1(%edx)
    366f:	75 ef                	jne    3660 <strcpy+0x10>
    ;
  return os;
}
    3671:	5b                   	pop    %ebx
    3672:	5d                   	pop    %ebp
    3673:	c3                   	ret    
    3674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    367a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003680 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3680:	55                   	push   %ebp
    3681:	89 e5                	mov    %esp,%ebp
    3683:	53                   	push   %ebx
    3684:	8b 55 08             	mov    0x8(%ebp),%edx
    3687:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    368a:	0f b6 02             	movzbl (%edx),%eax
    368d:	0f b6 19             	movzbl (%ecx),%ebx
    3690:	84 c0                	test   %al,%al
    3692:	75 1c                	jne    36b0 <strcmp+0x30>
    3694:	eb 2a                	jmp    36c0 <strcmp+0x40>
    3696:	8d 76 00             	lea    0x0(%esi),%esi
    3699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    36a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    36a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    36a6:	83 c1 01             	add    $0x1,%ecx
    36a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    36ac:	84 c0                	test   %al,%al
    36ae:	74 10                	je     36c0 <strcmp+0x40>
    36b0:	38 d8                	cmp    %bl,%al
    36b2:	74 ec                	je     36a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    36b4:	29 d8                	sub    %ebx,%eax
}
    36b6:	5b                   	pop    %ebx
    36b7:	5d                   	pop    %ebp
    36b8:	c3                   	ret    
    36b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    36c2:	29 d8                	sub    %ebx,%eax
}
    36c4:	5b                   	pop    %ebx
    36c5:	5d                   	pop    %ebp
    36c6:	c3                   	ret    
    36c7:	89 f6                	mov    %esi,%esi
    36c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036d0 <strlen>:

uint
strlen(const char *s)
{
    36d0:	55                   	push   %ebp
    36d1:	89 e5                	mov    %esp,%ebp
    36d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    36d6:	80 39 00             	cmpb   $0x0,(%ecx)
    36d9:	74 15                	je     36f0 <strlen+0x20>
    36db:	31 d2                	xor    %edx,%edx
    36dd:	8d 76 00             	lea    0x0(%esi),%esi
    36e0:	83 c2 01             	add    $0x1,%edx
    36e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    36e7:	89 d0                	mov    %edx,%eax
    36e9:	75 f5                	jne    36e0 <strlen+0x10>
    ;
  return n;
}
    36eb:	5d                   	pop    %ebp
    36ec:	c3                   	ret    
    36ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    36f0:	31 c0                	xor    %eax,%eax
}
    36f2:	5d                   	pop    %ebp
    36f3:	c3                   	ret    
    36f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003700 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3700:	55                   	push   %ebp
    3701:	89 e5                	mov    %esp,%ebp
    3703:	57                   	push   %edi
    3704:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3707:	8b 4d 10             	mov    0x10(%ebp),%ecx
    370a:	8b 45 0c             	mov    0xc(%ebp),%eax
    370d:	89 d7                	mov    %edx,%edi
    370f:	fc                   	cld    
    3710:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3712:	89 d0                	mov    %edx,%eax
    3714:	5f                   	pop    %edi
    3715:	5d                   	pop    %ebp
    3716:	c3                   	ret    
    3717:	89 f6                	mov    %esi,%esi
    3719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003720 <strchr>:

char*
strchr(const char *s, char c)
{
    3720:	55                   	push   %ebp
    3721:	89 e5                	mov    %esp,%ebp
    3723:	53                   	push   %ebx
    3724:	8b 45 08             	mov    0x8(%ebp),%eax
    3727:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    372a:	0f b6 10             	movzbl (%eax),%edx
    372d:	84 d2                	test   %dl,%dl
    372f:	74 1d                	je     374e <strchr+0x2e>
    if(*s == c)
    3731:	38 d3                	cmp    %dl,%bl
    3733:	89 d9                	mov    %ebx,%ecx
    3735:	75 0d                	jne    3744 <strchr+0x24>
    3737:	eb 17                	jmp    3750 <strchr+0x30>
    3739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3740:	38 ca                	cmp    %cl,%dl
    3742:	74 0c                	je     3750 <strchr+0x30>
  for(; *s; s++)
    3744:	83 c0 01             	add    $0x1,%eax
    3747:	0f b6 10             	movzbl (%eax),%edx
    374a:	84 d2                	test   %dl,%dl
    374c:	75 f2                	jne    3740 <strchr+0x20>
      return (char*)s;
  return 0;
    374e:	31 c0                	xor    %eax,%eax
}
    3750:	5b                   	pop    %ebx
    3751:	5d                   	pop    %ebp
    3752:	c3                   	ret    
    3753:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003760 <gets>:

char*
gets(char *buf, int max)
{
    3760:	55                   	push   %ebp
    3761:	89 e5                	mov    %esp,%ebp
    3763:	57                   	push   %edi
    3764:	56                   	push   %esi
    3765:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3766:	31 f6                	xor    %esi,%esi
    3768:	89 f3                	mov    %esi,%ebx
{
    376a:	83 ec 1c             	sub    $0x1c,%esp
    376d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    3770:	eb 2f                	jmp    37a1 <gets+0x41>
    3772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    3778:	8d 45 e7             	lea    -0x19(%ebp),%eax
    377b:	83 ec 04             	sub    $0x4,%esp
    377e:	6a 01                	push   $0x1
    3780:	50                   	push   %eax
    3781:	6a 00                	push   $0x0
    3783:	e8 32 01 00 00       	call   38ba <read>
    if(cc < 1)
    3788:	83 c4 10             	add    $0x10,%esp
    378b:	85 c0                	test   %eax,%eax
    378d:	7e 1c                	jle    37ab <gets+0x4b>
      break;
    buf[i++] = c;
    378f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3793:	83 c7 01             	add    $0x1,%edi
    3796:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    3799:	3c 0a                	cmp    $0xa,%al
    379b:	74 23                	je     37c0 <gets+0x60>
    379d:	3c 0d                	cmp    $0xd,%al
    379f:	74 1f                	je     37c0 <gets+0x60>
  for(i=0; i+1 < max; ){
    37a1:	83 c3 01             	add    $0x1,%ebx
    37a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    37a7:	89 fe                	mov    %edi,%esi
    37a9:	7c cd                	jl     3778 <gets+0x18>
    37ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    37ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    37b0:	c6 03 00             	movb   $0x0,(%ebx)
}
    37b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37b6:	5b                   	pop    %ebx
    37b7:	5e                   	pop    %esi
    37b8:	5f                   	pop    %edi
    37b9:	5d                   	pop    %ebp
    37ba:	c3                   	ret    
    37bb:	90                   	nop
    37bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    37c0:	8b 75 08             	mov    0x8(%ebp),%esi
    37c3:	8b 45 08             	mov    0x8(%ebp),%eax
    37c6:	01 de                	add    %ebx,%esi
    37c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    37ca:	c6 03 00             	movb   $0x0,(%ebx)
}
    37cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37d0:	5b                   	pop    %ebx
    37d1:	5e                   	pop    %esi
    37d2:	5f                   	pop    %edi
    37d3:	5d                   	pop    %ebp
    37d4:	c3                   	ret    
    37d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    37d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037e0 <stat>:

int
stat(const char *n, struct stat *st)
{
    37e0:	55                   	push   %ebp
    37e1:	89 e5                	mov    %esp,%ebp
    37e3:	56                   	push   %esi
    37e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    37e5:	83 ec 08             	sub    $0x8,%esp
    37e8:	6a 00                	push   $0x0
    37ea:	ff 75 08             	pushl  0x8(%ebp)
    37ed:	e8 f0 00 00 00       	call   38e2 <open>
  if(fd < 0)
    37f2:	83 c4 10             	add    $0x10,%esp
    37f5:	85 c0                	test   %eax,%eax
    37f7:	78 27                	js     3820 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    37f9:	83 ec 08             	sub    $0x8,%esp
    37fc:	ff 75 0c             	pushl  0xc(%ebp)
    37ff:	89 c3                	mov    %eax,%ebx
    3801:	50                   	push   %eax
    3802:	e8 f3 00 00 00       	call   38fa <fstat>
  close(fd);
    3807:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    380a:	89 c6                	mov    %eax,%esi
  close(fd);
    380c:	e8 b9 00 00 00       	call   38ca <close>
  return r;
    3811:	83 c4 10             	add    $0x10,%esp
}
    3814:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3817:	89 f0                	mov    %esi,%eax
    3819:	5b                   	pop    %ebx
    381a:	5e                   	pop    %esi
    381b:	5d                   	pop    %ebp
    381c:	c3                   	ret    
    381d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    3820:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3825:	eb ed                	jmp    3814 <stat+0x34>
    3827:	89 f6                	mov    %esi,%esi
    3829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003830 <atoi>:

int
atoi(const char *s)
{
    3830:	55                   	push   %ebp
    3831:	89 e5                	mov    %esp,%ebp
    3833:	53                   	push   %ebx
    3834:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3837:	0f be 11             	movsbl (%ecx),%edx
    383a:	8d 42 d0             	lea    -0x30(%edx),%eax
    383d:	3c 09                	cmp    $0x9,%al
  n = 0;
    383f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    3844:	77 1f                	ja     3865 <atoi+0x35>
    3846:	8d 76 00             	lea    0x0(%esi),%esi
    3849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3850:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3853:	83 c1 01             	add    $0x1,%ecx
    3856:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    385a:	0f be 11             	movsbl (%ecx),%edx
    385d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3860:	80 fb 09             	cmp    $0x9,%bl
    3863:	76 eb                	jbe    3850 <atoi+0x20>
  return n;
}
    3865:	5b                   	pop    %ebx
    3866:	5d                   	pop    %ebp
    3867:	c3                   	ret    
    3868:	90                   	nop
    3869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003870 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    3870:	55                   	push   %ebp
    3871:	89 e5                	mov    %esp,%ebp
    3873:	56                   	push   %esi
    3874:	53                   	push   %ebx
    3875:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3878:	8b 45 08             	mov    0x8(%ebp),%eax
    387b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    387e:	85 db                	test   %ebx,%ebx
    3880:	7e 14                	jle    3896 <memmove+0x26>
    3882:	31 d2                	xor    %edx,%edx
    3884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3888:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    388c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    388f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    3892:	39 d3                	cmp    %edx,%ebx
    3894:	75 f2                	jne    3888 <memmove+0x18>
  return vdst;
}
    3896:	5b                   	pop    %ebx
    3897:	5e                   	pop    %esi
    3898:	5d                   	pop    %ebp
    3899:	c3                   	ret    

0000389a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    389a:	b8 01 00 00 00       	mov    $0x1,%eax
    389f:	cd 40                	int    $0x40
    38a1:	c3                   	ret    

000038a2 <exit>:
SYSCALL(exit)
    38a2:	b8 02 00 00 00       	mov    $0x2,%eax
    38a7:	cd 40                	int    $0x40
    38a9:	c3                   	ret    

000038aa <wait>:
SYSCALL(wait)
    38aa:	b8 03 00 00 00       	mov    $0x3,%eax
    38af:	cd 40                	int    $0x40
    38b1:	c3                   	ret    

000038b2 <pipe>:
SYSCALL(pipe)
    38b2:	b8 04 00 00 00       	mov    $0x4,%eax
    38b7:	cd 40                	int    $0x40
    38b9:	c3                   	ret    

000038ba <read>:
SYSCALL(read)
    38ba:	b8 05 00 00 00       	mov    $0x5,%eax
    38bf:	cd 40                	int    $0x40
    38c1:	c3                   	ret    

000038c2 <write>:
SYSCALL(write)
    38c2:	b8 10 00 00 00       	mov    $0x10,%eax
    38c7:	cd 40                	int    $0x40
    38c9:	c3                   	ret    

000038ca <close>:
SYSCALL(close)
    38ca:	b8 15 00 00 00       	mov    $0x15,%eax
    38cf:	cd 40                	int    $0x40
    38d1:	c3                   	ret    

000038d2 <kill>:
SYSCALL(kill)
    38d2:	b8 06 00 00 00       	mov    $0x6,%eax
    38d7:	cd 40                	int    $0x40
    38d9:	c3                   	ret    

000038da <exec>:
SYSCALL(exec)
    38da:	b8 07 00 00 00       	mov    $0x7,%eax
    38df:	cd 40                	int    $0x40
    38e1:	c3                   	ret    

000038e2 <open>:
SYSCALL(open)
    38e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    38e7:	cd 40                	int    $0x40
    38e9:	c3                   	ret    

000038ea <mknod>:
SYSCALL(mknod)
    38ea:	b8 11 00 00 00       	mov    $0x11,%eax
    38ef:	cd 40                	int    $0x40
    38f1:	c3                   	ret    

000038f2 <unlink>:
SYSCALL(unlink)
    38f2:	b8 12 00 00 00       	mov    $0x12,%eax
    38f7:	cd 40                	int    $0x40
    38f9:	c3                   	ret    

000038fa <fstat>:
SYSCALL(fstat)
    38fa:	b8 08 00 00 00       	mov    $0x8,%eax
    38ff:	cd 40                	int    $0x40
    3901:	c3                   	ret    

00003902 <link>:
SYSCALL(link)
    3902:	b8 13 00 00 00       	mov    $0x13,%eax
    3907:	cd 40                	int    $0x40
    3909:	c3                   	ret    

0000390a <mkdir>:
SYSCALL(mkdir)
    390a:	b8 14 00 00 00       	mov    $0x14,%eax
    390f:	cd 40                	int    $0x40
    3911:	c3                   	ret    

00003912 <chdir>:
SYSCALL(chdir)
    3912:	b8 09 00 00 00       	mov    $0x9,%eax
    3917:	cd 40                	int    $0x40
    3919:	c3                   	ret    

0000391a <dup>:
SYSCALL(dup)
    391a:	b8 0a 00 00 00       	mov    $0xa,%eax
    391f:	cd 40                	int    $0x40
    3921:	c3                   	ret    

00003922 <getpid>:
SYSCALL(getpid)
    3922:	b8 0b 00 00 00       	mov    $0xb,%eax
    3927:	cd 40                	int    $0x40
    3929:	c3                   	ret    

0000392a <sbrk>:
SYSCALL(sbrk)
    392a:	b8 0c 00 00 00       	mov    $0xc,%eax
    392f:	cd 40                	int    $0x40
    3931:	c3                   	ret    

00003932 <sleep>:
SYSCALL(sleep)
    3932:	b8 0d 00 00 00       	mov    $0xd,%eax
    3937:	cd 40                	int    $0x40
    3939:	c3                   	ret    

0000393a <uptime>:
SYSCALL(uptime)
    393a:	b8 0e 00 00 00       	mov    $0xe,%eax
    393f:	cd 40                	int    $0x40
    3941:	c3                   	ret    

00003942 <getreadcount>:
SYSCALL(getreadcount)
    3942:	b8 16 00 00 00       	mov    $0x16,%eax
    3947:	cd 40                	int    $0x40
    3949:	c3                   	ret    
    394a:	66 90                	xchg   %ax,%ax
    394c:	66 90                	xchg   %ax,%ax
    394e:	66 90                	xchg   %ax,%ax

00003950 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3950:	55                   	push   %ebp
    3951:	89 e5                	mov    %esp,%ebp
    3953:	57                   	push   %edi
    3954:	56                   	push   %esi
    3955:	53                   	push   %ebx
    3956:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3959:	85 d2                	test   %edx,%edx
{
    395b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    395e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    3960:	79 76                	jns    39d8 <printint+0x88>
    3962:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    3966:	74 70                	je     39d8 <printint+0x88>
    x = -xx;
    3968:	f7 d8                	neg    %eax
    neg = 1;
    396a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3971:	31 f6                	xor    %esi,%esi
    3973:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3976:	eb 0a                	jmp    3982 <printint+0x32>
    3978:	90                   	nop
    3979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    3980:	89 fe                	mov    %edi,%esi
    3982:	31 d2                	xor    %edx,%edx
    3984:	8d 7e 01             	lea    0x1(%esi),%edi
    3987:	f7 f1                	div    %ecx
    3989:	0f b6 92 e8 54 00 00 	movzbl 0x54e8(%edx),%edx
  }while((x /= base) != 0);
    3990:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    3992:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    3995:	75 e9                	jne    3980 <printint+0x30>
  if(neg)
    3997:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    399a:	85 c0                	test   %eax,%eax
    399c:	74 08                	je     39a6 <printint+0x56>
    buf[i++] = '-';
    399e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    39a3:	8d 7e 02             	lea    0x2(%esi),%edi
    39a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    39aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    39ad:	8d 76 00             	lea    0x0(%esi),%esi
    39b0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    39b3:	83 ec 04             	sub    $0x4,%esp
    39b6:	83 ee 01             	sub    $0x1,%esi
    39b9:	6a 01                	push   $0x1
    39bb:	53                   	push   %ebx
    39bc:	57                   	push   %edi
    39bd:	88 45 d7             	mov    %al,-0x29(%ebp)
    39c0:	e8 fd fe ff ff       	call   38c2 <write>

  while(--i >= 0)
    39c5:	83 c4 10             	add    $0x10,%esp
    39c8:	39 de                	cmp    %ebx,%esi
    39ca:	75 e4                	jne    39b0 <printint+0x60>
    putc(fd, buf[i]);
}
    39cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    39cf:	5b                   	pop    %ebx
    39d0:	5e                   	pop    %esi
    39d1:	5f                   	pop    %edi
    39d2:	5d                   	pop    %ebp
    39d3:	c3                   	ret    
    39d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    39d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    39df:	eb 90                	jmp    3971 <printint+0x21>
    39e1:	eb 0d                	jmp    39f0 <printf>
    39e3:	90                   	nop
    39e4:	90                   	nop
    39e5:	90                   	nop
    39e6:	90                   	nop
    39e7:	90                   	nop
    39e8:	90                   	nop
    39e9:	90                   	nop
    39ea:	90                   	nop
    39eb:	90                   	nop
    39ec:	90                   	nop
    39ed:	90                   	nop
    39ee:	90                   	nop
    39ef:	90                   	nop

000039f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    39f0:	55                   	push   %ebp
    39f1:	89 e5                	mov    %esp,%ebp
    39f3:	57                   	push   %edi
    39f4:	56                   	push   %esi
    39f5:	53                   	push   %ebx
    39f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    39f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    39fc:	0f b6 1e             	movzbl (%esi),%ebx
    39ff:	84 db                	test   %bl,%bl
    3a01:	0f 84 b3 00 00 00    	je     3aba <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    3a07:	8d 45 10             	lea    0x10(%ebp),%eax
    3a0a:	83 c6 01             	add    $0x1,%esi
  state = 0;
    3a0d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    3a0f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3a12:	eb 2f                	jmp    3a43 <printf+0x53>
    3a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a18:	83 f8 25             	cmp    $0x25,%eax
    3a1b:	0f 84 a7 00 00 00    	je     3ac8 <printf+0xd8>
  write(fd, &c, 1);
    3a21:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3a24:	83 ec 04             	sub    $0x4,%esp
    3a27:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3a2a:	6a 01                	push   $0x1
    3a2c:	50                   	push   %eax
    3a2d:	ff 75 08             	pushl  0x8(%ebp)
    3a30:	e8 8d fe ff ff       	call   38c2 <write>
    3a35:	83 c4 10             	add    $0x10,%esp
    3a38:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    3a3b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3a3f:	84 db                	test   %bl,%bl
    3a41:	74 77                	je     3aba <printf+0xca>
    if(state == 0){
    3a43:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    3a45:	0f be cb             	movsbl %bl,%ecx
    3a48:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3a4b:	74 cb                	je     3a18 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3a4d:	83 ff 25             	cmp    $0x25,%edi
    3a50:	75 e6                	jne    3a38 <printf+0x48>
      if(c == 'd'){
    3a52:	83 f8 64             	cmp    $0x64,%eax
    3a55:	0f 84 05 01 00 00    	je     3b60 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3a5b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3a61:	83 f9 70             	cmp    $0x70,%ecx
    3a64:	74 72                	je     3ad8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a66:	83 f8 73             	cmp    $0x73,%eax
    3a69:	0f 84 99 00 00 00    	je     3b08 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a6f:	83 f8 63             	cmp    $0x63,%eax
    3a72:	0f 84 08 01 00 00    	je     3b80 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3a78:	83 f8 25             	cmp    $0x25,%eax
    3a7b:	0f 84 ef 00 00 00    	je     3b70 <printf+0x180>
  write(fd, &c, 1);
    3a81:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3a84:	83 ec 04             	sub    $0x4,%esp
    3a87:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3a8b:	6a 01                	push   $0x1
    3a8d:	50                   	push   %eax
    3a8e:	ff 75 08             	pushl  0x8(%ebp)
    3a91:	e8 2c fe ff ff       	call   38c2 <write>
    3a96:	83 c4 0c             	add    $0xc,%esp
    3a99:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3a9c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3a9f:	6a 01                	push   $0x1
    3aa1:	50                   	push   %eax
    3aa2:	ff 75 08             	pushl  0x8(%ebp)
    3aa5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3aa8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    3aaa:	e8 13 fe ff ff       	call   38c2 <write>
  for(i = 0; fmt[i]; i++){
    3aaf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    3ab3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    3ab6:	84 db                	test   %bl,%bl
    3ab8:	75 89                	jne    3a43 <printf+0x53>
    }
  }
}
    3aba:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3abd:	5b                   	pop    %ebx
    3abe:	5e                   	pop    %esi
    3abf:	5f                   	pop    %edi
    3ac0:	5d                   	pop    %ebp
    3ac1:	c3                   	ret    
    3ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    3ac8:	bf 25 00 00 00       	mov    $0x25,%edi
    3acd:	e9 66 ff ff ff       	jmp    3a38 <printf+0x48>
    3ad2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    3ad8:	83 ec 0c             	sub    $0xc,%esp
    3adb:	b9 10 00 00 00       	mov    $0x10,%ecx
    3ae0:	6a 00                	push   $0x0
    3ae2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    3ae5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ae8:	8b 17                	mov    (%edi),%edx
    3aea:	e8 61 fe ff ff       	call   3950 <printint>
        ap++;
    3aef:	89 f8                	mov    %edi,%eax
    3af1:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3af4:	31 ff                	xor    %edi,%edi
        ap++;
    3af6:	83 c0 04             	add    $0x4,%eax
    3af9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3afc:	e9 37 ff ff ff       	jmp    3a38 <printf+0x48>
    3b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    3b08:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3b0b:	8b 08                	mov    (%eax),%ecx
        ap++;
    3b0d:	83 c0 04             	add    $0x4,%eax
    3b10:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    3b13:	85 c9                	test   %ecx,%ecx
    3b15:	0f 84 8e 00 00 00    	je     3ba9 <printf+0x1b9>
        while(*s != 0){
    3b1b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    3b1e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    3b20:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    3b22:	84 c0                	test   %al,%al
    3b24:	0f 84 0e ff ff ff    	je     3a38 <printf+0x48>
    3b2a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    3b2d:	89 de                	mov    %ebx,%esi
    3b2f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3b32:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    3b35:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    3b38:	83 ec 04             	sub    $0x4,%esp
          s++;
    3b3b:	83 c6 01             	add    $0x1,%esi
    3b3e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    3b41:	6a 01                	push   $0x1
    3b43:	57                   	push   %edi
    3b44:	53                   	push   %ebx
    3b45:	e8 78 fd ff ff       	call   38c2 <write>
        while(*s != 0){
    3b4a:	0f b6 06             	movzbl (%esi),%eax
    3b4d:	83 c4 10             	add    $0x10,%esp
    3b50:	84 c0                	test   %al,%al
    3b52:	75 e4                	jne    3b38 <printf+0x148>
    3b54:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    3b57:	31 ff                	xor    %edi,%edi
    3b59:	e9 da fe ff ff       	jmp    3a38 <printf+0x48>
    3b5e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    3b60:	83 ec 0c             	sub    $0xc,%esp
    3b63:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3b68:	6a 01                	push   $0x1
    3b6a:	e9 73 ff ff ff       	jmp    3ae2 <printf+0xf2>
    3b6f:	90                   	nop
  write(fd, &c, 1);
    3b70:	83 ec 04             	sub    $0x4,%esp
    3b73:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3b76:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3b79:	6a 01                	push   $0x1
    3b7b:	e9 21 ff ff ff       	jmp    3aa1 <printf+0xb1>
        putc(fd, *ap);
    3b80:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    3b83:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    3b86:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    3b88:	6a 01                	push   $0x1
        ap++;
    3b8a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    3b8d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    3b90:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3b93:	50                   	push   %eax
    3b94:	ff 75 08             	pushl  0x8(%ebp)
    3b97:	e8 26 fd ff ff       	call   38c2 <write>
        ap++;
    3b9c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    3b9f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3ba2:	31 ff                	xor    %edi,%edi
    3ba4:	e9 8f fe ff ff       	jmp    3a38 <printf+0x48>
          s = "(null)";
    3ba9:	bb e0 54 00 00       	mov    $0x54e0,%ebx
        while(*s != 0){
    3bae:	b8 28 00 00 00       	mov    $0x28,%eax
    3bb3:	e9 72 ff ff ff       	jmp    3b2a <printf+0x13a>
    3bb8:	66 90                	xchg   %ax,%ax
    3bba:	66 90                	xchg   %ax,%ax
    3bbc:	66 90                	xchg   %ax,%ax
    3bbe:	66 90                	xchg   %ax,%ax

00003bc0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bc0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bc1:	a1 a0 5e 00 00       	mov    0x5ea0,%eax
{
    3bc6:	89 e5                	mov    %esp,%ebp
    3bc8:	57                   	push   %edi
    3bc9:	56                   	push   %esi
    3bca:	53                   	push   %ebx
    3bcb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    3bce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bd8:	39 c8                	cmp    %ecx,%eax
    3bda:	8b 10                	mov    (%eax),%edx
    3bdc:	73 32                	jae    3c10 <free+0x50>
    3bde:	39 d1                	cmp    %edx,%ecx
    3be0:	72 04                	jb     3be6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3be2:	39 d0                	cmp    %edx,%eax
    3be4:	72 32                	jb     3c18 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3be6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3be9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3bec:	39 fa                	cmp    %edi,%edx
    3bee:	74 30                	je     3c20 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3bf0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3bf3:	8b 50 04             	mov    0x4(%eax),%edx
    3bf6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3bf9:	39 f1                	cmp    %esi,%ecx
    3bfb:	74 3a                	je     3c37 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3bfd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3bff:	a3 a0 5e 00 00       	mov    %eax,0x5ea0
}
    3c04:	5b                   	pop    %ebx
    3c05:	5e                   	pop    %esi
    3c06:	5f                   	pop    %edi
    3c07:	5d                   	pop    %ebp
    3c08:	c3                   	ret    
    3c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c10:	39 d0                	cmp    %edx,%eax
    3c12:	72 04                	jb     3c18 <free+0x58>
    3c14:	39 d1                	cmp    %edx,%ecx
    3c16:	72 ce                	jb     3be6 <free+0x26>
{
    3c18:	89 d0                	mov    %edx,%eax
    3c1a:	eb bc                	jmp    3bd8 <free+0x18>
    3c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    3c20:	03 72 04             	add    0x4(%edx),%esi
    3c23:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3c26:	8b 10                	mov    (%eax),%edx
    3c28:	8b 12                	mov    (%edx),%edx
    3c2a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c2d:	8b 50 04             	mov    0x4(%eax),%edx
    3c30:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c33:	39 f1                	cmp    %esi,%ecx
    3c35:	75 c6                	jne    3bfd <free+0x3d>
    p->s.size += bp->s.size;
    3c37:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    3c3a:	a3 a0 5e 00 00       	mov    %eax,0x5ea0
    p->s.size += bp->s.size;
    3c3f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c42:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3c45:	89 10                	mov    %edx,(%eax)
}
    3c47:	5b                   	pop    %ebx
    3c48:	5e                   	pop    %esi
    3c49:	5f                   	pop    %edi
    3c4a:	5d                   	pop    %ebp
    3c4b:	c3                   	ret    
    3c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003c50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3c50:	55                   	push   %ebp
    3c51:	89 e5                	mov    %esp,%ebp
    3c53:	57                   	push   %edi
    3c54:	56                   	push   %esi
    3c55:	53                   	push   %ebx
    3c56:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c59:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3c5c:	8b 15 a0 5e 00 00    	mov    0x5ea0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c62:	8d 78 07             	lea    0x7(%eax),%edi
    3c65:	c1 ef 03             	shr    $0x3,%edi
    3c68:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3c6b:	85 d2                	test   %edx,%edx
    3c6d:	0f 84 9d 00 00 00    	je     3d10 <malloc+0xc0>
    3c73:	8b 02                	mov    (%edx),%eax
    3c75:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3c78:	39 cf                	cmp    %ecx,%edi
    3c7a:	76 6c                	jbe    3ce8 <malloc+0x98>
    3c7c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3c82:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3c87:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    3c8a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3c91:	eb 0e                	jmp    3ca1 <malloc+0x51>
    3c93:	90                   	nop
    3c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c98:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3c9a:	8b 48 04             	mov    0x4(%eax),%ecx
    3c9d:	39 f9                	cmp    %edi,%ecx
    3c9f:	73 47                	jae    3ce8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3ca1:	39 05 a0 5e 00 00    	cmp    %eax,0x5ea0
    3ca7:	89 c2                	mov    %eax,%edx
    3ca9:	75 ed                	jne    3c98 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    3cab:	83 ec 0c             	sub    $0xc,%esp
    3cae:	56                   	push   %esi
    3caf:	e8 76 fc ff ff       	call   392a <sbrk>
  if(p == (char*)-1)
    3cb4:	83 c4 10             	add    $0x10,%esp
    3cb7:	83 f8 ff             	cmp    $0xffffffff,%eax
    3cba:	74 1c                	je     3cd8 <malloc+0x88>
  hp->s.size = nu;
    3cbc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3cbf:	83 ec 0c             	sub    $0xc,%esp
    3cc2:	83 c0 08             	add    $0x8,%eax
    3cc5:	50                   	push   %eax
    3cc6:	e8 f5 fe ff ff       	call   3bc0 <free>
  return freep;
    3ccb:	8b 15 a0 5e 00 00    	mov    0x5ea0,%edx
      if((p = morecore(nunits)) == 0)
    3cd1:	83 c4 10             	add    $0x10,%esp
    3cd4:	85 d2                	test   %edx,%edx
    3cd6:	75 c0                	jne    3c98 <malloc+0x48>
        return 0;
  }
}
    3cd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    3cdb:	31 c0                	xor    %eax,%eax
}
    3cdd:	5b                   	pop    %ebx
    3cde:	5e                   	pop    %esi
    3cdf:	5f                   	pop    %edi
    3ce0:	5d                   	pop    %ebp
    3ce1:	c3                   	ret    
    3ce2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    3ce8:	39 cf                	cmp    %ecx,%edi
    3cea:	74 54                	je     3d40 <malloc+0xf0>
        p->s.size -= nunits;
    3cec:	29 f9                	sub    %edi,%ecx
    3cee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3cf1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3cf4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    3cf7:	89 15 a0 5e 00 00    	mov    %edx,0x5ea0
}
    3cfd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    3d00:	83 c0 08             	add    $0x8,%eax
}
    3d03:	5b                   	pop    %ebx
    3d04:	5e                   	pop    %esi
    3d05:	5f                   	pop    %edi
    3d06:	5d                   	pop    %ebp
    3d07:	c3                   	ret    
    3d08:	90                   	nop
    3d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    3d10:	c7 05 a0 5e 00 00 a4 	movl   $0x5ea4,0x5ea0
    3d17:	5e 00 00 
    3d1a:	c7 05 a4 5e 00 00 a4 	movl   $0x5ea4,0x5ea4
    3d21:	5e 00 00 
    base.s.size = 0;
    3d24:	b8 a4 5e 00 00       	mov    $0x5ea4,%eax
    3d29:	c7 05 a8 5e 00 00 00 	movl   $0x0,0x5ea8
    3d30:	00 00 00 
    3d33:	e9 44 ff ff ff       	jmp    3c7c <malloc+0x2c>
    3d38:	90                   	nop
    3d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    3d40:	8b 08                	mov    (%eax),%ecx
    3d42:	89 0a                	mov    %ecx,(%edx)
    3d44:	eb b1                	jmp    3cf7 <malloc+0xa7>
