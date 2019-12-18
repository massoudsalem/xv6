
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
      11:	68 76 4d 00 00       	push   $0x4d76
      16:	6a 01                	push   $0x1
      18:	e8 f3 39 00 00       	call   3a10 <printf>
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 8a 4d 00 00       	push   $0x4d8a
      26:	e8 b7 38 00 00       	call   38e2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 13                	js     45 <main+0x45>
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 f4 54 00 00       	push   $0x54f4
      39:	6a 01                	push   $0x1
      3b:	e8 d0 39 00 00       	call   3a10 <printf>
      40:	e8 5d 38 00 00       	call   38a2 <exit>
      45:	50                   	push   %eax
      46:	50                   	push   %eax
      47:	68 00 02 00 00       	push   $0x200
      4c:	68 8a 4d 00 00       	push   $0x4d8a
      51:	e8 8c 38 00 00       	call   38e2 <open>
      56:	89 04 24             	mov    %eax,(%esp)
      59:	e8 6c 38 00 00       	call   38ca <close>
      5e:	e8 5d 35 00 00       	call   35c0 <argptest>
      63:	e8 a8 11 00 00       	call   1210 <createdelete>
      68:	e8 63 1a 00 00       	call   1ad0 <linkunlink>
      6d:	e8 5e 17 00 00       	call   17d0 <concreate>
      72:	e8 99 0f 00 00       	call   1010 <fourfiles>
      77:	e8 d4 0d 00 00       	call   e50 <sharedfd>
      7c:	e8 ff 31 00 00       	call   3280 <bigargtest>
      81:	e8 6a 23 00 00       	call   23f0 <bigwrite>
      86:	e8 f5 31 00 00       	call   3280 <bigargtest>
      8b:	e8 70 31 00 00       	call   3200 <bsstest>
      90:	e8 9b 2c 00 00       	call   2d30 <sbrktest>
      95:	e8 b6 30 00 00       	call   3150 <validatetest>
      9a:	e8 51 03 00 00       	call   3f0 <opentest>
      9f:	e8 dc 03 00 00       	call   480 <writetest>
      a4:	e8 b7 05 00 00       	call   660 <writetest1>
      a9:	e8 82 07 00 00       	call   830 <createtest>
      ae:	e8 3d 02 00 00       	call   2f0 <openiputtest>
      b3:	e8 48 01 00 00       	call   200 <exitiputtest>
      b8:	e8 63 00 00 00       	call   120 <iputtest>
      bd:	e8 be 0c 00 00       	call   d80 <mem>
      c2:	e8 49 09 00 00       	call   a10 <pipe1>
      c7:	e8 e4 0a 00 00       	call   bb0 <preempt>
      cc:	e8 1f 0c 00 00       	call   cf0 <exitwait>
      d1:	e8 0a 27 00 00       	call   27e0 <rmdot>
      d6:	e8 c5 25 00 00       	call   26a0 <fourteen>
      db:	e8 f0 23 00 00       	call   24d0 <bigfile>
      e0:	e8 2b 1c 00 00       	call   1d10 <subdir>
      e5:	e8 d6 14 00 00       	call   15c0 <linktest>
      ea:	e8 41 13 00 00       	call   1430 <unlinkread>
      ef:	e8 6c 28 00 00       	call   2960 <dirfile>
      f4:	e8 67 2a 00 00       	call   2b60 <iref>
      f9:	e8 82 2b 00 00       	call   2c80 <forktest>
      fe:	e8 dd 1a 00 00       	call   1be0 <bigdir>
     103:	e8 48 34 00 00       	call   3550 <uio>
     108:	e8 b3 08 00 00       	call   9c0 <exectest>
     10d:	e8 90 37 00 00       	call   38a2 <exit>
     112:	66 90                	xchg   %ax,%ax
     114:	66 90                	xchg   %ax,%ax
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <iputtest>:
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
     126:	68 1c 3e 00 00       	push   $0x3e1c
     12b:	ff 35 38 5e 00 00    	pushl  0x5e38
     131:	e8 da 38 00 00       	call   3a10 <printf>
     136:	c7 04 24 af 3d 00 00 	movl   $0x3daf,(%esp)
     13d:	e8 c8 37 00 00       	call   390a <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 af 3d 00 00       	push   $0x3daf
     151:	e8 bc 37 00 00       	call   3912 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 ac 3d 00 00       	push   $0x3dac
     169:	e8 84 37 00 00       	call   38f2 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 d1 3d 00 00       	push   $0x3dd1
     17d:	e8 90 37 00 00       	call   3912 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 54 3e 00 00       	push   $0x3e54
     191:	ff 35 38 5e 00 00    	pushl  0x5e38
     197:	e8 74 38 00 00       	call   3a10 <printf>
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 88 3d 00 00       	push   $0x3d88
     1a8:	ff 35 38 5e 00 00    	pushl  0x5e38
     1ae:	e8 5d 38 00 00       	call   3a10 <printf>
     1b3:	e8 ea 36 00 00       	call   38a2 <exit>
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 d3 3d 00 00       	push   $0x3dd3
     1bf:	ff 35 38 5e 00 00    	pushl  0x5e38
     1c5:	e8 46 38 00 00       	call   3a10 <printf>
     1ca:	e8 d3 36 00 00       	call   38a2 <exit>
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 b7 3d 00 00       	push   $0x3db7
     1d6:	ff 35 38 5e 00 00    	pushl  0x5e38
     1dc:	e8 2f 38 00 00       	call   3a10 <printf>
     1e1:	e8 bc 36 00 00       	call   38a2 <exit>
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 96 3d 00 00       	push   $0x3d96
     1ed:	ff 35 38 5e 00 00    	pushl  0x5e38
     1f3:	e8 18 38 00 00       	call   3a10 <printf>
     1f8:	e8 a5 36 00 00       	call   38a2 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
     206:	68 e3 3d 00 00       	push   $0x3de3
     20b:	ff 35 38 5e 00 00    	pushl  0x5e38
     211:	e8 fa 37 00 00       	call   3a10 <printf>
     216:	e8 7f 36 00 00       	call   389a <fork>
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
     226:	75 48                	jne    270 <exitiputtest+0x70>
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 af 3d 00 00       	push   $0x3daf
     230:	e8 d5 36 00 00       	call   390a <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 af 3d 00 00       	push   $0x3daf
     248:	e8 c5 36 00 00       	call   3912 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 ac 3d 00 00       	push   $0x3dac
     25c:	e8 91 36 00 00       	call   38f2 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
     268:	e8 35 36 00 00       	call   38a2 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
     270:	e8 35 36 00 00       	call   38aa <wait>
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 06 3e 00 00       	push   $0x3e06
     27d:	ff 35 38 5e 00 00    	pushl  0x5e38
     283:	e8 88 37 00 00       	call   3a10 <printf>
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 b7 3d 00 00       	push   $0x3db7
     298:	ff 35 38 5e 00 00    	pushl  0x5e38
     29e:	e8 6d 37 00 00       	call   3a10 <printf>
     2a3:	e8 fa 35 00 00       	call   38a2 <exit>
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 c9 4c 00 00       	push   $0x4cc9
     2af:	ff 35 38 5e 00 00    	pushl  0x5e38
     2b5:	e8 56 37 00 00       	call   3a10 <printf>
     2ba:	e8 e3 35 00 00       	call   38a2 <exit>
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 f2 3d 00 00       	push   $0x3df2
     2c6:	ff 35 38 5e 00 00    	pushl  0x5e38
     2cc:	e8 3f 37 00 00       	call   3a10 <printf>
     2d1:	e8 cc 35 00 00       	call   38a2 <exit>
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 88 3d 00 00       	push   $0x3d88
     2dd:	ff 35 38 5e 00 00    	pushl  0x5e38
     2e3:	e8 28 37 00 00       	call   3a10 <printf>
     2e8:	e8 b5 35 00 00       	call   38a2 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
     2f6:	68 18 3e 00 00       	push   $0x3e18
     2fb:	ff 35 38 5e 00 00    	pushl  0x5e38
     301:	e8 0a 37 00 00       	call   3a10 <printf>
     306:	c7 04 24 27 3e 00 00 	movl   $0x3e27,(%esp)
     30d:	e8 f8 35 00 00       	call   390a <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
     31d:	e8 78 35 00 00       	call   389a <fork>
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
     32a:	75 34                	jne    360 <openiputtest+0x70>
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 27 3e 00 00       	push   $0x3e27
     336:	e8 a7 35 00 00       	call   38e2 <open>
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 ac 4d 00 00       	push   $0x4dac
     34a:	ff 35 38 5e 00 00    	pushl  0x5e38
     350:	e8 bb 36 00 00       	call   3a10 <printf>
     355:	e8 48 35 00 00       	call   38a2 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 c8 35 00 00       	call   3932 <sleep>
     36a:	c7 04 24 27 3e 00 00 	movl   $0x3e27,(%esp)
     371:	e8 7c 35 00 00       	call   38f2 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
     37d:	e8 28 35 00 00       	call   38aa <wait>
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 50 3e 00 00       	push   $0x3e50
     38a:	ff 35 38 5e 00 00    	pushl  0x5e38
     390:	e8 7b 36 00 00       	call   3a10 <printf>
     395:	83 c4 10             	add    $0x10,%esp
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     3a0:	e8 fd 34 00 00       	call   38a2 <exit>
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 2d 3e 00 00       	push   $0x3e2d
     3ac:	ff 35 38 5e 00 00    	pushl  0x5e38
     3b2:	e8 59 36 00 00       	call   3a10 <printf>
     3b7:	e8 e6 34 00 00       	call   38a2 <exit>
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 c9 4c 00 00       	push   $0x4cc9
     3c3:	ff 35 38 5e 00 00    	pushl  0x5e38
     3c9:	e8 42 36 00 00       	call   3a10 <printf>
     3ce:	e8 cf 34 00 00       	call   38a2 <exit>
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 41 3e 00 00       	push   $0x3e41
     3da:	ff 35 38 5e 00 00    	pushl  0x5e38
     3e0:	e8 2b 36 00 00       	call   3a10 <printf>
     3e5:	e8 b8 34 00 00       	call   38a2 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
     3f6:	68 62 3e 00 00       	push   $0x3e62
     3fb:	ff 35 38 5e 00 00    	pushl  0x5e38
     401:	e8 0a 36 00 00       	call   3a10 <printf>
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 6d 3e 00 00       	push   $0x3e6d
     40f:	e8 ce 34 00 00       	call   38e2 <open>
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 a6 34 00 00       	call   38ca <close>
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 85 3e 00 00       	push   $0x3e85
     42d:	e8 b0 34 00 00       	call   38e2 <open>
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 b0 3e 00 00       	push   $0x3eb0
     441:	ff 35 38 5e 00 00    	pushl  0x5e38
     447:	e8 c4 35 00 00       	call   3a10 <printf>
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 72 3e 00 00       	push   $0x3e72
     458:	ff 35 38 5e 00 00    	pushl  0x5e38
     45e:	e8 ad 35 00 00       	call   3a10 <printf>
     463:	e8 3a 34 00 00       	call   38a2 <exit>
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 92 3e 00 00       	push   $0x3e92
     46f:	ff 35 38 5e 00 00    	pushl  0x5e38
     475:	e8 96 35 00 00       	call   3a10 <printf>
     47a:	e8 23 34 00 00       	call   38a2 <exit>
     47f:	90                   	nop

