
_sched_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 41 04             	mov    0x4(%ecx),%eax
  14:	ff 70 04             	pushl  0x4(%eax)
  17:	e8 f4 01 00 00       	call   210 <atoi>
  1c:	89 04 24             	mov    %eax,(%esp)
  1f:	e8 0e 03 00 00       	call   332 <settickets>
  24:	83 c4 10             	add    $0x10,%esp
  27:	eb fe                	jmp    27 <main+0x27>
  29:	66 90                	xchg   %ax,%ax
  2b:	66 90                	xchg   %ax,%ax
  2d:	66 90                	xchg   %ax,%ax
  2f:	90                   	nop

00000030 <strcpy>:
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 45 08             	mov    0x8(%ebp),%eax
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3a:	89 c2                	mov    %eax,%edx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  40:	83 c1 01             	add    $0x1,%ecx
  43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 db                	test   %bl,%bl
  4c:	88 5a ff             	mov    %bl,-0x1(%edx)
  4f:	75 ef                	jne    40 <strcpy+0x10>
  51:	5b                   	pop    %ebx
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
  54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000060 <strcmp>:
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	0f b6 19             	movzbl (%ecx),%ebx
  70:	84 c0                	test   %al,%al
  72:	75 1c                	jne    90 <strcmp+0x30>
  74:	eb 2a                	jmp    a0 <strcmp+0x40>
  76:	8d 76 00             	lea    0x0(%esi),%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  80:	83 c2 01             	add    $0x1,%edx
  83:	0f b6 02             	movzbl (%edx),%eax
  86:	83 c1 01             	add    $0x1,%ecx
  89:	0f b6 19             	movzbl (%ecx),%ebx
  8c:	84 c0                	test   %al,%al
  8e:	74 10                	je     a0 <strcmp+0x40>
  90:	38 d8                	cmp    %bl,%al
  92:	74 ec                	je     80 <strcmp+0x20>
  94:	29 d8                	sub    %ebx,%eax
  96:	5b                   	pop    %ebx
  97:	5d                   	pop    %ebp
  98:	c3                   	ret    
  99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  a0:	31 c0                	xor    %eax,%eax
  a2:	29 d8                	sub    %ebx,%eax
  a4:	5b                   	pop    %ebx
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    
  a7:	89 f6                	mov    %esi,%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000b0 <strlen>:
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b6:	80 39 00             	cmpb   $0x0,(%ecx)
  b9:	74 15                	je     d0 <strlen+0x20>
  bb:	31 d2                	xor    %edx,%edx
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	83 c2 01             	add    $0x1,%edx
  c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  c7:	89 d0                	mov    %edx,%eax
  c9:	75 f5                	jne    c0 <strlen+0x10>
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	31 c0                	xor    %eax,%eax
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    
  d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000e0 <memset>:
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  f2:	89 d0                	mov    %edx,%eax
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 10a:	0f b6 10             	movzbl (%eax),%edx
 10d:	84 d2                	test   %dl,%dl
 10f:	74 1d                	je     12e <strchr+0x2e>
 111:	38 d3                	cmp    %dl,%bl
 113:	89 d9                	mov    %ebx,%ecx
 115:	75 0d                	jne    124 <strchr+0x24>
 117:	eb 17                	jmp    130 <strchr+0x30>
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 120:	38 ca                	cmp    %cl,%dl
 122:	74 0c                	je     130 <strchr+0x30>
 124:	83 c0 01             	add    $0x1,%eax
 127:	0f b6 10             	movzbl (%eax),%edx
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strchr+0x20>
 12e:	31 c0                	xor    %eax,%eax
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <gets>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	31 f6                	xor    %esi,%esi
 148:	89 f3                	mov    %esi,%ebx
 14a:	83 ec 1c             	sub    $0x1c,%esp
 14d:	8b 7d 08             	mov    0x8(%ebp),%edi
 150:	eb 2f                	jmp    181 <gets+0x41>
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 158:	8d 45 e7             	lea    -0x19(%ebp),%eax
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	6a 01                	push   $0x1
 160:	50                   	push   %eax
 161:	6a 00                	push   $0x0
 163:	e8 32 01 00 00       	call   29a <read>
 168:	83 c4 10             	add    $0x10,%esp
 16b:	85 c0                	test   %eax,%eax
 16d:	7e 1c                	jle    18b <gets+0x4b>
 16f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 173:	83 c7 01             	add    $0x1,%edi
 176:	88 47 ff             	mov    %al,-0x1(%edi)
 179:	3c 0a                	cmp    $0xa,%al
 17b:	74 23                	je     1a0 <gets+0x60>
 17d:	3c 0d                	cmp    $0xd,%al
 17f:	74 1f                	je     1a0 <gets+0x60>
 181:	83 c3 01             	add    $0x1,%ebx
 184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 187:	89 fe                	mov    %edi,%esi
 189:	7c cd                	jl     158 <gets+0x18>
 18b:	89 f3                	mov    %esi,%ebx
 18d:	8b 45 08             	mov    0x8(%ebp),%eax
 190:	c6 03 00             	movb   $0x0,(%ebx)
 193:	8d 65 f4             	lea    -0xc(%ebp),%esp
 196:	5b                   	pop    %ebx
 197:	5e                   	pop    %esi
 198:	5f                   	pop    %edi
 199:	5d                   	pop    %ebp
 19a:	c3                   	ret    
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	8b 75 08             	mov    0x8(%ebp),%esi
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	01 de                	add    %ebx,%esi
 1a8:	89 f3                	mov    %esi,%ebx
 1aa:	c6 03 00             	movb   $0x0,(%ebx)
 1ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b0:	5b                   	pop    %ebx
 1b1:	5e                   	pop    %esi
 1b2:	5f                   	pop    %edi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <stat>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	pushl  0x8(%ebp)
 1cd:	e8 f0 00 00 00       	call   2c2 <open>
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	pushl  0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 f3 00 00 00       	call   2da <fstat>
 1e7:	89 1c 24             	mov    %ebx,(%esp)
 1ea:	89 c6                	mov    %eax,%esi
 1ec:	e8 b9 00 00 00       	call   2aa <close>
 1f1:	83 c4 10             	add    $0x10,%esp
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <atoi>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 4d 08             	mov    0x8(%ebp),%ecx
 217:	0f be 11             	movsbl (%ecx),%edx
 21a:	8d 42 d0             	lea    -0x30(%edx),%eax
 21d:	3c 09                	cmp    $0x9,%al
 21f:	b8 00 00 00 00       	mov    $0x0,%eax
 224:	77 1f                	ja     245 <atoi+0x35>
 226:	8d 76 00             	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 230:	8d 04 80             	lea    (%eax,%eax,4),%eax
 233:	83 c1 01             	add    $0x1,%ecx
 236:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 23a:	0f be 11             	movsbl (%ecx),%edx
 23d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
 245:	5b                   	pop    %ebx
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <memmove>:
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
 255:	8b 5d 10             	mov    0x10(%ebp),%ebx
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
 25e:	85 db                	test   %ebx,%ebx
 260:	7e 14                	jle    276 <memmove+0x26>
 262:	31 d2                	xor    %edx,%edx
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 26c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 26f:	83 c2 01             	add    $0x1,%edx
 272:	39 d3                	cmp    %edx,%ebx
 274:	75 f2                	jne    268 <memmove+0x18>
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    

