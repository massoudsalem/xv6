
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	be 01 00 00 00       	mov    $0x1,%esi
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 66 03 00 00       	call   3a2 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 24                	js     69 <main+0x69>
  45:	83 ec 0c             	sub    $0xc,%esp
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 2e 03 00 00       	call   38a <close>
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  64:	e8 f9 02 00 00       	call   362 <exit>
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 6b 08 00 00       	push   $0x86b
  71:	6a 01                	push   $0x1
  73:	e8 58 04 00 00       	call   4d0 <printf>
  78:	e8 e5 02 00 00       	call   362 <exit>
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
  87:	e8 d6 02 00 00       	call   362 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 a0 0b 00 00       	push   $0xba0
  a9:	6a 01                	push   $0x1
  ab:	e8 d2 02 00 00       	call   382 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 26                	jne    dd <cat+0x4d>
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 a0 0b 00 00       	push   $0xba0
  c4:	56                   	push   %esi
  c5:	e8 b0 02 00 00       	call   37a <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	83 f8 00             	cmp    $0x0,%eax
  d0:	89 c3                	mov    %eax,%ebx
  d2:	7f cc                	jg     a0 <cat+0x10>
  d4:	75 1b                	jne    f1 <cat+0x61>
  d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	83 ec 08             	sub    $0x8,%esp
  e0:	68 48 08 00 00       	push   $0x848
  e5:	6a 01                	push   $0x1
  e7:	e8 e4 03 00 00       	call   4d0 <printf>
  ec:	e8 71 02 00 00       	call   362 <exit>
  f1:	50                   	push   %eax
  f2:	50                   	push   %eax
  f3:	68 5a 08 00 00       	push   $0x85a
  f8:	6a 01                	push   $0x1
  fa:	e8 d1 03 00 00       	call   4d0 <printf>
  ff:	e8 5e 02 00 00       	call   362 <exit>
 104:	66 90                	xchg   %ax,%ax
 106:	66 90                	xchg   %ax,%ax
 108:	66 90                	xchg   %ax,%ax
 10a:	66 90                	xchg   %ax,%ax
 10c:	66 90                	xchg   %ax,%ax
 10e:	66 90                	xchg   %ax,%ax