00000480 <writetest>:
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 be 3e 00 00       	push   $0x3ebe
     48d:	ff 35 38 5e 00 00    	pushl  0x5e38
     493:	e8 78 35 00 00       	call   3a10 <printf>
     498:	58                   	pop    %eax
     499:	5a                   	pop    %edx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 cf 3e 00 00       	push   $0x3ecf
     4a4:	e8 39 34 00 00       	call   38e2 <open>
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 88 01 00 00    	js     63c <writetest+0x1bc>
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
     4b9:	31 db                	xor    %ebx,%ebx
     4bb:	68 d5 3e 00 00       	push   $0x3ed5
     4c0:	ff 35 38 5e 00 00    	pushl  0x5e38
     4c6:	e8 45 35 00 00       	call   3a10 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 0c 3f 00 00       	push   $0x3f0c
     4da:	56                   	push   %esi
     4db:	e8 e2 33 00 00       	call   38c2 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 17 3f 00 00       	push   $0x3f17
     4f6:	56                   	push   %esi
     4f7:	e8 c6 33 00 00       	call   38c2 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 22 3f 00 00       	push   $0x3f22
     518:	ff 35 38 5e 00 00    	pushl  0x5e38
     51e:	e8 ed 34 00 00       	call   3a10 <printf>
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 9f 33 00 00       	call   38ca <close>
     52b:	5b                   	pop    %ebx
     52c:	5e                   	pop    %esi
     52d:	6a 00                	push   $0x0
     52f:	68 cf 3e 00 00       	push   $0x3ecf
     534:	e8 a9 33 00 00       	call   38e2 <open>
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	89 c3                	mov    %eax,%ebx
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 2d 3f 00 00       	push   $0x3f2d
     54e:	ff 35 38 5e 00 00    	pushl  0x5e38
     554:	e8 b7 34 00 00       	call   3a10 <printf>
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 20 86 00 00       	push   $0x8620
     566:	53                   	push   %ebx
     567:	e8 4e 33 00 00       	call   38ba <read>
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 94 00 00 00    	jne    60e <writetest+0x18e>
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 61 3f 00 00       	push   $0x3f61
     582:	ff 35 38 5e 00 00    	pushl  0x5e38
     588:	e8 83 34 00 00       	call   3a10 <printf>
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 35 33 00 00       	call   38ca <close>
     595:	c7 04 24 cf 3e 00 00 	movl   $0x3ecf,(%esp)
     59c:	e8 51 33 00 00       	call   38f2 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7d                	js     625 <writetest+0x1a5>
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 89 3f 00 00       	push   $0x3f89
     5b0:	ff 35 38 5e 00 00    	pushl  0x5e38
     5b6:	e8 55 34 00 00       	call   3a10 <printf>
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 d0 4d 00 00       	push   $0x4dd0
     5ce:	ff 35 38 5e 00 00    	pushl  0x5e38
     5d4:	e8 37 34 00 00       	call   3a10 <printf>
     5d9:	e8 c4 32 00 00       	call   38a2 <exit>
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 f4 4d 00 00       	push   $0x4df4
     5e7:	ff 35 38 5e 00 00    	pushl  0x5e38
     5ed:	e8 1e 34 00 00       	call   3a10 <printf>
     5f2:	e8 ab 32 00 00       	call   38a2 <exit>
     5f7:	51                   	push   %ecx
     5f8:	51                   	push   %ecx
     5f9:	68 46 3f 00 00       	push   $0x3f46
     5fe:	ff 35 38 5e 00 00    	pushl  0x5e38
     604:	e8 07 34 00 00       	call   3a10 <printf>
     609:	e8 94 32 00 00       	call   38a2 <exit>
     60e:	52                   	push   %edx
     60f:	52                   	push   %edx
     610:	68 8d 42 00 00       	push   $0x428d
     615:	ff 35 38 5e 00 00    	pushl  0x5e38
     61b:	e8 f0 33 00 00       	call   3a10 <printf>
     620:	e8 7d 32 00 00       	call   38a2 <exit>
     625:	50                   	push   %eax
     626:	50                   	push   %eax
     627:	68 74 3f 00 00       	push   $0x3f74
     62c:	ff 35 38 5e 00 00    	pushl  0x5e38
     632:	e8 d9 33 00 00       	call   3a10 <printf>
     637:	e8 66 32 00 00       	call   38a2 <exit>
     63c:	50                   	push   %eax
     63d:	50                   	push   %eax
     63e:	68 f0 3e 00 00       	push   $0x3ef0
     643:	ff 35 38 5e 00 00    	pushl  0x5e38
     649:	e8 c2 33 00 00       	call   3a10 <printf>
     64e:	e8 4f 32 00 00       	call   38a2 <exit>
     653:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 9d 3f 00 00       	push   $0x3f9d
     66d:	ff 35 38 5e 00 00    	pushl  0x5e38
     673:	e8 98 33 00 00       	call   3a10 <printf>
     678:	58                   	pop    %eax
     679:	5a                   	pop    %edx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 17 40 00 00       	push   $0x4017
     684:	e8 59 32 00 00       	call   38e2 <open>
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 61 01 00 00    	js     7f5 <writetest1+0x195>
     694:	89 c6                	mov    %eax,%esi
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6a0:	83 ec 04             	sub    $0x4,%esp
     6a3:	89 1d 20 86 00 00    	mov    %ebx,0x8620
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 20 86 00 00       	push   $0x8620
     6b3:	56                   	push   %esi
     6b4:	e8 09 32 00 00       	call   38c2 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 ef 31 00 00       	call   38ca <close>
     6db:	5b                   	pop    %ebx
     6dc:	5e                   	pop    %esi
     6dd:	6a 00                	push   $0x0
     6df:	68 17 40 00 00       	push   $0x4017
     6e4:	e8 f9 31 00 00       	call   38e2 <open>
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
     6ee:	89 c6                	mov    %eax,%esi
     6f0:	0f 88 e8 00 00 00    	js     7de <writetest1+0x17e>
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
     70b:	a1 20 86 00 00       	mov    0x8620,%eax
     710:	39 d8                	cmp    %ebx,%eax
     712:	75 7f                	jne    793 <writetest1+0x133>
     714:	83 c3 01             	add    $0x1,%ebx
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 20 86 00 00       	push   $0x8620
     724:	56                   	push   %esi
     725:	e8 90 31 00 00       	call   38ba <read>
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 84 31 00 00       	call   38ca <close>
     746:	c7 04 24 17 40 00 00 	movl   $0x4017,(%esp)
     74d:	e8 a0 31 00 00       	call   38f2 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 af 00 00 00    	js     80c <writetest1+0x1ac>
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 3e 40 00 00       	push   $0x403e
     765:	ff 35 38 5e 00 00    	pushl  0x5e38
     76b:	e8 a0 32 00 00       	call   3a10 <printf>
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 c7 3f 00 00       	push   $0x3fc7
     783:	ff 35 38 5e 00 00    	pushl  0x5e38
     789:	e8 82 32 00 00       	call   3a10 <printf>
     78e:	e8 0f 31 00 00       	call   38a2 <exit>
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 18 4e 00 00       	push   $0x4e18
     79a:	ff 35 38 5e 00 00    	pushl  0x5e38
     7a0:	e8 6b 32 00 00       	call   3a10 <printf>
     7a5:	e8 f8 30 00 00       	call   38a2 <exit>
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 1b 40 00 00       	push   $0x401b
     7b3:	ff 35 38 5e 00 00    	pushl  0x5e38
     7b9:	e8 52 32 00 00       	call   3a10 <printf>
     7be:	e8 df 30 00 00       	call   38a2 <exit>
     7c3:	52                   	push   %edx
     7c4:	68 8b 00 00 00       	push   $0x8b
     7c9:	68 fe 3f 00 00       	push   $0x3ffe
     7ce:	ff 35 38 5e 00 00    	pushl  0x5e38
     7d4:	e8 37 32 00 00       	call   3a10 <printf>
     7d9:	e8 c4 30 00 00       	call   38a2 <exit>
     7de:	51                   	push   %ecx
     7df:	51                   	push   %ecx
     7e0:	68 e5 3f 00 00       	push   $0x3fe5
     7e5:	ff 35 38 5e 00 00    	pushl  0x5e38
     7eb:	e8 20 32 00 00       	call   3a10 <printf>
     7f0:	e8 ad 30 00 00       	call   38a2 <exit>
     7f5:	50                   	push   %eax
     7f6:	50                   	push   %eax
     7f7:	68 ad 3f 00 00       	push   $0x3fad
     7fc:	ff 35 38 5e 00 00    	pushl  0x5e38
     802:	e8 09 32 00 00       	call   3a10 <printf>
     807:	e8 96 30 00 00       	call   38a2 <exit>
     80c:	50                   	push   %eax
     80d:	50                   	push   %eax
     80e:	68 2b 40 00 00       	push   $0x402b
     813:	ff 35 38 5e 00 00    	pushl  0x5e38
     819:	e8 f2 31 00 00       	call   3a10 <printf>
     81e:	e8 7f 30 00 00       	call   38a2 <exit>
     823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000830 <createtest>:
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
     839:	83 ec 0c             	sub    $0xc,%esp
     83c:	68 38 4e 00 00       	push   $0x4e38
     841:	ff 35 38 5e 00 00    	pushl  0x5e38
     847:	e8 c4 31 00 00       	call   3a10 <printf>
     84c:	c6 05 20 a6 00 00 61 	movb   $0x61,0xa620
     853:	c6 05 22 a6 00 00 00 	movb   $0x0,0xa622
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
     860:	83 ec 08             	sub    $0x8,%esp
     863:	88 1d 21 a6 00 00    	mov    %bl,0xa621
     869:	83 c3 01             	add    $0x1,%ebx
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 20 a6 00 00       	push   $0xa620
     876:	e8 67 30 00 00       	call   38e2 <open>
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 47 30 00 00       	call   38ca <close>
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
     88b:	c6 05 20 a6 00 00 61 	movb   $0x61,0xa620
     892:	c6 05 22 a6 00 00 00 	movb   $0x0,0xa622
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
     8a0:	83 ec 0c             	sub    $0xc,%esp
     8a3:	88 1d 21 a6 00 00    	mov    %bl,0xa621
     8a9:	83 c3 01             	add    $0x1,%ebx
     8ac:	68 20 a6 00 00       	push   $0xa620
     8b1:	e8 3c 30 00 00       	call   38f2 <unlink>
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 60 4e 00 00       	push   $0x4e60
     8c6:	ff 35 38 5e 00 00    	pushl  0x5e38
     8cc:	e8 3f 31 00 00       	call   3a10 <printf>
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
     8e6:	68 4c 40 00 00       	push   $0x404c
     8eb:	ff 35 38 5e 00 00    	pushl  0x5e38
     8f1:	e8 1a 31 00 00       	call   3a10 <printf>
     8f6:	c7 04 24 58 40 00 00 	movl   $0x4058,(%esp)
     8fd:	e8 08 30 00 00       	call   390a <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 58 40 00 00       	push   $0x4058
     911:	e8 fc 2f 00 00       	call   3912 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 fd 45 00 00       	push   $0x45fd
     929:	e8 e4 2f 00 00       	call   3912 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 58 40 00 00       	push   $0x4058
     93d:	e8 b0 2f 00 00       	call   38f2 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 95 40 00 00       	push   $0x4095
     951:	ff 35 38 5e 00 00    	pushl  0x5e38
     957:	e8 b4 30 00 00       	call   3a10 <printf>
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 88 3d 00 00       	push   $0x3d88
     968:	ff 35 38 5e 00 00    	pushl  0x5e38
     96e:	e8 9d 30 00 00       	call   3a10 <printf>
     973:	e8 2a 2f 00 00       	call   38a2 <exit>
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 81 40 00 00       	push   $0x4081
     97f:	ff 35 38 5e 00 00    	pushl  0x5e38
     985:	e8 86 30 00 00       	call   3a10 <printf>
     98a:	e8 13 2f 00 00       	call   38a2 <exit>
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 70 40 00 00       	push   $0x4070
     996:	ff 35 38 5e 00 00    	pushl  0x5e38
     99c:	e8 6f 30 00 00       	call   3a10 <printf>
     9a1:	e8 fc 2e 00 00       	call   38a2 <exit>
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 5d 40 00 00       	push   $0x405d
     9ad:	ff 35 38 5e 00 00    	pushl  0x5e38
     9b3:	e8 58 30 00 00       	call   3a10 <printf>
     9b8:	e8 e5 2e 00 00       	call   38a2 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
     9c6:	68 a4 40 00 00       	push   $0x40a4
     9cb:	ff 35 38 5e 00 00    	pushl  0x5e38
     9d1:	e8 3a 30 00 00       	call   3a10 <printf>
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 3c 5e 00 00       	push   $0x5e3c
     9dd:	68 6d 3e 00 00       	push   $0x3e6d
     9e2:	e8 f3 2e 00 00       	call   38da <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 af 40 00 00       	push   $0x40af
     9f7:	ff 35 38 5e 00 00    	pushl  0x5e38
     9fd:	e8 0e 30 00 00       	call   3a10 <printf>
     a02:	e8 9b 2e 00 00       	call   38a2 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a19:	83 ec 38             	sub    $0x38,%esp
     a1c:	50                   	push   %eax
     a1d:	e8 90 2e 00 00       	call   38b2 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 3e 01 00 00    	jne    b6b <pipe1+0x15b>
     a2d:	89 c3                	mov    %eax,%ebx
     a2f:	e8 66 2e 00 00       	call   389a <fork>
     a34:	83 f8 00             	cmp    $0x0,%eax
     a37:	0f 84 84 00 00 00    	je     ac1 <pipe1+0xb1>
     a3d:	0f 8e 3b 01 00 00    	jle    b7e <pipe1+0x16e>
     a43:	83 ec 0c             	sub    $0xc,%esp
     a46:	ff 75 e4             	pushl  -0x1c(%ebp)
     a49:	bf 01 00 00 00       	mov    $0x1,%edi
     a4e:	e8 77 2e 00 00       	call   38ca <close>
     a53:	83 c4 10             	add    $0x10,%esp
     a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     a5d:	83 ec 04             	sub    $0x4,%esp
     a60:	57                   	push   %edi
     a61:	68 20 86 00 00       	push   $0x8620
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 4c 2e 00 00       	call   38ba <read>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	0f 8e ab 00 00 00    	jle    b24 <pipe1+0x114>
     a79:	89 d9                	mov    %ebx,%ecx
     a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a7e:	f7 d9                	neg    %ecx
     a80:	38 9c 0b 20 86 00 00 	cmp    %bl,0x8620(%ebx,%ecx,1)
     a87:	8d 53 01             	lea    0x1(%ebx),%edx
     a8a:	75 1b                	jne    aa7 <pipe1+0x97>
     a8c:	39 f2                	cmp    %esi,%edx
     a8e:	89 d3                	mov    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
     a92:	01 ff                	add    %edi,%edi
     a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a97:	b8 00 20 00 00       	mov    $0x2000,%eax
     a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     aa2:	0f 4f f8             	cmovg  %eax,%edi
     aa5:	eb b6                	jmp    a5d <pipe1+0x4d>
     aa7:	83 ec 08             	sub    $0x8,%esp
     aaa:	68 de 40 00 00       	push   $0x40de
     aaf:	6a 01                	push   $0x1
     ab1:	e8 5a 2f 00 00       	call   3a10 <printf>
     ab6:	83 c4 10             	add    $0x10,%esp
     ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     abc:	5b                   	pop    %ebx
     abd:	5e                   	pop    %esi
     abe:	5f                   	pop    %edi
     abf:	5d                   	pop    %ebp
     ac0:	c3                   	ret    
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
     ae0:	88 84 03 20 86 00 00 	mov    %al,0x8620(%ebx,%eax,1)
     ae7:	83 c0 01             	add    $0x1,%eax
     aea:	39 d0                	cmp    %edx,%eax
     aec:	75 f2                	jne    ae0 <pipe1+0xd0>
     aee:	83 ec 04             	sub    $0x4,%esp
     af1:	68 09 04 00 00       	push   $0x409
     af6:	68 20 86 00 00       	push   $0x8620
     afb:	ff 75 e4             	pushl  -0x1c(%ebp)
     afe:	e8 bf 2d 00 00       	call   38c2 <write>
     b03:	83 c4 10             	add    $0x10,%esp
     b06:	3d 09 04 00 00       	cmp    $0x409,%eax
     b0b:	0f 85 80 00 00 00    	jne    b91 <pipe1+0x181>
     b11:	81 eb 09 04 00 00    	sub    $0x409,%ebx
     b17:	81 fb d3 eb ff ff    	cmp    $0xffffebd3,%ebx
     b1d:	75 b7                	jne    ad6 <pipe1+0xc6>
     b1f:	e8 7e 2d 00 00       	call   38a2 <exit>
     b24:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b2b:	75 29                	jne    b56 <pipe1+0x146>
     b2d:	83 ec 0c             	sub    $0xc,%esp
     b30:	ff 75 e0             	pushl  -0x20(%ebp)
     b33:	e8 92 2d 00 00       	call   38ca <close>
     b38:	e8 6d 2d 00 00       	call   38aa <wait>
     b3d:	5a                   	pop    %edx
     b3e:	59                   	pop    %ecx
     b3f:	68 03 41 00 00       	push   $0x4103
     b44:	6a 01                	push   $0x1
     b46:	e8 c5 2e 00 00       	call   3a10 <printf>
     b4b:	83 c4 10             	add    $0x10,%esp
     b4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b51:	5b                   	pop    %ebx
     b52:	5e                   	pop    %esi
     b53:	5f                   	pop    %edi
     b54:	5d                   	pop    %ebp
     b55:	c3                   	ret    
     b56:	53                   	push   %ebx
     b57:	ff 75 d4             	pushl  -0x2c(%ebp)
     b5a:	68 ec 40 00 00       	push   $0x40ec
     b5f:	6a 01                	push   $0x1
     b61:	e8 aa 2e 00 00       	call   3a10 <printf>
     b66:	e8 37 2d 00 00       	call   38a2 <exit>
     b6b:	57                   	push   %edi
     b6c:	57                   	push   %edi
     b6d:	68 c1 40 00 00       	push   $0x40c1
     b72:	6a 01                	push   $0x1
     b74:	e8 97 2e 00 00       	call   3a10 <printf>
     b79:	e8 24 2d 00 00       	call   38a2 <exit>
     b7e:	50                   	push   %eax
     b7f:	50                   	push   %eax
     b80:	68 0d 41 00 00       	push   $0x410d
     b85:	6a 01                	push   $0x1
     b87:	e8 84 2e 00 00       	call   3a10 <printf>
     b8c:	e8 11 2d 00 00       	call   38a2 <exit>
     b91:	56                   	push   %esi
     b92:	56                   	push   %esi
     b93:	68 d0 40 00 00       	push   $0x40d0
     b98:	6a 01                	push   $0x1
     b9a:	e8 71 2e 00 00       	call   3a10 <printf>
     b9f:	e8 fe 2c 00 00       	call   38a2 <exit>
     ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bb0 <preempt>:
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
     bb5:	53                   	push   %ebx
     bb6:	83 ec 24             	sub    $0x24,%esp
     bb9:	68 1c 41 00 00       	push   $0x411c
     bbe:	6a 01                	push   $0x1
     bc0:	e8 4b 2e 00 00       	call   3a10 <printf>
     bc5:	e8 d0 2c 00 00       	call   389a <fork>
     bca:	83 c4 10             	add    $0x10,%esp
     bcd:	85 c0                	test   %eax,%eax
     bcf:	75 02                	jne    bd3 <preempt+0x23>
     bd1:	eb fe                	jmp    bd1 <preempt+0x21>
     bd3:	89 c7                	mov    %eax,%edi
     bd5:	e8 c0 2c 00 00       	call   389a <fork>
     bda:	85 c0                	test   %eax,%eax
     bdc:	89 c6                	mov    %eax,%esi
     bde:	75 02                	jne    be2 <preempt+0x32>
     be0:	eb fe                	jmp    be0 <preempt+0x30>
     be2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     be5:	83 ec 0c             	sub    $0xc,%esp
     be8:	50                   	push   %eax
     be9:	e8 c4 2c 00 00       	call   38b2 <pipe>
     bee:	e8 a7 2c 00 00       	call   389a <fork>
     bf3:	83 c4 10             	add    $0x10,%esp
     bf6:	85 c0                	test   %eax,%eax
     bf8:	89 c3                	mov    %eax,%ebx
     bfa:	75 46                	jne    c42 <preempt+0x92>
     bfc:	83 ec 0c             	sub    $0xc,%esp
     bff:	ff 75 e0             	pushl  -0x20(%ebp)
     c02:	e8 c3 2c 00 00       	call   38ca <close>
     c07:	83 c4 0c             	add    $0xc,%esp
     c0a:	6a 01                	push   $0x1
     c0c:	68 e1 46 00 00       	push   $0x46e1
     c11:	ff 75 e4             	pushl  -0x1c(%ebp)
     c14:	e8 a9 2c 00 00       	call   38c2 <write>
     c19:	83 c4 10             	add    $0x10,%esp
     c1c:	83 e8 01             	sub    $0x1,%eax
     c1f:	74 11                	je     c32 <preempt+0x82>
     c21:	50                   	push   %eax
     c22:	50                   	push   %eax
     c23:	68 26 41 00 00       	push   $0x4126
     c28:	6a 01                	push   $0x1
     c2a:	e8 e1 2d 00 00       	call   3a10 <printf>
     c2f:	83 c4 10             	add    $0x10,%esp
     c32:	83 ec 0c             	sub    $0xc,%esp
     c35:	ff 75 e4             	pushl  -0x1c(%ebp)
     c38:	e8 8d 2c 00 00       	call   38ca <close>
     c3d:	83 c4 10             	add    $0x10,%esp
     c40:	eb fe                	jmp    c40 <preempt+0x90>
     c42:	83 ec 0c             	sub    $0xc,%esp
     c45:	ff 75 e4             	pushl  -0x1c(%ebp)
     c48:	e8 7d 2c 00 00       	call   38ca <close>
     c4d:	83 c4 0c             	add    $0xc,%esp
     c50:	68 00 20 00 00       	push   $0x2000
     c55:	68 20 86 00 00       	push   $0x8620
     c5a:	ff 75 e0             	pushl  -0x20(%ebp)
     c5d:	e8 58 2c 00 00       	call   38ba <read>
     c62:	83 c4 10             	add    $0x10,%esp
     c65:	83 e8 01             	sub    $0x1,%eax
     c68:	74 19                	je     c83 <preempt+0xd3>
     c6a:	50                   	push   %eax
     c6b:	50                   	push   %eax
     c6c:	68 3a 41 00 00       	push   $0x413a
     c71:	6a 01                	push   $0x1
     c73:	e8 98 2d 00 00       	call   3a10 <printf>
     c78:	83 c4 10             	add    $0x10,%esp
     c7b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c7e:	5b                   	pop    %ebx
     c7f:	5e                   	pop    %esi
     c80:	5f                   	pop    %edi
     c81:	5d                   	pop    %ebp
     c82:	c3                   	ret    
     c83:	83 ec 0c             	sub    $0xc,%esp
     c86:	ff 75 e0             	pushl  -0x20(%ebp)
     c89:	e8 3c 2c 00 00       	call   38ca <close>
     c8e:	58                   	pop    %eax
     c8f:	5a                   	pop    %edx
     c90:	68 4d 41 00 00       	push   $0x414d
     c95:	6a 01                	push   $0x1
     c97:	e8 74 2d 00 00       	call   3a10 <printf>
     c9c:	89 3c 24             	mov    %edi,(%esp)
     c9f:	e8 2e 2c 00 00       	call   38d2 <kill>
     ca4:	89 34 24             	mov    %esi,(%esp)
     ca7:	e8 26 2c 00 00       	call   38d2 <kill>
     cac:	89 1c 24             	mov    %ebx,(%esp)
     caf:	e8 1e 2c 00 00       	call   38d2 <kill>
     cb4:	59                   	pop    %ecx
     cb5:	5b                   	pop    %ebx
     cb6:	68 56 41 00 00       	push   $0x4156
     cbb:	6a 01                	push   $0x1
     cbd:	e8 4e 2d 00 00       	call   3a10 <printf>
     cc2:	e8 e3 2b 00 00       	call   38aa <wait>
     cc7:	e8 de 2b 00 00       	call   38aa <wait>
     ccc:	e8 d9 2b 00 00       	call   38aa <wait>
     cd1:	5e                   	pop    %esi
     cd2:	5f                   	pop    %edi
     cd3:	68 5f 41 00 00       	push   $0x415f
     cd8:	6a 01                	push   $0x1
     cda:	e8 31 2d 00 00       	call   3a10 <printf>
     cdf:	83 c4 10             	add    $0x10,%esp
     ce2:	eb 97                	jmp    c7b <preempt+0xcb>
     ce4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000cf0 <exitwait>:
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	be 64 00 00 00       	mov    $0x64,%esi
     cf9:	53                   	push   %ebx
     cfa:	eb 14                	jmp    d10 <exitwait+0x20>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d00:	74 6f                	je     d71 <exitwait+0x81>
     d02:	e8 a3 2b 00 00       	call   38aa <wait>
     d07:	39 d8                	cmp    %ebx,%eax
     d09:	75 2d                	jne    d38 <exitwait+0x48>
     d0b:	83 ee 01             	sub    $0x1,%esi
     d0e:	74 48                	je     d58 <exitwait+0x68>
     d10:	e8 85 2b 00 00       	call   389a <fork>
     d15:	85 c0                	test   %eax,%eax
     d17:	89 c3                	mov    %eax,%ebx
     d19:	79 e5                	jns    d00 <exitwait+0x10>
     d1b:	83 ec 08             	sub    $0x8,%esp
     d1e:	68 c9 4c 00 00       	push   $0x4cc9
     d23:	6a 01                	push   $0x1
     d25:	e8 e6 2c 00 00       	call   3a10 <printf>
     d2a:	83 c4 10             	add    $0x10,%esp
     d2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d30:	5b                   	pop    %ebx
     d31:	5e                   	pop    %esi
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 6b 41 00 00       	push   $0x416b
     d40:	6a 01                	push   $0x1
     d42:	e8 c9 2c 00 00       	call   3a10 <printf>
     d47:	83 c4 10             	add    $0x10,%esp
     d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d4d:	5b                   	pop    %ebx
     d4e:	5e                   	pop    %esi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d58:	83 ec 08             	sub    $0x8,%esp
     d5b:	68 7b 41 00 00       	push   $0x417b
     d60:	6a 01                	push   $0x1
     d62:	e8 a9 2c 00 00       	call   3a10 <printf>
     d67:	83 c4 10             	add    $0x10,%esp
     d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d6d:	5b                   	pop    %ebx
     d6e:	5e                   	pop    %esi
     d6f:	5d                   	pop    %ebp
     d70:	c3                   	ret    
     d71:	e8 2c 2b 00 00       	call   38a2 <exit>
     d76:	8d 76 00             	lea    0x0(%esi),%esi
     d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d80 <mem>:
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	56                   	push   %esi
     d85:	53                   	push   %ebx
     d86:	31 db                	xor    %ebx,%ebx
     d88:	83 ec 14             	sub    $0x14,%esp
     d8b:	68 88 41 00 00       	push   $0x4188
     d90:	6a 01                	push   $0x1
     d92:	e8 79 2c 00 00       	call   3a10 <printf>
     d97:	e8 86 2b 00 00       	call   3922 <getpid>
     d9c:	89 c6                	mov    %eax,%esi
     d9e:	e8 f7 2a 00 00       	call   389a <fork>
     da3:	83 c4 10             	add    $0x10,%esp
     da6:	85 c0                	test   %eax,%eax
     da8:	74 0a                	je     db4 <mem+0x34>
     daa:	e9 89 00 00 00       	jmp    e38 <mem+0xb8>
     daf:	90                   	nop
     db0:	89 18                	mov    %ebx,(%eax)
     db2:	89 c3                	mov    %eax,%ebx
     db4:	83 ec 0c             	sub    $0xc,%esp
     db7:	68 11 27 00 00       	push   $0x2711
     dbc:	e8 cf 2e 00 00       	call   3c90 <malloc>
     dc1:	83 c4 10             	add    $0x10,%esp
     dc4:	85 c0                	test   %eax,%eax
     dc6:	75 e8                	jne    db0 <mem+0x30>
     dc8:	85 db                	test   %ebx,%ebx
     dca:	74 18                	je     de4 <mem+0x64>
     dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     dd0:	8b 3b                	mov    (%ebx),%edi
     dd2:	83 ec 0c             	sub    $0xc,%esp
     dd5:	53                   	push   %ebx
     dd6:	89 fb                	mov    %edi,%ebx
     dd8:	e8 23 2e 00 00       	call   3c00 <free>
     ddd:	83 c4 10             	add    $0x10,%esp
     de0:	85 db                	test   %ebx,%ebx
     de2:	75 ec                	jne    dd0 <mem+0x50>
     de4:	83 ec 0c             	sub    $0xc,%esp
     de7:	68 00 50 00 00       	push   $0x5000
     dec:	e8 9f 2e 00 00       	call   3c90 <malloc>
     df1:	83 c4 10             	add    $0x10,%esp
     df4:	85 c0                	test   %eax,%eax
     df6:	74 20                	je     e18 <mem+0x98>
     df8:	83 ec 0c             	sub    $0xc,%esp
     dfb:	50                   	push   %eax
     dfc:	e8 ff 2d 00 00       	call   3c00 <free>
     e01:	58                   	pop    %eax
     e02:	5a                   	pop    %edx
     e03:	68 ac 41 00 00       	push   $0x41ac
     e08:	6a 01                	push   $0x1
     e0a:	e8 01 2c 00 00       	call   3a10 <printf>
     e0f:	e8 8e 2a 00 00       	call   38a2 <exit>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e18:	83 ec 08             	sub    $0x8,%esp
     e1b:	68 92 41 00 00       	push   $0x4192
     e20:	6a 01                	push   $0x1
     e22:	e8 e9 2b 00 00       	call   3a10 <printf>
     e27:	89 34 24             	mov    %esi,(%esp)
     e2a:	e8 a3 2a 00 00       	call   38d2 <kill>
     e2f:	e8 6e 2a 00 00       	call   38a2 <exit>
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e38:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e3b:	5b                   	pop    %ebx
     e3c:	5e                   	pop    %esi
     e3d:	5f                   	pop    %edi
     e3e:	5d                   	pop    %ebp
     e3f:	e9 66 2a 00 00       	jmp    38aa <wait>
     e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e50 <sharedfd>:
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	57                   	push   %edi
     e54:	56                   	push   %esi
     e55:	53                   	push   %ebx
     e56:	83 ec 34             	sub    $0x34,%esp
     e59:	68 b4 41 00 00       	push   $0x41b4
     e5e:	6a 01                	push   $0x1
     e60:	e8 ab 2b 00 00       	call   3a10 <printf>
     e65:	c7 04 24 c3 41 00 00 	movl   $0x41c3,(%esp)
     e6c:	e8 81 2a 00 00       	call   38f2 <unlink>
     e71:	59                   	pop    %ecx
     e72:	5b                   	pop    %ebx
     e73:	68 02 02 00 00       	push   $0x202
     e78:	68 c3 41 00 00       	push   $0x41c3
     e7d:	e8 60 2a 00 00       	call   38e2 <open>
     e82:	83 c4 10             	add    $0x10,%esp
     e85:	85 c0                	test   %eax,%eax
     e87:	0f 88 33 01 00 00    	js     fc0 <sharedfd+0x170>
     e8d:	89 c6                	mov    %eax,%esi
     e8f:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     e94:	e8 01 2a 00 00       	call   389a <fork>
     e99:	83 f8 01             	cmp    $0x1,%eax
     e9c:	89 c7                	mov    %eax,%edi
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
     ec0:	83 eb 01             	sub    $0x1,%ebx
     ec3:	74 29                	je     eee <sharedfd+0x9e>
     ec5:	8d 45 de             	lea    -0x22(%ebp),%eax
     ec8:	83 ec 04             	sub    $0x4,%esp
     ecb:	6a 0a                	push   $0xa
     ecd:	50                   	push   %eax
     ece:	56                   	push   %esi
     ecf:	e8 ee 29 00 00       	call   38c2 <write>
     ed4:	83 c4 10             	add    $0x10,%esp
     ed7:	83 f8 0a             	cmp    $0xa,%eax
     eda:	74 e4                	je     ec0 <sharedfd+0x70>
     edc:	83 ec 08             	sub    $0x8,%esp
     edf:	68 b4 4e 00 00       	push   $0x4eb4
     ee4:	6a 01                	push   $0x1
     ee6:	e8 25 2b 00 00       	call   3a10 <printf>
     eeb:	83 c4 10             	add    $0x10,%esp
     eee:	85 ff                	test   %edi,%edi
     ef0:	0f 84 fe 00 00 00    	je     ff4 <sharedfd+0x1a4>
     ef6:	e8 af 29 00 00       	call   38aa <wait>
     efb:	83 ec 0c             	sub    $0xc,%esp
     efe:	31 db                	xor    %ebx,%ebx
     f00:	31 ff                	xor    %edi,%edi
     f02:	56                   	push   %esi
     f03:	8d 75 e8             	lea    -0x18(%ebp),%esi
     f06:	e8 bf 29 00 00       	call   38ca <close>
     f0b:	58                   	pop    %eax
     f0c:	5a                   	pop    %edx
     f0d:	6a 00                	push   $0x0
     f0f:	68 c3 41 00 00       	push   $0x41c3
     f14:	e8 c9 29 00 00       	call   38e2 <open>
     f19:	83 c4 10             	add    $0x10,%esp
     f1c:	85 c0                	test   %eax,%eax
     f1e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     f21:	0f 88 b3 00 00 00    	js     fda <sharedfd+0x18a>
     f27:	89 f8                	mov    %edi,%eax
     f29:	89 df                	mov    %ebx,%edi
     f2b:	89 c3                	mov    %eax,%ebx
     f2d:	8d 76 00             	lea    0x0(%esi),%esi
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
     f50:	80 fa 70             	cmp    $0x70,%dl
     f53:	0f 94 c2             	sete   %dl
     f56:	0f b6 d2             	movzbl %dl,%edx
     f59:	01 d7                	add    %edx,%edi
     f5b:	83 c0 01             	add    $0x1,%eax
     f5e:	39 f0                	cmp    %esi,%eax
     f60:	74 ce                	je     f30 <sharedfd+0xe0>
     f62:	0f b6 10             	movzbl (%eax),%edx
     f65:	80 fa 63             	cmp    $0x63,%dl
     f68:	75 e6                	jne    f50 <sharedfd+0x100>
     f6a:	83 c3 01             	add    $0x1,%ebx
     f6d:	eb ec                	jmp    f5b <sharedfd+0x10b>
     f6f:	90                   	nop
     f70:	83 ec 0c             	sub    $0xc,%esp
     f73:	89 d8                	mov    %ebx,%eax
     f75:	ff 75 d4             	pushl  -0x2c(%ebp)
     f78:	89 fb                	mov    %edi,%ebx
     f7a:	89 c7                	mov    %eax,%edi
     f7c:	e8 49 29 00 00       	call   38ca <close>
     f81:	c7 04 24 c3 41 00 00 	movl   $0x41c3,(%esp)
     f88:	e8 65 29 00 00       	call   38f2 <unlink>
     f8d:	83 c4 10             	add    $0x10,%esp
     f90:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     f96:	75 61                	jne    ff9 <sharedfd+0x1a9>
     f98:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f9e:	75 59                	jne    ff9 <sharedfd+0x1a9>
     fa0:	83 ec 08             	sub    $0x8,%esp
     fa3:	68 cc 41 00 00       	push   $0x41cc
     fa8:	6a 01                	push   $0x1
     faa:	e8 61 2a 00 00       	call   3a10 <printf>
     faf:	83 c4 10             	add    $0x10,%esp
     fb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fb5:	5b                   	pop    %ebx
     fb6:	5e                   	pop    %esi
     fb7:	5f                   	pop    %edi
     fb8:	5d                   	pop    %ebp
     fb9:	c3                   	ret    
     fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fc0:	83 ec 08             	sub    $0x8,%esp
     fc3:	68 88 4e 00 00       	push   $0x4e88
     fc8:	6a 01                	push   $0x1
     fca:	e8 41 2a 00 00       	call   3a10 <printf>
     fcf:	83 c4 10             	add    $0x10,%esp
     fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd5:	5b                   	pop    %ebx
     fd6:	5e                   	pop    %esi
     fd7:	5f                   	pop    %edi
     fd8:	5d                   	pop    %ebp
     fd9:	c3                   	ret    
     fda:	83 ec 08             	sub    $0x8,%esp
     fdd:	68 d4 4e 00 00       	push   $0x4ed4
     fe2:	6a 01                	push   $0x1
     fe4:	e8 27 2a 00 00       	call   3a10 <printf>
     fe9:	83 c4 10             	add    $0x10,%esp
     fec:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fef:	5b                   	pop    %ebx
     ff0:	5e                   	pop    %esi
     ff1:	5f                   	pop    %edi
     ff2:	5d                   	pop    %ebp
     ff3:	c3                   	ret    
     ff4:	e8 a9 28 00 00       	call   38a2 <exit>
     ff9:	53                   	push   %ebx
     ffa:	57                   	push   %edi
     ffb:	68 d9 41 00 00       	push   $0x41d9
    1000:	6a 01                	push   $0x1
    1002:	e8 09 2a 00 00       	call   3a10 <printf>
    1007:	e8 96 28 00 00       	call   38a2 <exit>
    100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001010 <fourfiles>:
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
    1016:	be ee 41 00 00       	mov    $0x41ee,%esi
    101b:	31 db                	xor    %ebx,%ebx
    101d:	83 ec 34             	sub    $0x34,%esp
    1020:	c7 45 d8 ee 41 00 00 	movl   $0x41ee,-0x28(%ebp)
    1027:	c7 45 dc 37 43 00 00 	movl   $0x4337,-0x24(%ebp)
    102e:	68 f4 41 00 00       	push   $0x41f4
    1033:	6a 01                	push   $0x1
    1035:	c7 45 e0 3b 43 00 00 	movl   $0x433b,-0x20(%ebp)
    103c:	c7 45 e4 f1 41 00 00 	movl   $0x41f1,-0x1c(%ebp)
    1043:	e8 c8 29 00 00       	call   3a10 <printf>
    1048:	83 c4 10             	add    $0x10,%esp
    104b:	83 ec 0c             	sub    $0xc,%esp
    104e:	56                   	push   %esi
    104f:	e8 9e 28 00 00       	call   38f2 <unlink>
    1054:	e8 41 28 00 00       	call   389a <fork>
    1059:	83 c4 10             	add    $0x10,%esp
    105c:	85 c0                	test   %eax,%eax
    105e:	0f 88 68 01 00 00    	js     11cc <fourfiles+0x1bc>
    1064:	0f 84 df 00 00 00    	je     1149 <fourfiles+0x139>
    106a:	83 c3 01             	add    $0x1,%ebx
    106d:	83 fb 04             	cmp    $0x4,%ebx
    1070:	74 06                	je     1078 <fourfiles+0x68>
    1072:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1076:	eb d3                	jmp    104b <fourfiles+0x3b>
    1078:	e8 2d 28 00 00       	call   38aa <wait>
    107d:	31 ff                	xor    %edi,%edi
    107f:	e8 26 28 00 00       	call   38aa <wait>
    1084:	e8 21 28 00 00       	call   38aa <wait>
    1089:	e8 1c 28 00 00       	call   38aa <wait>
    108e:	c7 45 d0 ee 41 00 00 	movl   $0x41ee,-0x30(%ebp)
    1095:	83 ec 08             	sub    $0x8,%esp
    1098:	31 db                	xor    %ebx,%ebx
    109a:	6a 00                	push   $0x0
    109c:	ff 75 d0             	pushl  -0x30(%ebp)
    109f:	e8 3e 28 00 00       	call   38e2 <open>
    10a4:	83 c4 10             	add    $0x10,%esp
    10a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 20 00 00       	push   $0x2000
    10b8:	68 20 86 00 00       	push   $0x8620
    10bd:	ff 75 d4             	pushl  -0x2c(%ebp)
    10c0:	e8 f5 27 00 00       	call   38ba <read>
    10c5:	83 c4 10             	add    $0x10,%esp
    10c8:	85 c0                	test   %eax,%eax
    10ca:	7e 26                	jle    10f2 <fourfiles+0xe2>
    10cc:	31 d2                	xor    %edx,%edx
    10ce:	66 90                	xchg   %ax,%ax
    10d0:	0f be b2 20 86 00 00 	movsbl 0x8620(%edx),%esi
    10d7:	83 ff 01             	cmp    $0x1,%edi
    10da:	19 c9                	sbb    %ecx,%ecx
    10dc:	83 c1 31             	add    $0x31,%ecx
    10df:	39 ce                	cmp    %ecx,%esi
    10e1:	0f 85 be 00 00 00    	jne    11a5 <fourfiles+0x195>
    10e7:	83 c2 01             	add    $0x1,%edx
    10ea:	39 d0                	cmp    %edx,%eax
    10ec:	75 e2                	jne    10d0 <fourfiles+0xc0>
    10ee:	01 c3                	add    %eax,%ebx
    10f0:	eb be                	jmp    10b0 <fourfiles+0xa0>
    10f2:	83 ec 0c             	sub    $0xc,%esp
    10f5:	ff 75 d4             	pushl  -0x2c(%ebp)
    10f8:	e8 cd 27 00 00       	call   38ca <close>
    10fd:	83 c4 10             	add    $0x10,%esp
    1100:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1106:	0f 85 d3 00 00 00    	jne    11df <fourfiles+0x1cf>
    110c:	83 ec 0c             	sub    $0xc,%esp
    110f:	ff 75 d0             	pushl  -0x30(%ebp)
    1112:	e8 db 27 00 00       	call   38f2 <unlink>
    1117:	83 c4 10             	add    $0x10,%esp
    111a:	83 ff 01             	cmp    $0x1,%edi
    111d:	75 1a                	jne    1139 <fourfiles+0x129>
    111f:	83 ec 08             	sub    $0x8,%esp
    1122:	68 32 42 00 00       	push   $0x4232
    1127:	6a 01                	push   $0x1
    1129:	e8 e2 28 00 00       	call   3a10 <printf>
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
    1149:	83 ec 08             	sub    $0x8,%esp
    114c:	68 02 02 00 00       	push   $0x202
    1151:	56                   	push   %esi
    1152:	e8 8b 27 00 00       	call   38e2 <open>
    1157:	83 c4 10             	add    $0x10,%esp
    115a:	85 c0                	test   %eax,%eax
    115c:	89 c6                	mov    %eax,%esi
    115e:	78 59                	js     11b9 <fourfiles+0x1a9>
    1160:	83 ec 04             	sub    $0x4,%esp
    1163:	83 c3 30             	add    $0x30,%ebx
    1166:	68 00 02 00 00       	push   $0x200
    116b:	53                   	push   %ebx
    116c:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1171:	68 20 86 00 00       	push   $0x8620
    1176:	e8 85 25 00 00       	call   3700 <memset>
    117b:	83 c4 10             	add    $0x10,%esp
    117e:	83 ec 04             	sub    $0x4,%esp
    1181:	68 f4 01 00 00       	push   $0x1f4
    1186:	68 20 86 00 00       	push   $0x8620
    118b:	56                   	push   %esi
    118c:	e8 31 27 00 00       	call   38c2 <write>
    1191:	83 c4 10             	add    $0x10,%esp
    1194:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    1199:	75 57                	jne    11f2 <fourfiles+0x1e2>
    119b:	83 eb 01             	sub    $0x1,%ebx
    119e:	75 de                	jne    117e <fourfiles+0x16e>
    11a0:	e8 fd 26 00 00       	call   38a2 <exit>
    11a5:	83 ec 08             	sub    $0x8,%esp
    11a8:	68 15 42 00 00       	push   $0x4215
    11ad:	6a 01                	push   $0x1
    11af:	e8 5c 28 00 00       	call   3a10 <printf>
    11b4:	e8 e9 26 00 00       	call   38a2 <exit>
    11b9:	51                   	push   %ecx
    11ba:	51                   	push   %ecx
    11bb:	68 8f 44 00 00       	push   $0x448f
    11c0:	6a 01                	push   $0x1
    11c2:	e8 49 28 00 00       	call   3a10 <printf>
    11c7:	e8 d6 26 00 00       	call   38a2 <exit>
    11cc:	53                   	push   %ebx
    11cd:	53                   	push   %ebx
    11ce:	68 c9 4c 00 00       	push   $0x4cc9
    11d3:	6a 01                	push   $0x1
    11d5:	e8 36 28 00 00       	call   3a10 <printf>
    11da:	e8 c3 26 00 00       	call   38a2 <exit>
    11df:	50                   	push   %eax
    11e0:	53                   	push   %ebx
    11e1:	68 21 42 00 00       	push   $0x4221
    11e6:	6a 01                	push   $0x1
    11e8:	e8 23 28 00 00       	call   3a10 <printf>
    11ed:	e8 b0 26 00 00       	call   38a2 <exit>
    11f2:	52                   	push   %edx
    11f3:	50                   	push   %eax
    11f4:	68 04 42 00 00       	push   $0x4204
    11f9:	6a 01                	push   $0x1
    11fb:	e8 10 28 00 00       	call   3a10 <printf>
    1200:	e8 9d 26 00 00       	call   38a2 <exit>
    1205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <createdelete>:
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
    1215:	53                   	push   %ebx
    1216:	31 db                	xor    %ebx,%ebx
    1218:	83 ec 44             	sub    $0x44,%esp
    121b:	68 40 42 00 00       	push   $0x4240
    1220:	6a 01                	push   $0x1
    1222:	e8 e9 27 00 00       	call   3a10 <printf>
    1227:	83 c4 10             	add    $0x10,%esp
    122a:	e8 6b 26 00 00       	call   389a <fork>
    122f:	85 c0                	test   %eax,%eax
    1231:	0f 88 be 01 00 00    	js     13f5 <createdelete+0x1e5>
    1237:	0f 84 0b 01 00 00    	je     1348 <createdelete+0x138>
    123d:	83 c3 01             	add    $0x1,%ebx
    1240:	83 fb 04             	cmp    $0x4,%ebx
    1243:	75 e5                	jne    122a <createdelete+0x1a>
    1245:	8d 7d c8             	lea    -0x38(%ebp),%edi
    1248:	be ff ff ff ff       	mov    $0xffffffff,%esi
    124d:	e8 58 26 00 00       	call   38aa <wait>
    1252:	e8 53 26 00 00       	call   38aa <wait>
    1257:	e8 4e 26 00 00       	call   38aa <wait>
    125c:	e8 49 26 00 00       	call   38aa <wait>
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
    1284:	bb 70 00 00 00       	mov    $0x70,%ebx
    1289:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    128d:	83 ec 08             	sub    $0x8,%esp
    1290:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1293:	6a 00                	push   $0x0
    1295:	57                   	push   %edi
    1296:	88 45 c9             	mov    %al,-0x37(%ebp)
    1299:	e8 44 26 00 00       	call   38e2 <open>
    129e:	83 c4 10             	add    $0x10,%esp
    12a1:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12a5:	0f 84 85 00 00 00    	je     1330 <createdelete+0x120>
    12ab:	85 c0                	test   %eax,%eax
    12ad:	0f 88 1a 01 00 00    	js     13cd <createdelete+0x1bd>
    12b3:	83 fe 08             	cmp    $0x8,%esi
    12b6:	0f 86 54 01 00 00    	jbe    1410 <createdelete+0x200>
    12bc:	83 ec 0c             	sub    $0xc,%esp
    12bf:	50                   	push   %eax
    12c0:	e8 05 26 00 00       	call   38ca <close>
    12c5:	83 c4 10             	add    $0x10,%esp
    12c8:	83 c3 01             	add    $0x1,%ebx
    12cb:	80 fb 74             	cmp    $0x74,%bl
    12ce:	75 b9                	jne    1289 <createdelete+0x79>
    12d0:	8b 75 c0             	mov    -0x40(%ebp),%esi
    12d3:	83 fe 13             	cmp    $0x13,%esi
    12d6:	75 90                	jne    1268 <createdelete+0x58>
    12d8:	be 70 00 00 00       	mov    $0x70,%esi
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    12e0:	8d 46 c0             	lea    -0x40(%esi),%eax
    12e3:	bb 04 00 00 00       	mov    $0x4,%ebx
    12e8:	88 45 c7             	mov    %al,-0x39(%ebp)
    12eb:	89 f0                	mov    %esi,%eax
    12ed:	83 ec 0c             	sub    $0xc,%esp
    12f0:	88 45 c8             	mov    %al,-0x38(%ebp)
    12f3:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    12f7:	57                   	push   %edi
    12f8:	88 45 c9             	mov    %al,-0x37(%ebp)
    12fb:	e8 f2 25 00 00       	call   38f2 <unlink>
    1300:	83 c4 10             	add    $0x10,%esp
    1303:	83 eb 01             	sub    $0x1,%ebx
    1306:	75 e3                	jne    12eb <createdelete+0xdb>
    1308:	83 c6 01             	add    $0x1,%esi
    130b:	89 f0                	mov    %esi,%eax
    130d:	3c 84                	cmp    $0x84,%al
    130f:	75 cf                	jne    12e0 <createdelete+0xd0>
    1311:	83 ec 08             	sub    $0x8,%esp
    1314:	68 53 42 00 00       	push   $0x4253
    1319:	6a 01                	push   $0x1
    131b:	e8 f0 26 00 00       	call   3a10 <printf>
    1320:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1323:	5b                   	pop    %ebx
    1324:	5e                   	pop    %esi
    1325:	5f                   	pop    %edi
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret    
    1328:	90                   	nop
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1330:	83 fe 08             	cmp    $0x8,%esi
    1333:	0f 86 cf 00 00 00    	jbe    1408 <createdelete+0x1f8>
    1339:	85 c0                	test   %eax,%eax
    133b:	78 8b                	js     12c8 <createdelete+0xb8>
    133d:	e9 7a ff ff ff       	jmp    12bc <createdelete+0xac>
    1342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1348:	83 c3 70             	add    $0x70,%ebx
    134b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    134f:	8d 7d c8             	lea    -0x38(%ebp),%edi
    1352:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1355:	31 db                	xor    %ebx,%ebx
    1357:	eb 0f                	jmp    1368 <createdelete+0x158>
    1359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1360:	83 fb 13             	cmp    $0x13,%ebx
    1363:	74 63                	je     13c8 <createdelete+0x1b8>
    1365:	83 c3 01             	add    $0x1,%ebx
    1368:	83 ec 08             	sub    $0x8,%esp
    136b:	8d 43 30             	lea    0x30(%ebx),%eax
    136e:	68 02 02 00 00       	push   $0x202
    1373:	57                   	push   %edi
    1374:	88 45 c9             	mov    %al,-0x37(%ebp)
    1377:	e8 66 25 00 00       	call   38e2 <open>
    137c:	83 c4 10             	add    $0x10,%esp
    137f:	85 c0                	test   %eax,%eax
    1381:	78 5f                	js     13e2 <createdelete+0x1d2>
    1383:	83 ec 0c             	sub    $0xc,%esp
    1386:	50                   	push   %eax
    1387:	e8 3e 25 00 00       	call   38ca <close>
    138c:	83 c4 10             	add    $0x10,%esp
    138f:	85 db                	test   %ebx,%ebx
    1391:	74 d2                	je     1365 <createdelete+0x155>
    1393:	f6 c3 01             	test   $0x1,%bl
    1396:	75 c8                	jne    1360 <createdelete+0x150>
    1398:	83 ec 0c             	sub    $0xc,%esp
    139b:	89 d8                	mov    %ebx,%eax
    139d:	d1 f8                	sar    %eax
    139f:	57                   	push   %edi
    13a0:	83 c0 30             	add    $0x30,%eax
    13a3:	88 45 c9             	mov    %al,-0x37(%ebp)
    13a6:	e8 47 25 00 00       	call   38f2 <unlink>
    13ab:	83 c4 10             	add    $0x10,%esp
    13ae:	85 c0                	test   %eax,%eax
    13b0:	79 ae                	jns    1360 <createdelete+0x150>
    13b2:	52                   	push   %edx
    13b3:	52                   	push   %edx
    13b4:	68 41 3e 00 00       	push   $0x3e41
    13b9:	6a 01                	push   $0x1
    13bb:	e8 50 26 00 00       	call   3a10 <printf>
    13c0:	e8 dd 24 00 00       	call   38a2 <exit>
    13c5:	8d 76 00             	lea    0x0(%esi),%esi
    13c8:	e8 d5 24 00 00       	call   38a2 <exit>
    13cd:	83 ec 04             	sub    $0x4,%esp
    13d0:	57                   	push   %edi
    13d1:	68 00 4f 00 00       	push   $0x4f00
    13d6:	6a 01                	push   $0x1
    13d8:	e8 33 26 00 00       	call   3a10 <printf>
    13dd:	e8 c0 24 00 00       	call   38a2 <exit>
    13e2:	51                   	push   %ecx
    13e3:	51                   	push   %ecx
    13e4:	68 8f 44 00 00       	push   $0x448f
    13e9:	6a 01                	push   $0x1
    13eb:	e8 20 26 00 00       	call   3a10 <printf>
    13f0:	e8 ad 24 00 00       	call   38a2 <exit>
    13f5:	53                   	push   %ebx
    13f6:	53                   	push   %ebx
    13f7:	68 c9 4c 00 00       	push   $0x4cc9
    13fc:	6a 01                	push   $0x1
    13fe:	e8 0d 26 00 00       	call   3a10 <printf>
    1403:	e8 9a 24 00 00       	call   38a2 <exit>
    1408:	85 c0                	test   %eax,%eax
    140a:	0f 88 b8 fe ff ff    	js     12c8 <createdelete+0xb8>
    1410:	50                   	push   %eax
    1411:	57                   	push   %edi
    1412:	68 24 4f 00 00       	push   $0x4f24
    1417:	6a 01                	push   $0x1
    1419:	e8 f2 25 00 00       	call   3a10 <printf>
    141e:	e8 7f 24 00 00       	call   38a2 <exit>
    1423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001430 <unlinkread>:
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	56                   	push   %esi
    1434:	53                   	push   %ebx
    1435:	83 ec 08             	sub    $0x8,%esp
    1438:	68 64 42 00 00       	push   $0x4264
    143d:	6a 01                	push   $0x1
    143f:	e8 cc 25 00 00       	call   3a10 <printf>
    1444:	5b                   	pop    %ebx
    1445:	5e                   	pop    %esi
    1446:	68 02 02 00 00       	push   $0x202
    144b:	68 75 42 00 00       	push   $0x4275
    1450:	e8 8d 24 00 00       	call   38e2 <open>
    1455:	83 c4 10             	add    $0x10,%esp
    1458:	85 c0                	test   %eax,%eax
    145a:	0f 88 e6 00 00 00    	js     1546 <unlinkread+0x116>
    1460:	83 ec 04             	sub    $0x4,%esp
    1463:	89 c3                	mov    %eax,%ebx
    1465:	6a 05                	push   $0x5
    1467:	68 9a 42 00 00       	push   $0x429a
    146c:	50                   	push   %eax
    146d:	e8 50 24 00 00       	call   38c2 <write>
    1472:	89 1c 24             	mov    %ebx,(%esp)
    1475:	e8 50 24 00 00       	call   38ca <close>
    147a:	58                   	pop    %eax
    147b:	5a                   	pop    %edx
    147c:	6a 02                	push   $0x2
    147e:	68 75 42 00 00       	push   $0x4275
    1483:	e8 5a 24 00 00       	call   38e2 <open>
    1488:	83 c4 10             	add    $0x10,%esp
    148b:	85 c0                	test   %eax,%eax
    148d:	89 c3                	mov    %eax,%ebx
    148f:	0f 88 10 01 00 00    	js     15a5 <unlinkread+0x175>
    1495:	83 ec 0c             	sub    $0xc,%esp
    1498:	68 75 42 00 00       	push   $0x4275
    149d:	e8 50 24 00 00       	call   38f2 <unlink>
    14a2:	83 c4 10             	add    $0x10,%esp
    14a5:	85 c0                	test   %eax,%eax
    14a7:	0f 85 e5 00 00 00    	jne    1592 <unlinkread+0x162>
    14ad:	83 ec 08             	sub    $0x8,%esp
    14b0:	68 02 02 00 00       	push   $0x202
    14b5:	68 75 42 00 00       	push   $0x4275
    14ba:	e8 23 24 00 00       	call   38e2 <open>
    14bf:	83 c4 0c             	add    $0xc,%esp
    14c2:	89 c6                	mov    %eax,%esi
    14c4:	6a 03                	push   $0x3
    14c6:	68 d2 42 00 00       	push   $0x42d2
    14cb:	50                   	push   %eax
    14cc:	e8 f1 23 00 00       	call   38c2 <write>
    14d1:	89 34 24             	mov    %esi,(%esp)
    14d4:	e8 f1 23 00 00       	call   38ca <close>
    14d9:	83 c4 0c             	add    $0xc,%esp
    14dc:	68 00 20 00 00       	push   $0x2000
    14e1:	68 20 86 00 00       	push   $0x8620
    14e6:	53                   	push   %ebx
    14e7:	e8 ce 23 00 00       	call   38ba <read>
    14ec:	83 c4 10             	add    $0x10,%esp
    14ef:	83 f8 05             	cmp    $0x5,%eax
    14f2:	0f 85 87 00 00 00    	jne    157f <unlinkread+0x14f>
    14f8:	80 3d 20 86 00 00 68 	cmpb   $0x68,0x8620
    14ff:	75 6b                	jne    156c <unlinkread+0x13c>
    1501:	83 ec 04             	sub    $0x4,%esp
    1504:	6a 0a                	push   $0xa
    1506:	68 20 86 00 00       	push   $0x8620
    150b:	53                   	push   %ebx
    150c:	e8 b1 23 00 00       	call   38c2 <write>
    1511:	83 c4 10             	add    $0x10,%esp
    1514:	83 f8 0a             	cmp    $0xa,%eax
    1517:	75 40                	jne    1559 <unlinkread+0x129>
    1519:	83 ec 0c             	sub    $0xc,%esp
    151c:	53                   	push   %ebx
    151d:	e8 a8 23 00 00       	call   38ca <close>
    1522:	c7 04 24 75 42 00 00 	movl   $0x4275,(%esp)
    1529:	e8 c4 23 00 00       	call   38f2 <unlink>
    152e:	58                   	pop    %eax
    152f:	5a                   	pop    %edx
    1530:	68 1d 43 00 00       	push   $0x431d
    1535:	6a 01                	push   $0x1
    1537:	e8 d4 24 00 00       	call   3a10 <printf>
    153c:	83 c4 10             	add    $0x10,%esp
    153f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1542:	5b                   	pop    %ebx
    1543:	5e                   	pop    %esi
    1544:	5d                   	pop    %ebp
    1545:	c3                   	ret    
    1546:	51                   	push   %ecx
    1547:	51                   	push   %ecx
    1548:	68 80 42 00 00       	push   $0x4280
    154d:	6a 01                	push   $0x1
    154f:	e8 bc 24 00 00       	call   3a10 <printf>
    1554:	e8 49 23 00 00       	call   38a2 <exit>
    1559:	51                   	push   %ecx
    155a:	51                   	push   %ecx
    155b:	68 04 43 00 00       	push   $0x4304
    1560:	6a 01                	push   $0x1
    1562:	e8 a9 24 00 00       	call   3a10 <printf>
    1567:	e8 36 23 00 00       	call   38a2 <exit>
    156c:	53                   	push   %ebx
    156d:	53                   	push   %ebx
    156e:	68 ed 42 00 00       	push   $0x42ed
    1573:	6a 01                	push   $0x1
    1575:	e8 96 24 00 00       	call   3a10 <printf>
    157a:	e8 23 23 00 00       	call   38a2 <exit>
    157f:	56                   	push   %esi
    1580:	56                   	push   %esi
    1581:	68 d6 42 00 00       	push   $0x42d6
    1586:	6a 01                	push   $0x1
    1588:	e8 83 24 00 00       	call   3a10 <printf>
    158d:	e8 10 23 00 00       	call   38a2 <exit>
    1592:	50                   	push   %eax
    1593:	50                   	push   %eax
    1594:	68 b8 42 00 00       	push   $0x42b8
    1599:	6a 01                	push   $0x1
    159b:	e8 70 24 00 00       	call   3a10 <printf>
    15a0:	e8 fd 22 00 00       	call   38a2 <exit>
    15a5:	50                   	push   %eax
    15a6:	50                   	push   %eax
    15a7:	68 a0 42 00 00       	push   $0x42a0
    15ac:	6a 01                	push   $0x1
    15ae:	e8 5d 24 00 00       	call   3a10 <printf>
    15b3:	e8 ea 22 00 00       	call   38a2 <exit>
    15b8:	90                   	nop
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015c0 <linktest>:
    15c0:	55                   	push   %ebp
    15c1:	89 e5                	mov    %esp,%ebp
    15c3:	53                   	push   %ebx
    15c4:	83 ec 0c             	sub    $0xc,%esp
    15c7:	68 2c 43 00 00       	push   $0x432c
    15cc:	6a 01                	push   $0x1
    15ce:	e8 3d 24 00 00       	call   3a10 <printf>
    15d3:	c7 04 24 36 43 00 00 	movl   $0x4336,(%esp)
    15da:	e8 13 23 00 00       	call   38f2 <unlink>
    15df:	c7 04 24 3a 43 00 00 	movl   $0x433a,(%esp)
    15e6:	e8 07 23 00 00       	call   38f2 <unlink>
    15eb:	58                   	pop    %eax
    15ec:	5a                   	pop    %edx
    15ed:	68 02 02 00 00       	push   $0x202
    15f2:	68 36 43 00 00       	push   $0x4336
    15f7:	e8 e6 22 00 00       	call   38e2 <open>
    15fc:	83 c4 10             	add    $0x10,%esp
    15ff:	85 c0                	test   %eax,%eax
    1601:	0f 88 1e 01 00 00    	js     1725 <linktest+0x165>
    1607:	83 ec 04             	sub    $0x4,%esp
    160a:	89 c3                	mov    %eax,%ebx
    160c:	6a 05                	push   $0x5
    160e:	68 9a 42 00 00       	push   $0x429a
    1613:	50                   	push   %eax
    1614:	e8 a9 22 00 00       	call   38c2 <write>
    1619:	83 c4 10             	add    $0x10,%esp
    161c:	83 f8 05             	cmp    $0x5,%eax
    161f:	0f 85 98 01 00 00    	jne    17bd <linktest+0x1fd>
    1625:	83 ec 0c             	sub    $0xc,%esp
    1628:	53                   	push   %ebx
    1629:	e8 9c 22 00 00       	call   38ca <close>
    162e:	5b                   	pop    %ebx
    162f:	58                   	pop    %eax
    1630:	68 3a 43 00 00       	push   $0x433a
    1635:	68 36 43 00 00       	push   $0x4336
    163a:	e8 c3 22 00 00       	call   3902 <link>
    163f:	83 c4 10             	add    $0x10,%esp
    1642:	85 c0                	test   %eax,%eax
    1644:	0f 88 60 01 00 00    	js     17aa <linktest+0x1ea>
    164a:	83 ec 0c             	sub    $0xc,%esp
    164d:	68 36 43 00 00       	push   $0x4336
    1652:	e8 9b 22 00 00       	call   38f2 <unlink>
    1657:	58                   	pop    %eax
    1658:	5a                   	pop    %edx
    1659:	6a 00                	push   $0x0
    165b:	68 36 43 00 00       	push   $0x4336
    1660:	e8 7d 22 00 00       	call   38e2 <open>
    1665:	83 c4 10             	add    $0x10,%esp
    1668:	85 c0                	test   %eax,%eax
    166a:	0f 89 27 01 00 00    	jns    1797 <linktest+0x1d7>
    1670:	83 ec 08             	sub    $0x8,%esp
    1673:	6a 00                	push   $0x0
    1675:	68 3a 43 00 00       	push   $0x433a
    167a:	e8 63 22 00 00       	call   38e2 <open>
    167f:	83 c4 10             	add    $0x10,%esp
    1682:	85 c0                	test   %eax,%eax
    1684:	89 c3                	mov    %eax,%ebx
    1686:	0f 88 f8 00 00 00    	js     1784 <linktest+0x1c4>
    168c:	83 ec 04             	sub    $0x4,%esp
    168f:	68 00 20 00 00       	push   $0x2000
    1694:	68 20 86 00 00       	push   $0x8620
    1699:	50                   	push   %eax
    169a:	e8 1b 22 00 00       	call   38ba <read>
    169f:	83 c4 10             	add    $0x10,%esp
    16a2:	83 f8 05             	cmp    $0x5,%eax
    16a5:	0f 85 c6 00 00 00    	jne    1771 <linktest+0x1b1>
    16ab:	83 ec 0c             	sub    $0xc,%esp
    16ae:	53                   	push   %ebx
    16af:	e8 16 22 00 00       	call   38ca <close>
    16b4:	58                   	pop    %eax
    16b5:	5a                   	pop    %edx
    16b6:	68 3a 43 00 00       	push   $0x433a
    16bb:	68 3a 43 00 00       	push   $0x433a
    16c0:	e8 3d 22 00 00       	call   3902 <link>
    16c5:	83 c4 10             	add    $0x10,%esp
    16c8:	85 c0                	test   %eax,%eax
    16ca:	0f 89 8e 00 00 00    	jns    175e <linktest+0x19e>
    16d0:	83 ec 0c             	sub    $0xc,%esp
    16d3:	68 3a 43 00 00       	push   $0x433a
    16d8:	e8 15 22 00 00       	call   38f2 <unlink>
    16dd:	59                   	pop    %ecx
    16de:	5b                   	pop    %ebx
    16df:	68 36 43 00 00       	push   $0x4336
    16e4:	68 3a 43 00 00       	push   $0x433a
    16e9:	e8 14 22 00 00       	call   3902 <link>
    16ee:	83 c4 10             	add    $0x10,%esp
    16f1:	85 c0                	test   %eax,%eax
    16f3:	79 56                	jns    174b <linktest+0x18b>
    16f5:	83 ec 08             	sub    $0x8,%esp
    16f8:	68 36 43 00 00       	push   $0x4336
    16fd:	68 fe 45 00 00       	push   $0x45fe
    1702:	e8 fb 21 00 00       	call   3902 <link>
    1707:	83 c4 10             	add    $0x10,%esp
    170a:	85 c0                	test   %eax,%eax
    170c:	79 2a                	jns    1738 <linktest+0x178>
    170e:	83 ec 08             	sub    $0x8,%esp
    1711:	68 d4 43 00 00       	push   $0x43d4
    1716:	6a 01                	push   $0x1
    1718:	e8 f3 22 00 00       	call   3a10 <printf>
    171d:	83 c4 10             	add    $0x10,%esp
    1720:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1723:	c9                   	leave  
    1724:	c3                   	ret    
    1725:	50                   	push   %eax
    1726:	50                   	push   %eax
    1727:	68 3e 43 00 00       	push   $0x433e
    172c:	6a 01                	push   $0x1
    172e:	e8 dd 22 00 00       	call   3a10 <printf>
    1733:	e8 6a 21 00 00       	call   38a2 <exit>
    1738:	50                   	push   %eax
    1739:	50                   	push   %eax
    173a:	68 b8 43 00 00       	push   $0x43b8
    173f:	6a 01                	push   $0x1
    1741:	e8 ca 22 00 00       	call   3a10 <printf>
    1746:	e8 57 21 00 00       	call   38a2 <exit>
    174b:	52                   	push   %edx
    174c:	52                   	push   %edx
    174d:	68 6c 4f 00 00       	push   $0x4f6c
    1752:	6a 01                	push   $0x1
    1754:	e8 b7 22 00 00       	call   3a10 <printf>
    1759:	e8 44 21 00 00       	call   38a2 <exit>
    175e:	50                   	push   %eax
    175f:	50                   	push   %eax
    1760:	68 9a 43 00 00       	push   $0x439a
    1765:	6a 01                	push   $0x1
    1767:	e8 a4 22 00 00       	call   3a10 <printf>
    176c:	e8 31 21 00 00       	call   38a2 <exit>
    1771:	51                   	push   %ecx
    1772:	51                   	push   %ecx
    1773:	68 89 43 00 00       	push   $0x4389
    1778:	6a 01                	push   $0x1
    177a:	e8 91 22 00 00       	call   3a10 <printf>
    177f:	e8 1e 21 00 00       	call   38a2 <exit>
    1784:	53                   	push   %ebx
    1785:	53                   	push   %ebx
    1786:	68 78 43 00 00       	push   $0x4378
    178b:	6a 01                	push   $0x1
    178d:	e8 7e 22 00 00       	call   3a10 <printf>
    1792:	e8 0b 21 00 00       	call   38a2 <exit>
    1797:	50                   	push   %eax
    1798:	50                   	push   %eax
    1799:	68 44 4f 00 00       	push   $0x4f44
    179e:	6a 01                	push   $0x1
    17a0:	e8 6b 22 00 00       	call   3a10 <printf>
    17a5:	e8 f8 20 00 00       	call   38a2 <exit>
    17aa:	51                   	push   %ecx
    17ab:	51                   	push   %ecx
    17ac:	68 63 43 00 00       	push   $0x4363
    17b1:	6a 01                	push   $0x1
    17b3:	e8 58 22 00 00       	call   3a10 <printf>
    17b8:	e8 e5 20 00 00       	call   38a2 <exit>
    17bd:	50                   	push   %eax
    17be:	50                   	push   %eax
    17bf:	68 51 43 00 00       	push   $0x4351
    17c4:	6a 01                	push   $0x1
    17c6:	e8 45 22 00 00       	call   3a10 <printf>
    17cb:	e8 d2 20 00 00       	call   38a2 <exit>