0000027a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27a:	b8 01 00 00 00       	mov    $0x1,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <exit>:
SYSCALL(exit)
 282:	b8 02 00 00 00       	mov    $0x2,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <wait>:
SYSCALL(wait)
 28a:	b8 03 00 00 00       	mov    $0x3,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <pipe>:
SYSCALL(pipe)
 292:	b8 04 00 00 00       	mov    $0x4,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <read>:
SYSCALL(read)
 29a:	b8 05 00 00 00       	mov    $0x5,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <write>:
SYSCALL(write)
 2a2:	b8 10 00 00 00       	mov    $0x10,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <close>:
SYSCALL(close)
 2aa:	b8 15 00 00 00       	mov    $0x15,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <kill>:
SYSCALL(kill)
 2b2:	b8 06 00 00 00       	mov    $0x6,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <exec>:
SYSCALL(exec)
 2ba:	b8 07 00 00 00       	mov    $0x7,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <open>:
SYSCALL(open)
 2c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <mknod>:
SYSCALL(mknod)
 2ca:	b8 11 00 00 00       	mov    $0x11,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <unlink>:
SYSCALL(unlink)
 2d2:	b8 12 00 00 00       	mov    $0x12,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <fstat>:
SYSCALL(fstat)
 2da:	b8 08 00 00 00       	mov    $0x8,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <link>:
SYSCALL(link)
 2e2:	b8 13 00 00 00       	mov    $0x13,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <mkdir>:
SYSCALL(mkdir)
 2ea:	b8 14 00 00 00       	mov    $0x14,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <chdir>:
SYSCALL(chdir)
 2f2:	b8 09 00 00 00       	mov    $0x9,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <dup>:
SYSCALL(dup)
 2fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <getpid>:
SYSCALL(getpid)
 302:	b8 0b 00 00 00       	mov    $0xb,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <sbrk>:
SYSCALL(sbrk)
 30a:	b8 0c 00 00 00       	mov    $0xc,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <sleep>:
SYSCALL(sleep)
 312:	b8 0d 00 00 00       	mov    $0xd,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <uptime>:
SYSCALL(uptime)
 31a:	b8 0e 00 00 00       	mov    $0xe,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <getreadcount>:
SYSCALL(getreadcount)
 322:	b8 16 00 00 00       	mov    $0x16,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <gettime>:
SYSCALL(gettime)
 32a:	b8 17 00 00 00       	mov    $0x17,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <settickets>:
SYSCALL(settickets)
 332:	b8 18 00 00 00       	mov    $0x18,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <getpinfo>:
 33a:	b8 19 00 00 00       	mov    $0x19,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    
 342:	66 90                	xchg   %ax,%ax
 344:	66 90                	xchg   %ax,%ax
 346:	66 90                	xchg   %ax,%ax
 348:	66 90                	xchg   %ax,%ax
 34a:	66 90                	xchg   %ax,%ax
 34c:	66 90                	xchg   %ax,%ax
 34e:	66 90                	xchg   %ax,%ax

00000350 <printint>:
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 3c             	sub    $0x3c,%esp
 359:	85 d2                	test   %edx,%edx
 35b:	89 45 c0             	mov    %eax,-0x40(%ebp)
 35e:	89 d0                	mov    %edx,%eax
 360:	79 76                	jns    3d8 <printint+0x88>
 362:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 366:	74 70                	je     3d8 <printint+0x88>
 368:	f7 d8                	neg    %eax
 36a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 371:	31 f6                	xor    %esi,%esi
 373:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 376:	eb 0a                	jmp    382 <printint+0x32>
 378:	90                   	nop
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 380:	89 fe                	mov    %edi,%esi
 382:	31 d2                	xor    %edx,%edx
 384:	8d 7e 01             	lea    0x1(%esi),%edi
 387:	f7 f1                	div    %ecx
 389:	0f b6 92 70 07 00 00 	movzbl 0x770(%edx),%edx
 390:	85 c0                	test   %eax,%eax
 392:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
 395:	75 e9                	jne    380 <printint+0x30>
 397:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 39a:	85 c0                	test   %eax,%eax
 39c:	74 08                	je     3a6 <printint+0x56>
 39e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3a3:	8d 7e 02             	lea    0x2(%esi),%edi
 3a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 3aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
 3b0:	0f b6 06             	movzbl (%esi),%eax
 3b3:	83 ec 04             	sub    $0x4,%esp
 3b6:	83 ee 01             	sub    $0x1,%esi
 3b9:	6a 01                	push   $0x1
 3bb:	53                   	push   %ebx
 3bc:	57                   	push   %edi
 3bd:	88 45 d7             	mov    %al,-0x29(%ebp)
 3c0:	e8 dd fe ff ff       	call   2a2 <write>
 3c5:	83 c4 10             	add    $0x10,%esp
 3c8:	39 de                	cmp    %ebx,%esi
 3ca:	75 e4                	jne    3b0 <printint+0x60>
 3cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cf:	5b                   	pop    %ebx
 3d0:	5e                   	pop    %esi
 3d1:	5f                   	pop    %edi
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3df:	eb 90                	jmp    371 <printint+0x21>
 3e1:	eb 0d                	jmp    3f0 <printf>
 3e3:	90                   	nop
 3e4:	90                   	nop
 3e5:	90                   	nop
 3e6:	90                   	nop
 3e7:	90                   	nop
 3e8:	90                   	nop
 3e9:	90                   	nop
 3ea:	90                   	nop
 3eb:	90                   	nop
 3ec:	90                   	nop
 3ed:	90                   	nop
 3ee:	90                   	nop
 3ef:	90                   	nop