00000110 <strcpy>:
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 11a:	89 c2                	mov    %eax,%edx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	83 c1 01             	add    $0x1,%ecx
 123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 db                	test   %bl,%bl
 12c:	88 5a ff             	mov    %bl,-0x1(%edx)
 12f:	75 ef                	jne    120 <strcpy+0x10>
 131:	5b                   	pop    %ebx
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <strcmp>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	0f b6 19             	movzbl (%ecx),%ebx
 150:	84 c0                	test   %al,%al
 152:	75 1c                	jne    170 <strcmp+0x30>
 154:	eb 2a                	jmp    180 <strcmp+0x40>
 156:	8d 76 00             	lea    0x0(%esi),%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 160:	83 c2 01             	add    $0x1,%edx
 163:	0f b6 02             	movzbl (%edx),%eax
 166:	83 c1 01             	add    $0x1,%ecx
 169:	0f b6 19             	movzbl (%ecx),%ebx
 16c:	84 c0                	test   %al,%al
 16e:	74 10                	je     180 <strcmp+0x40>
 170:	38 d8                	cmp    %bl,%al
 172:	74 ec                	je     160 <strcmp+0x20>
 174:	29 d8                	sub    %ebx,%eax
 176:	5b                   	pop    %ebx
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 180:	31 c0                	xor    %eax,%eax
 182:	29 d8                	sub    %ebx,%eax
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <strlen>:
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 15                	je     1b0 <strlen+0x20>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	31 c0                	xor    %eax,%eax
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <memset>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	74 1d                	je     20e <strchr+0x2e>
 1f1:	38 d3                	cmp    %dl,%bl
 1f3:	89 d9                	mov    %ebx,%ecx
 1f5:	75 0d                	jne    204 <strchr+0x24>
 1f7:	eb 17                	jmp    210 <strchr+0x30>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0c                	je     210 <strchr+0x30>
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strchr+0x20>
 20e:	31 c0                	xor    %eax,%eax
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
 226:	31 f6                	xor    %esi,%esi
 228:	89 f3                	mov    %esi,%ebx
 22a:	83 ec 1c             	sub    $0x1c,%esp
 22d:	8b 7d 08             	mov    0x8(%ebp),%edi
 230:	eb 2f                	jmp    261 <gets+0x41>
 232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 238:	8d 45 e7             	lea    -0x19(%ebp),%eax
 23b:	83 ec 04             	sub    $0x4,%esp
 23e:	6a 01                	push   $0x1
 240:	50                   	push   %eax
 241:	6a 00                	push   $0x0
 243:	e8 32 01 00 00       	call   37a <read>
 248:	83 c4 10             	add    $0x10,%esp
 24b:	85 c0                	test   %eax,%eax
 24d:	7e 1c                	jle    26b <gets+0x4b>
 24f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 253:	83 c7 01             	add    $0x1,%edi
 256:	88 47 ff             	mov    %al,-0x1(%edi)
 259:	3c 0a                	cmp    $0xa,%al
 25b:	74 23                	je     280 <gets+0x60>
 25d:	3c 0d                	cmp    $0xd,%al
 25f:	74 1f                	je     280 <gets+0x60>
 261:	83 c3 01             	add    $0x1,%ebx
 264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 267:	89 fe                	mov    %edi,%esi
 269:	7c cd                	jl     238 <gets+0x18>
 26b:	89 f3                	mov    %esi,%ebx
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	c6 03 00             	movb   $0x0,(%ebx)
 273:	8d 65 f4             	lea    -0xc(%ebp),%esp
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    
 27b:	90                   	nop
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 280:	8b 75 08             	mov    0x8(%ebp),%esi
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 de                	add    %ebx,%esi
 288:	89 f3                	mov    %esi,%ebx
 28a:	c6 03 00             	movb   $0x0,(%ebx)
 28d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 290:	5b                   	pop    %ebx
 291:	5e                   	pop    %esi
 292:	5f                   	pop    %edi
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    
 295:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <stat>:
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	pushl  0x8(%ebp)
 2ad:	e8 f0 00 00 00       	call   3a2 <open>
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	pushl  0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 f3 00 00 00       	call   3ba <fstat>
 2c7:	89 1c 24             	mov    %ebx,(%esp)
 2ca:	89 c6                	mov    %eax,%esi
 2cc:	e8 b9 00 00 00       	call   38a <close>
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <atoi>:
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f7:	0f be 11             	movsbl (%ecx),%edx
 2fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2fd:	3c 09                	cmp    $0x9,%al
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
 304:	77 1f                	ja     325 <atoi+0x35>
 306:	8d 76 00             	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 310:	8d 04 80             	lea    (%eax,%eax,4),%eax
 313:	83 c1 01             	add    $0x1,%ecx
 316:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 31a:	0f be 11             	movsbl (%ecx),%edx
 31d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
 325:	5b                   	pop    %ebx
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	90                   	nop
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
 335:	8b 5d 10             	mov    0x10(%ebp),%ebx
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
 33e:	85 db                	test   %ebx,%ebx
 340:	7e 14                	jle    356 <memmove+0x26>
 342:	31 d2                	xor    %edx,%edx
 344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 34c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 34f:	83 c2 01             	add    $0x1,%edx
 352:	39 d3                	cmp    %edx,%ebx
 354:	75 f2                	jne    348 <memmove+0x18>
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35a:	b8 01 00 00 00       	mov    $0x1,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <exit>:
SYSCALL(exit)
 362:	b8 02 00 00 00       	mov    $0x2,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <wait>:
SYSCALL(wait)
 36a:	b8 03 00 00 00       	mov    $0x3,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <pipe>:
SYSCALL(pipe)
 372:	b8 04 00 00 00       	mov    $0x4,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <read>:
SYSCALL(read)
 37a:	b8 05 00 00 00       	mov    $0x5,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <write>:
SYSCALL(write)
 382:	b8 10 00 00 00       	mov    $0x10,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <close>:
SYSCALL(close)
 38a:	b8 15 00 00 00       	mov    $0x15,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <kill>:
SYSCALL(kill)
 392:	b8 06 00 00 00       	mov    $0x6,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <exec>:
SYSCALL(exec)
 39a:	b8 07 00 00 00       	mov    $0x7,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <open>:
SYSCALL(open)
 3a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <mknod>:
SYSCALL(mknod)
 3aa:	b8 11 00 00 00       	mov    $0x11,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <unlink>:
SYSCALL(unlink)
 3b2:	b8 12 00 00 00       	mov    $0x12,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <fstat>:
SYSCALL(fstat)
 3ba:	b8 08 00 00 00       	mov    $0x8,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <link>:
SYSCALL(link)
 3c2:	b8 13 00 00 00       	mov    $0x13,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <mkdir>:
SYSCALL(mkdir)
 3ca:	b8 14 00 00 00       	mov    $0x14,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <chdir>:
SYSCALL(chdir)
 3d2:	b8 09 00 00 00       	mov    $0x9,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <dup>:
SYSCALL(dup)
 3da:	b8 0a 00 00 00       	mov    $0xa,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <getpid>:
SYSCALL(getpid)
 3e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <sbrk>:
SYSCALL(sbrk)
 3ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <sleep>:
SYSCALL(sleep)
 3f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <uptime>:
SYSCALL(uptime)
 3fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <getreadcount>:
SYSCALL(getreadcount)
 402:	b8 16 00 00 00       	mov    $0x16,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <gettime>:
SYSCALL(gettime)
 40a:	b8 17 00 00 00       	mov    $0x17,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <settickets>:
SYSCALL(settickets)
 412:	b8 18 00 00 00       	mov    $0x18,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <getpinfo>:
 41a:	b8 19 00 00 00       	mov    $0x19,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    
 422:	66 90                	xchg   %ax,%ax
 424:	66 90                	xchg   %ax,%ax
 426:	66 90                	xchg   %ax,%ax
 428:	66 90                	xchg   %ax,%ax
 42a:	66 90                	xchg   %ax,%ax
 42c:	66 90                	xchg   %ax,%ax
 42e:	66 90                	xchg   %ax,%ax

00000430 <printint>:
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
 439:	85 d2                	test   %edx,%edx
 43b:	89 45 c0             	mov    %eax,-0x40(%ebp)
 43e:	89 d0                	mov    %edx,%eax
 440:	79 76                	jns    4b8 <printint+0x88>
 442:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 446:	74 70                	je     4b8 <printint+0x88>
 448:	f7 d8                	neg    %eax
 44a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 451:	31 f6                	xor    %esi,%esi
 453:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 456:	eb 0a                	jmp    462 <printint+0x32>
 458:	90                   	nop
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 460:	89 fe                	mov    %edi,%esi
 462:	31 d2                	xor    %edx,%edx
 464:	8d 7e 01             	lea    0x1(%esi),%edi
 467:	f7 f1                	div    %ecx
 469:	0f b6 92 88 08 00 00 	movzbl 0x888(%edx),%edx
 470:	85 c0                	test   %eax,%eax
 472:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
 475:	75 e9                	jne    460 <printint+0x30>
 477:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 47a:	85 c0                	test   %eax,%eax
 47c:	74 08                	je     486 <printint+0x56>
 47e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 483:	8d 7e 02             	lea    0x2(%esi),%edi
 486:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 48a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
 490:	0f b6 06             	movzbl (%esi),%eax
 493:	83 ec 04             	sub    $0x4,%esp
 496:	83 ee 01             	sub    $0x1,%esi
 499:	6a 01                	push   $0x1
 49b:	53                   	push   %ebx
 49c:	57                   	push   %edi
 49d:	88 45 d7             	mov    %al,-0x29(%ebp)
 4a0:	e8 dd fe ff ff       	call   382 <write>
 4a5:	83 c4 10             	add    $0x10,%esp
 4a8:	39 de                	cmp    %ebx,%esi
 4aa:	75 e4                	jne    490 <printint+0x60>
 4ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4af:	5b                   	pop    %ebx
 4b0:	5e                   	pop    %esi
 4b1:	5f                   	pop    %edi
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4bf:	eb 90                	jmp    451 <printint+0x21>
 4c1:	eb 0d                	jmp    4d0 <printf>
 4c3:	90                   	nop
 4c4:	90                   	nop
 4c5:	90                   	nop
 4c6:	90                   	nop
 4c7:	90                   	nop
 4c8:	90                   	nop
 4c9:	90                   	nop
 4ca:	90                   	nop
 4cb:	90                   	nop
 4cc:	90                   	nop
 4cd:	90                   	nop
 4ce:	90                   	nop
 4cf:	90                   	nop