000017d0 <concreate>:
    17d0:	55                   	push   %ebp
    17d1:	89 e5                	mov    %esp,%ebp
    17d3:	57                   	push   %edi
    17d4:	56                   	push   %esi
    17d5:	53                   	push   %ebx
    17d6:	31 f6                	xor    %esi,%esi
    17d8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    17db:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
    17e0:	83 ec 64             	sub    $0x64,%esp
    17e3:	68 e1 43 00 00       	push   $0x43e1
    17e8:	6a 01                	push   $0x1
    17ea:	e8 21 22 00 00       	call   3a10 <printf>
    17ef:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
    17f3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17f7:	83 c4 10             	add    $0x10,%esp
    17fa:	eb 4c                	jmp    1848 <concreate+0x78>
    17fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1800:	89 f0                	mov    %esi,%eax
    1802:	89 f1                	mov    %esi,%ecx
    1804:	f7 e7                	mul    %edi
    1806:	d1 ea                	shr    %edx
    1808:	8d 04 52             	lea    (%edx,%edx,2),%eax
    180b:	29 c1                	sub    %eax,%ecx
    180d:	83 f9 01             	cmp    $0x1,%ecx
    1810:	0f 84 ba 00 00 00    	je     18d0 <concreate+0x100>
    1816:	83 ec 08             	sub    $0x8,%esp
    1819:	68 02 02 00 00       	push   $0x202
    181e:	53                   	push   %ebx
    181f:	e8 be 20 00 00       	call   38e2 <open>
    1824:	83 c4 10             	add    $0x10,%esp
    1827:	85 c0                	test   %eax,%eax
    1829:	78 67                	js     1892 <concreate+0xc2>
    182b:	83 ec 0c             	sub    $0xc,%esp
    182e:	83 c6 01             	add    $0x1,%esi
    1831:	50                   	push   %eax
    1832:	e8 93 20 00 00       	call   38ca <close>
    1837:	83 c4 10             	add    $0x10,%esp
    183a:	e8 6b 20 00 00       	call   38aa <wait>
    183f:	83 fe 28             	cmp    $0x28,%esi
    1842:	0f 84 aa 00 00 00    	je     18f2 <concreate+0x122>
    1848:	83 ec 0c             	sub    $0xc,%esp
    184b:	8d 46 30             	lea    0x30(%esi),%eax
    184e:	53                   	push   %ebx
    184f:	88 45 ae             	mov    %al,-0x52(%ebp)
    1852:	e8 9b 20 00 00       	call   38f2 <unlink>
    1857:	e8 3e 20 00 00       	call   389a <fork>
    185c:	83 c4 10             	add    $0x10,%esp
    185f:	85 c0                	test   %eax,%eax
    1861:	75 9d                	jne    1800 <concreate+0x30>
    1863:	89 f0                	mov    %esi,%eax
    1865:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    186a:	f7 e2                	mul    %edx
    186c:	c1 ea 02             	shr    $0x2,%edx
    186f:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1872:	29 c6                	sub    %eax,%esi
    1874:	83 fe 01             	cmp    $0x1,%esi
    1877:	74 37                	je     18b0 <concreate+0xe0>
    1879:	83 ec 08             	sub    $0x8,%esp
    187c:	68 02 02 00 00       	push   $0x202
    1881:	53                   	push   %ebx
    1882:	e8 5b 20 00 00       	call   38e2 <open>
    1887:	83 c4 10             	add    $0x10,%esp
    188a:	85 c0                	test   %eax,%eax
    188c:	0f 89 28 02 00 00    	jns    1aba <concreate+0x2ea>
    1892:	83 ec 04             	sub    $0x4,%esp
    1895:	53                   	push   %ebx
    1896:	68 f4 43 00 00       	push   $0x43f4
    189b:	6a 01                	push   $0x1
    189d:	e8 6e 21 00 00       	call   3a10 <printf>
    18a2:	e8 fb 1f 00 00       	call   38a2 <exit>
    18a7:	89 f6                	mov    %esi,%esi
    18a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    18b0:	83 ec 08             	sub    $0x8,%esp
    18b3:	53                   	push   %ebx
    18b4:	68 f1 43 00 00       	push   $0x43f1
    18b9:	e8 44 20 00 00       	call   3902 <link>
    18be:	83 c4 10             	add    $0x10,%esp
    18c1:	e8 dc 1f 00 00       	call   38a2 <exit>
    18c6:	8d 76 00             	lea    0x0(%esi),%esi
    18c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    18d0:	83 ec 08             	sub    $0x8,%esp
    18d3:	83 c6 01             	add    $0x1,%esi
    18d6:	53                   	push   %ebx
    18d7:	68 f1 43 00 00       	push   $0x43f1
    18dc:	e8 21 20 00 00       	call   3902 <link>
    18e1:	83 c4 10             	add    $0x10,%esp
    18e4:	e8 c1 1f 00 00       	call   38aa <wait>
    18e9:	83 fe 28             	cmp    $0x28,%esi
    18ec:	0f 85 56 ff ff ff    	jne    1848 <concreate+0x78>
    18f2:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18f5:	83 ec 04             	sub    $0x4,%esp
    18f8:	6a 28                	push   $0x28
    18fa:	6a 00                	push   $0x0
    18fc:	50                   	push   %eax
    18fd:	e8 fe 1d 00 00       	call   3700 <memset>
    1902:	5f                   	pop    %edi
    1903:	58                   	pop    %eax
    1904:	6a 00                	push   $0x0
    1906:	68 fe 45 00 00       	push   $0x45fe
    190b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    190e:	e8 cf 1f 00 00       	call   38e2 <open>
    1913:	83 c4 10             	add    $0x10,%esp
    1916:	89 c6                	mov    %eax,%esi
    1918:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    191f:	90                   	nop
    1920:	83 ec 04             	sub    $0x4,%esp
    1923:	6a 10                	push   $0x10
    1925:	57                   	push   %edi
    1926:	56                   	push   %esi
    1927:	e8 8e 1f 00 00       	call   38ba <read>
    192c:	83 c4 10             	add    $0x10,%esp
    192f:	85 c0                	test   %eax,%eax
    1931:	7e 3d                	jle    1970 <concreate+0x1a0>
    1933:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1938:	74 e6                	je     1920 <concreate+0x150>
    193a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    193e:	75 e0                	jne    1920 <concreate+0x150>
    1940:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1944:	75 da                	jne    1920 <concreate+0x150>
    1946:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    194a:	83 e8 30             	sub    $0x30,%eax
    194d:	83 f8 27             	cmp    $0x27,%eax
    1950:	0f 87 4e 01 00 00    	ja     1aa4 <concreate+0x2d4>
    1956:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    195b:	0f 85 2d 01 00 00    	jne    1a8e <concreate+0x2be>
    1961:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
    1966:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    196a:	eb b4                	jmp    1920 <concreate+0x150>
    196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1970:	83 ec 0c             	sub    $0xc,%esp
    1973:	56                   	push   %esi
    1974:	e8 51 1f 00 00       	call   38ca <close>
    1979:	83 c4 10             	add    $0x10,%esp
    197c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1980:	0f 85 f5 00 00 00    	jne    1a7b <concreate+0x2ab>
    1986:	31 f6                	xor    %esi,%esi
    1988:	eb 48                	jmp    19d2 <concreate+0x202>
    198a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1990:	85 ff                	test   %edi,%edi
    1992:	74 05                	je     1999 <concreate+0x1c9>
    1994:	83 fa 01             	cmp    $0x1,%edx
    1997:	74 64                	je     19fd <concreate+0x22d>
    1999:	83 ec 0c             	sub    $0xc,%esp
    199c:	53                   	push   %ebx
    199d:	e8 50 1f 00 00       	call   38f2 <unlink>
    19a2:	89 1c 24             	mov    %ebx,(%esp)
    19a5:	e8 48 1f 00 00       	call   38f2 <unlink>
    19aa:	89 1c 24             	mov    %ebx,(%esp)
    19ad:	e8 40 1f 00 00       	call   38f2 <unlink>
    19b2:	89 1c 24             	mov    %ebx,(%esp)
    19b5:	e8 38 1f 00 00       	call   38f2 <unlink>
    19ba:	83 c4 10             	add    $0x10,%esp
    19bd:	85 ff                	test   %edi,%edi
    19bf:	0f 84 fc fe ff ff    	je     18c1 <concreate+0xf1>
    19c5:	83 c6 01             	add    $0x1,%esi
    19c8:	e8 dd 1e 00 00       	call   38aa <wait>
    19cd:	83 fe 28             	cmp    $0x28,%esi
    19d0:	74 7e                	je     1a50 <concreate+0x280>
    19d2:	8d 46 30             	lea    0x30(%esi),%eax
    19d5:	88 45 ae             	mov    %al,-0x52(%ebp)
    19d8:	e8 bd 1e 00 00       	call   389a <fork>
    19dd:	85 c0                	test   %eax,%eax
    19df:	89 c7                	mov    %eax,%edi
    19e1:	0f 88 80 00 00 00    	js     1a67 <concreate+0x297>
    19e7:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    19ec:	f7 e6                	mul    %esi
    19ee:	d1 ea                	shr    %edx
    19f0:	8d 04 52             	lea    (%edx,%edx,2),%eax
    19f3:	89 f2                	mov    %esi,%edx
    19f5:	29 c2                	sub    %eax,%edx
    19f7:	89 d0                	mov    %edx,%eax
    19f9:	09 f8                	or     %edi,%eax
    19fb:	75 93                	jne    1990 <concreate+0x1c0>
    19fd:	83 ec 08             	sub    $0x8,%esp
    1a00:	6a 00                	push   $0x0
    1a02:	53                   	push   %ebx
    1a03:	e8 da 1e 00 00       	call   38e2 <open>
    1a08:	89 04 24             	mov    %eax,(%esp)
    1a0b:	e8 ba 1e 00 00       	call   38ca <close>
    1a10:	58                   	pop    %eax
    1a11:	5a                   	pop    %edx
    1a12:	6a 00                	push   $0x0
    1a14:	53                   	push   %ebx
    1a15:	e8 c8 1e 00 00       	call   38e2 <open>
    1a1a:	89 04 24             	mov    %eax,(%esp)
    1a1d:	e8 a8 1e 00 00       	call   38ca <close>
    1a22:	59                   	pop    %ecx
    1a23:	58                   	pop    %eax
    1a24:	6a 00                	push   $0x0
    1a26:	53                   	push   %ebx
    1a27:	e8 b6 1e 00 00       	call   38e2 <open>
    1a2c:	89 04 24             	mov    %eax,(%esp)
    1a2f:	e8 96 1e 00 00       	call   38ca <close>
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
    1a50:	83 ec 08             	sub    $0x8,%esp
    1a53:	68 46 44 00 00       	push   $0x4446
    1a58:	6a 01                	push   $0x1
    1a5a:	e8 b1 1f 00 00       	call   3a10 <printf>
    1a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a62:	5b                   	pop    %ebx
    1a63:	5e                   	pop    %esi
    1a64:	5f                   	pop    %edi
    1a65:	5d                   	pop    %ebp
    1a66:	c3                   	ret    
    1a67:	83 ec 08             	sub    $0x8,%esp
    1a6a:	68 c9 4c 00 00       	push   $0x4cc9
    1a6f:	6a 01                	push   $0x1
    1a71:	e8 9a 1f 00 00       	call   3a10 <printf>
    1a76:	e8 27 1e 00 00       	call   38a2 <exit>
    1a7b:	51                   	push   %ecx
    1a7c:	51                   	push   %ecx
    1a7d:	68 90 4f 00 00       	push   $0x4f90
    1a82:	6a 01                	push   $0x1
    1a84:	e8 87 1f 00 00       	call   3a10 <printf>
    1a89:	e8 14 1e 00 00       	call   38a2 <exit>
    1a8e:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a91:	53                   	push   %ebx
    1a92:	50                   	push   %eax
    1a93:	68 29 44 00 00       	push   $0x4429
    1a98:	6a 01                	push   $0x1
    1a9a:	e8 71 1f 00 00       	call   3a10 <printf>
    1a9f:	e8 fe 1d 00 00       	call   38a2 <exit>
    1aa4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1aa7:	56                   	push   %esi
    1aa8:	50                   	push   %eax
    1aa9:	68 10 44 00 00       	push   $0x4410
    1aae:	6a 01                	push   $0x1
    1ab0:	e8 5b 1f 00 00       	call   3a10 <printf>
    1ab5:	e8 e8 1d 00 00       	call   38a2 <exit>
    1aba:	83 ec 0c             	sub    $0xc,%esp
    1abd:	50                   	push   %eax
    1abe:	e8 07 1e 00 00       	call   38ca <close>
    1ac3:	83 c4 10             	add    $0x10,%esp
    1ac6:	e9 f6 fd ff ff       	jmp    18c1 <concreate+0xf1>
    1acb:	90                   	nop
    1acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001ad0 <linkunlink>:
    1ad0:	55                   	push   %ebp
    1ad1:	89 e5                	mov    %esp,%ebp
    1ad3:	57                   	push   %edi
    1ad4:	56                   	push   %esi
    1ad5:	53                   	push   %ebx
    1ad6:	83 ec 24             	sub    $0x24,%esp
    1ad9:	68 54 44 00 00       	push   $0x4454
    1ade:	6a 01                	push   $0x1
    1ae0:	e8 2b 1f 00 00       	call   3a10 <printf>
    1ae5:	c7 04 24 e1 46 00 00 	movl   $0x46e1,(%esp)
    1aec:	e8 01 1e 00 00       	call   38f2 <unlink>
    1af1:	e8 a4 1d 00 00       	call   389a <fork>
    1af6:	83 c4 10             	add    $0x10,%esp
    1af9:	85 c0                	test   %eax,%eax
    1afb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1afe:	0f 88 b6 00 00 00    	js     1bba <linkunlink+0xea>
    1b04:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b08:	bb 64 00 00 00       	mov    $0x64,%ebx
    1b0d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
    1b12:	19 ff                	sbb    %edi,%edi
    1b14:	83 e7 60             	and    $0x60,%edi
    1b17:	83 c7 01             	add    $0x1,%edi
    1b1a:	eb 1e                	jmp    1b3a <linkunlink+0x6a>
    1b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1b20:	83 fa 01             	cmp    $0x1,%edx
    1b23:	74 7b                	je     1ba0 <linkunlink+0xd0>
    1b25:	83 ec 0c             	sub    $0xc,%esp
    1b28:	68 e1 46 00 00       	push   $0x46e1
    1b2d:	e8 c0 1d 00 00       	call   38f2 <unlink>
    1b32:	83 c4 10             	add    $0x10,%esp
    1b35:	83 eb 01             	sub    $0x1,%ebx
    1b38:	74 3d                	je     1b77 <linkunlink+0xa7>
    1b3a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b40:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    1b46:	89 f8                	mov    %edi,%eax
    1b48:	f7 e6                	mul    %esi
    1b4a:	d1 ea                	shr    %edx
    1b4c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b4f:	89 fa                	mov    %edi,%edx
    1b51:	29 c2                	sub    %eax,%edx
    1b53:	75 cb                	jne    1b20 <linkunlink+0x50>
    1b55:	83 ec 08             	sub    $0x8,%esp
    1b58:	68 02 02 00 00       	push   $0x202
    1b5d:	68 e1 46 00 00       	push   $0x46e1
    1b62:	e8 7b 1d 00 00       	call   38e2 <open>
    1b67:	89 04 24             	mov    %eax,(%esp)
    1b6a:	e8 5b 1d 00 00       	call   38ca <close>
    1b6f:	83 c4 10             	add    $0x10,%esp
    1b72:	83 eb 01             	sub    $0x1,%ebx
    1b75:	75 c3                	jne    1b3a <linkunlink+0x6a>
    1b77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b7a:	85 c0                	test   %eax,%eax
    1b7c:	74 4f                	je     1bcd <linkunlink+0xfd>
    1b7e:	e8 27 1d 00 00       	call   38aa <wait>
    1b83:	83 ec 08             	sub    $0x8,%esp
    1b86:	68 69 44 00 00       	push   $0x4469
    1b8b:	6a 01                	push   $0x1
    1b8d:	e8 7e 1e 00 00       	call   3a10 <printf>
    1b92:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b95:	5b                   	pop    %ebx
    1b96:	5e                   	pop    %esi
    1b97:	5f                   	pop    %edi
    1b98:	5d                   	pop    %ebp
    1b99:	c3                   	ret    
    1b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ba0:	83 ec 08             	sub    $0x8,%esp
    1ba3:	68 e1 46 00 00       	push   $0x46e1
    1ba8:	68 65 44 00 00       	push   $0x4465
    1bad:	e8 50 1d 00 00       	call   3902 <link>
    1bb2:	83 c4 10             	add    $0x10,%esp
    1bb5:	e9 7b ff ff ff       	jmp    1b35 <linkunlink+0x65>
    1bba:	52                   	push   %edx
    1bbb:	52                   	push   %edx
    1bbc:	68 c9 4c 00 00       	push   $0x4cc9
    1bc1:	6a 01                	push   $0x1
    1bc3:	e8 48 1e 00 00       	call   3a10 <printf>
    1bc8:	e8 d5 1c 00 00       	call   38a2 <exit>
    1bcd:	e8 d0 1c 00 00       	call   38a2 <exit>
    1bd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001be0 <bigdir>:
    1be0:	55                   	push   %ebp
    1be1:	89 e5                	mov    %esp,%ebp
    1be3:	57                   	push   %edi
    1be4:	56                   	push   %esi
    1be5:	53                   	push   %ebx
    1be6:	83 ec 24             	sub    $0x24,%esp
    1be9:	68 78 44 00 00       	push   $0x4478
    1bee:	6a 01                	push   $0x1
    1bf0:	e8 1b 1e 00 00       	call   3a10 <printf>
    1bf5:	c7 04 24 85 44 00 00 	movl   $0x4485,(%esp)
    1bfc:	e8 f1 1c 00 00       	call   38f2 <unlink>
    1c01:	5a                   	pop    %edx
    1c02:	59                   	pop    %ecx
    1c03:	68 00 02 00 00       	push   $0x200
    1c08:	68 85 44 00 00       	push   $0x4485
    1c0d:	e8 d0 1c 00 00       	call   38e2 <open>
    1c12:	83 c4 10             	add    $0x10,%esp
    1c15:	85 c0                	test   %eax,%eax
    1c17:	0f 88 de 00 00 00    	js     1cfb <bigdir+0x11b>
    1c1d:	83 ec 0c             	sub    $0xc,%esp
    1c20:	8d 7d de             	lea    -0x22(%ebp),%edi
    1c23:	31 f6                	xor    %esi,%esi
    1c25:	50                   	push   %eax
    1c26:	e8 9f 1c 00 00       	call   38ca <close>
    1c2b:	83 c4 10             	add    $0x10,%esp
    1c2e:	66 90                	xchg   %ax,%ax
    1c30:	89 f0                	mov    %esi,%eax
    1c32:	83 ec 08             	sub    $0x8,%esp
    1c35:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    1c39:	c1 f8 06             	sar    $0x6,%eax
    1c3c:	57                   	push   %edi
    1c3d:	68 85 44 00 00       	push   $0x4485
    1c42:	83 c0 30             	add    $0x30,%eax
    1c45:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    1c49:	88 45 df             	mov    %al,-0x21(%ebp)
    1c4c:	89 f0                	mov    %esi,%eax
    1c4e:	83 e0 3f             	and    $0x3f,%eax
    1c51:	83 c0 30             	add    $0x30,%eax
    1c54:	88 45 e0             	mov    %al,-0x20(%ebp)
    1c57:	e8 a6 1c 00 00       	call   3902 <link>
    1c5c:	83 c4 10             	add    $0x10,%esp
    1c5f:	85 c0                	test   %eax,%eax
    1c61:	89 c3                	mov    %eax,%ebx
    1c63:	75 6e                	jne    1cd3 <bigdir+0xf3>
    1c65:	83 c6 01             	add    $0x1,%esi
    1c68:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1c6e:	75 c0                	jne    1c30 <bigdir+0x50>
    1c70:	83 ec 0c             	sub    $0xc,%esp
    1c73:	68 85 44 00 00       	push   $0x4485
    1c78:	e8 75 1c 00 00       	call   38f2 <unlink>
    1c7d:	83 c4 10             	add    $0x10,%esp
    1c80:	89 d8                	mov    %ebx,%eax
    1c82:	83 ec 0c             	sub    $0xc,%esp
    1c85:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    1c89:	c1 f8 06             	sar    $0x6,%eax
    1c8c:	57                   	push   %edi
    1c8d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    1c91:	83 c0 30             	add    $0x30,%eax
    1c94:	88 45 df             	mov    %al,-0x21(%ebp)
    1c97:	89 d8                	mov    %ebx,%eax
    1c99:	83 e0 3f             	and    $0x3f,%eax
    1c9c:	83 c0 30             	add    $0x30,%eax
    1c9f:	88 45 e0             	mov    %al,-0x20(%ebp)
    1ca2:	e8 4b 1c 00 00       	call   38f2 <unlink>
    1ca7:	83 c4 10             	add    $0x10,%esp
    1caa:	85 c0                	test   %eax,%eax
    1cac:	75 39                	jne    1ce7 <bigdir+0x107>
    1cae:	83 c3 01             	add    $0x1,%ebx
    1cb1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cb7:	75 c7                	jne    1c80 <bigdir+0xa0>
    1cb9:	83 ec 08             	sub    $0x8,%esp
    1cbc:	68 c7 44 00 00       	push   $0x44c7
    1cc1:	6a 01                	push   $0x1
    1cc3:	e8 48 1d 00 00       	call   3a10 <printf>
    1cc8:	83 c4 10             	add    $0x10,%esp
    1ccb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cce:	5b                   	pop    %ebx
    1ccf:	5e                   	pop    %esi
    1cd0:	5f                   	pop    %edi
    1cd1:	5d                   	pop    %ebp
    1cd2:	c3                   	ret    
    1cd3:	83 ec 08             	sub    $0x8,%esp
    1cd6:	68 9e 44 00 00       	push   $0x449e
    1cdb:	6a 01                	push   $0x1
    1cdd:	e8 2e 1d 00 00       	call   3a10 <printf>
    1ce2:	e8 bb 1b 00 00       	call   38a2 <exit>
    1ce7:	83 ec 08             	sub    $0x8,%esp
    1cea:	68 b2 44 00 00       	push   $0x44b2
    1cef:	6a 01                	push   $0x1
    1cf1:	e8 1a 1d 00 00       	call   3a10 <printf>
    1cf6:	e8 a7 1b 00 00       	call   38a2 <exit>
    1cfb:	50                   	push   %eax
    1cfc:	50                   	push   %eax
    1cfd:	68 88 44 00 00       	push   $0x4488
    1d02:	6a 01                	push   $0x1
    1d04:	e8 07 1d 00 00       	call   3a10 <printf>
    1d09:	e8 94 1b 00 00       	call   38a2 <exit>
    1d0e:	66 90                	xchg   %ax,%ax