000003f0 <printf>:
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 2c             	sub    $0x2c,%esp
 3f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 3fc:	0f b6 1e             	movzbl (%esi),%ebx
 3ff:	84 db                	test   %bl,%bl
 401:	0f 84 bf 00 00 00    	je     4c6 <printf+0xd6>
 407:	83 c6 01             	add    $0x1,%esi
 40a:	8d 7d 10             	lea    0x10(%ebp),%edi
 40d:	31 d2                	xor    %edx,%edx
 40f:	eb 39                	jmp    44a <printf+0x5a>
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	83 f8 25             	cmp    $0x25,%eax
 41b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 41e:	ba 25 00 00 00       	mov    $0x25,%edx
 423:	74 1a                	je     43f <printf+0x4f>
 425:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 428:	83 ec 04             	sub    $0x4,%esp
 42b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 42e:	6a 01                	push   $0x1
 430:	50                   	push   %eax
 431:	ff 75 08             	pushl  0x8(%ebp)
 434:	e8 69 fe ff ff       	call   2a2 <write>
 439:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 43c:	83 c4 10             	add    $0x10,%esp
 43f:	83 c6 01             	add    $0x1,%esi
 442:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 446:	84 db                	test   %bl,%bl
 448:	74 7c                	je     4c6 <printf+0xd6>
 44a:	85 d2                	test   %edx,%edx
 44c:	0f be cb             	movsbl %bl,%ecx
 44f:	0f b6 c3             	movzbl %bl,%eax
 452:	74 c4                	je     418 <printf+0x28>
 454:	83 fa 25             	cmp    $0x25,%edx
 457:	75 e6                	jne    43f <printf+0x4f>
 459:	83 f8 64             	cmp    $0x64,%eax
 45c:	0f 84 a6 00 00 00    	je     508 <printf+0x118>
 462:	83 f8 6c             	cmp    $0x6c,%eax
 465:	0f 84 ad 00 00 00    	je     518 <printf+0x128>
 46b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 471:	83 f9 70             	cmp    $0x70,%ecx
 474:	74 5a                	je     4d0 <printf+0xe0>
 476:	83 f8 73             	cmp    $0x73,%eax
 479:	0f 84 e1 00 00 00    	je     560 <printf+0x170>
 47f:	83 f8 63             	cmp    $0x63,%eax
 482:	0f 84 28 01 00 00    	je     5b0 <printf+0x1c0>
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	74 6b                	je     4f8 <printf+0x108>
 48d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 490:	83 ec 04             	sub    $0x4,%esp
 493:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 497:	6a 01                	push   $0x1
 499:	50                   	push   %eax
 49a:	ff 75 08             	pushl  0x8(%ebp)
 49d:	e8 00 fe ff ff       	call   2a2 <write>
 4a2:	83 c4 0c             	add    $0xc,%esp
 4a5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4a8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4ab:	6a 01                	push   $0x1
 4ad:	50                   	push   %eax
 4ae:	ff 75 08             	pushl  0x8(%ebp)
 4b1:	83 c6 01             	add    $0x1,%esi
 4b4:	e8 e9 fd ff ff       	call   2a2 <write>
 4b9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4bd:	83 c4 10             	add    $0x10,%esp
 4c0:	31 d2                	xor    %edx,%edx
 4c2:	84 db                	test   %bl,%bl
 4c4:	75 84                	jne    44a <printf+0x5a>
 4c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5f                   	pop    %edi
 4cc:	5d                   	pop    %ebp
 4cd:	c3                   	ret    
 4ce:	66 90                	xchg   %ax,%ax
 4d0:	83 ec 0c             	sub    $0xc,%esp
 4d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4d8:	6a 00                	push   $0x0
 4da:	8b 17                	mov    (%edi),%edx
 4dc:	8b 45 08             	mov    0x8(%ebp),%eax
 4df:	83 c7 04             	add    $0x4,%edi
 4e2:	e8 69 fe ff ff       	call   350 <printint>
 4e7:	83 c4 10             	add    $0x10,%esp
 4ea:	31 d2                	xor    %edx,%edx
 4ec:	e9 4e ff ff ff       	jmp    43f <printf+0x4f>
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	83 ec 04             	sub    $0x4,%esp
 4fb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 4fe:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 501:	6a 01                	push   $0x1
 503:	eb a8                	jmp    4ad <printf+0xbd>
 505:	8d 76 00             	lea    0x0(%esi),%esi
 508:	83 ec 0c             	sub    $0xc,%esp
 50b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 510:	6a 01                	push   $0x1
 512:	eb c6                	jmp    4da <printf+0xea>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 518:	8b 57 04             	mov    0x4(%edi),%edx
 51b:	8b 1f                	mov    (%edi),%ebx
 51d:	85 d2                	test   %edx,%edx
 51f:	74 15                	je     536 <printf+0x146>
 521:	83 ec 0c             	sub    $0xc,%esp
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	b9 10 00 00 00       	mov    $0x10,%ecx
 52c:	6a 00                	push   $0x0
 52e:	e8 1d fe ff ff       	call   350 <printint>
 533:	83 c4 10             	add    $0x10,%esp
 536:	83 ec 0c             	sub    $0xc,%esp
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	89 da                	mov    %ebx,%edx
 53e:	6a 00                	push   $0x0
 540:	b9 10 00 00 00       	mov    $0x10,%ecx
 545:	83 c7 08             	add    $0x8,%edi
 548:	e8 03 fe ff ff       	call   350 <printint>
 54d:	83 c4 10             	add    $0x10,%esp
 550:	31 d2                	xor    %edx,%edx
 552:	e9 e8 fe ff ff       	jmp    43f <printf+0x4f>
 557:	89 f6                	mov    %esi,%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 560:	8b 0f                	mov    (%edi),%ecx
 562:	83 c7 04             	add    $0x4,%edi
 565:	85 c9                	test   %ecx,%ecx
 567:	74 6a                	je     5d3 <printf+0x1e3>
 569:	0f b6 01             	movzbl (%ecx),%eax
 56c:	31 d2                	xor    %edx,%edx
 56e:	89 cb                	mov    %ecx,%ebx
 570:	84 c0                	test   %al,%al
 572:	0f 84 c7 fe ff ff    	je     43f <printf+0x4f>
 578:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 57b:	89 de                	mov    %ebx,%esi
 57d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 580:	88 45 e3             	mov    %al,-0x1d(%ebp)
 583:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 586:	83 ec 04             	sub    $0x4,%esp
 589:	6a 01                	push   $0x1
 58b:	83 c6 01             	add    $0x1,%esi
 58e:	50                   	push   %eax
 58f:	53                   	push   %ebx
 590:	e8 0d fd ff ff       	call   2a2 <write>
 595:	0f b6 06             	movzbl (%esi),%eax
 598:	83 c4 10             	add    $0x10,%esp
 59b:	84 c0                	test   %al,%al
 59d:	75 e1                	jne    580 <printf+0x190>
 59f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	e9 96 fe ff ff       	jmp    43f <printf+0x4f>
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b0:	8b 07                	mov    (%edi),%eax
 5b2:	83 ec 04             	sub    $0x4,%esp
 5b5:	83 c7 04             	add    $0x4,%edi
 5b8:	6a 01                	push   $0x1
 5ba:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5bd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5c0:	50                   	push   %eax
 5c1:	ff 75 08             	pushl  0x8(%ebp)
 5c4:	e8 d9 fc ff ff       	call   2a2 <write>
 5c9:	83 c4 10             	add    $0x10,%esp
 5cc:	31 d2                	xor    %edx,%edx
 5ce:	e9 6c fe ff ff       	jmp    43f <printf+0x4f>
 5d3:	bb 68 07 00 00       	mov    $0x768,%ebx
 5d8:	b8 28 00 00 00       	mov    $0x28,%eax
 5dd:	eb 99                	jmp    578 <printf+0x188>
 5df:	90                   	nop