000004d0 <printf>:
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 2c             	sub    $0x2c,%esp
 4d9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4dc:	0f b6 1e             	movzbl (%esi),%ebx
 4df:	84 db                	test   %bl,%bl
 4e1:	0f 84 bf 00 00 00    	je     5a6 <printf+0xd6>
 4e7:	83 c6 01             	add    $0x1,%esi
 4ea:	8d 7d 10             	lea    0x10(%ebp),%edi
 4ed:	31 d2                	xor    %edx,%edx
 4ef:	eb 39                	jmp    52a <printf+0x5a>
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4fe:	ba 25 00 00 00       	mov    $0x25,%edx
 503:	74 1a                	je     51f <printf+0x4f>
 505:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 508:	83 ec 04             	sub    $0x4,%esp
 50b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 50e:	6a 01                	push   $0x1
 510:	50                   	push   %eax
 511:	ff 75 08             	pushl  0x8(%ebp)
 514:	e8 69 fe ff ff       	call   382 <write>
 519:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 51c:	83 c4 10             	add    $0x10,%esp
 51f:	83 c6 01             	add    $0x1,%esi
 522:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 526:	84 db                	test   %bl,%bl
 528:	74 7c                	je     5a6 <printf+0xd6>
 52a:	85 d2                	test   %edx,%edx
 52c:	0f be cb             	movsbl %bl,%ecx
 52f:	0f b6 c3             	movzbl %bl,%eax
 532:	74 c4                	je     4f8 <printf+0x28>
 534:	83 fa 25             	cmp    $0x25,%edx
 537:	75 e6                	jne    51f <printf+0x4f>
 539:	83 f8 64             	cmp    $0x64,%eax
 53c:	0f 84 a6 00 00 00    	je     5e8 <printf+0x118>
 542:	83 f8 6c             	cmp    $0x6c,%eax
 545:	0f 84 ad 00 00 00    	je     5f8 <printf+0x128>
 54b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 551:	83 f9 70             	cmp    $0x70,%ecx
 554:	74 5a                	je     5b0 <printf+0xe0>
 556:	83 f8 73             	cmp    $0x73,%eax
 559:	0f 84 e1 00 00 00    	je     640 <printf+0x170>
 55f:	83 f8 63             	cmp    $0x63,%eax
 562:	0f 84 28 01 00 00    	je     690 <printf+0x1c0>
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	74 6b                	je     5d8 <printf+0x108>
 56d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 570:	83 ec 04             	sub    $0x4,%esp
 573:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 577:	6a 01                	push   $0x1
 579:	50                   	push   %eax
 57a:	ff 75 08             	pushl  0x8(%ebp)
 57d:	e8 00 fe ff ff       	call   382 <write>
 582:	83 c4 0c             	add    $0xc,%esp
 585:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 588:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 58b:	6a 01                	push   $0x1
 58d:	50                   	push   %eax
 58e:	ff 75 08             	pushl  0x8(%ebp)
 591:	83 c6 01             	add    $0x1,%esi
 594:	e8 e9 fd ff ff       	call   382 <write>
 599:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 59d:	83 c4 10             	add    $0x10,%esp
 5a0:	31 d2                	xor    %edx,%edx
 5a2:	84 db                	test   %bl,%bl
 5a4:	75 84                	jne    52a <printf+0x5a>
 5a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a9:	5b                   	pop    %ebx
 5aa:	5e                   	pop    %esi
 5ab:	5f                   	pop    %edi
 5ac:	5d                   	pop    %ebp
 5ad:	c3                   	ret    
 5ae:	66 90                	xchg   %ax,%ax
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5b8:	6a 00                	push   $0x0
 5ba:	8b 17                	mov    (%edi),%edx
 5bc:	8b 45 08             	mov    0x8(%ebp),%eax
 5bf:	83 c7 04             	add    $0x4,%edi
 5c2:	e8 69 fe ff ff       	call   430 <printint>
 5c7:	83 c4 10             	add    $0x10,%esp
 5ca:	31 d2                	xor    %edx,%edx
 5cc:	e9 4e ff ff ff       	jmp    51f <printf+0x4f>
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	83 ec 04             	sub    $0x4,%esp
 5db:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5de:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5e1:	6a 01                	push   $0x1
 5e3:	eb a8                	jmp    58d <printf+0xbd>
 5e5:	8d 76 00             	lea    0x0(%esi),%esi
 5e8:	83 ec 0c             	sub    $0xc,%esp
 5eb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f0:	6a 01                	push   $0x1
 5f2:	eb c6                	jmp    5ba <printf+0xea>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5f8:	8b 57 04             	mov    0x4(%edi),%edx
 5fb:	8b 1f                	mov    (%edi),%ebx
 5fd:	85 d2                	test   %edx,%edx
 5ff:	74 15                	je     616 <printf+0x146>
 601:	83 ec 0c             	sub    $0xc,%esp
 604:	8b 45 08             	mov    0x8(%ebp),%eax
 607:	b9 10 00 00 00       	mov    $0x10,%ecx
 60c:	6a 00                	push   $0x0
 60e:	e8 1d fe ff ff       	call   430 <printint>
 613:	83 c4 10             	add    $0x10,%esp
 616:	83 ec 0c             	sub    $0xc,%esp
 619:	8b 45 08             	mov    0x8(%ebp),%eax
 61c:	89 da                	mov    %ebx,%edx
 61e:	6a 00                	push   $0x0
 620:	b9 10 00 00 00       	mov    $0x10,%ecx
 625:	83 c7 08             	add    $0x8,%edi
 628:	e8 03 fe ff ff       	call   430 <printint>
 62d:	83 c4 10             	add    $0x10,%esp
 630:	31 d2                	xor    %edx,%edx
 632:	e9 e8 fe ff ff       	jmp    51f <printf+0x4f>
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 640:	8b 0f                	mov    (%edi),%ecx
 642:	83 c7 04             	add    $0x4,%edi
 645:	85 c9                	test   %ecx,%ecx
 647:	74 6a                	je     6b3 <printf+0x1e3>
 649:	0f b6 01             	movzbl (%ecx),%eax
 64c:	31 d2                	xor    %edx,%edx
 64e:	89 cb                	mov    %ecx,%ebx
 650:	84 c0                	test   %al,%al
 652:	0f 84 c7 fe ff ff    	je     51f <printf+0x4f>
 658:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 65b:	89 de                	mov    %ebx,%esi
 65d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 660:	88 45 e3             	mov    %al,-0x1d(%ebp)
 663:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 666:	83 ec 04             	sub    $0x4,%esp
 669:	6a 01                	push   $0x1
 66b:	83 c6 01             	add    $0x1,%esi
 66e:	50                   	push   %eax
 66f:	53                   	push   %ebx
 670:	e8 0d fd ff ff       	call   382 <write>
 675:	0f b6 06             	movzbl (%esi),%eax
 678:	83 c4 10             	add    $0x10,%esp
 67b:	84 c0                	test   %al,%al
 67d:	75 e1                	jne    660 <printf+0x190>
 67f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 682:	31 d2                	xor    %edx,%edx
 684:	e9 96 fe ff ff       	jmp    51f <printf+0x4f>
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 690:	8b 07                	mov    (%edi),%eax
 692:	83 ec 04             	sub    $0x4,%esp
 695:	83 c7 04             	add    $0x4,%edi
 698:	6a 01                	push   $0x1
 69a:	88 45 e4             	mov    %al,-0x1c(%ebp)
 69d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6a0:	50                   	push   %eax
 6a1:	ff 75 08             	pushl  0x8(%ebp)
 6a4:	e8 d9 fc ff ff       	call   382 <write>
 6a9:	83 c4 10             	add    $0x10,%esp
 6ac:	31 d2                	xor    %edx,%edx
 6ae:	e9 6c fe ff ff       	jmp    51f <printf+0x4f>
 6b3:	bb 80 08 00 00       	mov    $0x880,%ebx
 6b8:	b8 28 00 00 00       	mov    $0x28,%eax
 6bd:	eb 99                	jmp    658 <printf+0x188>
 6bf:	90                   	nop