00001d10 <subdir>:
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	53                   	push   %ebx
    1d14:	83 ec 0c             	sub    $0xc,%esp
    1d17:	68 d2 44 00 00       	push   $0x44d2
    1d1c:	6a 01                	push   $0x1
    1d1e:	e8 ed 1c 00 00       	call   3a10 <printf>
    1d23:	c7 04 24 5b 45 00 00 	movl   $0x455b,(%esp)
    1d2a:	e8 c3 1b 00 00       	call   38f2 <unlink>
    1d2f:	c7 04 24 f8 45 00 00 	movl   $0x45f8,(%esp)
    1d36:	e8 cf 1b 00 00       	call   390a <mkdir>
    1d3b:	83 c4 10             	add    $0x10,%esp
    1d3e:	85 c0                	test   %eax,%eax
    1d40:	0f 85 b3 05 00 00    	jne    22f9 <subdir+0x5e9>
    1d46:	83 ec 08             	sub    $0x8,%esp
    1d49:	68 02 02 00 00       	push   $0x202
    1d4e:	68 31 45 00 00       	push   $0x4531
    1d53:	e8 8a 1b 00 00       	call   38e2 <open>
    1d58:	83 c4 10             	add    $0x10,%esp
    1d5b:	85 c0                	test   %eax,%eax
    1d5d:	89 c3                	mov    %eax,%ebx
    1d5f:	0f 88 81 05 00 00    	js     22e6 <subdir+0x5d6>
    1d65:	83 ec 04             	sub    $0x4,%esp
    1d68:	6a 02                	push   $0x2
    1d6a:	68 5b 45 00 00       	push   $0x455b
    1d6f:	50                   	push   %eax
    1d70:	e8 4d 1b 00 00       	call   38c2 <write>
    1d75:	89 1c 24             	mov    %ebx,(%esp)
    1d78:	e8 4d 1b 00 00       	call   38ca <close>
    1d7d:	c7 04 24 f8 45 00 00 	movl   $0x45f8,(%esp)
    1d84:	e8 69 1b 00 00       	call   38f2 <unlink>
    1d89:	83 c4 10             	add    $0x10,%esp
    1d8c:	85 c0                	test   %eax,%eax
    1d8e:	0f 89 3f 05 00 00    	jns    22d3 <subdir+0x5c3>
    1d94:	83 ec 0c             	sub    $0xc,%esp
    1d97:	68 0c 45 00 00       	push   $0x450c
    1d9c:	e8 69 1b 00 00       	call   390a <mkdir>
    1da1:	83 c4 10             	add    $0x10,%esp
    1da4:	85 c0                	test   %eax,%eax
    1da6:	0f 85 14 05 00 00    	jne    22c0 <subdir+0x5b0>
    1dac:	83 ec 08             	sub    $0x8,%esp
    1daf:	68 02 02 00 00       	push   $0x202
    1db4:	68 2e 45 00 00       	push   $0x452e
    1db9:	e8 24 1b 00 00       	call   38e2 <open>
    1dbe:	83 c4 10             	add    $0x10,%esp
    1dc1:	85 c0                	test   %eax,%eax
    1dc3:	89 c3                	mov    %eax,%ebx
    1dc5:	0f 88 24 04 00 00    	js     21ef <subdir+0x4df>
    1dcb:	83 ec 04             	sub    $0x4,%esp
    1dce:	6a 02                	push   $0x2
    1dd0:	68 4f 45 00 00       	push   $0x454f
    1dd5:	50                   	push   %eax
    1dd6:	e8 e7 1a 00 00       	call   38c2 <write>
    1ddb:	89 1c 24             	mov    %ebx,(%esp)
    1dde:	e8 e7 1a 00 00       	call   38ca <close>
    1de3:	58                   	pop    %eax
    1de4:	5a                   	pop    %edx
    1de5:	6a 00                	push   $0x0
    1de7:	68 52 45 00 00       	push   $0x4552
    1dec:	e8 f1 1a 00 00       	call   38e2 <open>
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	85 c0                	test   %eax,%eax
    1df6:	89 c3                	mov    %eax,%ebx
    1df8:	0f 88 de 03 00 00    	js     21dc <subdir+0x4cc>
    1dfe:	83 ec 04             	sub    $0x4,%esp
    1e01:	68 00 20 00 00       	push   $0x2000
    1e06:	68 20 86 00 00       	push   $0x8620
    1e0b:	50                   	push   %eax
    1e0c:	e8 a9 1a 00 00       	call   38ba <read>
    1e11:	83 c4 10             	add    $0x10,%esp
    1e14:	83 f8 02             	cmp    $0x2,%eax
    1e17:	0f 85 3a 03 00 00    	jne    2157 <subdir+0x447>
    1e1d:	80 3d 20 86 00 00 66 	cmpb   $0x66,0x8620
    1e24:	0f 85 2d 03 00 00    	jne    2157 <subdir+0x447>
    1e2a:	83 ec 0c             	sub    $0xc,%esp
    1e2d:	53                   	push   %ebx
    1e2e:	e8 97 1a 00 00       	call   38ca <close>
    1e33:	5b                   	pop    %ebx
    1e34:	58                   	pop    %eax
    1e35:	68 92 45 00 00       	push   $0x4592
    1e3a:	68 2e 45 00 00       	push   $0x452e
    1e3f:	e8 be 1a 00 00       	call   3902 <link>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	85 c0                	test   %eax,%eax
    1e49:	0f 85 c6 03 00 00    	jne    2215 <subdir+0x505>
    1e4f:	83 ec 0c             	sub    $0xc,%esp
    1e52:	68 2e 45 00 00       	push   $0x452e
    1e57:	e8 96 1a 00 00       	call   38f2 <unlink>
    1e5c:	83 c4 10             	add    $0x10,%esp
    1e5f:	85 c0                	test   %eax,%eax
    1e61:	0f 85 16 03 00 00    	jne    217d <subdir+0x46d>
    1e67:	83 ec 08             	sub    $0x8,%esp
    1e6a:	6a 00                	push   $0x0
    1e6c:	68 2e 45 00 00       	push   $0x452e
    1e71:	e8 6c 1a 00 00       	call   38e2 <open>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	85 c0                	test   %eax,%eax
    1e7b:	0f 89 2c 04 00 00    	jns    22ad <subdir+0x59d>
    1e81:	83 ec 0c             	sub    $0xc,%esp
    1e84:	68 f8 45 00 00       	push   $0x45f8
    1e89:	e8 84 1a 00 00       	call   3912 <chdir>
    1e8e:	83 c4 10             	add    $0x10,%esp
    1e91:	85 c0                	test   %eax,%eax
    1e93:	0f 85 01 04 00 00    	jne    229a <subdir+0x58a>
    1e99:	83 ec 0c             	sub    $0xc,%esp
    1e9c:	68 c6 45 00 00       	push   $0x45c6
    1ea1:	e8 6c 1a 00 00       	call   3912 <chdir>
    1ea6:	83 c4 10             	add    $0x10,%esp
    1ea9:	85 c0                	test   %eax,%eax
    1eab:	0f 85 b9 02 00 00    	jne    216a <subdir+0x45a>
    1eb1:	83 ec 0c             	sub    $0xc,%esp
    1eb4:	68 ec 45 00 00       	push   $0x45ec
    1eb9:	e8 54 1a 00 00       	call   3912 <chdir>
    1ebe:	83 c4 10             	add    $0x10,%esp
    1ec1:	85 c0                	test   %eax,%eax
    1ec3:	0f 85 a1 02 00 00    	jne    216a <subdir+0x45a>
    1ec9:	83 ec 0c             	sub    $0xc,%esp
    1ecc:	68 fb 45 00 00       	push   $0x45fb
    1ed1:	e8 3c 1a 00 00       	call   3912 <chdir>
    1ed6:	83 c4 10             	add    $0x10,%esp
    1ed9:	85 c0                	test   %eax,%eax
    1edb:	0f 85 21 03 00 00    	jne    2202 <subdir+0x4f2>
    1ee1:	83 ec 08             	sub    $0x8,%esp
    1ee4:	6a 00                	push   $0x0
    1ee6:	68 92 45 00 00       	push   $0x4592
    1eeb:	e8 f2 19 00 00       	call   38e2 <open>
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	85 c0                	test   %eax,%eax
    1ef5:	89 c3                	mov    %eax,%ebx
    1ef7:	0f 88 e0 04 00 00    	js     23dd <subdir+0x6cd>
    1efd:	83 ec 04             	sub    $0x4,%esp
    1f00:	68 00 20 00 00       	push   $0x2000
    1f05:	68 20 86 00 00       	push   $0x8620
    1f0a:	50                   	push   %eax
    1f0b:	e8 aa 19 00 00       	call   38ba <read>
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	83 f8 02             	cmp    $0x2,%eax
    1f16:	0f 85 ae 04 00 00    	jne    23ca <subdir+0x6ba>
    1f1c:	83 ec 0c             	sub    $0xc,%esp
    1f1f:	53                   	push   %ebx
    1f20:	e8 a5 19 00 00       	call   38ca <close>
    1f25:	59                   	pop    %ecx
    1f26:	5b                   	pop    %ebx
    1f27:	6a 00                	push   $0x0
    1f29:	68 2e 45 00 00       	push   $0x452e
    1f2e:	e8 af 19 00 00       	call   38e2 <open>
    1f33:	83 c4 10             	add    $0x10,%esp
    1f36:	85 c0                	test   %eax,%eax
    1f38:	0f 89 65 02 00 00    	jns    21a3 <subdir+0x493>
    1f3e:	83 ec 08             	sub    $0x8,%esp
    1f41:	68 02 02 00 00       	push   $0x202
    1f46:	68 46 46 00 00       	push   $0x4646
    1f4b:	e8 92 19 00 00       	call   38e2 <open>
    1f50:	83 c4 10             	add    $0x10,%esp
    1f53:	85 c0                	test   %eax,%eax
    1f55:	0f 89 35 02 00 00    	jns    2190 <subdir+0x480>
    1f5b:	83 ec 08             	sub    $0x8,%esp
    1f5e:	68 02 02 00 00       	push   $0x202
    1f63:	68 6b 46 00 00       	push   $0x466b
    1f68:	e8 75 19 00 00       	call   38e2 <open>
    1f6d:	83 c4 10             	add    $0x10,%esp
    1f70:	85 c0                	test   %eax,%eax
    1f72:	0f 89 0f 03 00 00    	jns    2287 <subdir+0x577>
    1f78:	83 ec 08             	sub    $0x8,%esp
    1f7b:	68 00 02 00 00       	push   $0x200
    1f80:	68 f8 45 00 00       	push   $0x45f8
    1f85:	e8 58 19 00 00       	call   38e2 <open>
    1f8a:	83 c4 10             	add    $0x10,%esp
    1f8d:	85 c0                	test   %eax,%eax
    1f8f:	0f 89 df 02 00 00    	jns    2274 <subdir+0x564>
    1f95:	83 ec 08             	sub    $0x8,%esp
    1f98:	6a 02                	push   $0x2
    1f9a:	68 f8 45 00 00       	push   $0x45f8
    1f9f:	e8 3e 19 00 00       	call   38e2 <open>
    1fa4:	83 c4 10             	add    $0x10,%esp
    1fa7:	85 c0                	test   %eax,%eax
    1fa9:	0f 89 b2 02 00 00    	jns    2261 <subdir+0x551>
    1faf:	83 ec 08             	sub    $0x8,%esp
    1fb2:	6a 01                	push   $0x1
    1fb4:	68 f8 45 00 00       	push   $0x45f8
    1fb9:	e8 24 19 00 00       	call   38e2 <open>
    1fbe:	83 c4 10             	add    $0x10,%esp
    1fc1:	85 c0                	test   %eax,%eax
    1fc3:	0f 89 85 02 00 00    	jns    224e <subdir+0x53e>
    1fc9:	83 ec 08             	sub    $0x8,%esp
    1fcc:	68 da 46 00 00       	push   $0x46da
    1fd1:	68 46 46 00 00       	push   $0x4646
    1fd6:	e8 27 19 00 00       	call   3902 <link>
    1fdb:	83 c4 10             	add    $0x10,%esp
    1fde:	85 c0                	test   %eax,%eax
    1fe0:	0f 84 55 02 00 00    	je     223b <subdir+0x52b>
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 da 46 00 00       	push   $0x46da
    1fee:	68 6b 46 00 00       	push   $0x466b
    1ff3:	e8 0a 19 00 00       	call   3902 <link>
    1ff8:	83 c4 10             	add    $0x10,%esp
    1ffb:	85 c0                	test   %eax,%eax
    1ffd:	0f 84 25 02 00 00    	je     2228 <subdir+0x518>
    2003:	83 ec 08             	sub    $0x8,%esp
    2006:	68 92 45 00 00       	push   $0x4592
    200b:	68 31 45 00 00       	push   $0x4531
    2010:	e8 ed 18 00 00       	call   3902 <link>
    2015:	83 c4 10             	add    $0x10,%esp
    2018:	85 c0                	test   %eax,%eax
    201a:	0f 84 a9 01 00 00    	je     21c9 <subdir+0x4b9>
    2020:	83 ec 0c             	sub    $0xc,%esp
    2023:	68 46 46 00 00       	push   $0x4646
    2028:	e8 dd 18 00 00       	call   390a <mkdir>
    202d:	83 c4 10             	add    $0x10,%esp
    2030:	85 c0                	test   %eax,%eax
    2032:	0f 84 7e 01 00 00    	je     21b6 <subdir+0x4a6>
    2038:	83 ec 0c             	sub    $0xc,%esp
    203b:	68 6b 46 00 00       	push   $0x466b
    2040:	e8 c5 18 00 00       	call   390a <mkdir>
    2045:	83 c4 10             	add    $0x10,%esp
    2048:	85 c0                	test   %eax,%eax
    204a:	0f 84 67 03 00 00    	je     23b7 <subdir+0x6a7>
    2050:	83 ec 0c             	sub    $0xc,%esp
    2053:	68 92 45 00 00       	push   $0x4592
    2058:	e8 ad 18 00 00       	call   390a <mkdir>
    205d:	83 c4 10             	add    $0x10,%esp
    2060:	85 c0                	test   %eax,%eax
    2062:	0f 84 3c 03 00 00    	je     23a4 <subdir+0x694>
    2068:	83 ec 0c             	sub    $0xc,%esp
    206b:	68 6b 46 00 00       	push   $0x466b
    2070:	e8 7d 18 00 00       	call   38f2 <unlink>
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	85 c0                	test   %eax,%eax
    207a:	0f 84 11 03 00 00    	je     2391 <subdir+0x681>
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	68 46 46 00 00       	push   $0x4646
    2088:	e8 65 18 00 00       	call   38f2 <unlink>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	85 c0                	test   %eax,%eax
    2092:	0f 84 e6 02 00 00    	je     237e <subdir+0x66e>
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	68 31 45 00 00       	push   $0x4531
    20a0:	e8 6d 18 00 00       	call   3912 <chdir>
    20a5:	83 c4 10             	add    $0x10,%esp
    20a8:	85 c0                	test   %eax,%eax
    20aa:	0f 84 bb 02 00 00    	je     236b <subdir+0x65b>
    20b0:	83 ec 0c             	sub    $0xc,%esp
    20b3:	68 dd 46 00 00       	push   $0x46dd
    20b8:	e8 55 18 00 00       	call   3912 <chdir>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 84 90 02 00 00    	je     2358 <subdir+0x648>
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 92 45 00 00       	push   $0x4592
    20d0:	e8 1d 18 00 00       	call   38f2 <unlink>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	85 c0                	test   %eax,%eax
    20da:	0f 85 9d 00 00 00    	jne    217d <subdir+0x46d>
    20e0:	83 ec 0c             	sub    $0xc,%esp
    20e3:	68 31 45 00 00       	push   $0x4531
    20e8:	e8 05 18 00 00       	call   38f2 <unlink>
    20ed:	83 c4 10             	add    $0x10,%esp
    20f0:	85 c0                	test   %eax,%eax
    20f2:	0f 85 4d 02 00 00    	jne    2345 <subdir+0x635>
    20f8:	83 ec 0c             	sub    $0xc,%esp
    20fb:	68 f8 45 00 00       	push   $0x45f8
    2100:	e8 ed 17 00 00       	call   38f2 <unlink>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	85 c0                	test   %eax,%eax
    210a:	0f 84 22 02 00 00    	je     2332 <subdir+0x622>
    2110:	83 ec 0c             	sub    $0xc,%esp
    2113:	68 0d 45 00 00       	push   $0x450d
    2118:	e8 d5 17 00 00       	call   38f2 <unlink>
    211d:	83 c4 10             	add    $0x10,%esp
    2120:	85 c0                	test   %eax,%eax
    2122:	0f 88 f7 01 00 00    	js     231f <subdir+0x60f>
    2128:	83 ec 0c             	sub    $0xc,%esp
    212b:	68 f8 45 00 00       	push   $0x45f8
    2130:	e8 bd 17 00 00       	call   38f2 <unlink>
    2135:	83 c4 10             	add    $0x10,%esp
    2138:	85 c0                	test   %eax,%eax
    213a:	0f 88 cc 01 00 00    	js     230c <subdir+0x5fc>
    2140:	83 ec 08             	sub    $0x8,%esp
    2143:	68 da 47 00 00       	push   $0x47da
    2148:	6a 01                	push   $0x1
    214a:	e8 c1 18 00 00       	call   3a10 <printf>
    214f:	83 c4 10             	add    $0x10,%esp
    2152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2155:	c9                   	leave  
    2156:	c3                   	ret    
    2157:	50                   	push   %eax
    2158:	50                   	push   %eax
    2159:	68 77 45 00 00       	push   $0x4577
    215e:	6a 01                	push   $0x1
    2160:	e8 ab 18 00 00       	call   3a10 <printf>
    2165:	e8 38 17 00 00       	call   38a2 <exit>
    216a:	50                   	push   %eax
    216b:	50                   	push   %eax
    216c:	68 d2 45 00 00       	push   $0x45d2
    2171:	6a 01                	push   $0x1
    2173:	e8 98 18 00 00       	call   3a10 <printf>
    2178:	e8 25 17 00 00       	call   38a2 <exit>
    217d:	52                   	push   %edx
    217e:	52                   	push   %edx
    217f:	68 9d 45 00 00       	push   $0x459d
    2184:	6a 01                	push   $0x1
    2186:	e8 85 18 00 00       	call   3a10 <printf>
    218b:	e8 12 17 00 00       	call   38a2 <exit>
    2190:	50                   	push   %eax
    2191:	50                   	push   %eax
    2192:	68 4f 46 00 00       	push   $0x464f
    2197:	6a 01                	push   $0x1
    2199:	e8 72 18 00 00       	call   3a10 <printf>
    219e:	e8 ff 16 00 00       	call   38a2 <exit>
    21a3:	52                   	push   %edx
    21a4:	52                   	push   %edx
    21a5:	68 34 50 00 00       	push   $0x5034
    21aa:	6a 01                	push   $0x1
    21ac:	e8 5f 18 00 00       	call   3a10 <printf>
    21b1:	e8 ec 16 00 00       	call   38a2 <exit>
    21b6:	52                   	push   %edx
    21b7:	52                   	push   %edx
    21b8:	68 e3 46 00 00       	push   $0x46e3
    21bd:	6a 01                	push   $0x1
    21bf:	e8 4c 18 00 00       	call   3a10 <printf>
    21c4:	e8 d9 16 00 00       	call   38a2 <exit>
    21c9:	51                   	push   %ecx
    21ca:	51                   	push   %ecx
    21cb:	68 a4 50 00 00       	push   $0x50a4
    21d0:	6a 01                	push   $0x1
    21d2:	e8 39 18 00 00       	call   3a10 <printf>
    21d7:	e8 c6 16 00 00       	call   38a2 <exit>
    21dc:	50                   	push   %eax
    21dd:	50                   	push   %eax
    21de:	68 5e 45 00 00       	push   $0x455e
    21e3:	6a 01                	push   $0x1
    21e5:	e8 26 18 00 00       	call   3a10 <printf>
    21ea:	e8 b3 16 00 00       	call   38a2 <exit>
    21ef:	51                   	push   %ecx
    21f0:	51                   	push   %ecx
    21f1:	68 37 45 00 00       	push   $0x4537
    21f6:	6a 01                	push   $0x1
    21f8:	e8 13 18 00 00       	call   3a10 <printf>
    21fd:	e8 a0 16 00 00       	call   38a2 <exit>
    2202:	50                   	push   %eax
    2203:	50                   	push   %eax
    2204:	68 00 46 00 00       	push   $0x4600
    2209:	6a 01                	push   $0x1
    220b:	e8 00 18 00 00       	call   3a10 <printf>
    2210:	e8 8d 16 00 00       	call   38a2 <exit>
    2215:	51                   	push   %ecx
    2216:	51                   	push   %ecx
    2217:	68 ec 4f 00 00       	push   $0x4fec
    221c:	6a 01                	push   $0x1
    221e:	e8 ed 17 00 00       	call   3a10 <printf>
    2223:	e8 7a 16 00 00       	call   38a2 <exit>
    2228:	53                   	push   %ebx
    2229:	53                   	push   %ebx
    222a:	68 80 50 00 00       	push   $0x5080
    222f:	6a 01                	push   $0x1
    2231:	e8 da 17 00 00       	call   3a10 <printf>
    2236:	e8 67 16 00 00       	call   38a2 <exit>
    223b:	50                   	push   %eax
    223c:	50                   	push   %eax
    223d:	68 5c 50 00 00       	push   $0x505c
    2242:	6a 01                	push   $0x1
    2244:	e8 c7 17 00 00       	call   3a10 <printf>
    2249:	e8 54 16 00 00       	call   38a2 <exit>
    224e:	50                   	push   %eax
    224f:	50                   	push   %eax
    2250:	68 bf 46 00 00       	push   $0x46bf
    2255:	6a 01                	push   $0x1
    2257:	e8 b4 17 00 00       	call   3a10 <printf>
    225c:	e8 41 16 00 00       	call   38a2 <exit>
    2261:	50                   	push   %eax
    2262:	50                   	push   %eax
    2263:	68 a6 46 00 00       	push   $0x46a6
    2268:	6a 01                	push   $0x1
    226a:	e8 a1 17 00 00       	call   3a10 <printf>
    226f:	e8 2e 16 00 00       	call   38a2 <exit>
    2274:	50                   	push   %eax
    2275:	50                   	push   %eax
    2276:	68 90 46 00 00       	push   $0x4690
    227b:	6a 01                	push   $0x1
    227d:	e8 8e 17 00 00       	call   3a10 <printf>
    2282:	e8 1b 16 00 00       	call   38a2 <exit>
    2287:	50                   	push   %eax
    2288:	50                   	push   %eax
    2289:	68 74 46 00 00       	push   $0x4674
    228e:	6a 01                	push   $0x1
    2290:	e8 7b 17 00 00       	call   3a10 <printf>
    2295:	e8 08 16 00 00       	call   38a2 <exit>
    229a:	50                   	push   %eax
    229b:	50                   	push   %eax
    229c:	68 b5 45 00 00       	push   $0x45b5
    22a1:	6a 01                	push   $0x1
    22a3:	e8 68 17 00 00       	call   3a10 <printf>
    22a8:	e8 f5 15 00 00       	call   38a2 <exit>
    22ad:	50                   	push   %eax
    22ae:	50                   	push   %eax
    22af:	68 10 50 00 00       	push   $0x5010
    22b4:	6a 01                	push   $0x1
    22b6:	e8 55 17 00 00       	call   3a10 <printf>
    22bb:	e8 e2 15 00 00       	call   38a2 <exit>
    22c0:	53                   	push   %ebx
    22c1:	53                   	push   %ebx
    22c2:	68 13 45 00 00       	push   $0x4513
    22c7:	6a 01                	push   $0x1
    22c9:	e8 42 17 00 00       	call   3a10 <printf>
    22ce:	e8 cf 15 00 00       	call   38a2 <exit>
    22d3:	50                   	push   %eax
    22d4:	50                   	push   %eax
    22d5:	68 c4 4f 00 00       	push   $0x4fc4
    22da:	6a 01                	push   $0x1
    22dc:	e8 2f 17 00 00       	call   3a10 <printf>
    22e1:	e8 bc 15 00 00       	call   38a2 <exit>
    22e6:	50                   	push   %eax
    22e7:	50                   	push   %eax
    22e8:	68 f7 44 00 00       	push   $0x44f7
    22ed:	6a 01                	push   $0x1
    22ef:	e8 1c 17 00 00       	call   3a10 <printf>
    22f4:	e8 a9 15 00 00       	call   38a2 <exit>
    22f9:	50                   	push   %eax
    22fa:	50                   	push   %eax
    22fb:	68 df 44 00 00       	push   $0x44df
    2300:	6a 01                	push   $0x1
    2302:	e8 09 17 00 00       	call   3a10 <printf>
    2307:	e8 96 15 00 00       	call   38a2 <exit>
    230c:	50                   	push   %eax
    230d:	50                   	push   %eax
    230e:	68 c8 47 00 00       	push   $0x47c8
    2313:	6a 01                	push   $0x1
    2315:	e8 f6 16 00 00       	call   3a10 <printf>
    231a:	e8 83 15 00 00       	call   38a2 <exit>
    231f:	52                   	push   %edx
    2320:	52                   	push   %edx
    2321:	68 b3 47 00 00       	push   $0x47b3
    2326:	6a 01                	push   $0x1
    2328:	e8 e3 16 00 00       	call   3a10 <printf>
    232d:	e8 70 15 00 00       	call   38a2 <exit>
    2332:	51                   	push   %ecx
    2333:	51                   	push   %ecx
    2334:	68 c8 50 00 00       	push   $0x50c8
    2339:	6a 01                	push   $0x1
    233b:	e8 d0 16 00 00       	call   3a10 <printf>
    2340:	e8 5d 15 00 00       	call   38a2 <exit>
    2345:	53                   	push   %ebx
    2346:	53                   	push   %ebx
    2347:	68 9e 47 00 00       	push   $0x479e
    234c:	6a 01                	push   $0x1
    234e:	e8 bd 16 00 00       	call   3a10 <printf>
    2353:	e8 4a 15 00 00       	call   38a2 <exit>
    2358:	50                   	push   %eax
    2359:	50                   	push   %eax
    235a:	68 86 47 00 00       	push   $0x4786
    235f:	6a 01                	push   $0x1
    2361:	e8 aa 16 00 00       	call   3a10 <printf>
    2366:	e8 37 15 00 00       	call   38a2 <exit>
    236b:	50                   	push   %eax
    236c:	50                   	push   %eax
    236d:	68 6e 47 00 00       	push   $0x476e
    2372:	6a 01                	push   $0x1
    2374:	e8 97 16 00 00       	call   3a10 <printf>
    2379:	e8 24 15 00 00       	call   38a2 <exit>
    237e:	50                   	push   %eax
    237f:	50                   	push   %eax
    2380:	68 52 47 00 00       	push   $0x4752
    2385:	6a 01                	push   $0x1
    2387:	e8 84 16 00 00       	call   3a10 <printf>
    238c:	e8 11 15 00 00       	call   38a2 <exit>
    2391:	50                   	push   %eax
    2392:	50                   	push   %eax
    2393:	68 36 47 00 00       	push   $0x4736
    2398:	6a 01                	push   $0x1
    239a:	e8 71 16 00 00       	call   3a10 <printf>
    239f:	e8 fe 14 00 00       	call   38a2 <exit>
    23a4:	50                   	push   %eax
    23a5:	50                   	push   %eax
    23a6:	68 19 47 00 00       	push   $0x4719
    23ab:	6a 01                	push   $0x1
    23ad:	e8 5e 16 00 00       	call   3a10 <printf>
    23b2:	e8 eb 14 00 00       	call   38a2 <exit>
    23b7:	50                   	push   %eax
    23b8:	50                   	push   %eax
    23b9:	68 fe 46 00 00       	push   $0x46fe
    23be:	6a 01                	push   $0x1
    23c0:	e8 4b 16 00 00       	call   3a10 <printf>
    23c5:	e8 d8 14 00 00       	call   38a2 <exit>
    23ca:	50                   	push   %eax
    23cb:	50                   	push   %eax
    23cc:	68 2b 46 00 00       	push   $0x462b
    23d1:	6a 01                	push   $0x1
    23d3:	e8 38 16 00 00       	call   3a10 <printf>
    23d8:	e8 c5 14 00 00       	call   38a2 <exit>
    23dd:	50                   	push   %eax
    23de:	50                   	push   %eax
    23df:	68 13 46 00 00       	push   $0x4613
    23e4:	6a 01                	push   $0x1
    23e6:	e8 25 16 00 00       	call   3a10 <printf>
    23eb:	e8 b2 14 00 00       	call   38a2 <exit>