000005e0 <free>:
 5e0:	55                   	push   %ebp
 5e1:	a1 14 0a 00 00       	mov    0xa14,%eax
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	57                   	push   %edi
 5e9:	56                   	push   %esi
 5ea:	53                   	push   %ebx
 5eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	39 c8                	cmp    %ecx,%eax
 5fa:	8b 10                	mov    (%eax),%edx
 5fc:	73 32                	jae    630 <free+0x50>
 5fe:	39 d1                	cmp    %edx,%ecx
 600:	72 04                	jb     606 <free+0x26>
 602:	39 d0                	cmp    %edx,%eax
 604:	72 32                	jb     638 <free+0x58>
 606:	8b 73 fc             	mov    -0x4(%ebx),%esi
 609:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60c:	39 fa                	cmp    %edi,%edx
 60e:	74 30                	je     640 <free+0x60>
 610:	89 53 f8             	mov    %edx,-0x8(%ebx)
 613:	8b 50 04             	mov    0x4(%eax),%edx
 616:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 619:	39 f1                	cmp    %esi,%ecx
 61b:	74 3a                	je     657 <free+0x77>
 61d:	89 08                	mov    %ecx,(%eax)
 61f:	a3 14 0a 00 00       	mov    %eax,0xa14
 624:	5b                   	pop    %ebx
 625:	5e                   	pop    %esi
 626:	5f                   	pop    %edi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 630:	39 d0                	cmp    %edx,%eax
 632:	72 04                	jb     638 <free+0x58>
 634:	39 d1                	cmp    %edx,%ecx
 636:	72 ce                	jb     606 <free+0x26>
 638:	89 d0                	mov    %edx,%eax
 63a:	eb bc                	jmp    5f8 <free+0x18>
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 640:	03 72 04             	add    0x4(%edx),%esi
 643:	89 73 fc             	mov    %esi,-0x4(%ebx)
 646:	8b 10                	mov    (%eax),%edx
 648:	8b 12                	mov    (%edx),%edx
 64a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 64d:	8b 50 04             	mov    0x4(%eax),%edx
 650:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 653:	39 f1                	cmp    %esi,%ecx
 655:	75 c6                	jne    61d <free+0x3d>
 657:	03 53 fc             	add    -0x4(%ebx),%edx
 65a:	a3 14 0a 00 00       	mov    %eax,0xa14
 65f:	89 50 04             	mov    %edx,0x4(%eax)
 662:	8b 53 f8             	mov    -0x8(%ebx),%edx
 665:	89 10                	mov    %edx,(%eax)
 667:	5b                   	pop    %ebx
 668:	5e                   	pop    %esi
 669:	5f                   	pop    %edi
 66a:	5d                   	pop    %ebp
 66b:	c3                   	ret    
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000670 <malloc>:
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 0c             	sub    $0xc,%esp
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	8b 15 14 0a 00 00    	mov    0xa14,%edx
 682:	8d 78 07             	lea    0x7(%eax),%edi
 685:	c1 ef 03             	shr    $0x3,%edi
 688:	83 c7 01             	add    $0x1,%edi
 68b:	85 d2                	test   %edx,%edx
 68d:	0f 84 9d 00 00 00    	je     730 <malloc+0xc0>
 693:	8b 02                	mov    (%edx),%eax
 695:	8b 48 04             	mov    0x4(%eax),%ecx
 698:	39 cf                	cmp    %ecx,%edi
 69a:	76 6c                	jbe    708 <malloc+0x98>
 69c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6a7:	0f 43 df             	cmovae %edi,%ebx
 6aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6b1:	eb 0e                	jmp    6c1 <malloc+0x51>
 6b3:	90                   	nop
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6b8:	8b 02                	mov    (%edx),%eax
 6ba:	8b 48 04             	mov    0x4(%eax),%ecx
 6bd:	39 f9                	cmp    %edi,%ecx
 6bf:	73 47                	jae    708 <malloc+0x98>
 6c1:	39 05 14 0a 00 00    	cmp    %eax,0xa14
 6c7:	89 c2                	mov    %eax,%edx
 6c9:	75 ed                	jne    6b8 <malloc+0x48>
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	56                   	push   %esi
 6cf:	e8 36 fc ff ff       	call   30a <sbrk>
 6d4:	83 c4 10             	add    $0x10,%esp
 6d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6da:	74 1c                	je     6f8 <malloc+0x88>
 6dc:	89 58 04             	mov    %ebx,0x4(%eax)
 6df:	83 ec 0c             	sub    $0xc,%esp
 6e2:	83 c0 08             	add    $0x8,%eax
 6e5:	50                   	push   %eax
 6e6:	e8 f5 fe ff ff       	call   5e0 <free>
 6eb:	8b 15 14 0a 00 00    	mov    0xa14,%edx
 6f1:	83 c4 10             	add    $0x10,%esp
 6f4:	85 d2                	test   %edx,%edx
 6f6:	75 c0                	jne    6b8 <malloc+0x48>
 6f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6fb:	31 c0                	xor    %eax,%eax
 6fd:	5b                   	pop    %ebx
 6fe:	5e                   	pop    %esi
 6ff:	5f                   	pop    %edi
 700:	5d                   	pop    %ebp
 701:	c3                   	ret    
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 708:	39 cf                	cmp    %ecx,%edi
 70a:	74 54                	je     760 <malloc+0xf0>
 70c:	29 f9                	sub    %edi,%ecx
 70e:	89 48 04             	mov    %ecx,0x4(%eax)
 711:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 714:	89 78 04             	mov    %edi,0x4(%eax)
 717:	89 15 14 0a 00 00    	mov    %edx,0xa14
 71d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 720:	83 c0 08             	add    $0x8,%eax
 723:	5b                   	pop    %ebx
 724:	5e                   	pop    %esi
 725:	5f                   	pop    %edi
 726:	5d                   	pop    %ebp
 727:	c3                   	ret    
 728:	90                   	nop
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 730:	c7 05 14 0a 00 00 18 	movl   $0xa18,0xa14
 737:	0a 00 00 
 73a:	c7 05 18 0a 00 00 18 	movl   $0xa18,0xa18
 741:	0a 00 00 
 744:	b8 18 0a 00 00       	mov    $0xa18,%eax
 749:	c7 05 1c 0a 00 00 00 	movl   $0x0,0xa1c
 750:	00 00 00 
 753:	e9 44 ff ff ff       	jmp    69c <malloc+0x2c>
 758:	90                   	nop
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 760:	8b 08                	mov    (%eax),%ecx
 762:	89 0a                	mov    %ecx,(%edx)
 764:	eb b1                	jmp    717 <malloc+0xa7>