000006c0 <free>:
 6c0:	55                   	push   %ebp
 6c1:	a1 80 0b 00 00       	mov    0xb80,%eax
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	39 c8                	cmp    %ecx,%eax
 6da:	8b 10                	mov    (%eax),%edx
 6dc:	73 32                	jae    710 <free+0x50>
 6de:	39 d1                	cmp    %edx,%ecx
 6e0:	72 04                	jb     6e6 <free+0x26>
 6e2:	39 d0                	cmp    %edx,%eax
 6e4:	72 32                	jb     718 <free+0x58>
 6e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ec:	39 fa                	cmp    %edi,%edx
 6ee:	74 30                	je     720 <free+0x60>
 6f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6f3:	8b 50 04             	mov    0x4(%eax),%edx
 6f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f9:	39 f1                	cmp    %esi,%ecx
 6fb:	74 3a                	je     737 <free+0x77>
 6fd:	89 08                	mov    %ecx,(%eax)
 6ff:	a3 80 0b 00 00       	mov    %eax,0xb80
 704:	5b                   	pop    %ebx
 705:	5e                   	pop    %esi
 706:	5f                   	pop    %edi
 707:	5d                   	pop    %ebp
 708:	c3                   	ret    
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 710:	39 d0                	cmp    %edx,%eax
 712:	72 04                	jb     718 <free+0x58>
 714:	39 d1                	cmp    %edx,%ecx
 716:	72 ce                	jb     6e6 <free+0x26>
 718:	89 d0                	mov    %edx,%eax
 71a:	eb bc                	jmp    6d8 <free+0x18>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 720:	03 72 04             	add    0x4(%edx),%esi
 723:	89 73 fc             	mov    %esi,-0x4(%ebx)
 726:	8b 10                	mov    (%eax),%edx
 728:	8b 12                	mov    (%edx),%edx
 72a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 72d:	8b 50 04             	mov    0x4(%eax),%edx
 730:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 733:	39 f1                	cmp    %esi,%ecx
 735:	75 c6                	jne    6fd <free+0x3d>
 737:	03 53 fc             	add    -0x4(%ebx),%edx
 73a:	a3 80 0b 00 00       	mov    %eax,0xb80
 73f:	89 50 04             	mov    %edx,0x4(%eax)
 742:	8b 53 f8             	mov    -0x8(%ebx),%edx
 745:	89 10                	mov    %edx,(%eax)
 747:	5b                   	pop    %ebx
 748:	5e                   	pop    %esi
 749:	5f                   	pop    %edi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000750 <malloc>:
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 0c             	sub    $0xc,%esp
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	8b 15 80 0b 00 00    	mov    0xb80,%edx
 762:	8d 78 07             	lea    0x7(%eax),%edi
 765:	c1 ef 03             	shr    $0x3,%edi
 768:	83 c7 01             	add    $0x1,%edi
 76b:	85 d2                	test   %edx,%edx
 76d:	0f 84 9d 00 00 00    	je     810 <malloc+0xc0>
 773:	8b 02                	mov    (%edx),%eax
 775:	8b 48 04             	mov    0x4(%eax),%ecx
 778:	39 cf                	cmp    %ecx,%edi
 77a:	76 6c                	jbe    7e8 <malloc+0x98>
 77c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 782:	bb 00 10 00 00       	mov    $0x1000,%ebx
 787:	0f 43 df             	cmovae %edi,%ebx
 78a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 791:	eb 0e                	jmp    7a1 <malloc+0x51>
 793:	90                   	nop
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 798:	8b 02                	mov    (%edx),%eax
 79a:	8b 48 04             	mov    0x4(%eax),%ecx
 79d:	39 f9                	cmp    %edi,%ecx
 79f:	73 47                	jae    7e8 <malloc+0x98>
 7a1:	39 05 80 0b 00 00    	cmp    %eax,0xb80
 7a7:	89 c2                	mov    %eax,%edx
 7a9:	75 ed                	jne    798 <malloc+0x48>
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	56                   	push   %esi
 7af:	e8 36 fc ff ff       	call   3ea <sbrk>
 7b4:	83 c4 10             	add    $0x10,%esp
 7b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ba:	74 1c                	je     7d8 <malloc+0x88>
 7bc:	89 58 04             	mov    %ebx,0x4(%eax)
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	83 c0 08             	add    $0x8,%eax
 7c5:	50                   	push   %eax
 7c6:	e8 f5 fe ff ff       	call   6c0 <free>
 7cb:	8b 15 80 0b 00 00    	mov    0xb80,%edx
 7d1:	83 c4 10             	add    $0x10,%esp
 7d4:	85 d2                	test   %edx,%edx
 7d6:	75 c0                	jne    798 <malloc+0x48>
 7d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7db:	31 c0                	xor    %eax,%eax
 7dd:	5b                   	pop    %ebx
 7de:	5e                   	pop    %esi
 7df:	5f                   	pop    %edi
 7e0:	5d                   	pop    %ebp
 7e1:	c3                   	ret    
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7e8:	39 cf                	cmp    %ecx,%edi
 7ea:	74 54                	je     840 <malloc+0xf0>
 7ec:	29 f9                	sub    %edi,%ecx
 7ee:	89 48 04             	mov    %ecx,0x4(%eax)
 7f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 7f4:	89 78 04             	mov    %edi,0x4(%eax)
 7f7:	89 15 80 0b 00 00    	mov    %edx,0xb80
 7fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 800:	83 c0 08             	add    $0x8,%eax
 803:	5b                   	pop    %ebx
 804:	5e                   	pop    %esi
 805:	5f                   	pop    %edi
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
 808:	90                   	nop
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 810:	c7 05 80 0b 00 00 84 	movl   $0xb84,0xb80
 817:	0b 00 00 
 81a:	c7 05 84 0b 00 00 84 	movl   $0xb84,0xb84
 821:	0b 00 00 
 824:	b8 84 0b 00 00       	mov    $0xb84,%eax
 829:	c7 05 88 0b 00 00 00 	movl   $0x0,0xb88
 830:	00 00 00 
 833:	e9 44 ff ff ff       	jmp    77c <malloc+0x2c>
 838:	90                   	nop
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb b1                	jmp    7f7 <malloc+0xa7>