000023f0 <bigwrite>:
    23f0:	55                   	push   %ebp
    23f1:	89 e5                	mov    %esp,%ebp
    23f3:	56                   	push   %esi
    23f4:	53                   	push   %ebx
    23f5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
    23fa:	83 ec 08             	sub    $0x8,%esp
    23fd:	68 e5 47 00 00       	push   $0x47e5
    2402:	6a 01                	push   $0x1
    2404:	e8 07 16 00 00       	call   3a10 <printf>
    2409:	c7 04 24 f4 47 00 00 	movl   $0x47f4,(%esp)
    2410:	e8 dd 14 00 00       	call   38f2 <unlink>
    2415:	83 c4 10             	add    $0x10,%esp
    2418:	90                   	nop
    2419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2420:	83 ec 08             	sub    $0x8,%esp
    2423:	68 02 02 00 00       	push   $0x202
    2428:	68 f4 47 00 00       	push   $0x47f4
    242d:	e8 b0 14 00 00       	call   38e2 <open>
    2432:	83 c4 10             	add    $0x10,%esp
    2435:	85 c0                	test   %eax,%eax
    2437:	89 c6                	mov    %eax,%esi
    2439:	78 7e                	js     24b9 <bigwrite+0xc9>
    243b:	83 ec 04             	sub    $0x4,%esp
    243e:	53                   	push   %ebx
    243f:	68 20 86 00 00       	push   $0x8620
    2444:	50                   	push   %eax
    2445:	e8 78 14 00 00       	call   38c2 <write>
    244a:	83 c4 10             	add    $0x10,%esp
    244d:	39 d8                	cmp    %ebx,%eax
    244f:	75 55                	jne    24a6 <bigwrite+0xb6>
    2451:	83 ec 04             	sub    $0x4,%esp
    2454:	53                   	push   %ebx
    2455:	68 20 86 00 00       	push   $0x8620
    245a:	56                   	push   %esi
    245b:	e8 62 14 00 00       	call   38c2 <write>
    2460:	83 c4 10             	add    $0x10,%esp
    2463:	39 d8                	cmp    %ebx,%eax
    2465:	75 3f                	jne    24a6 <bigwrite+0xb6>
    2467:	83 ec 0c             	sub    $0xc,%esp
    246a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    2470:	56                   	push   %esi
    2471:	e8 54 14 00 00       	call   38ca <close>
    2476:	c7 04 24 f4 47 00 00 	movl   $0x47f4,(%esp)
    247d:	e8 70 14 00 00       	call   38f2 <unlink>
    2482:	83 c4 10             	add    $0x10,%esp
    2485:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    248b:	75 93                	jne    2420 <bigwrite+0x30>
    248d:	83 ec 08             	sub    $0x8,%esp
    2490:	68 27 48 00 00       	push   $0x4827
    2495:	6a 01                	push   $0x1
    2497:	e8 74 15 00 00       	call   3a10 <printf>
    249c:	83 c4 10             	add    $0x10,%esp
    249f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24a2:	5b                   	pop    %ebx
    24a3:	5e                   	pop    %esi
    24a4:	5d                   	pop    %ebp
    24a5:	c3                   	ret    
    24a6:	50                   	push   %eax
    24a7:	53                   	push   %ebx
    24a8:	68 15 48 00 00       	push   $0x4815
    24ad:	6a 01                	push   $0x1
    24af:	e8 5c 15 00 00       	call   3a10 <printf>
    24b4:	e8 e9 13 00 00       	call   38a2 <exit>
    24b9:	83 ec 08             	sub    $0x8,%esp
    24bc:	68 fd 47 00 00       	push   $0x47fd
    24c1:	6a 01                	push   $0x1
    24c3:	e8 48 15 00 00       	call   3a10 <printf>
    24c8:	e8 d5 13 00 00       	call   38a2 <exit>
    24cd:	8d 76 00             	lea    0x0(%esi),%esi

000024d0 <bigfile>:
    24d0:	55                   	push   %ebp
    24d1:	89 e5                	mov    %esp,%ebp
    24d3:	57                   	push   %edi
    24d4:	56                   	push   %esi
    24d5:	53                   	push   %ebx
    24d6:	83 ec 14             	sub    $0x14,%esp
    24d9:	68 34 48 00 00       	push   $0x4834
    24de:	6a 01                	push   $0x1
    24e0:	e8 2b 15 00 00       	call   3a10 <printf>
    24e5:	c7 04 24 50 48 00 00 	movl   $0x4850,(%esp)
    24ec:	e8 01 14 00 00       	call   38f2 <unlink>
    24f1:	58                   	pop    %eax
    24f2:	5a                   	pop    %edx
    24f3:	68 02 02 00 00       	push   $0x202
    24f8:	68 50 48 00 00       	push   $0x4850
    24fd:	e8 e0 13 00 00       	call   38e2 <open>
    2502:	83 c4 10             	add    $0x10,%esp
    2505:	85 c0                	test   %eax,%eax
    2507:	0f 88 5e 01 00 00    	js     266b <bigfile+0x19b>
    250d:	89 c6                	mov    %eax,%esi
    250f:	31 db                	xor    %ebx,%ebx
    2511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2518:	83 ec 04             	sub    $0x4,%esp
    251b:	68 58 02 00 00       	push   $0x258
    2520:	53                   	push   %ebx
    2521:	68 20 86 00 00       	push   $0x8620
    2526:	e8 d5 11 00 00       	call   3700 <memset>
    252b:	83 c4 0c             	add    $0xc,%esp
    252e:	68 58 02 00 00       	push   $0x258
    2533:	68 20 86 00 00       	push   $0x8620
    2538:	56                   	push   %esi
    2539:	e8 84 13 00 00       	call   38c2 <write>
    253e:	83 c4 10             	add    $0x10,%esp
    2541:	3d 58 02 00 00       	cmp    $0x258,%eax
    2546:	0f 85 f8 00 00 00    	jne    2644 <bigfile+0x174>
    254c:	83 c3 01             	add    $0x1,%ebx
    254f:	83 fb 14             	cmp    $0x14,%ebx
    2552:	75 c4                	jne    2518 <bigfile+0x48>
    2554:	83 ec 0c             	sub    $0xc,%esp
    2557:	56                   	push   %esi
    2558:	e8 6d 13 00 00       	call   38ca <close>
    255d:	5e                   	pop    %esi
    255e:	5f                   	pop    %edi
    255f:	6a 00                	push   $0x0
    2561:	68 50 48 00 00       	push   $0x4850
    2566:	e8 77 13 00 00       	call   38e2 <open>
    256b:	83 c4 10             	add    $0x10,%esp
    256e:	85 c0                	test   %eax,%eax
    2570:	89 c6                	mov    %eax,%esi
    2572:	0f 88 e0 00 00 00    	js     2658 <bigfile+0x188>
    2578:	31 db                	xor    %ebx,%ebx
    257a:	31 ff                	xor    %edi,%edi
    257c:	eb 30                	jmp    25ae <bigfile+0xde>
    257e:	66 90                	xchg   %ax,%ax
    2580:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2585:	0f 85 91 00 00 00    	jne    261c <bigfile+0x14c>
    258b:	0f be 05 20 86 00 00 	movsbl 0x8620,%eax
    2592:	89 fa                	mov    %edi,%edx
    2594:	d1 fa                	sar    %edx
    2596:	39 d0                	cmp    %edx,%eax
    2598:	75 6e                	jne    2608 <bigfile+0x138>
    259a:	0f be 15 4b 87 00 00 	movsbl 0x874b,%edx
    25a1:	39 d0                	cmp    %edx,%eax
    25a3:	75 63                	jne    2608 <bigfile+0x138>
    25a5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
    25ab:	83 c7 01             	add    $0x1,%edi
    25ae:	83 ec 04             	sub    $0x4,%esp
    25b1:	68 2c 01 00 00       	push   $0x12c
    25b6:	68 20 86 00 00       	push   $0x8620
    25bb:	56                   	push   %esi
    25bc:	e8 f9 12 00 00       	call   38ba <read>
    25c1:	83 c4 10             	add    $0x10,%esp
    25c4:	85 c0                	test   %eax,%eax
    25c6:	78 68                	js     2630 <bigfile+0x160>
    25c8:	75 b6                	jne    2580 <bigfile+0xb0>
    25ca:	83 ec 0c             	sub    $0xc,%esp
    25cd:	56                   	push   %esi
    25ce:	e8 f7 12 00 00       	call   38ca <close>
    25d3:	83 c4 10             	add    $0x10,%esp
    25d6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25dc:	0f 85 9c 00 00 00    	jne    267e <bigfile+0x1ae>
    25e2:	83 ec 0c             	sub    $0xc,%esp
    25e5:	68 50 48 00 00       	push   $0x4850
    25ea:	e8 03 13 00 00       	call   38f2 <unlink>
    25ef:	58                   	pop    %eax
    25f0:	5a                   	pop    %edx
    25f1:	68 df 48 00 00       	push   $0x48df
    25f6:	6a 01                	push   $0x1
    25f8:	e8 13 14 00 00       	call   3a10 <printf>
    25fd:	83 c4 10             	add    $0x10,%esp
    2600:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2603:	5b                   	pop    %ebx
    2604:	5e                   	pop    %esi
    2605:	5f                   	pop    %edi
    2606:	5d                   	pop    %ebp
    2607:	c3                   	ret    
    2608:	83 ec 08             	sub    $0x8,%esp
    260b:	68 ac 48 00 00       	push   $0x48ac
    2610:	6a 01                	push   $0x1
    2612:	e8 f9 13 00 00       	call   3a10 <printf>
    2617:	e8 86 12 00 00       	call   38a2 <exit>
    261c:	83 ec 08             	sub    $0x8,%esp
    261f:	68 98 48 00 00       	push   $0x4898
    2624:	6a 01                	push   $0x1
    2626:	e8 e5 13 00 00       	call   3a10 <printf>
    262b:	e8 72 12 00 00       	call   38a2 <exit>
    2630:	83 ec 08             	sub    $0x8,%esp
    2633:	68 83 48 00 00       	push   $0x4883
    2638:	6a 01                	push   $0x1
    263a:	e8 d1 13 00 00       	call   3a10 <printf>
    263f:	e8 5e 12 00 00       	call   38a2 <exit>
    2644:	83 ec 08             	sub    $0x8,%esp
    2647:	68 58 48 00 00       	push   $0x4858
    264c:	6a 01                	push   $0x1
    264e:	e8 bd 13 00 00       	call   3a10 <printf>
    2653:	e8 4a 12 00 00       	call   38a2 <exit>
    2658:	53                   	push   %ebx
    2659:	53                   	push   %ebx
    265a:	68 6e 48 00 00       	push   $0x486e
    265f:	6a 01                	push   $0x1
    2661:	e8 aa 13 00 00       	call   3a10 <printf>
    2666:	e8 37 12 00 00       	call   38a2 <exit>
    266b:	50                   	push   %eax
    266c:	50                   	push   %eax
    266d:	68 42 48 00 00       	push   $0x4842
    2672:	6a 01                	push   $0x1
    2674:	e8 97 13 00 00       	call   3a10 <printf>
    2679:	e8 24 12 00 00       	call   38a2 <exit>
    267e:	51                   	push   %ecx
    267f:	51                   	push   %ecx
    2680:	68 c5 48 00 00       	push   $0x48c5
    2685:	6a 01                	push   $0x1
    2687:	e8 84 13 00 00       	call   3a10 <printf>
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
    26a0:	55                   	push   %ebp
    26a1:	89 e5                	mov    %esp,%ebp
    26a3:	83 ec 10             	sub    $0x10,%esp
    26a6:	68 f0 48 00 00       	push   $0x48f0
    26ab:	6a 01                	push   $0x1
    26ad:	e8 5e 13 00 00       	call   3a10 <printf>
    26b2:	c7 04 24 2b 49 00 00 	movl   $0x492b,(%esp)
    26b9:	e8 4c 12 00 00       	call   390a <mkdir>
    26be:	83 c4 10             	add    $0x10,%esp
    26c1:	85 c0                	test   %eax,%eax
    26c3:	0f 85 97 00 00 00    	jne    2760 <fourteen+0xc0>
    26c9:	83 ec 0c             	sub    $0xc,%esp
    26cc:	68 e8 50 00 00       	push   $0x50e8
    26d1:	e8 34 12 00 00       	call   390a <mkdir>
    26d6:	83 c4 10             	add    $0x10,%esp
    26d9:	85 c0                	test   %eax,%eax
    26db:	0f 85 de 00 00 00    	jne    27bf <fourteen+0x11f>
    26e1:	83 ec 08             	sub    $0x8,%esp
    26e4:	68 00 02 00 00       	push   $0x200
    26e9:	68 38 51 00 00       	push   $0x5138
    26ee:	e8 ef 11 00 00       	call   38e2 <open>
    26f3:	83 c4 10             	add    $0x10,%esp
    26f6:	85 c0                	test   %eax,%eax
    26f8:	0f 88 ae 00 00 00    	js     27ac <fourteen+0x10c>
    26fe:	83 ec 0c             	sub    $0xc,%esp
    2701:	50                   	push   %eax
    2702:	e8 c3 11 00 00       	call   38ca <close>
    2707:	58                   	pop    %eax
    2708:	5a                   	pop    %edx
    2709:	6a 00                	push   $0x0
    270b:	68 a8 51 00 00       	push   $0x51a8
    2710:	e8 cd 11 00 00       	call   38e2 <open>
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	85 c0                	test   %eax,%eax
    271a:	78 7d                	js     2799 <fourteen+0xf9>
    271c:	83 ec 0c             	sub    $0xc,%esp
    271f:	50                   	push   %eax
    2720:	e8 a5 11 00 00       	call   38ca <close>
    2725:	c7 04 24 1c 49 00 00 	movl   $0x491c,(%esp)
    272c:	e8 d9 11 00 00       	call   390a <mkdir>
    2731:	83 c4 10             	add    $0x10,%esp
    2734:	85 c0                	test   %eax,%eax
    2736:	74 4e                	je     2786 <fourteen+0xe6>
    2738:	83 ec 0c             	sub    $0xc,%esp
    273b:	68 44 52 00 00       	push   $0x5244
    2740:	e8 c5 11 00 00       	call   390a <mkdir>
    2745:	83 c4 10             	add    $0x10,%esp
    2748:	85 c0                	test   %eax,%eax
    274a:	74 27                	je     2773 <fourteen+0xd3>
    274c:	83 ec 08             	sub    $0x8,%esp
    274f:	68 3a 49 00 00       	push   $0x493a
    2754:	6a 01                	push   $0x1
    2756:	e8 b5 12 00 00       	call   3a10 <printf>
    275b:	83 c4 10             	add    $0x10,%esp
    275e:	c9                   	leave  
    275f:	c3                   	ret    
    2760:	50                   	push   %eax
    2761:	50                   	push   %eax
    2762:	68 ff 48 00 00       	push   $0x48ff
    2767:	6a 01                	push   $0x1
    2769:	e8 a2 12 00 00       	call   3a10 <printf>
    276e:	e8 2f 11 00 00       	call   38a2 <exit>
    2773:	50                   	push   %eax
    2774:	50                   	push   %eax
    2775:	68 64 52 00 00       	push   $0x5264
    277a:	6a 01                	push   $0x1
    277c:	e8 8f 12 00 00       	call   3a10 <printf>
    2781:	e8 1c 11 00 00       	call   38a2 <exit>
    2786:	52                   	push   %edx
    2787:	52                   	push   %edx
    2788:	68 14 52 00 00       	push   $0x5214
    278d:	6a 01                	push   $0x1
    278f:	e8 7c 12 00 00       	call   3a10 <printf>
    2794:	e8 09 11 00 00       	call   38a2 <exit>
    2799:	51                   	push   %ecx
    279a:	51                   	push   %ecx
    279b:	68 d8 51 00 00       	push   $0x51d8
    27a0:	6a 01                	push   $0x1
    27a2:	e8 69 12 00 00       	call   3a10 <printf>
    27a7:	e8 f6 10 00 00       	call   38a2 <exit>
    27ac:	51                   	push   %ecx
    27ad:	51                   	push   %ecx
    27ae:	68 68 51 00 00       	push   $0x5168
    27b3:	6a 01                	push   $0x1
    27b5:	e8 56 12 00 00       	call   3a10 <printf>
    27ba:	e8 e3 10 00 00       	call   38a2 <exit>
    27bf:	50                   	push   %eax
    27c0:	50                   	push   %eax
    27c1:	68 08 51 00 00       	push   $0x5108
    27c6:	6a 01                	push   $0x1
    27c8:	e8 43 12 00 00       	call   3a10 <printf>
    27cd:	e8 d0 10 00 00       	call   38a2 <exit>
    27d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027e0 <rmdot>:
    27e0:	55                   	push   %ebp
    27e1:	89 e5                	mov    %esp,%ebp
    27e3:	83 ec 10             	sub    $0x10,%esp
    27e6:	68 47 49 00 00       	push   $0x4947
    27eb:	6a 01                	push   $0x1
    27ed:	e8 1e 12 00 00       	call   3a10 <printf>
    27f2:	c7 04 24 53 49 00 00 	movl   $0x4953,(%esp)
    27f9:	e8 0c 11 00 00       	call   390a <mkdir>
    27fe:	83 c4 10             	add    $0x10,%esp
    2801:	85 c0                	test   %eax,%eax
    2803:	0f 85 b0 00 00 00    	jne    28b9 <rmdot+0xd9>
    2809:	83 ec 0c             	sub    $0xc,%esp
    280c:	68 53 49 00 00       	push   $0x4953
    2811:	e8 fc 10 00 00       	call   3912 <chdir>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	85 c0                	test   %eax,%eax
    281b:	0f 85 1d 01 00 00    	jne    293e <rmdot+0x15e>
    2821:	83 ec 0c             	sub    $0xc,%esp
    2824:	68 fe 45 00 00       	push   $0x45fe
    2829:	e8 c4 10 00 00       	call   38f2 <unlink>
    282e:	83 c4 10             	add    $0x10,%esp
    2831:	85 c0                	test   %eax,%eax
    2833:	0f 84 f2 00 00 00    	je     292b <rmdot+0x14b>
    2839:	83 ec 0c             	sub    $0xc,%esp
    283c:	68 fd 45 00 00       	push   $0x45fd
    2841:	e8 ac 10 00 00       	call   38f2 <unlink>
    2846:	83 c4 10             	add    $0x10,%esp
    2849:	85 c0                	test   %eax,%eax
    284b:	0f 84 c7 00 00 00    	je     2918 <rmdot+0x138>
    2851:	83 ec 0c             	sub    $0xc,%esp
    2854:	68 d1 3d 00 00       	push   $0x3dd1
    2859:	e8 b4 10 00 00       	call   3912 <chdir>
    285e:	83 c4 10             	add    $0x10,%esp
    2861:	85 c0                	test   %eax,%eax
    2863:	0f 85 9c 00 00 00    	jne    2905 <rmdot+0x125>
    2869:	83 ec 0c             	sub    $0xc,%esp
    286c:	68 9b 49 00 00       	push   $0x499b
    2871:	e8 7c 10 00 00       	call   38f2 <unlink>
    2876:	83 c4 10             	add    $0x10,%esp
    2879:	85 c0                	test   %eax,%eax
    287b:	74 75                	je     28f2 <rmdot+0x112>
    287d:	83 ec 0c             	sub    $0xc,%esp
    2880:	68 b9 49 00 00       	push   $0x49b9
    2885:	e8 68 10 00 00       	call   38f2 <unlink>
    288a:	83 c4 10             	add    $0x10,%esp
    288d:	85 c0                	test   %eax,%eax
    288f:	74 4e                	je     28df <rmdot+0xff>
    2891:	83 ec 0c             	sub    $0xc,%esp
    2894:	68 53 49 00 00       	push   $0x4953
    2899:	e8 54 10 00 00       	call   38f2 <unlink>
    289e:	83 c4 10             	add    $0x10,%esp
    28a1:	85 c0                	test   %eax,%eax
    28a3:	75 27                	jne    28cc <rmdot+0xec>
    28a5:	83 ec 08             	sub    $0x8,%esp
    28a8:	68 ee 49 00 00       	push   $0x49ee
    28ad:	6a 01                	push   $0x1
    28af:	e8 5c 11 00 00       	call   3a10 <printf>
    28b4:	83 c4 10             	add    $0x10,%esp
    28b7:	c9                   	leave  
    28b8:	c3                   	ret    
    28b9:	50                   	push   %eax
    28ba:	50                   	push   %eax
    28bb:	68 58 49 00 00       	push   $0x4958
    28c0:	6a 01                	push   $0x1
    28c2:	e8 49 11 00 00       	call   3a10 <printf>
    28c7:	e8 d6 0f 00 00       	call   38a2 <exit>
    28cc:	50                   	push   %eax
    28cd:	50                   	push   %eax
    28ce:	68 d9 49 00 00       	push   $0x49d9
    28d3:	6a 01                	push   $0x1
    28d5:	e8 36 11 00 00       	call   3a10 <printf>
    28da:	e8 c3 0f 00 00       	call   38a2 <exit>
    28df:	52                   	push   %edx
    28e0:	52                   	push   %edx
    28e1:	68 c1 49 00 00       	push   $0x49c1
    28e6:	6a 01                	push   $0x1
    28e8:	e8 23 11 00 00       	call   3a10 <printf>
    28ed:	e8 b0 0f 00 00       	call   38a2 <exit>
    28f2:	51                   	push   %ecx
    28f3:	51                   	push   %ecx
    28f4:	68 a2 49 00 00       	push   $0x49a2
    28f9:	6a 01                	push   $0x1
    28fb:	e8 10 11 00 00       	call   3a10 <printf>
    2900:	e8 9d 0f 00 00       	call   38a2 <exit>
    2905:	50                   	push   %eax
    2906:	50                   	push   %eax
    2907:	68 d3 3d 00 00       	push   $0x3dd3
    290c:	6a 01                	push   $0x1
    290e:	e8 fd 10 00 00       	call   3a10 <printf>
    2913:	e8 8a 0f 00 00       	call   38a2 <exit>
    2918:	50                   	push   %eax
    2919:	50                   	push   %eax
    291a:	68 8c 49 00 00       	push   $0x498c
    291f:	6a 01                	push   $0x1
    2921:	e8 ea 10 00 00       	call   3a10 <printf>
    2926:	e8 77 0f 00 00       	call   38a2 <exit>
    292b:	50                   	push   %eax
    292c:	50                   	push   %eax
    292d:	68 7e 49 00 00       	push   $0x497e
    2932:	6a 01                	push   $0x1
    2934:	e8 d7 10 00 00       	call   3a10 <printf>
    2939:	e8 64 0f 00 00       	call   38a2 <exit>
    293e:	50                   	push   %eax
    293f:	50                   	push   %eax
    2940:	68 6b 49 00 00       	push   $0x496b
    2945:	6a 01                	push   $0x1
    2947:	e8 c4 10 00 00       	call   3a10 <printf>
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
    2960:	55                   	push   %ebp
    2961:	89 e5                	mov    %esp,%ebp
    2963:	53                   	push   %ebx
    2964:	83 ec 0c             	sub    $0xc,%esp
    2967:	68 f8 49 00 00       	push   $0x49f8
    296c:	6a 01                	push   $0x1
    296e:	e8 9d 10 00 00       	call   3a10 <printf>
    2973:	59                   	pop    %ecx
    2974:	5b                   	pop    %ebx
    2975:	68 00 02 00 00       	push   $0x200
    297a:	68 05 4a 00 00       	push   $0x4a05
    297f:	e8 5e 0f 00 00       	call   38e2 <open>
    2984:	83 c4 10             	add    $0x10,%esp
    2987:	85 c0                	test   %eax,%eax
    2989:	0f 88 43 01 00 00    	js     2ad2 <dirfile+0x172>
    298f:	83 ec 0c             	sub    $0xc,%esp
    2992:	50                   	push   %eax
    2993:	e8 32 0f 00 00       	call   38ca <close>
    2998:	c7 04 24 05 4a 00 00 	movl   $0x4a05,(%esp)
    299f:	e8 6e 0f 00 00       	call   3912 <chdir>
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	85 c0                	test   %eax,%eax
    29a9:	0f 84 10 01 00 00    	je     2abf <dirfile+0x15f>
    29af:	83 ec 08             	sub    $0x8,%esp
    29b2:	6a 00                	push   $0x0
    29b4:	68 3e 4a 00 00       	push   $0x4a3e
    29b9:	e8 24 0f 00 00       	call   38e2 <open>
    29be:	83 c4 10             	add    $0x10,%esp
    29c1:	85 c0                	test   %eax,%eax
    29c3:	0f 89 e3 00 00 00    	jns    2aac <dirfile+0x14c>
    29c9:	83 ec 08             	sub    $0x8,%esp
    29cc:	68 00 02 00 00       	push   $0x200
    29d1:	68 3e 4a 00 00       	push   $0x4a3e
    29d6:	e8 07 0f 00 00       	call   38e2 <open>
    29db:	83 c4 10             	add    $0x10,%esp
    29de:	85 c0                	test   %eax,%eax
    29e0:	0f 89 c6 00 00 00    	jns    2aac <dirfile+0x14c>
    29e6:	83 ec 0c             	sub    $0xc,%esp
    29e9:	68 3e 4a 00 00       	push   $0x4a3e
    29ee:	e8 17 0f 00 00       	call   390a <mkdir>
    29f3:	83 c4 10             	add    $0x10,%esp
    29f6:	85 c0                	test   %eax,%eax
    29f8:	0f 84 46 01 00 00    	je     2b44 <dirfile+0x1e4>
    29fe:	83 ec 0c             	sub    $0xc,%esp
    2a01:	68 3e 4a 00 00       	push   $0x4a3e
    2a06:	e8 e7 0e 00 00       	call   38f2 <unlink>
    2a0b:	83 c4 10             	add    $0x10,%esp
    2a0e:	85 c0                	test   %eax,%eax
    2a10:	0f 84 1b 01 00 00    	je     2b31 <dirfile+0x1d1>
    2a16:	83 ec 08             	sub    $0x8,%esp
    2a19:	68 3e 4a 00 00       	push   $0x4a3e
    2a1e:	68 a2 4a 00 00       	push   $0x4aa2
    2a23:	e8 da 0e 00 00       	call   3902 <link>
    2a28:	83 c4 10             	add    $0x10,%esp
    2a2b:	85 c0                	test   %eax,%eax
    2a2d:	0f 84 eb 00 00 00    	je     2b1e <dirfile+0x1be>
    2a33:	83 ec 0c             	sub    $0xc,%esp
    2a36:	68 05 4a 00 00       	push   $0x4a05
    2a3b:	e8 b2 0e 00 00       	call   38f2 <unlink>
    2a40:	83 c4 10             	add    $0x10,%esp
    2a43:	85 c0                	test   %eax,%eax
    2a45:	0f 85 c0 00 00 00    	jne    2b0b <dirfile+0x1ab>
    2a4b:	83 ec 08             	sub    $0x8,%esp
    2a4e:	6a 02                	push   $0x2
    2a50:	68 fe 45 00 00       	push   $0x45fe
    2a55:	e8 88 0e 00 00       	call   38e2 <open>
    2a5a:	83 c4 10             	add    $0x10,%esp
    2a5d:	85 c0                	test   %eax,%eax
    2a5f:	0f 89 93 00 00 00    	jns    2af8 <dirfile+0x198>
    2a65:	83 ec 08             	sub    $0x8,%esp
    2a68:	6a 00                	push   $0x0
    2a6a:	68 fe 45 00 00       	push   $0x45fe
    2a6f:	e8 6e 0e 00 00       	call   38e2 <open>
    2a74:	83 c4 0c             	add    $0xc,%esp
    2a77:	89 c3                	mov    %eax,%ebx
    2a79:	6a 01                	push   $0x1
    2a7b:	68 e1 46 00 00       	push   $0x46e1
    2a80:	50                   	push   %eax
    2a81:	e8 3c 0e 00 00       	call   38c2 <write>
    2a86:	83 c4 10             	add    $0x10,%esp
    2a89:	85 c0                	test   %eax,%eax
    2a8b:	7f 58                	jg     2ae5 <dirfile+0x185>
    2a8d:	83 ec 0c             	sub    $0xc,%esp
    2a90:	53                   	push   %ebx
    2a91:	e8 34 0e 00 00       	call   38ca <close>
    2a96:	58                   	pop    %eax
    2a97:	5a                   	pop    %edx
    2a98:	68 d5 4a 00 00       	push   $0x4ad5
    2a9d:	6a 01                	push   $0x1
    2a9f:	e8 6c 0f 00 00       	call   3a10 <printf>
    2aa4:	83 c4 10             	add    $0x10,%esp
    2aa7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aaa:	c9                   	leave  
    2aab:	c3                   	ret    
    2aac:	50                   	push   %eax
    2aad:	50                   	push   %eax
    2aae:	68 49 4a 00 00       	push   $0x4a49
    2ab3:	6a 01                	push   $0x1
    2ab5:	e8 56 0f 00 00       	call   3a10 <printf>
    2aba:	e8 e3 0d 00 00       	call   38a2 <exit>
    2abf:	50                   	push   %eax
    2ac0:	50                   	push   %eax
    2ac1:	68 24 4a 00 00       	push   $0x4a24
    2ac6:	6a 01                	push   $0x1
    2ac8:	e8 43 0f 00 00       	call   3a10 <printf>
    2acd:	e8 d0 0d 00 00       	call   38a2 <exit>
    2ad2:	52                   	push   %edx
    2ad3:	52                   	push   %edx
    2ad4:	68 0d 4a 00 00       	push   $0x4a0d
    2ad9:	6a 01                	push   $0x1
    2adb:	e8 30 0f 00 00       	call   3a10 <printf>
    2ae0:	e8 bd 0d 00 00       	call   38a2 <exit>
    2ae5:	51                   	push   %ecx
    2ae6:	51                   	push   %ecx
    2ae7:	68 c1 4a 00 00       	push   $0x4ac1
    2aec:	6a 01                	push   $0x1
    2aee:	e8 1d 0f 00 00       	call   3a10 <printf>
    2af3:	e8 aa 0d 00 00       	call   38a2 <exit>
    2af8:	53                   	push   %ebx
    2af9:	53                   	push   %ebx
    2afa:	68 b8 52 00 00       	push   $0x52b8
    2aff:	6a 01                	push   $0x1
    2b01:	e8 0a 0f 00 00       	call   3a10 <printf>
    2b06:	e8 97 0d 00 00       	call   38a2 <exit>
    2b0b:	50                   	push   %eax
    2b0c:	50                   	push   %eax
    2b0d:	68 a9 4a 00 00       	push   $0x4aa9
    2b12:	6a 01                	push   $0x1
    2b14:	e8 f7 0e 00 00       	call   3a10 <printf>
    2b19:	e8 84 0d 00 00       	call   38a2 <exit>
    2b1e:	50                   	push   %eax
    2b1f:	50                   	push   %eax
    2b20:	68 98 52 00 00       	push   $0x5298
    2b25:	6a 01                	push   $0x1
    2b27:	e8 e4 0e 00 00       	call   3a10 <printf>
    2b2c:	e8 71 0d 00 00       	call   38a2 <exit>
    2b31:	50                   	push   %eax
    2b32:	50                   	push   %eax
    2b33:	68 84 4a 00 00       	push   $0x4a84
    2b38:	6a 01                	push   $0x1
    2b3a:	e8 d1 0e 00 00       	call   3a10 <printf>
    2b3f:	e8 5e 0d 00 00       	call   38a2 <exit>
    2b44:	50                   	push   %eax
    2b45:	50                   	push   %eax
    2b46:	68 67 4a 00 00       	push   $0x4a67
    2b4b:	6a 01                	push   $0x1
    2b4d:	e8 be 0e 00 00       	call   3a10 <printf>
    2b52:	e8 4b 0d 00 00       	call   38a2 <exit>
    2b57:	89 f6                	mov    %esi,%esi
    2b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b60 <iref>:
    2b60:	55                   	push   %ebp
    2b61:	89 e5                	mov    %esp,%ebp
    2b63:	53                   	push   %ebx
    2b64:	bb 33 00 00 00       	mov    $0x33,%ebx
    2b69:	83 ec 0c             	sub    $0xc,%esp
    2b6c:	68 e5 4a 00 00       	push   $0x4ae5
    2b71:	6a 01                	push   $0x1
    2b73:	e8 98 0e 00 00       	call   3a10 <printf>
    2b78:	83 c4 10             	add    $0x10,%esp
    2b7b:	90                   	nop
    2b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2b80:	83 ec 0c             	sub    $0xc,%esp
    2b83:	68 f6 4a 00 00       	push   $0x4af6
    2b88:	e8 7d 0d 00 00       	call   390a <mkdir>
    2b8d:	83 c4 10             	add    $0x10,%esp
    2b90:	85 c0                	test   %eax,%eax
    2b92:	0f 85 bb 00 00 00    	jne    2c53 <iref+0xf3>
    2b98:	83 ec 0c             	sub    $0xc,%esp
    2b9b:	68 f6 4a 00 00       	push   $0x4af6
    2ba0:	e8 6d 0d 00 00       	call   3912 <chdir>
    2ba5:	83 c4 10             	add    $0x10,%esp
    2ba8:	85 c0                	test   %eax,%eax
    2baa:	0f 85 b7 00 00 00    	jne    2c67 <iref+0x107>
    2bb0:	83 ec 0c             	sub    $0xc,%esp
    2bb3:	68 ab 41 00 00       	push   $0x41ab
    2bb8:	e8 4d 0d 00 00       	call   390a <mkdir>
    2bbd:	59                   	pop    %ecx
    2bbe:	58                   	pop    %eax
    2bbf:	68 ab 41 00 00       	push   $0x41ab
    2bc4:	68 a2 4a 00 00       	push   $0x4aa2
    2bc9:	e8 34 0d 00 00       	call   3902 <link>
    2bce:	58                   	pop    %eax
    2bcf:	5a                   	pop    %edx
    2bd0:	68 00 02 00 00       	push   $0x200
    2bd5:	68 ab 41 00 00       	push   $0x41ab
    2bda:	e8 03 0d 00 00       	call   38e2 <open>
    2bdf:	83 c4 10             	add    $0x10,%esp
    2be2:	85 c0                	test   %eax,%eax
    2be4:	78 0c                	js     2bf2 <iref+0x92>
    2be6:	83 ec 0c             	sub    $0xc,%esp
    2be9:	50                   	push   %eax
    2bea:	e8 db 0c 00 00       	call   38ca <close>
    2bef:	83 c4 10             	add    $0x10,%esp
    2bf2:	83 ec 08             	sub    $0x8,%esp
    2bf5:	68 00 02 00 00       	push   $0x200
    2bfa:	68 e0 46 00 00       	push   $0x46e0
    2bff:	e8 de 0c 00 00       	call   38e2 <open>
    2c04:	83 c4 10             	add    $0x10,%esp
    2c07:	85 c0                	test   %eax,%eax
    2c09:	78 0c                	js     2c17 <iref+0xb7>
    2c0b:	83 ec 0c             	sub    $0xc,%esp
    2c0e:	50                   	push   %eax
    2c0f:	e8 b6 0c 00 00       	call   38ca <close>
    2c14:	83 c4 10             	add    $0x10,%esp
    2c17:	83 ec 0c             	sub    $0xc,%esp
    2c1a:	68 e0 46 00 00       	push   $0x46e0
    2c1f:	e8 ce 0c 00 00       	call   38f2 <unlink>
    2c24:	83 c4 10             	add    $0x10,%esp
    2c27:	83 eb 01             	sub    $0x1,%ebx
    2c2a:	0f 85 50 ff ff ff    	jne    2b80 <iref+0x20>
    2c30:	83 ec 0c             	sub    $0xc,%esp
    2c33:	68 d1 3d 00 00       	push   $0x3dd1
    2c38:	e8 d5 0c 00 00       	call   3912 <chdir>
    2c3d:	58                   	pop    %eax
    2c3e:	5a                   	pop    %edx
    2c3f:	68 24 4b 00 00       	push   $0x4b24
    2c44:	6a 01                	push   $0x1
    2c46:	e8 c5 0d 00 00       	call   3a10 <printf>
    2c4b:	83 c4 10             	add    $0x10,%esp
    2c4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c51:	c9                   	leave  
    2c52:	c3                   	ret    
    2c53:	83 ec 08             	sub    $0x8,%esp
    2c56:	68 fc 4a 00 00       	push   $0x4afc
    2c5b:	6a 01                	push   $0x1
    2c5d:	e8 ae 0d 00 00       	call   3a10 <printf>
    2c62:	e8 3b 0c 00 00       	call   38a2 <exit>
    2c67:	83 ec 08             	sub    $0x8,%esp
    2c6a:	68 10 4b 00 00       	push   $0x4b10
    2c6f:	6a 01                	push   $0x1
    2c71:	e8 9a 0d 00 00       	call   3a10 <printf>
    2c76:	e8 27 0c 00 00       	call   38a2 <exit>
    2c7b:	90                   	nop
    2c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c80 <forktest>:
    2c80:	55                   	push   %ebp
    2c81:	89 e5                	mov    %esp,%ebp
    2c83:	53                   	push   %ebx
    2c84:	31 db                	xor    %ebx,%ebx
    2c86:	83 ec 0c             	sub    $0xc,%esp
    2c89:	68 38 4b 00 00       	push   $0x4b38
    2c8e:	6a 01                	push   $0x1
    2c90:	e8 7b 0d 00 00       	call   3a10 <printf>
    2c95:	83 c4 10             	add    $0x10,%esp
    2c98:	eb 13                	jmp    2cad <forktest+0x2d>
    2c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2ca0:	74 62                	je     2d04 <forktest+0x84>
    2ca2:	83 c3 01             	add    $0x1,%ebx
    2ca5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2cab:	74 43                	je     2cf0 <forktest+0x70>
    2cad:	e8 e8 0b 00 00       	call   389a <fork>
    2cb2:	85 c0                	test   %eax,%eax
    2cb4:	79 ea                	jns    2ca0 <forktest+0x20>
    2cb6:	85 db                	test   %ebx,%ebx
    2cb8:	74 14                	je     2cce <forktest+0x4e>
    2cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2cc0:	e8 e5 0b 00 00       	call   38aa <wait>
    2cc5:	85 c0                	test   %eax,%eax
    2cc7:	78 40                	js     2d09 <forktest+0x89>
    2cc9:	83 eb 01             	sub    $0x1,%ebx
    2ccc:	75 f2                	jne    2cc0 <forktest+0x40>
    2cce:	e8 d7 0b 00 00       	call   38aa <wait>
    2cd3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cd6:	75 45                	jne    2d1d <forktest+0x9d>
    2cd8:	83 ec 08             	sub    $0x8,%esp
    2cdb:	68 6a 4b 00 00       	push   $0x4b6a
    2ce0:	6a 01                	push   $0x1
    2ce2:	e8 29 0d 00 00       	call   3a10 <printf>
    2ce7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cea:	c9                   	leave  
    2ceb:	c3                   	ret    
    2cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2cf0:	83 ec 08             	sub    $0x8,%esp
    2cf3:	68 d8 52 00 00       	push   $0x52d8
    2cf8:	6a 01                	push   $0x1
    2cfa:	e8 11 0d 00 00       	call   3a10 <printf>
    2cff:	e8 9e 0b 00 00       	call   38a2 <exit>
    2d04:	e8 99 0b 00 00       	call   38a2 <exit>
    2d09:	83 ec 08             	sub    $0x8,%esp
    2d0c:	68 43 4b 00 00       	push   $0x4b43
    2d11:	6a 01                	push   $0x1
    2d13:	e8 f8 0c 00 00       	call   3a10 <printf>
    2d18:	e8 85 0b 00 00       	call   38a2 <exit>
    2d1d:	50                   	push   %eax
    2d1e:	50                   	push   %eax
    2d1f:	68 57 4b 00 00       	push   $0x4b57
    2d24:	6a 01                	push   $0x1
    2d26:	e8 e5 0c 00 00       	call   3a10 <printf>
    2d2b:	e8 72 0b 00 00       	call   38a2 <exit>

00002d30 <sbrktest>:
    2d30:	55                   	push   %ebp
    2d31:	89 e5                	mov    %esp,%ebp
    2d33:	57                   	push   %edi
    2d34:	56                   	push   %esi
    2d35:	53                   	push   %ebx
    2d36:	31 ff                	xor    %edi,%edi
    2d38:	83 ec 64             	sub    $0x64,%esp
    2d3b:	68 78 4b 00 00       	push   $0x4b78
    2d40:	ff 35 38 5e 00 00    	pushl  0x5e38
    2d46:	e8 c5 0c 00 00       	call   3a10 <printf>
    2d4b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d52:	e8 d3 0b 00 00       	call   392a <sbrk>
    2d57:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d5e:	89 c3                	mov    %eax,%ebx
    2d60:	e8 c5 0b 00 00       	call   392a <sbrk>
    2d65:	83 c4 10             	add    $0x10,%esp
    2d68:	89 c6                	mov    %eax,%esi
    2d6a:	eb 06                	jmp    2d72 <sbrktest+0x42>
    2d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2d70:	89 c6                	mov    %eax,%esi
    2d72:	83 ec 0c             	sub    $0xc,%esp
    2d75:	6a 01                	push   $0x1
    2d77:	e8 ae 0b 00 00       	call   392a <sbrk>
    2d7c:	83 c4 10             	add    $0x10,%esp
    2d7f:	39 f0                	cmp    %esi,%eax
    2d81:	0f 85 62 02 00 00    	jne    2fe9 <sbrktest+0x2b9>
    2d87:	83 c7 01             	add    $0x1,%edi
    2d8a:	c6 06 01             	movb   $0x1,(%esi)
    2d8d:	8d 46 01             	lea    0x1(%esi),%eax
    2d90:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2d96:	75 d8                	jne    2d70 <sbrktest+0x40>
    2d98:	e8 fd 0a 00 00       	call   389a <fork>
    2d9d:	85 c0                	test   %eax,%eax
    2d9f:	89 c7                	mov    %eax,%edi
    2da1:	0f 88 82 03 00 00    	js     3129 <sbrktest+0x3f9>
    2da7:	83 ec 0c             	sub    $0xc,%esp
    2daa:	83 c6 02             	add    $0x2,%esi
    2dad:	6a 01                	push   $0x1
    2daf:	e8 76 0b 00 00       	call   392a <sbrk>
    2db4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dbb:	e8 6a 0b 00 00       	call   392a <sbrk>
    2dc0:	83 c4 10             	add    $0x10,%esp
    2dc3:	39 f0                	cmp    %esi,%eax
    2dc5:	0f 85 47 03 00 00    	jne    3112 <sbrktest+0x3e2>
    2dcb:	85 ff                	test   %edi,%edi
    2dcd:	0f 84 3a 03 00 00    	je     310d <sbrktest+0x3dd>
    2dd3:	e8 d2 0a 00 00       	call   38aa <wait>
    2dd8:	83 ec 0c             	sub    $0xc,%esp
    2ddb:	6a 00                	push   $0x0
    2ddd:	e8 48 0b 00 00       	call   392a <sbrk>
    2de2:	89 c6                	mov    %eax,%esi
    2de4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2de9:	29 f0                	sub    %esi,%eax
    2deb:	89 04 24             	mov    %eax,(%esp)
    2dee:	e8 37 0b 00 00       	call   392a <sbrk>
    2df3:	83 c4 10             	add    $0x10,%esp
    2df6:	39 c6                	cmp    %eax,%esi
    2df8:	0f 85 f8 02 00 00    	jne    30f6 <sbrktest+0x3c6>
    2dfe:	83 ec 0c             	sub    $0xc,%esp
    2e01:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
    2e08:	6a 00                	push   $0x0
    2e0a:	e8 1b 0b 00 00       	call   392a <sbrk>
    2e0f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2e16:	89 c6                	mov    %eax,%esi
    2e18:	e8 0d 0b 00 00       	call   392a <sbrk>
    2e1d:	83 c4 10             	add    $0x10,%esp
    2e20:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e23:	0f 84 b6 02 00 00    	je     30df <sbrktest+0x3af>
    2e29:	83 ec 0c             	sub    $0xc,%esp
    2e2c:	6a 00                	push   $0x0
    2e2e:	e8 f7 0a 00 00       	call   392a <sbrk>
    2e33:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    2e39:	83 c4 10             	add    $0x10,%esp
    2e3c:	39 d0                	cmp    %edx,%eax
    2e3e:	0f 85 84 02 00 00    	jne    30c8 <sbrktest+0x398>
    2e44:	83 ec 0c             	sub    $0xc,%esp
    2e47:	6a 00                	push   $0x0
    2e49:	e8 dc 0a 00 00       	call   392a <sbrk>
    2e4e:	89 c6                	mov    %eax,%esi
    2e50:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e57:	e8 ce 0a 00 00       	call   392a <sbrk>
    2e5c:	83 c4 10             	add    $0x10,%esp
    2e5f:	39 c6                	cmp    %eax,%esi
    2e61:	89 c7                	mov    %eax,%edi
    2e63:	0f 85 48 02 00 00    	jne    30b1 <sbrktest+0x381>
    2e69:	83 ec 0c             	sub    $0xc,%esp
    2e6c:	6a 00                	push   $0x0
    2e6e:	e8 b7 0a 00 00       	call   392a <sbrk>
    2e73:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    2e79:	83 c4 10             	add    $0x10,%esp
    2e7c:	39 d0                	cmp    %edx,%eax
    2e7e:	0f 85 2d 02 00 00    	jne    30b1 <sbrktest+0x381>
    2e84:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e8b:	0f 84 09 02 00 00    	je     309a <sbrktest+0x36a>
    2e91:	83 ec 0c             	sub    $0xc,%esp
    2e94:	6a 00                	push   $0x0
    2e96:	e8 8f 0a 00 00       	call   392a <sbrk>
    2e9b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ea2:	89 c6                	mov    %eax,%esi
    2ea4:	e8 81 0a 00 00       	call   392a <sbrk>
    2ea9:	89 d9                	mov    %ebx,%ecx
    2eab:	29 c1                	sub    %eax,%ecx
    2ead:	89 0c 24             	mov    %ecx,(%esp)
    2eb0:	e8 75 0a 00 00       	call   392a <sbrk>
    2eb5:	83 c4 10             	add    $0x10,%esp
    2eb8:	39 c6                	cmp    %eax,%esi
    2eba:	0f 85 c3 01 00 00    	jne    3083 <sbrktest+0x353>
    2ec0:	be 00 00 00 80       	mov    $0x80000000,%esi
    2ec5:	e8 58 0a 00 00       	call   3922 <getpid>
    2eca:	89 c7                	mov    %eax,%edi
    2ecc:	e8 c9 09 00 00       	call   389a <fork>
    2ed1:	85 c0                	test   %eax,%eax
    2ed3:	0f 88 93 01 00 00    	js     306c <sbrktest+0x33c>
    2ed9:	0f 84 6b 01 00 00    	je     304a <sbrktest+0x31a>
    2edf:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    2ee5:	e8 c0 09 00 00       	call   38aa <wait>
    2eea:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    2ef0:	75 d3                	jne    2ec5 <sbrktest+0x195>
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
    2f10:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f13:	74 14                	je     2f29 <sbrktest+0x1f9>
    2f15:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f18:	83 ec 04             	sub    $0x4,%esp
    2f1b:	6a 01                	push   $0x1
    2f1d:	50                   	push   %eax
    2f1e:	ff 75 b8             	pushl  -0x48(%ebp)
    2f21:	e8 94 09 00 00       	call   38ba <read>
    2f26:	83 c4 10             	add    $0x10,%esp
    2f29:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2f2c:	83 c6 04             	add    $0x4,%esi
    2f2f:	39 c6                	cmp    %eax,%esi
    2f31:	74 4f                	je     2f82 <sbrktest+0x252>
    2f33:	e8 62 09 00 00       	call   389a <fork>
    2f38:	85 c0                	test   %eax,%eax
    2f3a:	89 06                	mov    %eax,(%esi)
    2f3c:	75 d2                	jne    2f10 <sbrktest+0x1e0>
    2f3e:	83 ec 0c             	sub    $0xc,%esp
    2f41:	6a 00                	push   $0x0
    2f43:	e8 e2 09 00 00       	call   392a <sbrk>
    2f48:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2f4d:	29 c2                	sub    %eax,%edx
    2f4f:	89 14 24             	mov    %edx,(%esp)
    2f52:	e8 d3 09 00 00       	call   392a <sbrk>
    2f57:	83 c4 0c             	add    $0xc,%esp
    2f5a:	6a 01                	push   $0x1
    2f5c:	68 e1 46 00 00       	push   $0x46e1
    2f61:	ff 75 bc             	pushl  -0x44(%ebp)
    2f64:	e8 59 09 00 00       	call   38c2 <write>
    2f69:	83 c4 10             	add    $0x10,%esp
    2f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2f70:	83 ec 0c             	sub    $0xc,%esp
    2f73:	68 e8 03 00 00       	push   $0x3e8
    2f78:	e8 b5 09 00 00       	call   3932 <sleep>
    2f7d:	83 c4 10             	add    $0x10,%esp
    2f80:	eb ee                	jmp    2f70 <sbrktest+0x240>
    2f82:	83 ec 0c             	sub    $0xc,%esp
    2f85:	68 00 10 00 00       	push   $0x1000
    2f8a:	e8 9b 09 00 00       	call   392a <sbrk>
    2f8f:	83 c4 10             	add    $0x10,%esp
    2f92:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    2f95:	8b 07                	mov    (%edi),%eax
    2f97:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f9a:	74 11                	je     2fad <sbrktest+0x27d>
    2f9c:	83 ec 0c             	sub    $0xc,%esp
    2f9f:	50                   	push   %eax
    2fa0:	e8 2d 09 00 00       	call   38d2 <kill>
    2fa5:	e8 00 09 00 00       	call   38aa <wait>
    2faa:	83 c4 10             	add    $0x10,%esp
    2fad:	83 c7 04             	add    $0x4,%edi
    2fb0:	39 fe                	cmp    %edi,%esi
    2fb2:	75 e1                	jne    2f95 <sbrktest+0x265>
    2fb4:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    2fb8:	74 66                	je     3020 <sbrktest+0x2f0>
    2fba:	83 ec 0c             	sub    $0xc,%esp
    2fbd:	6a 00                	push   $0x0
    2fbf:	e8 66 09 00 00       	call   392a <sbrk>
    2fc4:	83 c4 10             	add    $0x10,%esp
    2fc7:	39 d8                	cmp    %ebx,%eax
    2fc9:	77 3c                	ja     3007 <sbrktest+0x2d7>
    2fcb:	83 ec 08             	sub    $0x8,%esp
    2fce:	68 20 4c 00 00       	push   $0x4c20
    2fd3:	ff 35 38 5e 00 00    	pushl  0x5e38
    2fd9:	e8 32 0a 00 00       	call   3a10 <printf>
    2fde:	83 c4 10             	add    $0x10,%esp
    2fe1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fe4:	5b                   	pop    %ebx
    2fe5:	5e                   	pop    %esi
    2fe6:	5f                   	pop    %edi
    2fe7:	5d                   	pop    %ebp
    2fe8:	c3                   	ret    
    2fe9:	83 ec 0c             	sub    $0xc,%esp
    2fec:	50                   	push   %eax
    2fed:	56                   	push   %esi
    2fee:	57                   	push   %edi
    2fef:	68 83 4b 00 00       	push   $0x4b83
    2ff4:	ff 35 38 5e 00 00    	pushl  0x5e38
    2ffa:	e8 11 0a 00 00       	call   3a10 <printf>
    2fff:	83 c4 20             	add    $0x20,%esp
    3002:	e8 9b 08 00 00       	call   38a2 <exit>
    3007:	83 ec 0c             	sub    $0xc,%esp
    300a:	6a 00                	push   $0x0
    300c:	e8 19 09 00 00       	call   392a <sbrk>
    3011:	29 c3                	sub    %eax,%ebx
    3013:	89 1c 24             	mov    %ebx,(%esp)
    3016:	e8 0f 09 00 00       	call   392a <sbrk>
    301b:	83 c4 10             	add    $0x10,%esp
    301e:	eb ab                	jmp    2fcb <sbrktest+0x29b>
    3020:	50                   	push   %eax
    3021:	50                   	push   %eax
    3022:	68 05 4c 00 00       	push   $0x4c05
    3027:	ff 35 38 5e 00 00    	pushl  0x5e38
    302d:	e8 de 09 00 00       	call   3a10 <printf>
    3032:	e8 6b 08 00 00       	call   38a2 <exit>
    3037:	52                   	push   %edx
    3038:	52                   	push   %edx
    3039:	68 c1 40 00 00       	push   $0x40c1
    303e:	6a 01                	push   $0x1
    3040:	e8 cb 09 00 00       	call   3a10 <printf>
    3045:	e8 58 08 00 00       	call   38a2 <exit>
    304a:	0f be 06             	movsbl (%esi),%eax
    304d:	50                   	push   %eax
    304e:	56                   	push   %esi
    304f:	68 ec 4b 00 00       	push   $0x4bec
    3054:	ff 35 38 5e 00 00    	pushl  0x5e38
    305a:	e8 b1 09 00 00       	call   3a10 <printf>
    305f:	89 3c 24             	mov    %edi,(%esp)
    3062:	e8 6b 08 00 00       	call   38d2 <kill>
    3067:	e8 36 08 00 00       	call   38a2 <exit>
    306c:	51                   	push   %ecx
    306d:	51                   	push   %ecx
    306e:	68 c9 4c 00 00       	push   $0x4cc9
    3073:	ff 35 38 5e 00 00    	pushl  0x5e38
    3079:	e8 92 09 00 00       	call   3a10 <printf>
    307e:	e8 1f 08 00 00       	call   38a2 <exit>
    3083:	50                   	push   %eax
    3084:	56                   	push   %esi
    3085:	68 cc 53 00 00       	push   $0x53cc
    308a:	ff 35 38 5e 00 00    	pushl  0x5e38
    3090:	e8 7b 09 00 00       	call   3a10 <printf>
    3095:	e8 08 08 00 00       	call   38a2 <exit>
    309a:	53                   	push   %ebx
    309b:	53                   	push   %ebx
    309c:	68 9c 53 00 00       	push   $0x539c
    30a1:	ff 35 38 5e 00 00    	pushl  0x5e38
    30a7:	e8 64 09 00 00       	call   3a10 <printf>
    30ac:	e8 f1 07 00 00       	call   38a2 <exit>
    30b1:	57                   	push   %edi
    30b2:	56                   	push   %esi
    30b3:	68 74 53 00 00       	push   $0x5374
    30b8:	ff 35 38 5e 00 00    	pushl  0x5e38
    30be:	e8 4d 09 00 00       	call   3a10 <printf>
    30c3:	e8 da 07 00 00       	call   38a2 <exit>
    30c8:	50                   	push   %eax
    30c9:	56                   	push   %esi
    30ca:	68 3c 53 00 00       	push   $0x533c
    30cf:	ff 35 38 5e 00 00    	pushl  0x5e38
    30d5:	e8 36 09 00 00       	call   3a10 <printf>
    30da:	e8 c3 07 00 00       	call   38a2 <exit>
    30df:	56                   	push   %esi
    30e0:	56                   	push   %esi
    30e1:	68 d1 4b 00 00       	push   $0x4bd1
    30e6:	ff 35 38 5e 00 00    	pushl  0x5e38
    30ec:	e8 1f 09 00 00       	call   3a10 <printf>
    30f1:	e8 ac 07 00 00       	call   38a2 <exit>
    30f6:	57                   	push   %edi
    30f7:	57                   	push   %edi
    30f8:	68 fc 52 00 00       	push   $0x52fc
    30fd:	ff 35 38 5e 00 00    	pushl  0x5e38
    3103:	e8 08 09 00 00       	call   3a10 <printf>
    3108:	e8 95 07 00 00       	call   38a2 <exit>
    310d:	e8 90 07 00 00       	call   38a2 <exit>
    3112:	50                   	push   %eax
    3113:	50                   	push   %eax
    3114:	68 b5 4b 00 00       	push   $0x4bb5
    3119:	ff 35 38 5e 00 00    	pushl  0x5e38
    311f:	e8 ec 08 00 00       	call   3a10 <printf>
    3124:	e8 79 07 00 00       	call   38a2 <exit>
    3129:	50                   	push   %eax
    312a:	50                   	push   %eax
    312b:	68 9e 4b 00 00       	push   $0x4b9e
    3130:	ff 35 38 5e 00 00    	pushl  0x5e38
    3136:	e8 d5 08 00 00       	call   3a10 <printf>
    313b:	e8 62 07 00 00       	call   38a2 <exit>

00003140 <validateint>:
    3140:	55                   	push   %ebp
    3141:	89 e5                	mov    %esp,%ebp
    3143:	5d                   	pop    %ebp
    3144:	c3                   	ret    
    3145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003150 <validatetest>:
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	56                   	push   %esi
    3154:	53                   	push   %ebx
    3155:	31 db                	xor    %ebx,%ebx
    3157:	83 ec 08             	sub    $0x8,%esp
    315a:	68 2e 4c 00 00       	push   $0x4c2e
    315f:	ff 35 38 5e 00 00    	pushl  0x5e38
    3165:	e8 a6 08 00 00       	call   3a10 <printf>
    316a:	83 c4 10             	add    $0x10,%esp
    316d:	8d 76 00             	lea    0x0(%esi),%esi
    3170:	e8 25 07 00 00       	call   389a <fork>
    3175:	85 c0                	test   %eax,%eax
    3177:	89 c6                	mov    %eax,%esi
    3179:	74 63                	je     31de <validatetest+0x8e>
    317b:	83 ec 0c             	sub    $0xc,%esp
    317e:	6a 00                	push   $0x0
    3180:	e8 ad 07 00 00       	call   3932 <sleep>
    3185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    318c:	e8 a1 07 00 00       	call   3932 <sleep>
    3191:	89 34 24             	mov    %esi,(%esp)
    3194:	e8 39 07 00 00       	call   38d2 <kill>
    3199:	e8 0c 07 00 00       	call   38aa <wait>
    319e:	58                   	pop    %eax
    319f:	5a                   	pop    %edx
    31a0:	53                   	push   %ebx
    31a1:	68 3d 4c 00 00       	push   $0x4c3d
    31a6:	e8 57 07 00 00       	call   3902 <link>
    31ab:	83 c4 10             	add    $0x10,%esp
    31ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    31b1:	75 30                	jne    31e3 <validatetest+0x93>
    31b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31b9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31bf:	75 af                	jne    3170 <validatetest+0x20>
    31c1:	83 ec 08             	sub    $0x8,%esp
    31c4:	68 61 4c 00 00       	push   $0x4c61
    31c9:	ff 35 38 5e 00 00    	pushl  0x5e38
    31cf:	e8 3c 08 00 00       	call   3a10 <printf>
    31d4:	83 c4 10             	add    $0x10,%esp
    31d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31da:	5b                   	pop    %ebx
    31db:	5e                   	pop    %esi
    31dc:	5d                   	pop    %ebp
    31dd:	c3                   	ret    
    31de:	e8 bf 06 00 00       	call   38a2 <exit>
    31e3:	83 ec 08             	sub    $0x8,%esp
    31e6:	68 48 4c 00 00       	push   $0x4c48
    31eb:	ff 35 38 5e 00 00    	pushl  0x5e38
    31f1:	e8 1a 08 00 00       	call   3a10 <printf>
    31f6:	e8 a7 06 00 00       	call   38a2 <exit>
    31fb:	90                   	nop
    31fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003200 <bsstest>:
    3200:	55                   	push   %ebp
    3201:	89 e5                	mov    %esp,%ebp
    3203:	83 ec 10             	sub    $0x10,%esp
    3206:	68 6e 4c 00 00       	push   $0x4c6e
    320b:	ff 35 38 5e 00 00    	pushl  0x5e38
    3211:	e8 fa 07 00 00       	call   3a10 <printf>
    3216:	83 c4 10             	add    $0x10,%esp
    3219:	80 3d 00 5f 00 00 00 	cmpb   $0x0,0x5f00
    3220:	75 39                	jne    325b <bsstest+0x5b>
    3222:	b8 01 00 00 00       	mov    $0x1,%eax
    3227:	89 f6                	mov    %esi,%esi
    3229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3230:	80 b8 00 5f 00 00 00 	cmpb   $0x0,0x5f00(%eax)
    3237:	75 22                	jne    325b <bsstest+0x5b>
    3239:	83 c0 01             	add    $0x1,%eax
    323c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3241:	75 ed                	jne    3230 <bsstest+0x30>
    3243:	83 ec 08             	sub    $0x8,%esp
    3246:	68 89 4c 00 00       	push   $0x4c89
    324b:	ff 35 38 5e 00 00    	pushl  0x5e38
    3251:	e8 ba 07 00 00       	call   3a10 <printf>
    3256:	83 c4 10             	add    $0x10,%esp
    3259:	c9                   	leave  
    325a:	c3                   	ret    
    325b:	83 ec 08             	sub    $0x8,%esp
    325e:	68 78 4c 00 00       	push   $0x4c78
    3263:	ff 35 38 5e 00 00    	pushl  0x5e38
    3269:	e8 a2 07 00 00       	call   3a10 <printf>
    326e:	e8 2f 06 00 00       	call   38a2 <exit>
    3273:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003280 <bigargtest>:
    3280:	55                   	push   %ebp
    3281:	89 e5                	mov    %esp,%ebp
    3283:	83 ec 14             	sub    $0x14,%esp
    3286:	68 96 4c 00 00       	push   $0x4c96
    328b:	e8 62 06 00 00       	call   38f2 <unlink>
    3290:	e8 05 06 00 00       	call   389a <fork>
    3295:	83 c4 10             	add    $0x10,%esp
    3298:	85 c0                	test   %eax,%eax
    329a:	74 3f                	je     32db <bigargtest+0x5b>
    329c:	0f 88 c2 00 00 00    	js     3364 <bigargtest+0xe4>
    32a2:	e8 03 06 00 00       	call   38aa <wait>
    32a7:	83 ec 08             	sub    $0x8,%esp
    32aa:	6a 00                	push   $0x0
    32ac:	68 96 4c 00 00       	push   $0x4c96
    32b1:	e8 2c 06 00 00       	call   38e2 <open>
    32b6:	83 c4 10             	add    $0x10,%esp
    32b9:	85 c0                	test   %eax,%eax
    32bb:	0f 88 8c 00 00 00    	js     334d <bigargtest+0xcd>
    32c1:	83 ec 0c             	sub    $0xc,%esp
    32c4:	50                   	push   %eax
    32c5:	e8 00 06 00 00       	call   38ca <close>
    32ca:	c7 04 24 96 4c 00 00 	movl   $0x4c96,(%esp)
    32d1:	e8 1c 06 00 00       	call   38f2 <unlink>
    32d6:	83 c4 10             	add    $0x10,%esp
    32d9:	c9                   	leave  
    32da:	c3                   	ret    
    32db:	b8 60 5e 00 00       	mov    $0x5e60,%eax
    32e0:	c7 00 f0 53 00 00    	movl   $0x53f0,(%eax)
    32e6:	83 c0 04             	add    $0x4,%eax
    32e9:	3d dc 5e 00 00       	cmp    $0x5edc,%eax
    32ee:	75 f0                	jne    32e0 <bigargtest+0x60>
    32f0:	51                   	push   %ecx
    32f1:	51                   	push   %ecx
    32f2:	68 a0 4c 00 00       	push   $0x4ca0
    32f7:	ff 35 38 5e 00 00    	pushl  0x5e38
    32fd:	c7 05 dc 5e 00 00 00 	movl   $0x0,0x5edc
    3304:	00 00 00 
    3307:	e8 04 07 00 00       	call   3a10 <printf>
    330c:	58                   	pop    %eax
    330d:	5a                   	pop    %edx
    330e:	68 60 5e 00 00       	push   $0x5e60
    3313:	68 6d 3e 00 00       	push   $0x3e6d
    3318:	e8 bd 05 00 00       	call   38da <exec>
    331d:	59                   	pop    %ecx
    331e:	58                   	pop    %eax
    331f:	68 ad 4c 00 00       	push   $0x4cad
    3324:	ff 35 38 5e 00 00    	pushl  0x5e38
    332a:	e8 e1 06 00 00       	call   3a10 <printf>
    332f:	58                   	pop    %eax
    3330:	5a                   	pop    %edx
    3331:	68 00 02 00 00       	push   $0x200
    3336:	68 96 4c 00 00       	push   $0x4c96
    333b:	e8 a2 05 00 00       	call   38e2 <open>
    3340:	89 04 24             	mov    %eax,(%esp)
    3343:	e8 82 05 00 00       	call   38ca <close>
    3348:	e8 55 05 00 00       	call   38a2 <exit>
    334d:	50                   	push   %eax
    334e:	50                   	push   %eax
    334f:	68 d6 4c 00 00       	push   $0x4cd6
    3354:	ff 35 38 5e 00 00    	pushl  0x5e38
    335a:	e8 b1 06 00 00       	call   3a10 <printf>
    335f:	e8 3e 05 00 00       	call   38a2 <exit>
    3364:	52                   	push   %edx
    3365:	52                   	push   %edx
    3366:	68 bd 4c 00 00       	push   $0x4cbd
    336b:	ff 35 38 5e 00 00    	pushl  0x5e38
    3371:	e8 9a 06 00 00       	call   3a10 <printf>
    3376:	e8 27 05 00 00       	call   38a2 <exit>
    337b:	90                   	nop
    337c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003380 <fsfull>:
    3380:	55                   	push   %ebp
    3381:	89 e5                	mov    %esp,%ebp
    3383:	57                   	push   %edi
    3384:	56                   	push   %esi
    3385:	53                   	push   %ebx
    3386:	31 db                	xor    %ebx,%ebx
    3388:	83 ec 54             	sub    $0x54,%esp
    338b:	68 eb 4c 00 00       	push   $0x4ceb
    3390:	6a 01                	push   $0x1
    3392:	e8 79 06 00 00       	call   3a10 <printf>
    3397:	83 c4 10             	add    $0x10,%esp
    339a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    33a0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    33a5:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    33aa:	83 ec 04             	sub    $0x4,%esp
    33ad:	f7 e3                	mul    %ebx
    33af:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    33b3:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    33b7:	c1 ea 06             	shr    $0x6,%edx
    33ba:	8d 42 30             	lea    0x30(%edx),%eax
    33bd:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    33c3:	88 45 a9             	mov    %al,-0x57(%ebp)
    33c6:	89 d8                	mov    %ebx,%eax
    33c8:	29 d0                	sub    %edx,%eax
    33ca:	89 c2                	mov    %eax,%edx
    33cc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33d1:	f7 e2                	mul    %edx
    33d3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33d8:	c1 ea 05             	shr    $0x5,%edx
    33db:	83 c2 30             	add    $0x30,%edx
    33de:	88 55 aa             	mov    %dl,-0x56(%ebp)
    33e1:	f7 e3                	mul    %ebx
    33e3:	89 d8                	mov    %ebx,%eax
    33e5:	c1 ea 05             	shr    $0x5,%edx
    33e8:	6b d2 64             	imul   $0x64,%edx,%edx
    33eb:	29 d0                	sub    %edx,%eax
    33ed:	f7 e1                	mul    %ecx
    33ef:	89 d8                	mov    %ebx,%eax
    33f1:	c1 ea 03             	shr    $0x3,%edx
    33f4:	83 c2 30             	add    $0x30,%edx
    33f7:	88 55 ab             	mov    %dl,-0x55(%ebp)
    33fa:	f7 e1                	mul    %ecx
    33fc:	89 d9                	mov    %ebx,%ecx
    33fe:	c1 ea 03             	shr    $0x3,%edx
    3401:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3404:	01 c0                	add    %eax,%eax
    3406:	29 c1                	sub    %eax,%ecx
    3408:	89 c8                	mov    %ecx,%eax
    340a:	83 c0 30             	add    $0x30,%eax
    340d:	88 45 ac             	mov    %al,-0x54(%ebp)
    3410:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3413:	50                   	push   %eax
    3414:	68 f8 4c 00 00       	push   $0x4cf8
    3419:	6a 01                	push   $0x1
    341b:	e8 f0 05 00 00       	call   3a10 <printf>
    3420:	58                   	pop    %eax
    3421:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3424:	5a                   	pop    %edx
    3425:	68 02 02 00 00       	push   $0x202
    342a:	50                   	push   %eax
    342b:	e8 b2 04 00 00       	call   38e2 <open>
    3430:	83 c4 10             	add    $0x10,%esp
    3433:	85 c0                	test   %eax,%eax
    3435:	89 c7                	mov    %eax,%edi
    3437:	78 57                	js     3490 <fsfull+0x110>
    3439:	31 f6                	xor    %esi,%esi
    343b:	eb 05                	jmp    3442 <fsfull+0xc2>
    343d:	8d 76 00             	lea    0x0(%esi),%esi
    3440:	01 c6                	add    %eax,%esi
    3442:	83 ec 04             	sub    $0x4,%esp
    3445:	68 00 02 00 00       	push   $0x200
    344a:	68 20 86 00 00       	push   $0x8620
    344f:	57                   	push   %edi
    3450:	e8 6d 04 00 00       	call   38c2 <write>
    3455:	83 c4 10             	add    $0x10,%esp
    3458:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    345d:	7f e1                	jg     3440 <fsfull+0xc0>
    345f:	83 ec 04             	sub    $0x4,%esp
    3462:	56                   	push   %esi
    3463:	68 14 4d 00 00       	push   $0x4d14
    3468:	6a 01                	push   $0x1
    346a:	e8 a1 05 00 00       	call   3a10 <printf>
    346f:	89 3c 24             	mov    %edi,(%esp)
    3472:	e8 53 04 00 00       	call   38ca <close>
    3477:	83 c4 10             	add    $0x10,%esp
    347a:	85 f6                	test   %esi,%esi
    347c:	74 28                	je     34a6 <fsfull+0x126>
    347e:	83 c3 01             	add    $0x1,%ebx
    3481:	e9 1a ff ff ff       	jmp    33a0 <fsfull+0x20>
    3486:	8d 76 00             	lea    0x0(%esi),%esi
    3489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3490:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3493:	83 ec 04             	sub    $0x4,%esp
    3496:	50                   	push   %eax
    3497:	68 04 4d 00 00       	push   $0x4d04
    349c:	6a 01                	push   $0x1
    349e:	e8 6d 05 00 00       	call   3a10 <printf>
    34a3:	83 c4 10             	add    $0x10,%esp
    34a6:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    34ab:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
    34b0:	89 d8                	mov    %ebx,%eax
    34b2:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    34b7:	83 ec 0c             	sub    $0xc,%esp
    34ba:	f7 e7                	mul    %edi
    34bc:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    34c0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    34c4:	c1 ea 06             	shr    $0x6,%edx
    34c7:	8d 42 30             	lea    0x30(%edx),%eax
    34ca:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    34d0:	88 45 a9             	mov    %al,-0x57(%ebp)
    34d3:	89 d8                	mov    %ebx,%eax
    34d5:	29 d0                	sub    %edx,%eax
    34d7:	f7 e6                	mul    %esi
    34d9:	89 d8                	mov    %ebx,%eax
    34db:	c1 ea 05             	shr    $0x5,%edx
    34de:	83 c2 30             	add    $0x30,%edx
    34e1:	88 55 aa             	mov    %dl,-0x56(%ebp)
    34e4:	f7 e6                	mul    %esi
    34e6:	89 d8                	mov    %ebx,%eax
    34e8:	c1 ea 05             	shr    $0x5,%edx
    34eb:	6b d2 64             	imul   $0x64,%edx,%edx
    34ee:	29 d0                	sub    %edx,%eax
    34f0:	f7 e1                	mul    %ecx
    34f2:	89 d8                	mov    %ebx,%eax
    34f4:	c1 ea 03             	shr    $0x3,%edx
    34f7:	83 c2 30             	add    $0x30,%edx
    34fa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    34fd:	f7 e1                	mul    %ecx
    34ff:	89 d9                	mov    %ebx,%ecx
    3501:	83 eb 01             	sub    $0x1,%ebx
    3504:	c1 ea 03             	shr    $0x3,%edx
    3507:	8d 04 92             	lea    (%edx,%edx,4),%eax
    350a:	01 c0                	add    %eax,%eax
    350c:	29 c1                	sub    %eax,%ecx
    350e:	89 c8                	mov    %ecx,%eax
    3510:	83 c0 30             	add    $0x30,%eax
    3513:	88 45 ac             	mov    %al,-0x54(%ebp)
    3516:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3519:	50                   	push   %eax
    351a:	e8 d3 03 00 00       	call   38f2 <unlink>
    351f:	83 c4 10             	add    $0x10,%esp
    3522:	83 fb ff             	cmp    $0xffffffff,%ebx
    3525:	75 89                	jne    34b0 <fsfull+0x130>
    3527:	83 ec 08             	sub    $0x8,%esp
    352a:	68 24 4d 00 00       	push   $0x4d24
    352f:	6a 01                	push   $0x1
    3531:	e8 da 04 00 00       	call   3a10 <printf>
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
    3550:	55                   	push   %ebp
    3551:	89 e5                	mov    %esp,%ebp
    3553:	83 ec 10             	sub    $0x10,%esp
    3556:	68 3a 4d 00 00       	push   $0x4d3a
    355b:	6a 01                	push   $0x1
    355d:	e8 ae 04 00 00       	call   3a10 <printf>
    3562:	e8 33 03 00 00       	call   389a <fork>
    3567:	83 c4 10             	add    $0x10,%esp
    356a:	85 c0                	test   %eax,%eax
    356c:	74 1b                	je     3589 <uio+0x39>
    356e:	78 3d                	js     35ad <uio+0x5d>
    3570:	e8 35 03 00 00       	call   38aa <wait>
    3575:	83 ec 08             	sub    $0x8,%esp
    3578:	68 44 4d 00 00       	push   $0x4d44
    357d:	6a 01                	push   $0x1
    357f:	e8 8c 04 00 00       	call   3a10 <printf>
    3584:	83 c4 10             	add    $0x10,%esp
    3587:	c9                   	leave  
    3588:	c3                   	ret    
    3589:	b8 09 00 00 00       	mov    $0x9,%eax
    358e:	ba 70 00 00 00       	mov    $0x70,%edx
    3593:	ee                   	out    %al,(%dx)
    3594:	ba 71 00 00 00       	mov    $0x71,%edx
    3599:	ec                   	in     (%dx),%al
    359a:	52                   	push   %edx
    359b:	52                   	push   %edx
    359c:	68 d0 54 00 00       	push   $0x54d0
    35a1:	6a 01                	push   $0x1
    35a3:	e8 68 04 00 00       	call   3a10 <printf>
    35a8:	e8 f5 02 00 00       	call   38a2 <exit>
    35ad:	50                   	push   %eax
    35ae:	50                   	push   %eax
    35af:	68 c9 4c 00 00       	push   $0x4cc9
    35b4:	6a 01                	push   $0x1
    35b6:	e8 55 04 00 00       	call   3a10 <printf>
    35bb:	e8 e2 02 00 00       	call   38a2 <exit>

000035c0 <argptest>:
    35c0:	55                   	push   %ebp
    35c1:	89 e5                	mov    %esp,%ebp
    35c3:	53                   	push   %ebx
    35c4:	83 ec 0c             	sub    $0xc,%esp
    35c7:	6a 00                	push   $0x0
    35c9:	68 53 4d 00 00       	push   $0x4d53
    35ce:	e8 0f 03 00 00       	call   38e2 <open>
    35d3:	83 c4 10             	add    $0x10,%esp
    35d6:	85 c0                	test   %eax,%eax
    35d8:	78 39                	js     3613 <argptest+0x53>
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
    35f5:	89 1c 24             	mov    %ebx,(%esp)
    35f8:	e8 cd 02 00 00       	call   38ca <close>
    35fd:	58                   	pop    %eax
    35fe:	5a                   	pop    %edx
    35ff:	68 65 4d 00 00       	push   $0x4d65
    3604:	6a 01                	push   $0x1
    3606:	e8 05 04 00 00       	call   3a10 <printf>
    360b:	83 c4 10             	add    $0x10,%esp
    360e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3611:	c9                   	leave  
    3612:	c3                   	ret    
    3613:	51                   	push   %ecx
    3614:	51                   	push   %ecx
    3615:	68 58 4d 00 00       	push   $0x4d58
    361a:	6a 02                	push   $0x2
    361c:	e8 ef 03 00 00       	call   3a10 <printf>
    3621:	e8 7c 02 00 00       	call   38a2 <exit>
    3626:	8d 76 00             	lea    0x0(%esi),%esi
    3629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003630 <rand>:
    3630:	69 05 34 5e 00 00 0d 	imul   $0x19660d,0x5e34,%eax
    3637:	66 19 00 
    363a:	55                   	push   %ebp
    363b:	89 e5                	mov    %esp,%ebp
    363d:	5d                   	pop    %ebp
    363e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3643:	a3 34 5e 00 00       	mov    %eax,0x5e34
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
    389a:	b8 01 00 00 00       	mov    $0x1,%eax
    389f:	cd 40                	int    $0x40
    38a1:	c3                   	ret    

000038a2 <exit>:
    38a2:	b8 02 00 00 00       	mov    $0x2,%eax
    38a7:	cd 40                	int    $0x40
    38a9:	c3                   	ret    

000038aa <wait>:
    38aa:	b8 03 00 00 00       	mov    $0x3,%eax
    38af:	cd 40                	int    $0x40
    38b1:	c3                   	ret    

000038b2 <pipe>:
    38b2:	b8 04 00 00 00       	mov    $0x4,%eax
    38b7:	cd 40                	int    $0x40
    38b9:	c3                   	ret    

000038ba <read>:
    38ba:	b8 05 00 00 00       	mov    $0x5,%eax
    38bf:	cd 40                	int    $0x40
    38c1:	c3                   	ret    

000038c2 <write>:
    38c2:	b8 10 00 00 00       	mov    $0x10,%eax
    38c7:	cd 40                	int    $0x40
    38c9:	c3                   	ret    

000038ca <close>:
    38ca:	b8 15 00 00 00       	mov    $0x15,%eax
    38cf:	cd 40                	int    $0x40
    38d1:	c3                   	ret    

000038d2 <kill>:
    38d2:	b8 06 00 00 00       	mov    $0x6,%eax
    38d7:	cd 40                	int    $0x40
    38d9:	c3                   	ret    

000038da <exec>:
    38da:	b8 07 00 00 00       	mov    $0x7,%eax
    38df:	cd 40                	int    $0x40
    38e1:	c3                   	ret    

000038e2 <open>:
    38e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    38e7:	cd 40                	int    $0x40
    38e9:	c3                   	ret    

000038ea <mknod>:
    38ea:	b8 11 00 00 00       	mov    $0x11,%eax
    38ef:	cd 40                	int    $0x40
    38f1:	c3                   	ret    

000038f2 <unlink>:
    38f2:	b8 12 00 00 00       	mov    $0x12,%eax
    38f7:	cd 40                	int    $0x40
    38f9:	c3                   	ret    

000038fa <fstat>:
    38fa:	b8 08 00 00 00       	mov    $0x8,%eax
    38ff:	cd 40                	int    $0x40
    3901:	c3                   	ret    

00003902 <link>:
    3902:	b8 13 00 00 00       	mov    $0x13,%eax
    3907:	cd 40                	int    $0x40
    3909:	c3                   	ret    

0000390a <mkdir>:
    390a:	b8 14 00 00 00       	mov    $0x14,%eax
    390f:	cd 40                	int    $0x40
    3911:	c3                   	ret    

00003912 <chdir>:
    3912:	b8 09 00 00 00       	mov    $0x9,%eax
    3917:	cd 40                	int    $0x40
    3919:	c3                   	ret    

0000391a <dup>:
    391a:	b8 0a 00 00 00       	mov    $0xa,%eax
    391f:	cd 40                	int    $0x40
    3921:	c3                   	ret    

00003922 <getpid>:
    3922:	b8 0b 00 00 00       	mov    $0xb,%eax
    3927:	cd 40                	int    $0x40
    3929:	c3                   	ret    

0000392a <sbrk>:
    392a:	b8 0c 00 00 00       	mov    $0xc,%eax
    392f:	cd 40                	int    $0x40
    3931:	c3                   	ret    

00003932 <sleep>:
    3932:	b8 0d 00 00 00       	mov    $0xd,%eax
    3937:	cd 40                	int    $0x40
    3939:	c3                   	ret    

0000393a <uptime>:
    393a:	b8 0e 00 00 00       	mov    $0xe,%eax
    393f:	cd 40                	int    $0x40
    3941:	c3                   	ret    

00003942 <getreadcount>:
    3942:	b8 16 00 00 00       	mov    $0x16,%eax
    3947:	cd 40                	int    $0x40
    3949:	c3                   	ret    

0000394a <gettime>:
    394a:	b8 17 00 00 00       	mov    $0x17,%eax
    394f:	cd 40                	int    $0x40
    3951:	c3                   	ret    

00003952 <settickets>:
    3952:	b8 18 00 00 00       	mov    $0x18,%eax
    3957:	cd 40                	int    $0x40
    3959:	c3                   	ret    

0000395a <getpinfo>:
    395a:	b8 19 00 00 00       	mov    $0x19,%eax
    395f:	cd 40                	int    $0x40
    3961:	c3                   	ret    
    3962:	66 90                	xchg   %ax,%ax
    3964:	66 90                	xchg   %ax,%ax
    3966:	66 90                	xchg   %ax,%ax
    3968:	66 90                	xchg   %ax,%ax
    396a:	66 90                	xchg   %ax,%ax
    396c:	66 90                	xchg   %ax,%ax
    396e:	66 90                	xchg   %ax,%ax

00003970 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3970:	55                   	push   %ebp
    3971:	89 e5                	mov    %esp,%ebp
    3973:	57                   	push   %edi
    3974:	56                   	push   %esi
    3975:	53                   	push   %ebx
    3976:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3979:	85 d2                	test   %edx,%edx
{
    397b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    397e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    3980:	79 76                	jns    39f8 <printint+0x88>
    3982:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    3986:	74 70                	je     39f8 <printint+0x88>
    x = -xx;
    3988:	f7 d8                	neg    %eax
    neg = 1;
    398a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3991:	31 f6                	xor    %esi,%esi
    3993:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    3996:	eb 0a                	jmp    39a2 <printint+0x32>
    3998:	90                   	nop
    3999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    39a0:	89 fe                	mov    %edi,%esi
    39a2:	31 d2                	xor    %edx,%edx
    39a4:	8d 7e 01             	lea    0x1(%esi),%edi
    39a7:	f7 f1                	div    %ecx
    39a9:	0f b6 92 28 55 00 00 	movzbl 0x5528(%edx),%edx
  }while((x /= base) != 0);
    39b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    39b2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    39b5:	75 e9                	jne    39a0 <printint+0x30>
  if(neg)
    39b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    39ba:	85 c0                	test   %eax,%eax
    39bc:	74 08                	je     39c6 <printint+0x56>
    buf[i++] = '-';
    39be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    39c3:	8d 7e 02             	lea    0x2(%esi),%edi
    39c6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    39ca:	8b 7d c0             	mov    -0x40(%ebp),%edi
    39cd:	8d 76 00             	lea    0x0(%esi),%esi
    39d0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    39d3:	83 ec 04             	sub    $0x4,%esp
    39d6:	83 ee 01             	sub    $0x1,%esi
    39d9:	6a 01                	push   $0x1
    39db:	53                   	push   %ebx
    39dc:	57                   	push   %edi
    39dd:	88 45 d7             	mov    %al,-0x29(%ebp)
    39e0:	e8 dd fe ff ff       	call   38c2 <write>

  while(--i >= 0)
    39e5:	83 c4 10             	add    $0x10,%esp
    39e8:	39 de                	cmp    %ebx,%esi
    39ea:	75 e4                	jne    39d0 <printint+0x60>
    putc(fd, buf[i]);
}
    39ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    39ef:	5b                   	pop    %ebx
    39f0:	5e                   	pop    %esi
    39f1:	5f                   	pop    %edi
    39f2:	5d                   	pop    %ebp
    39f3:	c3                   	ret    
    39f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    39f8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    39ff:	eb 90                	jmp    3991 <printint+0x21>
    3a01:	eb 0d                	jmp    3a10 <printf>
    3a03:	90                   	nop
    3a04:	90                   	nop
    3a05:	90                   	nop
    3a06:	90                   	nop
    3a07:	90                   	nop
    3a08:	90                   	nop
    3a09:	90                   	nop
    3a0a:	90                   	nop
    3a0b:	90                   	nop
    3a0c:	90                   	nop
    3a0d:	90                   	nop
    3a0e:	90                   	nop
    3a0f:	90                   	nop

00003a10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    3a10:	55                   	push   %ebp
    3a11:	89 e5                	mov    %esp,%ebp
    3a13:	57                   	push   %edi
    3a14:	56                   	push   %esi
    3a15:	53                   	push   %ebx
    3a16:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a19:	8b 75 0c             	mov    0xc(%ebp),%esi
    3a1c:	0f b6 1e             	movzbl (%esi),%ebx
    3a1f:	84 db                	test   %bl,%bl
    3a21:	0f 84 bf 00 00 00    	je     3ae6 <printf+0xd6>
    3a27:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    3a2a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    3a2d:	31 d2                	xor    %edx,%edx
    3a2f:	eb 39                	jmp    3a6a <printf+0x5a>
    3a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a38:	83 f8 25             	cmp    $0x25,%eax
    3a3b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3a3e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    3a43:	74 1a                	je     3a5f <printf+0x4f>
  write(fd, &c, 1);
    3a45:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3a48:	83 ec 04             	sub    $0x4,%esp
    3a4b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3a4e:	6a 01                	push   $0x1
    3a50:	50                   	push   %eax
    3a51:	ff 75 08             	pushl  0x8(%ebp)
    3a54:	e8 69 fe ff ff       	call   38c2 <write>
    3a59:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3a5c:	83 c4 10             	add    $0x10,%esp
    3a5f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    3a62:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3a66:	84 db                	test   %bl,%bl
    3a68:	74 7c                	je     3ae6 <printf+0xd6>
    if(state == 0){
    3a6a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    3a6c:	0f be cb             	movsbl %bl,%ecx
    3a6f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3a72:	74 c4                	je     3a38 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3a74:	83 fa 25             	cmp    $0x25,%edx
    3a77:	75 e6                	jne    3a5f <printf+0x4f>
      if(c == 'd'){
    3a79:	83 f8 64             	cmp    $0x64,%eax
    3a7c:	0f 84 a6 00 00 00    	je     3b28 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    3a82:	83 f8 6c             	cmp    $0x6c,%eax
    3a85:	0f 84 ad 00 00 00    	je     3b38 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    3a8b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3a91:	83 f9 70             	cmp    $0x70,%ecx
    3a94:	74 5a                	je     3af0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a96:	83 f8 73             	cmp    $0x73,%eax
    3a99:	0f 84 e1 00 00 00    	je     3b80 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a9f:	83 f8 63             	cmp    $0x63,%eax
    3aa2:	0f 84 28 01 00 00    	je     3bd0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3aa8:	83 f8 25             	cmp    $0x25,%eax
    3aab:	74 6b                	je     3b18 <printf+0x108>
  write(fd, &c, 1);
    3aad:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3ab0:	83 ec 04             	sub    $0x4,%esp
    3ab3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3ab7:	6a 01                	push   $0x1
    3ab9:	50                   	push   %eax
    3aba:	ff 75 08             	pushl  0x8(%ebp)
    3abd:	e8 00 fe ff ff       	call   38c2 <write>
    3ac2:	83 c4 0c             	add    $0xc,%esp
    3ac5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3ac8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3acb:	6a 01                	push   $0x1
    3acd:	50                   	push   %eax
    3ace:	ff 75 08             	pushl  0x8(%ebp)
    3ad1:	83 c6 01             	add    $0x1,%esi
    3ad4:	e8 e9 fd ff ff       	call   38c2 <write>
  for(i = 0; fmt[i]; i++){
    3ad9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    3add:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3ae0:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    3ae2:	84 db                	test   %bl,%bl
    3ae4:	75 84                	jne    3a6a <printf+0x5a>
    }
  }
}
    3ae6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ae9:	5b                   	pop    %ebx
    3aea:	5e                   	pop    %esi
    3aeb:	5f                   	pop    %edi
    3aec:	5d                   	pop    %ebp
    3aed:	c3                   	ret    
    3aee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    3af0:	83 ec 0c             	sub    $0xc,%esp
    3af3:	b9 10 00 00 00       	mov    $0x10,%ecx
    3af8:	6a 00                	push   $0x0
    3afa:	8b 17                	mov    (%edi),%edx
    3afc:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    3aff:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    3b02:	e8 69 fe ff ff       	call   3970 <printint>
    3b07:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3b0a:	31 d2                	xor    %edx,%edx
    3b0c:	e9 4e ff ff ff       	jmp    3a5f <printf+0x4f>
    3b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    3b18:	83 ec 04             	sub    $0x4,%esp
    3b1b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3b1e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3b21:	6a 01                	push   $0x1
    3b23:	eb a8                	jmp    3acd <printf+0xbd>
    3b25:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    3b28:	83 ec 0c             	sub    $0xc,%esp
    3b2b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3b30:	6a 01                	push   $0x1
    3b32:	eb c6                	jmp    3afa <printf+0xea>
    3b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    3b38:	8b 57 04             	mov    0x4(%edi),%edx
    3b3b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    3b3d:	85 d2                	test   %edx,%edx
    3b3f:	74 15                	je     3b56 <printf+0x146>
    3b41:	83 ec 0c             	sub    $0xc,%esp
    3b44:	8b 45 08             	mov    0x8(%ebp),%eax
    3b47:	b9 10 00 00 00       	mov    $0x10,%ecx
    3b4c:	6a 00                	push   $0x0
    3b4e:	e8 1d fe ff ff       	call   3970 <printint>
    3b53:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    3b56:	83 ec 0c             	sub    $0xc,%esp
    3b59:	8b 45 08             	mov    0x8(%ebp),%eax
    3b5c:	89 da                	mov    %ebx,%edx
    3b5e:	6a 00                	push   $0x0
    3b60:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    3b65:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    3b68:	e8 03 fe ff ff       	call   3970 <printint>
    3b6d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3b70:	31 d2                	xor    %edx,%edx
    3b72:	e9 e8 fe ff ff       	jmp    3a5f <printf+0x4f>
    3b77:	89 f6                	mov    %esi,%esi
    3b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    3b80:	8b 0f                	mov    (%edi),%ecx
        ap++;
    3b82:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    3b85:	85 c9                	test   %ecx,%ecx
    3b87:	74 6a                	je     3bf3 <printf+0x1e3>
        while(*s != 0){
    3b89:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    3b8c:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    3b8e:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    3b90:	84 c0                	test   %al,%al
    3b92:	0f 84 c7 fe ff ff    	je     3a5f <printf+0x4f>
    3b98:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    3b9b:	89 de                	mov    %ebx,%esi
    3b9d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3ba0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    3ba3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3ba6:	83 ec 04             	sub    $0x4,%esp
    3ba9:	6a 01                	push   $0x1
          s++;
    3bab:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    3bae:	50                   	push   %eax
    3baf:	53                   	push   %ebx
    3bb0:	e8 0d fd ff ff       	call   38c2 <write>
        while(*s != 0){
    3bb5:	0f b6 06             	movzbl (%esi),%eax
    3bb8:	83 c4 10             	add    $0x10,%esp
    3bbb:	84 c0                	test   %al,%al
    3bbd:	75 e1                	jne    3ba0 <printf+0x190>
    3bbf:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    3bc2:	31 d2                	xor    %edx,%edx
    3bc4:	e9 96 fe ff ff       	jmp    3a5f <printf+0x4f>
    3bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    3bd0:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    3bd2:	83 ec 04             	sub    $0x4,%esp
        ap++;
    3bd5:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    3bd8:	6a 01                	push   $0x1
        putc(fd, *ap);
    3bda:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    3bdd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3be0:	50                   	push   %eax
    3be1:	ff 75 08             	pushl  0x8(%ebp)
    3be4:	e8 d9 fc ff ff       	call   38c2 <write>
    3be9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3bec:	31 d2                	xor    %edx,%edx
    3bee:	e9 6c fe ff ff       	jmp    3a5f <printf+0x4f>
          s = "(null)";
    3bf3:	bb 20 55 00 00       	mov    $0x5520,%ebx
        while(*s != 0){
    3bf8:	b8 28 00 00 00       	mov    $0x28,%eax
    3bfd:	eb 99                	jmp    3b98 <printf+0x188>
    3bff:	90                   	nop

00003c00 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c00:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c01:	a1 e0 5e 00 00       	mov    0x5ee0,%eax
{
    3c06:	89 e5                	mov    %esp,%ebp
    3c08:	57                   	push   %edi
    3c09:	56                   	push   %esi
    3c0a:	53                   	push   %ebx
    3c0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    3c0e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3c11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c18:	39 c8                	cmp    %ecx,%eax
    3c1a:	8b 10                	mov    (%eax),%edx
    3c1c:	73 32                	jae    3c50 <free+0x50>
    3c1e:	39 d1                	cmp    %edx,%ecx
    3c20:	72 04                	jb     3c26 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c22:	39 d0                	cmp    %edx,%eax
    3c24:	72 32                	jb     3c58 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c26:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3c29:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3c2c:	39 fa                	cmp    %edi,%edx
    3c2e:	74 30                	je     3c60 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3c30:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c33:	8b 50 04             	mov    0x4(%eax),%edx
    3c36:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c39:	39 f1                	cmp    %esi,%ecx
    3c3b:	74 3a                	je     3c77 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3c3d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3c3f:	a3 e0 5e 00 00       	mov    %eax,0x5ee0
}
    3c44:	5b                   	pop    %ebx
    3c45:	5e                   	pop    %esi
    3c46:	5f                   	pop    %edi
    3c47:	5d                   	pop    %ebp
    3c48:	c3                   	ret    
    3c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c50:	39 d0                	cmp    %edx,%eax
    3c52:	72 04                	jb     3c58 <free+0x58>
    3c54:	39 d1                	cmp    %edx,%ecx
    3c56:	72 ce                	jb     3c26 <free+0x26>
{
    3c58:	89 d0                	mov    %edx,%eax
    3c5a:	eb bc                	jmp    3c18 <free+0x18>
    3c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    3c60:	03 72 04             	add    0x4(%edx),%esi
    3c63:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3c66:	8b 10                	mov    (%eax),%edx
    3c68:	8b 12                	mov    (%edx),%edx
    3c6a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c6d:	8b 50 04             	mov    0x4(%eax),%edx
    3c70:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c73:	39 f1                	cmp    %esi,%ecx
    3c75:	75 c6                	jne    3c3d <free+0x3d>
    p->s.size += bp->s.size;
    3c77:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    3c7a:	a3 e0 5e 00 00       	mov    %eax,0x5ee0
    p->s.size += bp->s.size;
    3c7f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c82:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3c85:	89 10                	mov    %edx,(%eax)
}
    3c87:	5b                   	pop    %ebx
    3c88:	5e                   	pop    %esi
    3c89:	5f                   	pop    %edi
    3c8a:	5d                   	pop    %ebp
    3c8b:	c3                   	ret    
    3c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003c90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3c90:	55                   	push   %ebp
    3c91:	89 e5                	mov    %esp,%ebp
    3c93:	57                   	push   %edi
    3c94:	56                   	push   %esi
    3c95:	53                   	push   %ebx
    3c96:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c99:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3c9c:	8b 15 e0 5e 00 00    	mov    0x5ee0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3ca2:	8d 78 07             	lea    0x7(%eax),%edi
    3ca5:	c1 ef 03             	shr    $0x3,%edi
    3ca8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3cab:	85 d2                	test   %edx,%edx
    3cad:	0f 84 9d 00 00 00    	je     3d50 <malloc+0xc0>
    3cb3:	8b 02                	mov    (%edx),%eax
    3cb5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3cb8:	39 cf                	cmp    %ecx,%edi
    3cba:	76 6c                	jbe    3d28 <malloc+0x98>
    3cbc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3cc2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3cc7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    3cca:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3cd1:	eb 0e                	jmp    3ce1 <malloc+0x51>
    3cd3:	90                   	nop
    3cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3cd8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3cda:	8b 48 04             	mov    0x4(%eax),%ecx
    3cdd:	39 f9                	cmp    %edi,%ecx
    3cdf:	73 47                	jae    3d28 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3ce1:	39 05 e0 5e 00 00    	cmp    %eax,0x5ee0
    3ce7:	89 c2                	mov    %eax,%edx
    3ce9:	75 ed                	jne    3cd8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    3ceb:	83 ec 0c             	sub    $0xc,%esp
    3cee:	56                   	push   %esi
    3cef:	e8 36 fc ff ff       	call   392a <sbrk>
  if(p == (char*)-1)
    3cf4:	83 c4 10             	add    $0x10,%esp
    3cf7:	83 f8 ff             	cmp    $0xffffffff,%eax
    3cfa:	74 1c                	je     3d18 <malloc+0x88>
  hp->s.size = nu;
    3cfc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3cff:	83 ec 0c             	sub    $0xc,%esp
    3d02:	83 c0 08             	add    $0x8,%eax
    3d05:	50                   	push   %eax
    3d06:	e8 f5 fe ff ff       	call   3c00 <free>
  return freep;
    3d0b:	8b 15 e0 5e 00 00    	mov    0x5ee0,%edx
      if((p = morecore(nunits)) == 0)
    3d11:	83 c4 10             	add    $0x10,%esp
    3d14:	85 d2                	test   %edx,%edx
    3d16:	75 c0                	jne    3cd8 <malloc+0x48>
        return 0;
  }
}
    3d18:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    3d1b:	31 c0                	xor    %eax,%eax
}
    3d1d:	5b                   	pop    %ebx
    3d1e:	5e                   	pop    %esi
    3d1f:	5f                   	pop    %edi
    3d20:	5d                   	pop    %ebp
    3d21:	c3                   	ret    
    3d22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    3d28:	39 cf                	cmp    %ecx,%edi
    3d2a:	74 54                	je     3d80 <malloc+0xf0>
        p->s.size -= nunits;
    3d2c:	29 f9                	sub    %edi,%ecx
    3d2e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3d31:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3d34:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    3d37:	89 15 e0 5e 00 00    	mov    %edx,0x5ee0
}
    3d3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    3d40:	83 c0 08             	add    $0x8,%eax
}
    3d43:	5b                   	pop    %ebx
    3d44:	5e                   	pop    %esi
    3d45:	5f                   	pop    %edi
    3d46:	5d                   	pop    %ebp
    3d47:	c3                   	ret    
    3d48:	90                   	nop
    3d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    3d50:	c7 05 e0 5e 00 00 e4 	movl   $0x5ee4,0x5ee0
    3d57:	5e 00 00 
    3d5a:	c7 05 e4 5e 00 00 e4 	movl   $0x5ee4,0x5ee4
    3d61:	5e 00 00 
    base.s.size = 0;
    3d64:	b8 e4 5e 00 00       	mov    $0x5ee4,%eax
    3d69:	c7 05 e8 5e 00 00 00 	movl   $0x0,0x5ee8
    3d70:	00 00 00 
    3d73:	e9 44 ff ff ff       	jmp    3cbc <malloc+0x2c>
    3d78:	90                   	nop
    3d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    3d80:	8b 08                	mov    (%eax),%ecx
    3d82:	89 0a                	mov    %ecx,(%edx)
    3d84:	eb b1                	jmp    3d37 <malloc+0xa7>
